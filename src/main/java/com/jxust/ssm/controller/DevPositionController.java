package com.jxust.ssm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jxust.ssm.service.DevAttrService;

@Controller
public class DevPositionController {

	@Resource
	private DevAttrService devAttrService;

}
