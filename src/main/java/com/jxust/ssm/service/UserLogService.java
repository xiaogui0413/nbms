package com.jxust.ssm.service;

import java.util.List;

import com.jxust.ssm.pojo.UserLog;

public interface UserLogService {
	
	List<UserLog> selectUserLogList();
	
	List<UserLog> selectByOperator(String operator);
	
	void insertUserLog(UserLog userLog);

}
