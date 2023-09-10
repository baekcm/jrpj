package com.jnet.front.common.dao.impl;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.domain.Menu;
import com.jnet.front.common.dao.CommonDao;

@Repository
public class CommonDaoImpl implements CommonDao {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public void saveSatfact(Map<String, String> hmap) throws SQLException {
		sql.insert("satfactSql.saveSatfact",hmap);
	}
	
	@Override
	public int selectSatfactDup(Map<String, String> hmap) throws SQLException {
		return (Integer)sql.selectOne("satfactSql.selectSatfactDup",hmap);
	}
	
	@Override
	public Menu selectContentInfo(Menu menu) throws SQLException {
		return (Menu)sql.selectOne("satfactSql.selectContentInfo",menu);
	}
	
	
}
