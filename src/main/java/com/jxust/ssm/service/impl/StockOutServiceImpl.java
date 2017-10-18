package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.ssm.dao.StockOutDao;
import com.jxust.ssm.pojo.StockOut;
import com.jxust.ssm.service.StockOutService;

@Transactional
@Service("stockOutService")
public class StockOutServiceImpl implements StockOutService{
	
	@Resource
	StockOutDao stockOutDao;
	@Override
	public StockOut selectByPrimaryKey(Integer id) {
		
		return stockOutDao.selectByPrimaryKey(id);
	}

	@Override
	public List<StockOut> selectStockOutList() {
		
		return stockOutDao.selectStockOutList();
	}

	@Override
	public List<StockOut> selectByDevName(String devName) {
		
		return stockOutDao.selectByDevName(devName);
	}

	@Override
	public void deleteByPrimaryKey(Integer id) {
		
		stockOutDao.deleteByPrimaryKey(id);
	}

	@Override
	public void updateStockOut(StockOut stockOut) {
		
		stockOutDao.updateStockOut(stockOut);
	}

	@Override
	public void insertStockOut(StockOut stockOut) {
		
		stockOutDao.insertStockOut(stockOut);
		
	}

	@Override
	public StockOut selectByDevLabel(String sDevLabel) {

		return stockOutDao.selectByDevLabel(sDevLabel);
	}

	@Override
	public void updateStockOutState(Integer id) {
		
		stockOutDao.updateStockOutState(id);
		
	}


	@Override
	public void updateStockOutState1(String id) {
		
		stockOutDao.updateStockOutState1(id);
		
	}

}
