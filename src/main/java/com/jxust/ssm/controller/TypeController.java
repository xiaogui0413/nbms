package com.jxust.ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.ssm.pojo.SubType;
import com.jxust.ssm.pojo.Type;
import com.jxust.ssm.service.SubTypeService;
import com.jxust.ssm.service.TypeService;

import net.sf.json.JSONArray;

@Controller
public class TypeController {
	
	@Resource
	private TypeService typeService;
	@Resource
	private SubTypeService subTypeService;
	
	//异步添加一级分类
	@RequestMapping(value = "/addFirstType",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addFirstType(@RequestBody Type type) {
			typeService.insertType(type);
		JSONArray json = JSONArray.fromObject(type);
		 return json.toString();
	}
	
	/*查询一级分类列表*/
	@RequestMapping("/selectTypeList")
	public String selectTypeList(Model model) {
		List<Type> type = typeService.selectTypeList();
		List<SubType> subType = subTypeService.selectSubTypeList();
		model.addAttribute("subType", subType);
		model.addAttribute("type", type);
		return "Stock/listType.jsp";
	}
	/*删除一级分类*/
	@RequestMapping("/deleteType")
	public String deleteType(int id,Model model) {
		typeService.deleteByPrimaryKey(id);
		return "selectTypeList";
	}
}
