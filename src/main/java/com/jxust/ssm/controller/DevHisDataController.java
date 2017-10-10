package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
