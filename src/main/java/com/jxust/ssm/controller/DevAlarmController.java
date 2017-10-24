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

import com.jxust.ssm.pojo.DevAlarm;
import com.jxust.ssm.service.DevAlarmService;

@Controller
public class DevAlarmController {
	@Resource
	private DevAlarmService devAlarmService;
	
	/*历史告警数据*/
	@RequestMapping("/listDevAlarm")
	public String listDevAlarm(Model model) throws IOException{
		List<DevAlarm> devAlarm = devAlarmService.selectDevAlarmList();
		model.addAttribute("devAlarm", devAlarm);
		System.out.println(devAlarm);
		return "Alarm/listAlarmhis.jsp";
	}
	
	/*当前告警数据*/
	@RequestMapping("/listDevAlarmNow")
	public String listDevAlarmNow(Model model) throws IOException{
		List<DevAlarm> devAlarm = devAlarmService.selectDevAlarmList();
		model.addAttribute("devAlarm", devAlarm);
		return "Alarm/listAlarmnow.jsp";
	}	
	/*根据条件查询历史数据*/
	@RequestMapping("/selectDevAlarmMap")
	public String selectDevAlarmMap(HttpServletRequest request ,Model model) throws IOException{
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
		
		List<DevAlarm> devAlarm = devAlarmService.selectDevAlarmMap(paramMap);
		model.addAttribute("devAlarm", devAlarm);
		return "Alarm/listAlarmhis.jsp";

	}
	
	@RequestMapping("/alarmDef")
	public String alarmDef(Model model) throws IOException{

		return "Alarm/alarmDef.jsp";

	}

}
