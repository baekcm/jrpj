package com.jnet.front.menu.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.domain.Menu;
import com.jnet.front.menu.dao.FrontMenuDao;
import com.jnet.front.menu.service.FrontMenuService;

@Service
public class FrontMenuServiceImpl implements FrontMenuService {

	@Autowired
	private FrontMenuDao frontMenuDao;
	

	@Override
	public ArrayList<Menu> frontContents(Menu menuParam) throws SQLException {
		return frontMenuDao.frontContents(menuParam);
	}
	
	
	@Override
	public String findFrontCts(HashMap<String, String> hmap) throws SQLException {
		return frontMenuDao.findFrontCts(hmap);
	}
	
	@Override
	public ArrayList<Menu> listTest() throws SQLException {
		HashMap<String, String> hmap = new HashMap<String, String>();
		return frontMenuDao.listTest(hmap);
	}
	
	
	@Override
	public void updateTest(Menu menuParam) throws SQLException {
		frontMenuDao.updateTest(menuParam);
	}
}
