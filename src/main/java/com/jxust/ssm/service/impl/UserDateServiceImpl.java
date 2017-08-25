package com.jxust.ssm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.ssm.dao.UserDataDao;
import com.jxust.ssm.pojo.UserData;
import com.jxust.ssm.service.UserDataService;

@Transactional
@Service("userDataService")
public class UserDateServiceImpl implements UserDataService{

	@Resource
	UserDataDao userDataDao;
	@Override
	public UserData selectByPrimaryKey(String clerkName,String password) {
		System.out.println("执行了seevice");
		return userDataDao.selectByPrimaryKey(clerkName, password);
	}

}
