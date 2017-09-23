package com.jxust.ssm.udpserver;

import java.io.*;
import java.net.*;
import org.json.*;
import java.sql.*;
import java.util.Date;  
import java.text.SimpleDateFormat;

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
        int port = 8800;                    //客户端端口号
        String sDevID = null;
        String sLoca = null;
        String sXpos = null;
        String sYpos = null;
        String sHop = null;
        String sBattVolt = null;
        int nState = 1;
        String sDateTime = null;
        
        try 
        {
            address = packet.getAddress();      //客户端IP
            port = packet.getPort();            //客户端端口号            
         
        	info = new String(packet.getData(), 0, packet.getLength());   //接收到的信息
            System.out.println("接收到的数据："+info);
                    
            //解析数据更新到数据库表中
            //数据样例：{"DevType":"GPS","SubType":"NB-GPS","DevID":"1001","Loca":"LBS","x_pos":"114.219984","y_pos":"30.59902","Hop":"0.00","BattVolt":"4.12"}     
            
            JSONObject dataJson = new JSONObject(info);
            
            sDevID = dataJson.get("DevID").toString();
            sLoca = dataJson.get("Loca").toString();
            sXpos = dataJson.get("x_pos").toString();
            sYpos = dataJson.get("y_pos").toString();
            sHop = dataJson.get("Hop").toString();
            sBattVolt = dataJson.get("BattVolt").toString();
            
       //     System.out.println(sDevID+","+sLoca+","+sXpos+","+sYpos+sHop+","+sBattVolt);
            
            int sLoca1 = Integer.parseInt(sLoca);
            double   sXpos1 = Double.valueOf(sXpos).doubleValue();
            double   sYpos1 = Double.valueOf(sYpos).doubleValue();
            double   sHop1 = Double.valueOf(sHop).doubleValue();
            double   sBattVolt1 = Double.valueOf(sBattVolt).doubleValue();
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//修改日期格式
            sDateTime = dateFormat.format(now);
            System.out.println(sXpos1+sYpos1+sHop1+sBattVolt1);
            String strsql = "update tab_nbms_dev_rtdata set nLocaMode=?,x_pos=?,y_pos=?,fHop=?,fBatteryVolt=?,nState=?,SamplingTime=?,sIPAddr=?,nPort=? where sDevID=?";  
            PreparedStatement pstmt = dbConn.prepareStatement(strsql);
//          pstmt.setInt(1, Integer.parseInt(sLoca));
//          pstmt.setFloat(2, Float.parseFloat(sXpos));
//          pstmt.setFloat(3, Float.parseFloat(sYpos));
//          pstmt.setFloat(4, Float.parseFloat(sHop));
//          pstmt.setFloat(5, Float.parseFloat(sBattVolt));
            pstmt.setDouble(1, sLoca1);
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
            	System.out.println("更新数据失败！");
            }
            else
            {
            	System.out.println("更新数据成功！");
            }
            pstmt.close();  


            //测试反馈信息
            byte[] data2 = null;
            DatagramPacket packet2 = null;
            data2 = "我已收到！".getBytes();
            packet2 = new DatagramPacket(data2, data2.length, address, port);
            socket.send(packet2);
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        	System.out.println("数据解析有误！");
        }
        //socket.close();不能关闭    
    }

	private Integer valueOf(String sXpos) {
		// TODO Auto-generated method stub
		return null;
	}
}

public class UDPServer1 {
    public static void main(String[] args) throws IOException {      	
    	Connection dbSQLConn = null;	
    	String driverName = "com.mysql.jdbc.Driver"; //加载数据库驱动
    	// 连接数据库ServletUser
    	String dbURL = "jdbc:mysql://127.0.0.1:3506/nbms?useUnicode=true&characterEncoding=utf8";
    	String userName = "root"; //用户名
    	String userPwd = "Yge@123#"; //密码
    	try 
    	{
    		Class.forName(driverName);
    		dbSQLConn = DriverManager.getConnection(dbURL, userName, userPwd);
    		System.out.println("数据库连接成功"); // 如果连接成功
   	} 
    	catch (Exception e)
    	{
    		e.printStackTrace();
    		System.out.println("数据库连接失败");
    	}     	
  	
        DatagramSocket socket = new DatagramSocket(8800);
        DatagramPacket packet = null;
        byte[] data = null;

        System.out.println("服务器端启动，等待接收数据---");
        while(true){
            data = new byte[1024];//创建字节数组，指定接收的数据包大小
            packet = new DatagramPacket(data, data.length);
            socket.receive(packet);//此方法在接收到数据包之前会一直阻塞
            
            InetAddress addr = packet.getAddress();// 接收的地址
            System.out.println(addr.toString());
            
            Thread thread = new Thread(new UDPThread(socket, packet,dbSQLConn));
            thread.start();
        } 
    }
}
