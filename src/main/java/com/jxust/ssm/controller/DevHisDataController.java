package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

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
		System.out.println("收到请求_______________");
		List<DevHisData> devHisData = devHisService.selectDevHisDataList();
		model.addAttribute("devHisData", devHisData);
		System.out.println("数据为："+devHisData);
		return "DevData/listHis.jsp";

	}
}
