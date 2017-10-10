package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.jxust.ssm.dao.SubTypeDao;
import com.jxust.ssm.pojo.SubType;
import com.jxust.ssm.service.SubTypeService;

@Transactional
@Service("subTypeService")
public class SubTypeServiceImpl implements SubTypeService{

	@Resource
	SubTypeDao subTypeDao;
	
	@Override
	public List<SubType> selectSubTypeList() {

		List<SubType> parent = subTypeDao.selectSubTypeList();
/*		
		for(SubType parents:parent){
			// 查询出当前父分类的所有子分类
						List<SubType> children = (List<SubType>) selectByPrimaryKey(parents.getId());
						// 设置给父分类
						parents.setParentCode(children);
			
		}*/
		
		subTypeDao.selectSubTypeList();
		return subTypeDao.selectSubTypeList();
	}
	@Override
	public SubType selectByPrimaryKey(int id) {

		return subTypeDao.selectByPrimaryKey(id);
	}

}
