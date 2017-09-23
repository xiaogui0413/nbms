package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jxust.ssm.pojo.StockOut;
import com.jxust.ssm.service.StockOutService;

@Controller
public class StockOutController{
	
	@Resource
	private StockOutService stockOutService;
	
	@RequestMapping("/listStockOut")
	public String listStockOut( HttpServletResponse response,Model model) throws IOException{
		List<StockOut> stockOut = stockOutService.selectStockOutList();
		System.out.println(stockOut);
		model.addAttribute("stockOut", stockOut);
	return "/Stock/listStockOut.jsp";
	}

	@RequestMapping("/selectgStockOutByDevName")
	public String selectgStockOutByDevName(@RequestParam("selectItem")String sDevName,Model model) throws IOException{
		List<StockOut> stockOut = stockOutService.selectByDevName(sDevName);
		model.addAttribute("stockOut", stockOut);
	return "/Stock/listStockOut.jsp";
	}
	
	@RequestMapping("/deleteStockOut")
	public String deleteStockOut(int id) throws IOException{
		stockOutService.deleteByPrimaryKey(id);
	return "listStockOut";
	}
	
	@RequestMapping("/updateStockOutView")
	public String updateStockOutView(int id,Model model) throws IOException{
		StockOut stock = stockOutService.selectByPrimaryKey(id);
		model.addAttribute("stock",stock);
	return "/Stock/editStockOut.jsp";
	}
	
	@RequestMapping("/updateStockOut")
	public String updateStockOut(HttpServletRequest request,Model model) throws IOException{

		int id = Integer.parseInt(request.getParameter("sn"));
		String sDevName = request.getParameter("sDevName");
		int  nDevType = Integer.parseInt(request.getParameter("nDevType"));
		String sStockOutType = request.getParameter("sStockOutType");
		String sStorageName = request.getParameter("sStorageName");
		String sUnitName = request.getParameter("sUnitName");
		String sResponsiblePerson = request.getParameter("sResponsiblePerson");
		String sTelphone = request.getParameter("sTelphone");
		String sRegistrant = request.getParameter("sRegistrant");
		String stockOutTime = request.getParameter("stockOutTime");
		String sRemark = request.getParameter("sRemark");
						
		StockOut stock = new StockOut();
		stock.setSn(id);
		stock.setsDevName(sDevName);
		stock.setnDevType(nDevType);
		stock.setsStockOutType(sStockOutType);
		stock.setsStorageName(sStorageName);
		stock.setsUnitName(sUnitName);
		stock.setsResponsiblePerson(sResponsiblePerson);
		stock.setsTelphone(sTelphone);
		stock.setsRegistrant(sRegistrant);
		stock.setStockOutTime(stockOutTime);
		stock.setsRemark(sRemark);
				
		stockOutService.updateStockOut(stock);
		return "/listStockOut";
	}
	
	@RequestMapping("/outStockIn")
	public String outStockIn(HttpServletRequest request,Model model) throws IOException{

		/*int id = Integer.parseInt(request.getParameter("sn"));
		String sDevName = request.getParameter("sDevName");
		int  nDevType = Integer.parseInt(request.getParameter("nDevType"));
		String  sStockIntType = request.getParameter("sStockIntType");
		String sStorageName = request.getParameter("sStorageName");
		String sSupplierName = request.getParameter("sSupplierName");
		String sRegistrant = request.getParameter("sRegistrant");
		String StorageTime = request.getParameter("StorageTime");
		String sRemark = request.getParameter("sRemark");*/
				
/*		StockIn stock = new StockIn();
		stock.setSn(id);
		stock.setsDevName(sDevName);
		stock.setnDevType(nDevType);
		stock.setsStockIntType(sStockIntType);
		stock.setsStorageName(sStorageName);
		stock.setsSupplierName(sSupplierName);
		stock.setsRegistrant(sRegistrant);
		stock.setStorageTime(StorageTime);
		stock.setsRemark(sRemark);
				
		stockInService.updateStockIn(stock);
		model.addAttribute("stock",stock);*/
		
	/*	int id = Integer.parseInt(request.getParameter("sn"));*/
		String sDevName = request.getParameter("sDevName");
		int  nDevType = Integer.parseInt(request.getParameter("nDevType"));
		String sStockOutType = request.getParameter("sStockOutType");
		String sStorageName = request.getParameter("sStorageName");
		String sUnitName = request.getParameter("sUnitName");
		String sResponsiblePerson = request.getParameter("sResponsiblePerson");
		String sTelphone = request.getParameter("sTelphone");
		String sRegistrant = request.getParameter("sRegistrant");
		String stockOutTime = request.getParameter("stockOutTime");
		String sRemark = request.getParameter("sRemark");
		
		StockOut stock = new StockOut();
		
		/*stock.setSn(id);*/
		stock.setsDevName(sDevName);
		stock.setnDevType(nDevType);
		stock.setsStockOutType(sStockOutType);
		stock.setsStorageName(sStorageName);
		stock.setsUnitName(sUnitName);
		stock.setsResponsiblePerson(sResponsiblePerson);
		stock.setsTelphone(sTelphone);
		stock.setsRegistrant(sRegistrant);
		stock.setStockOutTime(stockOutTime);
		stock.setsRemark(sRemark);
/*		System.out.println(stock);
		StockOut devAttr = new StockOut();
		DevAttr devAttr1 = new DevAttr();
		devAttr1.setsDevName(sDevName);
		devAttr1.setnDevType(nDevType);
		devAttrService.insertDevAttr(devAttr1);*/
		
		stockOutService.insertStockOut(stock);
		/*stockOutService.selectStockOutList();*/
/*		System.out.println(id);
		System.out.println(sDevName);
		System.out.println(nDevType);
		System.out.println(sStockOutType);
		System.out.println(sStorageName);
		System.out.println(sUnitName);
		System.out.println(sResponsiblePerson);
		System.out.println(sTelphone);
		System.out.println(sRegistrant);
		System.out.println(stockOutTime);
		System.out.println(sRemark);*/
		
		
		return "/listStockIn";
	}
	
	@RequestMapping("/insertStockOut")
	public String insertStockOut(HttpServletRequest request,Model model) throws IOException{

		String sDevName = request.getParameter("sDevName");
		int  nDevType = Integer.parseInt(request.getParameter("nDevType"));
		String sStockOutType = request.getParameter("sStockOutType");
		String sStorageName = request.getParameter("sStorageName");
		String sUnitName = request.getParameter("sUnitName");
		String sResponsiblePerson = request.getParameter("sResponsiblePerson");
		String sTelphone = request.getParameter("sTelphone");
		String sRegistrant = request.getParameter("sRegistrant");
		String stockOutTime = request.getParameter("StockOutTime");
		String sRemark = request.getParameter("sRemark");

		StockOut stock = new StockOut();
		stock.setsDevName(sDevName);
		stock.setnDevType(nDevType);
		stock.setsStockOutType(sStockOutType);
		stock.setsStorageName(sStorageName);
		stock.setsUnitName(sUnitName);
		stock.setsResponsiblePerson(sResponsiblePerson);
		stock.setsTelphone(sTelphone);
		stock.setsRegistrant(sRegistrant);
		stock.setStockOutTime(stockOutTime);
		stock.setsRemark(sRemark);
		stockOutService.insertStockOut(stock);
		StockOut stock1 = new StockOut();
		stock1.setsDevName(sDevName);
		stock1.setnDevType(nDevType);
		
	return "/listStockOut";
	}
}
