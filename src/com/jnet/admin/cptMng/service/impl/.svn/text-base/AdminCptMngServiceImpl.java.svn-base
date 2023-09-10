package com.jnet.admin.cptMng.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.cptMng.dao.AdminCptMngDao;
import com.jnet.admin.cptMng.service.AdminCptMngService;
import com.jnet.domain.Menu;
import com.jnet.domain.Minwon;

@Service
public class AdminCptMngServiceImpl implements AdminCptMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private AdminCptMngDao adminCptMngDao;
	
	@Override
	public int findCptTotCnt(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngServiceImpl - findCptTotCnt");
		return adminCptMngDao.findCptTotCnt(minwonParam);
	}

	@Override
	public ArrayList<Minwon> listCptMng(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngServiceImpl - listCptMng");
		return adminCptMngDao.listCptMng(minwonParam);
	}

	@Override
	public Minwon findCptMng(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngServiceImpl - findCptMng");
		adminCptMngDao.updateMinwonHit(minwonParam);
		return adminCptMngDao.findCptMng(minwonParam);
	}

	@Override
	public void updateCptMng(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngServiceImpl - updateCptMng");
		adminCptMngDao.updateMinwonQ(minwonParam);
		
		//민원 카테고리 update
		Minwon minwon = null;
		//사업장
		minwon = new Minwon();
		minwon.setCommCodeSeq(String.valueOf(minwonParam.getUpId()));
		minwon.setqCommSeq(minwonParam.getUpCommSeq());
		adminCptMngDao.updateMinwonCommQ(minwon);
		
		//분야
		minwon = new Minwon();
		minwon.setCommCodeSeq(String.valueOf(minwonParam.getAreaId()));
		minwon.setqCommSeq(minwonParam.getAreaCommSeq());
		adminCptMngDao.updateMinwonCommQ(minwon);
		
		
		if(minwonParam.getaSeq() != null && minwonParam.getaSeq() > 0) {
			//민원 update
			adminCptMngDao.updateMinwonA(minwonParam);
			
			if(minwonParam.getAdmAuthCode().equals("S") && minwonParam.getHappyId() != null && minwonParam.getHappyId() > 0) {
				//해피콜 수정
				minwon = new Minwon();
				minwon.setCommCodeSeq(String.valueOf(minwonParam.getHappyId()));
				minwon.setaCommSeq(minwonParam.getHappyCommSeq());
				adminCptMngDao.updateMinwonCommA(minwon);
			}
		} else {
			//민원 insert
			adminCptMngDao.saveMinwonA(minwonParam);
			
			if(minwonParam.getAdmAuthCode().equals("S") && minwonParam.getHappyId() != null && minwonParam.getHappyId() > 0) {
				//해피콜 등록
				minwon = new Minwon();
				minwon.setqSeq(minwonParam.getqSeq());
				minwon.setaSeq(minwonParam.getaSeq());
				minwon.setCommCodeSeq(String.valueOf(minwonParam.getHappyId()));
				adminCptMngDao.saveMinwonCommA(minwon);
			}
			
		}
	}

	@Override
	public ArrayList<Minwon> listCptStatsRight(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngServiceImpl - listCptStatsRight");
		return adminCptMngDao.listCptStatsRight(minwonParam);
	}

	@Override
	public ArrayList<Menu> listSatisFactionStats() throws SQLException {
		logger.info("AdminCptMngServiceImpl - listSatisFactionStats");
		return adminCptMngDao.listSatisFactionStats();
	}

	@Override
	public ArrayList<Menu> listSiteMap() throws SQLException {
		logger.info("AdminCptMngServiceImpl - listSiteMap");
		return adminCptMngDao.listSiteMap();
	}

	@Override
	public ArrayList<Minwon> listCptStatsTotCnt(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngServiceImpl - listCptStatsTotCnt");
		return adminCptMngDao.listCptStatsTotCnt(minwonParam);
	}
}
