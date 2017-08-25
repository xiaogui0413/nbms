package com.jxust.ssm.dao;

import java.util.List;

import com.jxust.ssm.pojo.DevAttr;

/**
 * @author GuiqiHu
 *
 * @date 2017年8月22日 下午2:59:11
 */
public interface DevAttrDao {
	DevAttr selectByPrimaryKey(Integer id);
	
	List<DevAttr> selectDevAttrList();

}
