package com.jnet.admin.empMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.empMng.dao.AdminEmpMngDao;
import com.jnet.domain.Emp;

@Repository
public class AdminEmpMngDaoImpl implements AdminEmpMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public int findEmpTotCnt(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngDaoImpl-findEmpTotCnt");
		return (Integer)sql.selectOne("empSql.findEmpTotCnt",empParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Emp> listEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngDaoImpl-listEmpMng");
		return (ArrayList<Emp>)sql.selectList("empSql.listEmpMng",empParam);
	}
	
	@Override
	public Emp findEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngDaoImpl-findEmpMng");
		return (Emp)sql.selectOne("empSql.findEmpMng",empParam);
	}
	
	@Override
	public void saveEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngDaoImpl-saveEmpMng");
		sql.insert("empSql.saveEmpMng",empParam);
	}
	
	@Override
	public void updateEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngDaoImpl-updateEmpMng");
		sql.update("empSql.updateEmpMng",empParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Emp> listAllMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngDaoImpl-listAllMng");
		return (ArrayList<Emp>)sql.selectList("empSql.listAllMng",empParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Emp> listDept() throws SQLException {
		logger.info("AdminEmpMngDaoImpl-listDept");
		return (ArrayList<Emp>)sql.selectList("empSql.listDept");
	}

	@Override
	public void removeEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngDaoImpl-removeEmpMng");
		sql.update("empSql.removeEmpMng",empParam);
	}
}
