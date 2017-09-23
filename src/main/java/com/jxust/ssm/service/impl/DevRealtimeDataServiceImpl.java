package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.ssm.dao.DevRealtimeDataDao;
import com.jxust.ssm.pojo.DevRealtimeData;
import com.jxust.ssm.service.DevRealtimeDataService;

@Transactional
@Service("devRealtimeDataService")
public class DevRealtimeDataServiceImpl implements DevRealtimeDataService{

	@Resource
	DevRealtimeDataDao devRealtimeDataDao;

	@Override
	public List<DevRealtimeData> selectDevRealtimeDataList() {
		// TODO Auto-generated method stub
		return devRealtimeDataDao.selectDevRealtimeDataList();
	}

}
