package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.ssm.pojo.User;
import com.jxust.ssm.service.UserService;

@Controller
public class UserController {
	/**
	 * 使用@Autowired也可以，@Autowired默认按类型装配
	 * 
	 * @Resource 默认按名称装配，当找不到与名称匹配的bean才会按类型装配。
	 */
	@Resource
	private UserService userService;

	@RequestMapping("/showUser")
	public String testtoshowUser(@RequestParam(value = "id") Integer id, Model model) {
		System.out.println("id:" + id);
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "showUser";
	}

	@RequestMapping("/insertUser1")
	public String testinsertUser1() {
		User user = new User();
		user.setUserName("李清照");
		user.setPassword("3232322");
		user.setAge(22);
		int count = userService.insert(user);
		System.out.println("插入" + count + "条数据成功");
		return "showUser";
	}

	@RequestMapping("/listUser")
	public String testlistUser(Model model) {
		List<User> user = userService.selectUserList();
		System.out.println(user);
		model.addAttribute("user", user);

		return "map";
	}

	@RequestMapping(value = "/testAction")
	public @ResponseBody Map<String, Object> login(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(request.getParameter("name"));
		Map<String, Object> map = new HashMap<String, Object>();

		if (request.getParameter("name").equals("123")) {
			System.out.println("城东");
			map.put("msg", "成功");
		} else {
			System.out.println("失败");
			map.put("msg", "失败");
		}
		return map;
	}
}
