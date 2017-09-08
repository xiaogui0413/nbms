package com.jxust.ssm.dao;

import java.util.List;

import com.jxust.ssm.pojo.StockIn;

public interface StockInDao {
    StockIn selectByPrimaryKey(Integer id);
	
	List<StockIn> selectStockInList();
	
	List<StockIn> selectByDevName(String devName);
	
	void deleteByPrimaryKey(Integer id);
	
	void updateStockIn(StockIn stockIn);
	
	void insertStockIn(StockIn stockIn);
}
