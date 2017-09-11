package com.jxust.ssm.controller;

import java.util.List;
import java.util.UUID;

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
	
	//用户登录
	@RequestMapping("/userLogin")
	public String userLogin(@RequestParam("username") String clerkName,@RequestParam("password") String password,Model model) {
		UserData userData = userDataService.selectByPrimaryKey(clerkName, password);
			if(userData == null){
				model.addAttribute("msg", "用户名或密码错误！");
				return "/Public/login.jsp";
			}
			else{
				model.addAttribute("username", clerkName); 
				return "index.jsp";
			}
	}
	
	@RequestMapping("/selectUserList")
	public String selectUserList(Model model) {
		List<UserData> userData = userDataService.selectUserList();
		model.addAttribute("userData", userData);
		return "User/listUser.jsp";
	}
	
	//修改用户信息预览
	@RequestMapping("/updateUserView")
	public String updateUserView(String id,Model model) {
		 UserData userData = userDataService.selectById(id);
		model.addAttribute("userData", userData);
		System.out.println("执行了，ID为："+id);
		return "User/editUser.jsp";
	}
	
	//修改用户信息
		@RequestMapping("/updateUser")
		public String updateUser(HttpServletRequest request,Model model) {
			String id = request.getParameter("id");
			String clerkName = request.getParameter("clerkName");
			String password = request.getParameter("password");
			String contact = request.getParameter("contact");
			String address = request.getParameter("address");
			String emailAddr = request.getParameter("emailAddr");
			String memo = request.getParameter("memo");
			
			UserData userData = new UserData();
				userData.setId(id);
				userData.setClerkName(clerkName);
				userData.setAddress(address);
				userData.setContact(contact);
				userData.setEmailAddr(emailAddr);
				userData.setPassword(password);
				userData.setMemo(memo);				
			userDataService.updateUser(userData);
			System.out.println("执行了修改操作，修改ID为"+id);
			return "selectUserList";
		}
	
	//删除用户
	@RequestMapping("/deleteUser")
	public String deleteUser(String id,Model model) {
		userDataService.deleteByPrimaryKey(id);
		System.out.println("删除成功，删除的ID为："+id);
		return "selectUserList";
	}
	
	//添加用户
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest request,Model model) {
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		String clerkName = request.getParameter("clerkName");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String emailAddr = request.getParameter("emailAddr");
		String memo = request.getParameter("memo");

		UserData userData = new UserData();
		userData.setId(uuid);
		userData.setClerkName(clerkName);
		userData.setClerkType(1);
		userData.setPassword(password);
		userData.setContact(contact);
		userData.setAddress(address);
		userData.setEmailAddr(emailAddr);
		userData.setDel_state(0);
		userData.setMemo(memo);
		userDataService.insertUser(userData);
		System.out.println("插入成功，id为"+uuid);
		return "selectUserList";
	}	
}