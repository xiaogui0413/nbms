package com.jxust.ssm.service.impl;

import java.util.List;

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
		
		return userDataDao.selectByPrimaryKey(clerkName, password);
	}
	@Override
	public List<UserData> selectUserList() {
		
		return userDataDao.selectUserList();
	}
	@Override
	public void deleteByPrimaryKey(String id) {
		
		userDataDao.deleteByPrimaryKey(id);
	}
	@Override
	public void updateUser(UserData userData) {
		
		userDataDao.updateUser(userData);
	}
	@Override
	public void insertUser(UserData userData) {
		
		userDataDao.insertUser(userData);
	}
	@Override
	public UserData selectById(String id) {
		
		return userDataDao.selectById(id);
	}
	

}
