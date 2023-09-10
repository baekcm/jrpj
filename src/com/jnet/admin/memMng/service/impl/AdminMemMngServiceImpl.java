package com.jnet.admin.memMng.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.memMng.dao.AdminMemMngDao;
import com.jnet.admin.memMng.service.AdminMemMngService;
import com.jnet.domain.Common;
import com.jnet.domain.Member;
import com.jnet.front.login.dao.FrontLoginDao;

@Service
public class AdminMemMngServiceImpl implements AdminMemMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminMemMngDao adminMemMngDao;

	@Autowired
	private FrontLoginDao frontLoginDao;
	
	@Override
	public int findMemTotCnt(Member memberParam) throws SQLException {
		logger.info("AdminMemMngServiceImpl - findMemTotCnt");
		return adminMemMngDao.findMemTotCnt(memberParam);
	}

	@Override
	public ArrayList<Member> listMemMng(Member memberParam) throws SQLException {
		logger.info("AdminMemMngServiceImpl - listMemMng");
		return adminMemMngDao.listMemMng(memberParam);
	}

	@Override
	public Member findMemMng(Member memberParam) throws SQLException {
		logger.info("AdminMemMngServiceImpl - findMemMng");
		return adminMemMngDao.findMemMng(memberParam);
	}

	@Override
	public int findMemOutTotCnt(Member memberParam) throws SQLException {
		logger.info("AdminMemMngServiceImpl - findMemOutTotCnt");
		return adminMemMngDao.findMemOutTotCnt(memberParam);
	}

	@Override
	public ArrayList<Member> listMemOutMng(Member memberParam) throws SQLException {
		logger.info("AdminMemMngServiceImpl - listMemOutMng");
		return adminMemMngDao.listMemOutMng(memberParam);
	}

	@Override
	public ArrayList<Common> listMemStatByAge() throws SQLException {
		logger.info("AdminMemMngServiceImpl - listMemStatByAge");
		return adminMemMngDao.listMemStatByAge();
	}

	@Override
	public ArrayList<Common> listMemStatBySex() throws SQLException {
		logger.info("AdminMemMngServiceImpl - listMemStatBySex");
		return adminMemMngDao.listMemStatBySex();
	}

	@Override
	public int findBbsCntByUserId(Member memberResult) throws SQLException {
		logger.info("AdminMemMngServiceImpl - findBbsCntByUserId");
		return adminMemMngDao.findBbsCntByUserId(memberResult);
	}

	@Override
	public int findReplyCntByUserId(Member memberResult) throws SQLException {
		logger.info("AdminMemMngServiceImpl - findReplyCntByUserId");
		return adminMemMngDao.findReplyCntByUserId(memberResult);
	}

	@Override
	public void updateMemMngByAdmin(Member memberParam) throws SQLException {
		logger.info("AdminMemMngServiceImpl - updateMemMngByAdmin");
		frontLoginDao.updateMember(memberParam);
	}

	@Override
	public ArrayList<Member> listMember(Member memberParam) throws SQLException {
		logger.info("AdminMemMngServiceImpl - listMember");
		return adminMemMngDao.listMember(memberParam);
	}
}
