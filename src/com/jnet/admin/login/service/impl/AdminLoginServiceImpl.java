package com.jnet.admin.login.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.login.dao.AdminLoginDao;
import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.domain.Admin;
import com.jnet.domain.Common;
import com.jnet.domain.Member;
import com.jnet.domain.Menu;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private AdminLoginDao adminLoginDao;

	@Override
	public Admin findAdminLoginInfo(Admin adminParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - findAdminLoginInfo");
		return adminLoginDao.findAdminLoginInfo(adminParam);
	}

	@Override
	public ArrayList<Menu> listAdminAuth(Admin adminResult) throws SQLException {
		logger.info("AdminLoginServiceImpl - listAdminAuth");
		return adminLoginDao.listAdminAuth(adminResult);
	}

	@Override
	public ArrayList<Menu> listMenu(Menu menuParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listMenu");
		return adminLoginDao.listMenu(menuParam);
	}

	@Override
	public Common findMemMinGrpCnt(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - findMemMinGrpCnt");
		return adminLoginDao.findMemMinGrpCnt(commonParam);
	}

	@Override
	public ArrayList<Common> listMemMonth(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listMemMonth");
		return adminLoginDao.listMemMonth(commonParam);
	}

	@Override
	public ArrayList<Common> listMemDay(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listMemDay");
		return adminLoginDao.listMemDay(commonParam);
	}
	
	@Override
	public ArrayList<Common> listMemDate() throws SQLException {
		logger.info("AdminLoginServiceImpl - listMemDate");
		return adminLoginDao.listMemDate();
	}
	
	@Override
	public ArrayList<Common> listSiteMonth(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listSiteMonth");
		return adminLoginDao.listSiteMonth(commonParam);
	}

	@Override
	public ArrayList<Common> listSiteDay(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listSiteDay");
		return adminLoginDao.listSiteDay(commonParam);
	}

	@Override
	public ArrayList<Common> listSiteDate() throws SQLException {
		logger.info("AdminLoginServiceImpl - listSiteDate");
		return adminLoginDao.listSiteDate();
	}

	@Override
	public void updateAdmLoginInfo(Admin adminParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - updateAdmLoginInfo");
		adminLoginDao.updateAdmLoginInfo(adminParam);
	}

	@Override
	public ArrayList<Common> listMemYear(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listMemYear");
		return adminLoginDao.listMemYear(commonParam);
	}

	@Override
	public ArrayList<Common> listSiteYear(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listSiteYear");
		return adminLoginDao.listSiteYear(commonParam);
	}

	@Override
	public ArrayList<Member> listMemSlctDate(Common commonParam) throws SQLException {
		logger.info("AdminLoginServiceImpl - listMemSlctDate");
		return adminLoginDao.listMemSlctDate(commonParam);
	}

	@Override
	public ArrayList<Member> listSiteSlctDate(Common commonParam)throws SQLException {
		logger.info("AdminLoginServiceImpl - listSiteSlctDate");
		return adminLoginDao.listSiteSlctDate(commonParam);
	}
}
