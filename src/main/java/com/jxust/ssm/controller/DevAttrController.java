package com.jxust.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxust.ssm.pojo.DevAttr;
import com.jxust.ssm.pojo.StockOut;
import com.jxust.ssm.service.DevAttrService;
import com.jxust.ssm.service.StockOutService;
//import com.jxust.ssm.udpserver.UDPServer;

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
	@Resource
	private StockOutService stockOutService;
	
	@RequestMapping("/showDevAttr")
	public String testtoshowUser(@RequestParam(value = "id") Integer id, Model model) {
		DevAttr devAttr = devAttrService.getDevAttrById(id);
		model.addAttribute("devAttr", devAttr);
		return "/WEB-INF/views/";
	}
	
	@RequestMapping("/listDevAttr")
	public String testlidevser( HttpServletResponse response,Model model) throws IOException{
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		model.addAttribute("devAttr", devAttr);
		
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
   	 	model.addAttribute("s", s);
	/*	JSONArray json = JSONArray.fromObject(devAttr);*/

/*		response.setHeader("Cache-Contrl", "no-cache");
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(json);
		response.getWriter().flush();*/

	return "/Map/map5.jsp";
	}
	
	
	//查询设备列表带分页
	@RequestMapping("/listDevAttrByPage")
	public String listDevAttrByPage(Model model,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="8") Integer pageSize) throws IOException{
		
		PageHelper.startPage(page, pageSize);
		
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		PageInfo<DevAttr> p=new PageInfo<DevAttr>(devAttr);
		System.out.println(p.getPageNum());
		if(p.getPageNum()<=0){
			p.setPageNum(1);
		}
		model.addAttribute("page",p);
		model.addAttribute("devAttr", devAttr);
		
		String s="[";
		for(DevAttr d:devAttr){
			 s +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getSn()+"],";
			/*System.out.println(d.getX_pos()+d.getY_pos());*/				
		}
		s = s.substring(0,s.length()-1);
		s+="]";
		
   	 	model.addAttribute("s", s);
	return "/Map/map5.jsp";
	}
	
	@RequestMapping(value = "/selectDevAttr",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectDevAttr(HttpServletResponse response,@RequestBody int id,Model model) {
		DevAttr devAttr1 = devAttrService.getDevAttrById(id);
		String json = JSONArray.fromObject(devAttr1).toString();
		System.out.println(json);
		return json.toString();
	}
	
	/*取消对设备的监控*/
	@RequestMapping(value = "/recallDevAttr",produces = "application/json; charset=utf-8")
	@ResponseBody
	public void recallDevAttr(HttpServletResponse response,@RequestBody int id,Model model) {
		
		//int count = devAttrService.selectCountDevAttr();
/*		if(count == 1){
			model.addAttribute("username", "不能删除最后一个设备");
			
		}*/
		System.out.println(id);
		
		 DevAttr dev = devAttrService.getDevAttrById(id);
		  String devID = dev.getsDevID();
		stockOutService.updateStockOutState1(devID);
		 devAttrService.deleteByPrimaryKey(id);
		System.out.println("已经取消监控了");
	}
	
	@RequestMapping(value="/selectDevAttr1",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectDevAttr1(HttpServletResponse response,@RequestBody int id) throws IOException{
		DevAttr dev = devAttrService.getDevAttrById(id);
		System.out.println(dev);

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
		return json.toString();
	}
	
	@RequestMapping("/listDevAttrTest")
	public String listDevAttrTest( HttpServletResponse response,Model model) throws IOException{
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		model.addAttribute("devAttr", devAttr);
		
		List<DevAttr> devAttrOnline = devAttrService.selectDevAttrOnline();
		
		List<DevAttr> devAttrOffline = devAttrService.selectDevAttrOffline();

		//所有设备
		String s="[";
		for(DevAttr d:devAttr){
			 s +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getSn()+"],";				
		}
		s = s.substring(0,s.length()-1);
		s+="]";
   	 	model.addAttribute("s", s);
   	 	
   	 	//在线设备
   	 	String online="[";
		for(DevAttr d:devAttrOnline){
			online +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getSn()+"],";				
		}
		online = online.substring(0,online.length()-1);
		online+="]";
	 	model.addAttribute("online", online);
   	 	//离线设备
	 	String offline="[";
		for(DevAttr d:devAttrOffline){
			offline +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getSn()+"],";				
		}
		offline = offline.substring(0,offline.length()-1);
		offline+="]";
   	 	model.addAttribute("offline", offline);

	return "/Map/map2Test.jsp";
	}
	
	@RequestMapping("/listDevAttrTest2")
	public String listDevAttrTest2( HttpServletResponse response,Model model) throws IOException{
		List<DevAttr> devAttr = devAttrService.selectDevAttrList();
		model.addAttribute("devAttr", devAttr);
		
		DevAttr devAttr1 = devAttrService.getDevAttrById(1);
		model.addAttribute("devAttr1", devAttr1);
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
   	 /*	model.addAttribute("s", s);*/

	/*	JSONArray json = JSONArray.fromObject(devAttr);*/

/*		response.setHeader("Cache-Contrl", "no-cache");
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(json);
		response.getWriter().flush();*/
	return "/Map/map2Test1.jsp";
	}
	
	@RequestMapping("/insertToDevAttr")
	@ResponseBody
	public String insertToDevAttr(@RequestBody int id,Model model) throws IOException{
		StockOut stockOut = stockOutService.selectByPrimaryKey(id);
		int devType = stockOut.getnDevType();
		int devSubType = stockOut.getnSubtype();
		String sDevID = stockOut.getsDevID();
		String devName = stockOut.getsDevName();		
		String devID = stockOut.getsDevID();
		System.out.println("DEVID是"+devID);
		DevAttr dev = new DevAttr();
		dev.setsDevID(sDevID);
		dev.setnDevType(devType);
		dev.setnSubtype(devSubType);
		dev.setsDevName(devName);
		dev.setsDevID(devID);
		int state = stockOut.getState();
		if(state == 1){
			JSONArray json = JSONArray.fromObject(state);
			return json.toString();
		}
		else{
			devAttrService.insertDevAttr(dev);
			stockOutService.updateStockOutState(id);
			JSONArray json = JSONArray.fromObject(state);
			return json.toString();
			}

	}
	
	@RequestMapping("/selectByDevName")
	public String selectByDevName(Model model, HttpServletRequest request) {
		String devName = request.getParameter("devName");
		List<DevAttr> devAttr = devAttrService.selectByDevName(devName);
		model.addAttribute("devAttr", devAttr);
		String s="[";
		for(DevAttr d:devAttr){
			 s +="["+ d.getX_pos()+","+d.getY_pos()+","+d.getSn()+"],";
			/*System.out.println(d.getX_pos()+d.getY_pos());*/					
		}
		s = s.substring(0,s.length()-1);
		s+="]";

   	 	model.addAttribute("s", s);
   	 	return "/Map/map5.jsp";
	}
	
	@RequestMapping("/getUdpData")
	public String getUdpData(Model model) throws IOException{
		/*UDPServer udp = new UDPServer();*/
	return null;
	}
	
}