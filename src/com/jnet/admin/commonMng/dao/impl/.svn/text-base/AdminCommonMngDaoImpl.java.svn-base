package com.jnet.admin.commonMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.commonMng.dao.AdminCommonMngDao;
import com.jnet.domain.Common;
import com.jnet.domain.Menu;

@Repository
public class AdminCommonMngDaoImpl implements AdminCommonMngDao {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listCommonCode(Common commonParam) throws SQLException {
		logger.info("AdminCommonMngDaoImpl-listCommonCode");
		return (ArrayList<Common>)sql.selectList("commonSql.listCommonCode",commonParam);
	}


	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listMenuByType(Menu menuParam) throws SQLException {
		logger.info("AdminCommonMngDaoImpl-listMenuByType");
		return (ArrayList<Menu>)sql.selectList("commonSql.listMenuByType",menuParam);
	}
}
