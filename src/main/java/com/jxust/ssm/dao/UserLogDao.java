package com.jxust.ssm.dao;

import java.util.List;

import com.jxust.ssm.pojo.UserLog;

public interface UserLogDao {
	
	List<UserLog> selectUserLogList();
	
	List<UserLog> selectByOperator(String operator);
	
	void insertUserLog(UserLog userLog);

}
