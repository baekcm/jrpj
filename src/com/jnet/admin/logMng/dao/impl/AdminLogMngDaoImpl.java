package com.jnet.admin.logMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.logMng.dao.AdminLogMngDao;
import com.jnet.domain.Common;

@Repository
public class AdminLogMngDaoImpl implements AdminLogMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;

	@Override
	public int findLogTotCnt(Common commonParam) throws SQLException {
		logger.info("AdminLogMngDaoImpl-findLogTotCnt");
		return (Integer)sql.selectOne("logSql.findLogTotCnt",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listLogMng(Common commonParam) throws SQLException {
		logger.info("AdminLogMngDaoImpl-listLogMng");
		return (ArrayList<Common>)sql.selectList("logSql.listLogMng",commonParam);
	}
	
}
