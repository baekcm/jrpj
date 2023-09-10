package com.jnet.front.common.dao;

import java.sql.SQLException;
import java.util.Map;

import com.jnet.domain.Menu;

public interface CommonDao {

	public abstract void saveSatfact(Map<String, String> hmap) throws SQLException;
	public abstract int selectSatfactDup(Map<String, String> hmap) throws SQLException;
	public abstract Menu selectContentInfo(Menu menu) throws SQLException;
}
