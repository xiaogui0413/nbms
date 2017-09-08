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

import com.jxust.ssm.pojo.StockIn;
import com.jxust.ssm.service.StockInService;

@Controller
public class StockInController{
	
	@Resource
	private StockInService stockInService;
	
	@RequestMapping("/listStockIn")
	public String testlidevser( HttpServletResponse response,Model model) throws IOException{
		List<StockIn> stockIn = stockInService.selectStockInList();
		model.addAttribute("stockIn", stockIn);
	return "/Stock/listStockIn.jsp";
	}
	
	@RequestMapping("/selectgStockInByDevName")
	public String selectgStockInByDevName( HttpServletRequest request,Model model) throws IOException{
		//String devName = request.getParameter("selectItem");
		List<StockIn> stockIn = stockInService.selectStockInList();
		model.addAttribute("stockIn", stockIn);
	return "/Stock/listStockIn.jsp";
	}
	
	@RequestMapping("/selectgStockInByDevName1")
	public String selectgStockInByDevName1(@RequestParam("selectItem")String sDevName,Model model) throws IOException{
		System.out.println(sDevName);
		List<StockIn> stockIn = stockInService.selectByDevName(sDevName);
		model.addAttribute("stockIn", stockIn);
	return "/Stock/listStockIn.jsp";
	}
	
	@RequestMapping("/deleteStockIn")
	public String deleteStockIn(int id,Model model) throws IOException{
		stockInService.deleteByPrimaryKey(id);
	return "/listStockIn";
	}
	
	@RequestMapping("/updateStockInView")
	public String updateStockInView(int id,Model model) throws IOException{
		StockIn stock = stockInService.selectByPrimaryKey(id);
		model.addAttribute("stock",stock);
	return "/Stock/editStockIn.jsp";
	}
	
	@RequestMapping("/insertStockIn")
	public String insertStockIn(HttpServletRequest request,Model model) throws IOException{

		String sDevName = request.getParameter("sDevName");
		int  nDevType = Integer.parseInt(request.getParameter("nDevType"));
		String  sStockIntType = request.getParameter("sStockIntType");
		String sStorageName = request.getParameter("sStorageName");
		String sSupplierName = request.getParameter("sSupplierName");
		String sRegistrant = request.getParameter("sRegistrant");
		String StorageTime = request.getParameter("StorageTime");
		String sRemark = request.getParameter("sRemark");

		StockIn stock = new StockIn();
		stock.setsDevName(sDevName);
		stock.setnDevType(nDevType);
		stock.setsStockIntType(sStockIntType);
		stock.setsStorageName(sStorageName);
		stock.setsSupplierName(sSupplierName);
		stock.setsRegistrant(sRegistrant);
		stock.setStorageTime(StorageTime);
		stock.setsRemark(sRemark);

		stockInService.insertStockIn(stock);
	return "/listStockIn";
	}
	
	@RequestMapping("/updateStockIn")
	public String updateStockIn(HttpServletRequest request,Model model) throws IOException{

		int id = Integer.parseInt(request.getParameter("sn"));
		String sDevName = request.getParameter("sDevName");
		int  nDevType = Integer.parseInt(request.getParameter("nDevType"));
		String  sStockIntType = request.getParameter("sStockIntType");
		String sStorageName = request.getParameter("sStorageName");
		String sSupplierName = request.getParameter("sSupplierName");
		String sRegistrant = request.getParameter("sRegistrant");
		String StorageTime = request.getParameter("StorageTime");
		String sRemark = request.getParameter("sRemark");
				
		StockIn stock = new StockIn();
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
		model.addAttribute("stock",stock);
		return "/listStockIn";
	}

}
