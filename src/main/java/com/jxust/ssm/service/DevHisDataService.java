package com.jxust.ssm.service;

import java.util.List;
import java.util.Map;

import com.jxust.ssm.pojo.DevHisData;

public interface DevHisDataService {
	
	List<DevHisData> selectDevHisDataList();
	
	/*List<DevHisData> selectStockInMap(DevHisData dev);*/
	
	List<DevHisData> selectDevHisDataMap(Map<String, Object> paramMap);

}
