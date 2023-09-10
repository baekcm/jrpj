package com.jnet.admin.login.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.login.dao.AdminLoginDao;
import com.jnet.domain.Admin;
import com.jnet.domain.Common;
import com.jnet.domain.Member;
import com.jnet.domain.Menu;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;

	@Override
	public Admin findAdminLoginInfo(Admin adminParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-findAdminLoginInfo");
		return (Admin) sql.selectOne("loginSql.findAdminLoginInfo",adminParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listAdminAuth(Admin adminResult) throws SQLException {
		logger.info("AdminLoginDaoImpl-listAdminAuth");
		return (ArrayList<Menu>)sql.selectList("loginSql.listAdminAuth",adminResult);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listMenu(Menu menuParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listMenu");
		return (ArrayList<Menu>)sql.selectList("menuSql.listMenu",menuParam);
	}

	@Override
	public Common findMemMinGrpCnt(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-findMemMinGrpCnt");
		return (Common)sql.selectOne("adminMainSql.findMemMinGrpCnt",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listMemMonth(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listMemMonth");
		return (ArrayList<Common>)sql.selectList("loginSql.listMemMonth",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listMemDay(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listMemDay");
		return (ArrayList<Common>)sql.selectList("loginSql.listMemDay",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listMemDate() throws SQLException {
		logger.info("AdminLoginDaoImpl-listMemDate");
		return (ArrayList<Common>)sql.selectList("loginSql.listMemDate");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listSiteMonth(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listSiteMonth");
		return (ArrayList<Common>)sql.selectList("loginSql.listSiteMonth",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listSiteDay(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listSiteDay");
		return (ArrayList<Common>)sql.selectList("loginSql.listSiteDay",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listSiteDate() throws SQLException {
		logger.info("AdminLoginDaoImpl-listSiteDate");
		return (ArrayList<Common>)sql.selectList("loginSql.listSiteDate");
	}

	@Override
	public void updateAdmLoginInfo(Admin adminParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-updateAdmLoginInfo");
		sql.update("loginSql.updateAdmLoginInfo",adminParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listMemYear(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listMemYear");
		return (ArrayList<Common>) sql.selectList("loginSql.listMemYear",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listSiteYear(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listSiteYear");
		return (ArrayList<Common>) sql.selectList("loginSql.listSiteYear",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Member> listMemSlctDate(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listMemSlctDate");
		return (ArrayList<Member>) sql.selectList("loginSql.listMemSlctDate",commonParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Member> listSiteSlctDate(Common commonParam) throws SQLException {
		logger.info("AdminLoginDaoImpl-listSiteSlctDate");
		return (ArrayList<Member>) sql.selectList("loginSql.listSiteSlctDate",commonParam);
	}
}
