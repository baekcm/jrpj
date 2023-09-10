package com.jnet.front.menu.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.jnet.domain.Menu;

public interface FrontMenuService {

	
	/**
	 * 메뉴 조회
	 * @param menuParam menuParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> frontContents(Menu menuParam) throws SQLException;
	
	/**
	 * 사용자 컨텐츠 조회
	 * 
	 * @param HashMap  hmap
	 * @throws Exception Exception
	 */
	public abstract String findFrontCts(HashMap<String, String> hmap) throws Exception;
	
	public abstract ArrayList<Menu> listTest() throws SQLException;
	
	public abstract void updateTest(Menu menuParam) throws SQLException;
}
