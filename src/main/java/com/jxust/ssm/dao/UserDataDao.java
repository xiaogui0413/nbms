package com.jxust.ssm.dao;

import com.jxust.ssm.pojo.UserData;

public interface UserDataDao {
	
	 //用户登陆
	 UserData selectByPrimaryKey(String clerkName,String password);

}
