package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.ssm.dao.StockInDao;
import com.jxust.ssm.pojo.StockIn;
import com.jxust.ssm.service.StockInService;

@Transactional
@Service("stockInService")
public class StockInServiceImpl implements StockInService{
	
	@Resource
	StockInDao stockInDao;
	@Override
	public StockIn selectByPrimaryKey(Integer id) {
		return stockInDao.selectByPrimaryKey(id);
	}

	@Override
	public List<StockIn> selectStockInList() {
		return stockInDao.selectStockInList();
	}

	@Override
	public List<StockIn> selectByDevName(String devName) {
		return stockInDao.selectByDevName(devName);
	}

	@Override
	public void deleteByPrimaryKey(Integer id) {
		stockInDao.deleteByPrimaryKey(id);
	}

	@Override
	public void updateStockIn(StockIn stockIn) {
		stockInDao.updateStockIn(stockIn);
	}

	@Override
	public void insertStockIn(StockIn stockIn) {
		stockInDao.insertStockIn(stockIn);
		
	}

}
