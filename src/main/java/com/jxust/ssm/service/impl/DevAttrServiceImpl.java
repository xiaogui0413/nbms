package com.jxust.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.ssm.dao.DevAttrDao;
import com.jxust.ssm.pojo.DevAttr;
import com.jxust.ssm.service.DevAttrService;

/**
 * @author GuiqiHu
 *
 * @date 2017年8月22日 下午3:01:34
 */
@Transactional
@Service("devAttrService")
public class DevAttrServiceImpl implements DevAttrService{
	
	@Resource
	DevAttrDao devAttrDao;
	@Override
	public DevAttr getDevAttrById(Integer id) {
		
		return devAttrDao.selectByPrimaryKey(id);
	}

	@Override
	public List<DevAttr> selectDevAttrList() {
		
		return devAttrDao.selectDevAttrList();
	}

	@Override
	public List<DevAttr> selectDevAttrOnline() {
		
		return devAttrDao.selectDevAttrOnline();
	}

	@Override
	public List<DevAttr> selectDevAttrOffline() {
		
		return devAttrDao.selectDevAttrOffline();
	}

	@Override
	public List<DevAttr> selectDevAttrByDevType() {
		
		return devAttrDao.selectDevAttrByDevType();
	}

	@Override
	public void insertDevAttr(DevAttr devAttr) {
		
		devAttrDao.insertDevAttr(devAttr);
		
	}

	@Override
	public void deleteByPrimaryKey(Integer id) {
		
		devAttrDao.deleteByPrimaryKey(id);
		
	}
	
	

}
