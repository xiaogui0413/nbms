package com.jxust.ssm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.jxust.ssm.dao.DevAlarmDao;
import com.jxust.ssm.pojo.DevAlarm;
import com.jxust.ssm.service.DevAlarmService;

@Transactional
@Service("devAlarmService")
public class DevAlarmServiceImpl implements DevAlarmService{

	@Resource
	private DevAlarmDao devAlrmDao;
	@Override
	public List<DevAlarm> selectDevAlarmList() {
		
		return devAlrmDao.selectDevAlarmList();
	}

	@Override
	public List<DevAlarm> selectDevAlarmMap(Map<String, Object> paramMap) {
		
		return devAlrmDao.selectDevAlarmMap(paramMap);
	}

}
