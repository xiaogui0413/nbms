package com.jxust.ssm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jxust.ssm.service.SubTypeService;

@Controller
public class SubTypeController {
	@Resource
	private SubTypeService subTypeService;
	
	@RequestMapping("/selectSubTypeByType1")
	public String selectSubTypeByType1(Model model) {
/*		List<SubType> subType = subTypeService.selectSubTypeByType();
		for(SubType a:subType){
			System.out.println("=============="+a);
		}*/
		
		return "User/listUser.jsp";
	}
	


}
