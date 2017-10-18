package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxust.ssm.pojo.DevAttr;
import com.jxust.ssm.service.DevAttrService;
import com.jxust.ssm.service.DevRealtimeDataService;

@Controller
public class DevRealtimeDataController {
	
	@Resource
	private DevRealtimeDataService devRealtimeService;
	@Resource
	private DevAttrService devAttrService;
	
	@RequestMapping("/listDevRealtimeData")
	public String listDevRealtimeData(Model model) throws IOException{
		System.out.println("hahaha ");
/*		List<DevRealtimeData> devRealtimeData = devRealtimeService.selectDevRealtimeDataList();
		model.addAttribute("devRealtimeData", devRealtimeData);*/
		
		/*实时数据其实就是在线设备当前的数据*/
		List<DevAttr> devAttr = devAttrService.selectDevAttrOnline();
		System.out.println(devAttr);
		model.addAttribute("devRealtimeData", devAttr);
		return "DevData/listRealtime.jsp";

	}
}
