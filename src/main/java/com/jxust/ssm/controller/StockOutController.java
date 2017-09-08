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
		model.addAttribute("stockOut", stockOut);
	return "/Stock/listStockOut.jsp";
	}

	@RequestMapping("/selectgStockOutByDevName")
	public String selectgStockOutByDevName(@RequestParam("selectItem")String sDevName,Model model) throws IOException{
		System.out.println(sDevName);
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
	return "/listStockOut";
	}
}
