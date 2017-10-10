package com.jxust.ssm.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.ssm.pojo.UserData;
import com.jxust.ssm.service.UserDataService;
import com.jxust.ssm.utils.Md5Utils;

import net.sf.json.JSONArray;

@Controller
public class UserDataController {
	
	@Resource
	private UserDataService userDataService;
	
	/**
	 * 
	 * @param clerkName
	 * @param password
	 * @param model
	 * @return
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 修改密码和新增用户校验用户名的sql dao servicve serviceimpl 都已经写好
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	//用户登录
	@RequestMapping("/userLogin")
	public String userLogin(@RequestParam("username") String clerkName,@RequestParam("password") String password,Model model) {
		String password1 = Md5Utils.md5(password);
		UserData userData = userDataService.selectByPrimaryKey(clerkName, password1);
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
	@RequestMapping(value = "/updateUserView",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateUserView(@RequestBody String id,Model model) {
		 UserData userData = userDataService.selectById(id);
		 JSONArray json = JSONArray.fromObject(userData);
		 return json.toString();
	}
	
	//修改用户信息
	@RequestMapping(value = "/updateUser",produces = "application/json; charset=utf-8")
	@ResponseBody
	public void updateUser(@RequestBody UserData users) {		
		userDataService.updateUser(users);
	}	
	//删除用户
	@RequestMapping("/deleteUser")
	public String deleteUser(String id,Model model) {
		userDataService.deleteByPrimaryKey(id);
		return "selectUserList";
	}
	
	//添加用户
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest request,Model model) {
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		String clerkName = request.getParameter("clerkName");
		String password =  Md5Utils.md5(request.getParameter("password"));
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
		UserData uname = userDataService.selectByClerkName(clerkName);
		if(uname == null){
			userDataService.insertUser(userData);
			return "selectUserList";
		}
		else{
			model.addAttribute("msg", "用户名已被注册！");
			return "User/addUser.jsp";
		}		
	}	
}