package com.jxust.ssm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jxust.ssm.pojo.UserData;
import com.jxust.ssm.service.UserDataService;


@Controller
public class UserDataController {
	
	@Resource
	private UserDataService userDataService;
	
	@RequestMapping("/login3")
	public String login(@RequestParam("username") String clerkName,@RequestParam("password") String password,Model model) {
		if (clerkName.equals("admin") && password.equals("000000")) {
            model.addAttribute("username", clerkName); 
            return "index.jsp";
		}
		else{
			model.addAttribute("msg", "用户名或密码错误！");
            return "/Public/login.jsp";
		}
		
	}
	
	@RequestMapping("/login2")
	public String login2(UserData userData,HttpServletRequest request) {
		String clerkName = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(clerkName);
		System.out.println(password);
		UserData user = userDataService.selectByPrimaryKey(clerkName, password);
		System.out.println(user);
		if(user == null){
			System.out.println("登录失败");
		}
	/*UserData user = userDataService.selectByPrimaryKey(userData.getClerkName(), userData.getPassword());
		System.out.println(user);*/
		System.out.println("wocoa");
		return "index.html";
	}
}
