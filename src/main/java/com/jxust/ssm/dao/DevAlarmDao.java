package com.jxust.ssm.dao;

import java.util.List;
import java.util.Map;

import com.jxust.ssm.pojo.DevAlarm;

public interface DevAlarmDao {
	
	List<DevAlarm> selectDevAlarmList();
	
	List<DevAlarm> selectDevAlarmMap(Map<String, Object> paramMap);

}
