package com.jxust.ssm.service;

import java.util.List;
import java.util.Map;

import com.jxust.ssm.pojo.DevAlarm;

public interface DevAlarmService {
	
	List<DevAlarm> selectDevAlarmList();
	
	List<DevAlarm> selectDevAlarmMap(Map<String, Object> paramMap);
}
