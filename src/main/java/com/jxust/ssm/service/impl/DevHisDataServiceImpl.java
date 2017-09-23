package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.ssm.dao.DevHisDataDao;
import com.jxust.ssm.pojo.DevHisData;
import com.jxust.ssm.service.DevHisDataService;

@Transactional
@Service("devHisDataService")
public class DevHisDataServiceImpl implements DevHisDataService{

	@Resource
	DevHisDataDao devHisDataDao;

	@Override
	public List<DevHisData> selectDevHisDataList() {
		
		return devHisDataDao.selectDevHisDataList();
	}

}
