package com.jxust.ssm.dao;

import java.util.List;

import com.jxust.ssm.pojo.Type;

public interface TypeDao {
	
	Type selectByPrimaryKey();
	
	List<Type> selectTypeList();
	
	void deleteByPrimaryKey(int id);
	
	void insertType(Type type);
	
	void updateByPrimaryKey();
	
	List<Type> selectSubTypeByType(int id);

}