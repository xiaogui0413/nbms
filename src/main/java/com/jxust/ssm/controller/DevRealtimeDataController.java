package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxust.ssm.pojo.DevRealtimeData;
import com.jxust.ssm.service.DevRealtimeDataService;

@Controller
public class DevRealtimeDataController {
	
	@Resource
	private DevRealtimeDataService devRealtimeService;
	
	@RequestMapping("/listDevRealtimeData")
	public String listDevRealtimeData(Model model) throws IOException{
		System.out.println("收到请求！！！");
		List<DevRealtimeData> devRealtimeData = devRealtimeService.selectDevRealtimeDataList();
		model.addAttribute("devRealtimeData", devRealtimeData);
		System.out.println("数据为："+devRealtimeData);
		return "DevData/listRealtime.jsp";

	}
}
