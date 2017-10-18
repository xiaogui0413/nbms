package com.jxust.ssm.service;

import java.util.List;

import com.jxust.ssm.pojo.StockOut;

public interface StockOutService {
	StockOut selectByPrimaryKey(Integer id);
	
	List<StockOut> selectStockOutList();
	
	List<StockOut> selectByDevName(String devName);
	
	void deleteByPrimaryKey(Integer id);
	
	void updateStockOut(StockOut stockOut);

	void insertStockOut(StockOut stockOut);
	
	StockOut selectByDevLabel(String sDevLabel);
	
	void updateStockOutState(Integer id);
	
	void updateStockOutState1(String id);
}
