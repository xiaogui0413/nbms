package com.jxust.ssm.service;

import com.jxust.ssm.pojo.UserData;

public interface UserDataService {
	
	UserData selectByPrimaryKey(String clerkName,String password);

}
