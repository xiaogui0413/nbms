/**
 * 
 */
package com.jxust.ssm.service;

import java.util.List;

import com.jxust.ssm.pojo.DevAttr;

/**
 * @author GuiqiHu
 *
 * @date 2017年8月22日 下午3:00:45
 */
public interface DevAttrService {
	//根据id查找
	public DevAttr getDevAttrById(Integer id);
	
	List<DevAttr> selectDevAttrList();
	
	List<DevAttr> selectDevAttrOnline();
	
	List<DevAttr> selectDevAttrOffline();
	
	List<DevAttr> selectDevAttrByDevType();
	
	void insertDevAttr(DevAttr devAttr);
	
	void deleteByPrimaryKey(Integer id);
	
	int selectCountDevAttr();
	
	List<DevAttr> selectByDevName(String devName);

}
