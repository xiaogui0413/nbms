package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.jxust.ssm.dao.TypeDao;
import com.jxust.ssm.pojo.Type;
import com.jxust.ssm.service.TypeService;

@Transactional
@Service("typeService")
public class TypeServiceImpl implements TypeService{
	
	@Resource
	TypeDao typeDao;

	public Type selectByPrimaryKey() {

		return typeDao.selectByPrimaryKey();
	}

	@Override
	public List<Type> selectTypeList() {

		return typeDao.selectTypeList();
	}

	@Override
	public void deleteByPrimaryKey(int id) {
		
		typeDao.deleteByPrimaryKey(id);
		
	}

	@Override
	public void insertType(Type type) {
		
		typeDao.insertType(type);
		
	}

	public void updateByPrimaryKey() {
		
		typeDao.updateByPrimaryKey();
		
	}

	@Override
	public List<Type> selectSubTypeByType(int id) {
		
		return typeDao.selectSubTypeByType(id);
	}


}