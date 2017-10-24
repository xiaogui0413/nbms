package com.jxust.ssm.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.ssm.pojo.UserData;
import com.jxust.ssm.pojo.UserLog;
import com.jxust.ssm.service.UserDataService;
import com.jxust.ssm.service.UserLogService;
import com.jxust.ssm.utils.AddressUtil;
import com.jxust.ssm.utils.Md5Utils;
import com.jxust.ssm.utils.ValidateCode;

import cz.mallat.uasparser.OnlineUpdater;
import cz.mallat.uasparser.UASparser;
import cz.mallat.uasparser.UserAgentInfo;
import net.sf.json.JSONArray;

@Controller
public class UserDataController {
	
	@Resource
	private UserDataService userDataService;
	@Resource
	private UserLogService userLogService;
	
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
	public String userLogin(Model model,HttpServletRequest request) {
		String clerkName = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		String password1 = Md5Utils.md5(password);
		
		  HttpSession session = request.getSession(); 	  
		    String sessionCode = (String) session.getAttribute("code");  
		    if (!StringUtils.equalsIgnoreCase(code, sessionCode)){
		    	model.addAttribute("msg", "验证码错误！");
				return "/Public/login.jsp";
		    }

		UserData userData = userDataService.selectByPrimaryKey(clerkName, password1);
			if(userData == null){
				model.addAttribute("msg", "用户名或密码错误！");
				return "/Public/login.jsp";
			}
			else{
				model.addAttribute("username", clerkName);
				request.getSession().setAttribute("username",clerkName);
				
				UserLog userLog = new UserLog();
				Date date = new Date();
				SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String loginTime = sdf.format(date);
				userLog.setOperator(clerkName);
				userLog.setCreate_time(loginTime);
				String userIP = getRemoteHost(request); //：获得客户端的ip地址
				userLog.setIp(userIP);
				String address = "";
				 try {
					address = AddressUtil.getAddresses("ip="+userIP, "utf-8");
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				 userLog.setRemark(address);
				
				 String str = request.getHeader("user-agent");
				 UASparser uasParser = null;
				 try {
					uasParser = new UASparser(OnlineUpdater.getVendoredInputStream());
					UserAgentInfo userAgentInfo = uasParser.parse(str);
					String userOS = "用户操作系统为："+ userAgentInfo.getOsName();
					String userBrowser = "用户浏览器为：" + userAgentInfo.getUaName();
					userLog.setContent(userOS+"；"+userBrowser);
				} catch (IOException e) {
					e.printStackTrace();
				}				
				userLogService.insertUserLog(userLog);			
				return "index.jsp";
			}			
	}
	
	  public String getRemoteHost(HttpServletRequest request) {
		    String ip = request.getHeader("x-forwarded-for");
		    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		      ip = request.getHeader("Proxy-Client-IP");
		    }
		    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		      ip = request.getHeader("WL-Proxy-Client-IP");
		    }
		    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		      ip = request.getRemoteAddr();
		    }
		    return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
		  }
	
	@RequestMapping("/selectUserList")
	public String selectUserList(Model model) {
		List<UserData> userData = userDataService.selectUserList();
		model.addAttribute("userData", userData);
		return "User/listUser.jsp";
	}
	
	
	//用户退出
	@RequestMapping("/userLogout")
	public String userLogout(Model model) {

		return "/Public/login.jsp";
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
	
    /** 
     * 响应验证码页面 
     * @return 
     */  
    @RequestMapping(value="/validateCode")  
    public String validateCode(HttpServletRequest request,HttpServletResponse response) throws Exception{  
        // 设置响应的类型格式为图片格式  
        response.setContentType("image/jpeg");  
        //禁止图像缓存。  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
      
        HttpSession session = request.getSession();  
      
        ValidateCode vCode = new ValidateCode(120,30,4,80);  
        session.setAttribute("code", vCode.getCode());  
        vCode.write(response.getOutputStream());  
        return null;  
    }
}