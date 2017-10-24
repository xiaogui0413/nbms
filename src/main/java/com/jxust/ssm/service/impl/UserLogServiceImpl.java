package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.jxust.ssm.dao.UserLogDao;
import com.jxust.ssm.pojo.UserLog;
import com.jxust.ssm.service.UserLogService;

@Transactional
@Service("userLogService")
public class UserLogServiceImpl implements UserLogService{

	@Resource
	UserLogDao userLogDao;
	@Override
	public List<UserLog> selectUserLogList() {
		
		return userLogDao.selectUserLogList();
	}

	@Override
	public List<UserLog> selectByOperator(String operator) {
		
		return userLogDao.selectByOperator(operator);
	}

	@Override
	public void insertUserLog(UserLog userLog) {
		
		userLogDao.insertUserLog(userLog);
	}

}
