package com.jnet.front.common.service.impl;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.domain.Menu;
import com.jnet.front.common.dao.CommonDao;
import com.jnet.front.common.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private CommonDao commonDao;
	
	@Override
	public void saveSatfact(Map<String, String> hmap) throws SQLException{
		commonDao.saveSatfact(hmap);
	}
	
	@Override
	public int selectSatfactDup(Map<String, String> hmap) throws SQLException{
		return (int)commonDao.selectSatfactDup(hmap);
	}
	
	@Override
	public Menu selectContentInfo(Menu menu) throws SQLException{
		return (Menu)commonDao.selectContentInfo(menu);
	}
}
