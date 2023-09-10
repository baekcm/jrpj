package com.jnet.front.menu.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.domain.Menu;
import com.jnet.front.menu.dao.FrontMenuDao;

@Repository
public class FrontMenuDaoImpl implements FrontMenuDao {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> frontContents(Menu menuParam) throws SQLException {
		return (ArrayList<Menu>)sql.selectList("menuSql.frontContents",menuParam);
	}
	
	
	@Override
	public String findFrontCts(HashMap<String, String> hmap) throws SQLException {
		return (String)sql.selectOne("ctsSql.findFrontCts",hmap);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listTest(HashMap<String, String> hmap) throws SQLException {
		return (ArrayList<Menu>)sql.selectList("ctsSql.listTest",hmap);
	}
	
	
	@Override
	public void updateTest(Menu menuParam) throws SQLException {
		sql.update("ctsSql.updateTest",menuParam);
	}
}
