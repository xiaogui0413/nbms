package com.jxust.ssm.utils;

import java.io.*;
import java.net.*;
import org.json.*;
import java.sql.*;
import java.util.Date; 
import java.util.Calendar; 
import java.text.SimpleDateFormat;
import java.util.Timer;
import java.util.TimerTask;

class UDPThread implements Runnable{
    
    DatagramSocket socket = null;
    DatagramPacket packet = null; 
    Connection dbConn = null;

    public UDPThread(DatagramSocket socket,DatagramPacket packet,Connection dbConn) {
        this.socket = socket;
        this.packet = packet;
        this.dbConn = dbConn; 
    }

    public void run() {
        String info = null;
        InetAddress address = null;         //客户端IP
        String sAddr = null;
        int port = 8800;                    //客户端端口号
        String sDevType = null;
        String sSubType = null;
        String sDevID = null;
        String sLoca = null;
        String sXpos = null;
        String sYpos = null;
        String sHop = null;
        String sBattVolt = null;
        String sRSOC="100";
        String sVolt="220";
        int nState = 1;
        String sDateTime = null;
        
        try 
        {
            address = packet.getAddress();      //客户端IP
            sAddr = address.toString();
            sAddr = sAddr.substring(sAddr.lastIndexOf("/") + 1 );
            port = packet.getPort();            //客户端端口号            
         
        	info = new String(packet.getData(), 0, packet.getLength());   //接收到的信息
            System.out.println("接收数据from"+sAddr+"<<"+info);
            
          
            //数据解析，更新到数据库表中
            //数据样例：{"DevType":"GPS","SubType":"NB-GPS","DevID":"1001","Loca":"LBS","x_pos":"114.219984","y_pos":"30.59902","Hop":"0.00","BattVolt":"4.12"}     
            
            JSONObject dataJson = new JSONObject(info); 
            
            //sDevType = dataJson.get("DevType").toString();
           // sSubType = dataJson.get("SubType").toString();
            sDevID = dataJson.get("DevID").toString();
            sLoca = dataJson.get("Loca").toString();
            sXpos = dataJson.get("x_pos").toString();
            sYpos = dataJson.get("y_pos").toString();
            
            if(sHop!=null){
            	sHop = dataJson.get("Hop").toString();
            }	
            sBattVolt = dataJson.get("BattVolt").toString();
            double   sXpos1 = Double.valueOf(sXpos).doubleValue();
            double   sYpos1 = Double.valueOf(sYpos).doubleValue();
            if(sHop!=null){
               double sHop1 = Double.valueOf(sHop).doubleValue();
            }
            else{
            	 double sHop1 = 500;
            	 


            double   sBattVolt1 = Double.valueOf(sBattVolt).doubleValue();

            Date now = new Date(); 
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//修改日期格式
            sDateTime = dateFormat.format(now);             
         
            String strsql = "update tab_nbms_devattr set nLocaMode=?,x_pos=?,y_pos=?,fHop=?,fBatteryVolt=?,nState=?,SamplingTime=?,sIPAddr=?,nPort=? where sDevID=?";
            PreparedStatement pstmt = dbConn.prepareStatement(strsql);
//          pstmt.setInt(1, Integer.parseInt(sLoca));
//          pstmt.setFloat(2, Float.parseFloat(sXpos));
//          pstmt.setFloat(3, Float.parseFloat(sYpos));
//          pstmt.setFloat(4, Float.parseFloat(sHop));
//          pstmt.setFloat(5, Float.parseFloat(sBattVolt));
            pstmt.setString(1, sLoca);
            pstmt.setDouble(2, sXpos1);
            pstmt.setDouble(3, sYpos1);
            pstmt.setDouble(4, sHop1);
            pstmt.setDouble(5, sBattVolt1);
            pstmt.setInt(6, nState);
            pstmt.setString(7,sDateTime);
            pstmt.setString(8,address.toString());
            pstmt.setInt(9, port);
            pstmt.setString(10, sDevID);     

            int rs = pstmt.executeUpdate(); 

            if (rs<=0)
            {
            	System.out.println("更新数据失败!");
            }
            else
            {
            	System.out.println("更新数据成功!");
            }
            pstmt.close(); 

            }
            //测试反馈信息
            byte[] data2 = null;
            DatagramPacket packet2 = null;
            data2 = "我已经收到！".getBytes();
            packet2 = new DatagramPacket(data2, data2.length, address, port);
            socket.send(packet2);
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        	System.out.println("解析数据有误!");
        }
        //socket.close();不能关闭         
    }
}

//定时任务
class DataTask extends TimerTask {
    
    Connection dbConn = null;
    long inteval = 300000;

    public DataTask (Connection dbConn,long intevalPeriod) {
        this.dbConn = dbConn;
        this.inteval = intevalPeriod;
    }
    public void run() {  
    	
        try 
        {
	    	Date now = new Date(); 
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//修改日期格式
	        //String sDateTime = dateFormat.format(now);                 
	        Date beforeDate = new Date(now.getTime() - inteval);      //时间往前推一定时间段
	        String sDateTime = dateFormat.format(beforeDate);
	        
	        System.out.println(sDateTime);  
	        
		    String sql = "update tab_nbms_devattr set nState=? where SamplingTime<?";  
		    PreparedStatement pstmt = dbConn.prepareStatement(sql);  
		    pstmt.setInt(1, 0);
		    pstmt.setString(2,sDateTime);
		    
		    int rs = pstmt.executeUpdate(); 
		    if (rs<=0)
		    {
		    	System.out.println("更新状态失败!");
		    }
		    else
		    {
		    	System.out.println("更新状态成功!");
		    }
		    pstmt.close();
        }		    
        catch (Exception e) 
        {
            e.printStackTrace();
        	System.out.println("更新数据有误!");
        }
    }    
}

public class UDPServer {
    public static void main(String[] args) throws IOException {  	
    	//--------------建立jdbc连接------------------------------
    	Connection dbSQLConn = null;
    	String driverName = "com.mysql.jdbc.Driver"; //加载数据库驱动
    	// 连接服务器和数据库ServletUser
    	String dbURL = "jdbc:mysql://47.95.241.111:3506/nbms?useUnicode=true&characterEncoding=utf8";
    	String userName = "root"; //用户名
    	String userPwd = "Yge@123##"; //密码
    	try 
    	{
    		Class.forName(driverName);
    		dbSQLConn = DriverManager.getConnection(dbURL, userName, userPwd);
    		System.out.println("连接数据成功!"); // 如果连接成功
    	} 
    	catch (Exception e)
    	{
    		e.printStackTrace();
    		System.out.println("数据库连接失败");
    	} 
    	
    	//--------------定时任务:定时判断设备的状态，在一定时间内没有更新，认为是失连状态----------------------
//        TimerTask task = new TimerTask() { 
//            public void run() {  
//            	
//            	Date now = new Date(); 
//                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//修改日期格式
//                //String sDateTime = dateFormat.format(now);                 
//                Date beforeDate = new Date(now.getTime() - 300000);      //时间往前推一定时间段
//                String sDateTime = dateFormat.format(beforeDate);
//                
//                System.out.println(sDateTime);  
//                
//               
//            }  
//        };
    	
        long delay = 300000;               //延时执行时间 
        long intevalPeriod = 300000;    //时间间隔
    	TimerTask task = new DataTask(dbSQLConn,intevalPeriod);
        Timer timer = new Timer();  
        //间隔定时执行任务
        timer.scheduleAtFixedRate(task, delay, intevalPeriod);
    	
  	    //--------------建立网络------------------------------
        DatagramSocket socket = new DatagramSocket(5000);
        DatagramPacket packet = null;
        byte[] data = null;

        System.out.println("服务器端启动，等待接收数据---");
        while(true){
            data = new byte[1024];//创建字节数组，指定接收的数据包的大小
            packet = new DatagramPacket(data, data.length);
            socket.receive(packet);//此方法在接收到数据报之前会一直阻塞          
            Thread thread = new Thread(new UDPThread(socket, packet,dbSQLConn));
            thread.start();           
        } 
    }
}