package com.jxust.ssm.service;

import java.util.List;

import com.jxust.ssm.pojo.SubType;

public interface SubTypeService {
	
	List<SubType> selectSubTypeList();
	
	SubType selectByPrimaryKey(int id);
	
	List<SubType> selectSubTypeByType(int id);

}
