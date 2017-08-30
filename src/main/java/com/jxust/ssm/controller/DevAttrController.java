package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
	public String testlistUser( HttpServletResponse response,Model model) throws IOException{
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		model.addAttribute("devAttr", devAttr);
		String s="[";
		for(DevAttr d:devAttr){
			 s +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getSn()+"],";
			/*System.out.println(d.getX_pos()+d.getY_pos());*/
					
		}
		s = s.substring(0,s.length()-1);
   	 s+="]";
   	model.addAttribute("s", s);
		System.out.println(s);

		String json = JSONArray.fromObject(devAttr).toString();
		System.out.println(json.length());
		System.out.println(devAttr);

/*		response.setHeader("Cache-Contrl", "no-cache");
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(json);
		response.getWriter().flush();*/

	return "/Map/map2.jsp";
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