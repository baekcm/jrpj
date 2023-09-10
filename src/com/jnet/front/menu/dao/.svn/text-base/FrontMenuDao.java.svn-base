package com.jnet.front.menu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.jnet.domain.Menu;

public interface FrontMenuDao {

	/**
	 * 메뉴 조회
	 * @param menuParam menuParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> frontContents(Menu menuParam) throws SQLException;
	
	/**
	 * 사용자 컨텐츠 조회
	 * @param hashamp map
	 * @throws SQLException SQLException
	 */
	public abstract String findFrontCts(HashMap<String, String> hmap) throws SQLException;
	
	public abstract ArrayList<Menu> listTest(HashMap<String, String> hmap) throws SQLException;
	
	public abstract void updateTest(Menu menuParam) throws SQLException;
	
}
