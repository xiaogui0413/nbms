package com.jxust.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.ssm.pojo.DevAttr;
import com.jxust.ssm.pojo.UserData;
import com.jxust.ssm.service.DevAttrService;
import com.jxust.ssm.service.UserDataService;
import com.jxust.ssm.utils.BaiduMapUtil;
import com.jxust.ssm.utils.Md5Utils;

import net.sf.json.JSONObject;

@Controller
public class DevInvokeController {

	@Resource
	private DevAttrService devAttrService;
	@Resource
	private UserDataService userDataService;

	@RequestMapping(value = "/whereis", produces = "application/json; charset=utf-8")
	public String whereIs(Model model, String user, String passwd, String devid, String format) {
		System.out.println(format);
		String password = Md5Utils.md5(passwd);
		UserData userData = userDataService.selectByPrimaryKey(user, password);
		DevAttr devAttr = devAttrService.selectByDevID(devid);
		if (userData == null) {
			return "没有授权！";
		}

		if (format.equals("map")) {
			System.out.println("地图");
			String ss = devAttr.getX_pos() + "," + devAttr.getY_pos() + "," + devAttr.getsDevID();
			System.out.println(ss);
			String s = "[" + ss + "]";
			model.addAttribute("s", s);
			return "/invokeMap2.jsp";
			// return "/Map/map5.jsp";
		} else {

			Double BattValt = devAttr.getfBatteryVolt();
			Double Hop = devAttr.getfHop();
			String Position = devAttr.getX_pos() + "," + devAttr.getY_pos();
			String Local = devAttr.getnLocaMode();
			Map<Object, Object> devMap = new HashMap<Object, Object>();
			devMap.put("Position", Position);
			devMap.put("Hop", Hop);
			devMap.put("Local", Local);
			devMap.put("BattValt", BattValt);
			JSONObject json = JSONObject.fromObject(devMap);
			return json.toString();
		}
	}

	@RequestMapping(value = "/whereis2", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String whereIs2(String devid, String ak) {
		// String devid = "865352030203284";
		DevAttr devAttr = devAttrService.selectByDevID(devid);
		if (ak.equals("ssssss") && devAttr != null) {

			String position = devAttr.getY_pos() + "," + devAttr.getX_pos();
			String position2 = devAttr.getX_pos() + "," + devAttr.getY_pos();

			Double BattValt = devAttr.getfBatteryVolt();
			Double Hop = devAttr.getfHop();
			String Position = devAttr.getX_pos() + "," + devAttr.getY_pos();
			String Local = devAttr.getnLocaMode();
			String devName = devAttr.getsDevName();

			String transferedPosition = BaiduMapUtil.getPositionTransfer(position2);
			String first = transferedPosition.substring(2, 16);
			String last = transferedPosition.substring(22);
			String aa = last + "," + first;
			position = aa;

			String str = BaiduMapUtil.getAddress(position);
			str = str.substring(3, str.length() - 3);

			Map<Object, Object> devMap = new HashMap<Object, Object>();
			devMap.put("devName", devName);
			devMap.put("Position", Position);
			devMap.put("Hop", Hop);
			devMap.put("Local", Local);
			devMap.put("BattValt", BattValt);
			devMap.put("地址：", str);

			JSONObject json = JSONObject.fromObject(devMap);
			return json.toString();
		} else {
			return "0";
		}

	}

}
