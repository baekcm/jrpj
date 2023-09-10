package com.jnet.admin.commonMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Common;
import com.jnet.domain.Menu;


public interface AdminCommonMngDao {

	/**
	 * 공통코드 목록조회
	 * 
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listCommonCode(Common commonParam) throws SQLException;

	/**
	 * 사업장/게시판타입별 목록조회
	 * @param menuParam menuParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> listMenuByType(Menu menuParam) throws SQLException;
}
