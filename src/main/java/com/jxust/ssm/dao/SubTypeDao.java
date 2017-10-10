package com.jxust.ssm.dao;

import java.util.List;

import com.jxust.ssm.pojo.SubType;

public interface SubTypeDao {
	
	List<SubType> selectSubTypeList();
	
	SubType selectByPrimaryKey(int id);

}
