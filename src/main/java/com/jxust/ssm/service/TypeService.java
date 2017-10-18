package com.jxust.ssm.service;

import java.util.List;

import com.jxust.ssm.pojo.Type;

public interface TypeService {
	
	Type selectByPrimaryKey();
	
	List<Type> selectTypeList();
	
	void deleteByPrimaryKey(int id);
	
	void insertType(Type type);
	
	void updateByPrimaryKey();
	
	List<Type> selectSubTypeByType(int id);

}
