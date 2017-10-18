package com.jxust.ssm.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.jxust.ssm.pojo.DevHisData;
import com.jxust.ssm.service.DevHisDataService;

@Controller
public class DevHisDataController {
	
	@Resource
	private DevHisDataService devHisService;
	
	@RequestMapping("/listDevHisData")
	public String listDevHisData(Model model) throws IOException{
		List<DevHisData> devHisData = devHisService.selectDevHisDataList();
		model.addAttribute("devHisData", devHisData);
		System.out.println(devHisData);
		return "DevData/listHis.jsp";

	}
		
	@RequestMapping("/listDevHisDataByPage")
	public String listDevHisDataByPage(Model model,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="8") Integer pageSize) throws IOException{
		
		List<DevHisData> devHisData = devHisService.selectDevHisDataList();
		
		System.out.println("执行了");
		PageInfo<DevHisData> p=new PageInfo<DevHisData>(devHisData);
		System.out.println(p.getPageNum());
		if(p.getPageNum()<=0){
			p.setPageNum(1);
		}
		model.addAttribute("page",p);
		model.addAttribute("devHisData", devHisData);
		System.out.println("历史数据"+devHisData);
		return "DevData/listHis.jsp";

	}
	
	@RequestMapping("/selectDevHisDataMap11")
	public String selectStockInMap11(HttpServletRequest request ,Model model) throws IOException{
		String devID = request.getParameter("devID");
		String devName = request.getParameter("devName");
		String beginTime = request.getParameter("beginTime");
		//String endTime = request.getParameter("endTime");
		System.out.println(beginTime);
		DevHisData devHis = new DevHisData();
		devHis.setsDevID(devID);
		devHis.setsDevName(devName);
		//devHis.setSamplingTime(beginTime);
		/*List<DevHisData> devHisData = devHisService.selectStockInMap(devHis);
		model.addAttribute("devHisData", devHisData);*/
		return "DevData/listHis.jsp";

	}
	
	@RequestMapping("/selectStockInMap")
	public String selectStockInMap(HttpServletRequest request ,Model model) throws IOException{
		String devID = request.getParameter("devID");
		String devName = request.getParameter("devName");
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
			
		model.addAttribute("devID", devID);
		model.addAttribute("devName", devName);
		model.addAttribute("beginTime", beginTime);
		model.addAttribute("endTime", endTime);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("devID", devID);
		paramMap.put("devName", devName);
		paramMap.put("beginTime", beginTime);
		paramMap.put("endTime", endTime);
		List<DevHisData> devHisData = devHisService.selectDevHisDataMap(paramMap);
		model.addAttribute("devHisData", devHisData);
		
		return "DevData/listHis.jsp";
	}
	
	 @RequestMapping("/export")
	 public void export(HttpServletResponse response, Model model) throws IOException {
	        //第一步:创建一个工作簿excel文件  
	        Workbook workbook=new HSSFWorkbook();//HSSF操作Excel2003以下版本 
	         
	        //第二步:创建一个工作表sheet  
	        Sheet sheet=workbook.createSheet("设备历史数据");
	        //设置标题样式
	        HSSFCellStyle headerStyle = (HSSFCellStyle) workbook .createCellStyle();// 创建标题样式  
	        headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //设置垂直居中  
	        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);   //设置水平居中  
	        HSSFFont headerFont = (HSSFFont) workbook.createFont(); //创建字体样式  
	        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 字体加粗  
	        headerFont.setFontName("Times New Roman");  //设置字体类型  
	        headerFont.setFontHeightInPoints((short) 18);    //设置字体大小  
	        headerStyle.setFont(headerFont);    //为标题样式设置字体样式  
	        // 设置表格默认列宽度为15个字节  
	        sheet.setDefaultColumnWidth((short) 18);

	        //第三步:创建一个行对象(我们放在第4行)  
	        Row nRow=sheet.createRow(0);//从0开始 

	        //设置表格自适应列宽
	        sheet.autoSizeColumn(1,true);
	          
	        //第四步:创建一个单元格对象，指定列  
	        //createCell参数有两个，一个是第几列一个是参数类型，  
	        //这里我们使用默认参数类型  
	        //第五步:给单元格设置内容 

     	    nRow.createCell(0).setCellValue("设备类型");  
            nRow.createCell(1).setCellValue("设备子类型"); 
            nRow.createCell(2).setCellValue("设备地址");  
            nRow.createCell(3).setCellValue("设备ID");
            nRow.createCell(4).setCellValue("定位方式");
            nRow.createCell(5).setCellValue("设备名称");
            nRow.createCell(6).setCellValue("经度");
            nRow.createCell(7).setCellValue("纬度");
            nRow.createCell(8).setCellValue("可信度(米)");
            nRow.createCell(9).setCellValue("电池电压(V)");
            nRow.createCell(10).setCellValue("剩余电量(%)");
            nRow.createCell(11).setCellValue("供电电压(V)");
            nRow.createCell(12).setCellValue("数据采集时间");
	  
	        List<DevHisData> devList = devHisService.selectDevHisDataList();
	        for (int i = 0; i < devList.size(); i++) {
	        	DevHisData devHis = devList.get(i);
	     	   Row mRow=sheet.createRow(i+1);
	     	    mRow.createCell(0).setCellValue(devHis.getnDevType());  
	            mRow.createCell(1).setCellValue(devHis.getnSubtype()); 
	            mRow.createCell(2).setCellValue(devHis.getnDevAddr());  
	            mRow.createCell(3).setCellValue(devHis.getsDevID());
	            mRow.createCell(4).setCellValue(devHis.getnLocaMode());
	            mRow.createCell(5).setCellValue(devHis.getsDevName());
	            mRow.createCell(6).setCellValue(devHis.getX_pos());
	            mRow.createCell(7).setCellValue(devHis.getY_pos());
	            mRow.createCell(8).setCellValue(devHis.getfHop());
	            mRow.createCell(9).setCellValue(devHis.getfBatteryVolt());
	            mRow.createCell(10).setCellValue(devHis.getfRSOC());
	            mRow.createCell(11).setCellValue(devHis.getfVolt());
	            mRow.createCell(12).setCellValue(devHis.getSamplingTime());
	        }

/*	         sheet.autoSizeColumn((short)0); //调整第一列宽度
	         sheet.autoSizeColumn((short)1); //调整第二列宽度
	         sheet.autoSizeColumn((short)2); //调整第三列宽度
	         sheet.autoSizeColumn((short)3); //调整第四列宽度
*/
	        String fileName = "历史数据表";
	        ByteArrayOutputStream os = new ByteArrayOutputStream();
	        workbook.write(os);
	        byte[] content = os.toByteArray();
	        InputStream is = new ByteArrayInputStream(content);
	        // 设置response参数，可以打开下载页面
	        response.reset();
	        response.setContentType("application/vnd.ms-excel;charset=utf-8");
	        response.setHeader("Content-Disposition", "attachment;filename="
	            + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
	        ServletOutputStream out = response.getOutputStream();
	        BufferedInputStream bis = null;
	        BufferedOutputStream bos = null;
	   
	        try {
	          bis = new BufferedInputStream(is);
	          bos = new BufferedOutputStream(out);
	          byte[] buff = new byte[2048];
	          int bytesRead;
	          // Simple read/write loop.
	          while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
	            bos.write(buff, 0, bytesRead);
	          }
	        } catch (Exception e) {
	         
	          e.printStackTrace();
	        } finally {
	          if (bis != null)
	            bis.close();
	          if (bos != null)
	            bos.close();
	        }
   }

}
