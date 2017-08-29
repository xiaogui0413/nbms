package com.jxust.ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jxust.ssm.pojo.DevAttr;
import com.jxust.ssm.service.DevAttrService;

import net.sf.json.JSONArray;

/**
 * @author GuiqiHu
 *
 * @date 2017年8月22日 下午3:00:15
 */
@Controller
public class DevAttrController {
	
	@Resource
	private DevAttrService devAttrService;
	
	@RequestMapping("/showDevAttr")
	public String testtoshowUser(@RequestParam(value = "id") Integer id, Model model) {
		System.out.println("id:" + id);
		DevAttr devAttr = devAttrService.getDevAttrById(id);
		model.addAttribute("devAttr", devAttr);
		return "/WEB-INF/views/";
	}
	
	@RequestMapping("/listDevAttr")
	public String testlistUser(Model model) {
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
/*	      JSONArray array = null;

	          array = JSONArray.fromObject(devAttr);//能过去 
*/
		JSONArray array = null;
		array = JSONArray.fromObject(devAttr);
		
		model.addAttribute("devAttr", array);
		Long cur = System.currentTimeMillis();
		model.addAttribute("cur", cur);
		System.out.println(devAttr);
		
		model.addAttribute("devAttr", devAttr);

		return "/Map/map3.jsp";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		System.out.println(devAttr);
		model.addAttribute("devAttr", devAttr);
		System.out.println("******hah*****");
		return "/index.jsp";
	}

}