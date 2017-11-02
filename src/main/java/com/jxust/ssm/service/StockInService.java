package com.jxust.ssm.service;

import java.util.List;

import com.jxust.ssm.pojo.StockIn;

public interface StockInService {

	StockIn selectByPrimaryKey(Integer id);

	List<StockIn> selectStockInList();

	List<StockIn> selectByDevName(String devName);

	void deleteByPrimaryKey(Integer id);

	void updateStockIn(StockIn stockIn);

	void insertStockIn(StockIn stockIn);
}
