package com.jxust.ssm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jxust.ssm.service.SubTypeService;

@Controller
public class SubTypeController {
	@Resource
	private SubTypeService subTypeService;

}
