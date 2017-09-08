package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.ssm.pojo.DevAttr;
import com.jxust.ssm.pojo.User;
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
	public String testlidevser( HttpServletResponse response,Model model) throws IOException{
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		model.addAttribute("devAttr", devAttr);
		
		DevAttr devAttr1 = devAttrService.getDevAttrById(1);
		model.addAttribute("devAttr1", devAttr1);
		System.out.println("hah"+devAttr1.getsDevName());
		String s="[";
		for(DevAttr d:devAttr){
			 s +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getSn()+"],";
			/*System.out.println(d.getX_pos()+d.getY_pos());*/					
		}
		s = s.substring(0,s.length()-1);
		s+="]";
		String sa="[";
		for(DevAttr d:devAttr){
			 sa +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getsDevName()+"],";
			/*System.out.println(d.getX_pos()+d.getY_pos());*/					
		}
		sa = sa.substring(0,s.length()-1);
		sa+="]";
		model.addAttribute("sa", sa);
		System.out.println(sa);
   	 	model.addAttribute("s", s);
		System.out.println(s);

		JSONArray json = JSONArray.fromObject(devAttr);
		System.out.println(json);

/*		response.setHeader("Cache-Contrl", "no-cache");
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(json);
		response.getWriter().flush();*/

	return "/Map/map2.jsp";
	}
	
	@RequestMapping("/selectDevAttr")
	public String selectDevAttr(Model model) {
		DevAttr devAttr1 = devAttrService.getDevAttrById(1);
		System.out.println(devAttr1);
		String zuobiao = devAttr1.getX_pos()+devAttr1.getY_pos();
		model.addAttribute("devAttr", devAttr1);
		System.out.println(zuobiao);
		return "/Map/map0.jsp";
	}
	
	@RequestMapping(value="/selectDevAttr1",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectDevAttr1(HttpServletResponse response) throws IOException{
		DevAttr dev = devAttrService.getDevAttrById(2);
		String json = JSONArray.fromObject(dev).toString();
		System.out.println(json);
		return json.toString();
	/*	response.setHeader("Cache-Contrl", "no-cache");
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(json);
		response.getWriter().flush();*/

	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		System.out.println(devAttr);
		model.addAttribute("devAttr", devAttr);
		return "/index.jsp";
	}
	
	@RequestMapping(value="/listDevAttr2",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String testlidevser2( HttpServletResponse response,Model model) throws IOException{
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		model.addAttribute("devAttr", devAttr);
		
		 response.setContentType("text/javascript;charset=utf-8"); //当然如果是json数据,需要设置为("text/JavaScript;charset=utf-8");
		 
		    response.setCharacterEncoding("utf-8");
		JSONArray json = JSONArray.fromObject(devAttr);
		System.out.println(json);
		System.out.println("%%%%%%"+json.toString());
		return json.toString();
	}
	
	@RequestMapping("/testJson")
	@ResponseBody
	   public List<DevAttr> test(){  
        List<DevAttr> list = new ArrayList<DevAttr>();  
          
        //注入值  
        DevAttr dev = new DevAttr();  
        dev.setSn(1);  
        dev.setsDevName("张三"); 
        dev.setnState(1);
        list.add(dev);  
  
        DevAttr dev2 = new DevAttr();  
        dev2.setSn(2);  
        dev2.setsDevName("李四");  
        dev2.setnState(1);  
        list.add(dev2);  
          
        return list;  //直接返回list对象  
    }
	
	
	@RequestMapping("/testJson1")
	@ResponseBody
	public User jsonSource(User user){
		System.out.println("huhude");
		return user;
	}

}