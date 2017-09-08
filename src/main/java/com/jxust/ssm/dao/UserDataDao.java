package com.jxust.ssm.dao;

import java.util.List;

import com.jxust.ssm.pojo.UserData;

public interface UserDataDao {
	
	 //用户登陆
	 UserData selectByPrimaryKey(String clerkName,String password);
	 
	 UserData selectById(String id);
	 
	 List<UserData> selectUserList();
	 
	 void deleteByPrimaryKey(String id);
	 
	 void updateUser(UserData userData);
	 
	 void insertUser(UserData userData);

}
