package com.jxust.ssm.service.impl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<DevHisData> selectDevHisDataMap(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return devHisDataDao.selectDevHisDataMap(paramMap);
	}

	/*@Override
	public List<DevHisData> selectStockInMap(DevHisData dev) {
		
		return devHisDataDao.selectStockInMap(dev);
	}*/

}
