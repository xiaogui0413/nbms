package com.jxust.ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxust.ssm.pojo.UserLog;
import com.jxust.ssm.service.UserLogService;

@Controller
public class UserLogController {

	@Resource
	private UserLogService userLogService;

	@RequestMapping("/logInfo")
	public String selectUserLogList(Model model, @RequestParam(required = true, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize) {

		PageHelper.startPage(page, pageSize);
		List<UserLog> userLog = userLogService.selectUserLogList();
		PageInfo<UserLog> p = new PageInfo<UserLog>(userLog);
		model.addAttribute("page", p);
		model.addAttribute("userLog", userLog);
		return "UserLog/listUserLog.jsp";
	}

	@RequestMapping("/selectByOperator")
	public String selectByOperator(@RequestParam("selectItem") String operator, Model model) {

		PageHelper.startPage(1, 10);
		List<UserLog> userLog = userLogService.selectByOperator(operator);
		PageInfo<UserLog> p = new PageInfo<UserLog>(userLog);
		model.addAttribute("page", p);
		model.addAttribute("userLog", userLog);
		return "UserLog/listUserLog.jsp";
	}

}
