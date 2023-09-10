package com.jnet.admin.logMng.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.logMng.dao.AdminLogMngDao;
import com.jnet.admin.logMng.service.AdminLogMngService;
import com.jnet.domain.Common;

@Service
public class AdminLogMngServiceImpl implements AdminLogMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private AdminLogMngDao aminLogMngDao;

	@Override
	public int findLogTotCnt(Common commonParam) throws SQLException {
		logger.info("AdminLogMngServiceImpl - findLogTotCnt");
		return aminLogMngDao.findLogTotCnt(commonParam);
	}

	@Override
	public ArrayList<Common> listLogMng(Common commonParam) throws SQLException {
		logger.info("AdminLogMngServiceImpl - listLogMng");
		return aminLogMngDao.listLogMng(commonParam);
	}

	
}
