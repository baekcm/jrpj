package com.jnet.front.main.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.domain.BbsData;
import com.jnet.domain.Pgm;
import com.jnet.domain.Popup;
import com.jnet.front.main.dao.MainDao;
import com.jnet.front.main.service.MainService;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao mainDao;
	
	@Override
	public ArrayList<BbsData> listLeastBbsDataMain(BbsData bbsParam) throws SQLException {
		return mainDao.listLeastBbsDataMain(bbsParam);
	}
	
	@Override
	public ArrayList<Popup> listPopupMain(Popup popParam) throws SQLException {
		return mainDao.listPopupMain(popParam);
	}
	
	@Override
	public ArrayList<BbsData> listLeastBbsDataSubMain(BbsData bbsParam) throws SQLException {
		return mainDao.listLeastBbsDataSubMain(bbsParam);
	}
	
	@Override
	public ArrayList<Popup> listPopupSubMain(Popup popParam) throws SQLException {
		return mainDao.listPopupSubMain(popParam);
	}
	
	@Override
	public ArrayList<BbsData> listLeastBbsDataPhotoSubMain(BbsData bbsParam) throws SQLException {
		return mainDao.listLeastBbsDataPhotoSubMain(bbsParam);
	}
	
	@Override
	public ArrayList<Pgm> listFrontLeastPgm(Pgm pgmParam) throws SQLException {
		return mainDao.listFrontLeastPgm(pgmParam);
	}
	
	@Override
	public ArrayList<Pgm> findOutPgmImgSubMain(Pgm pgmParam) throws SQLException {
		return mainDao.findOutPgmImgSubMain(pgmParam);
	}
	
	@Override
	public ArrayList<BbsData> listLeastBbsDataSearchMain(BbsData bbsParam) throws SQLException {
		return mainDao.listLeastBbsDataSearchMain(bbsParam);
	}
	
	@Override
	public ArrayList<BbsData> listBbsDataSearchMainMore(BbsData bbsParam) throws SQLException {
		return mainDao.listBbsDataSearchMainMore(bbsParam);
	}
	
	@Override
	public int listBbsDataSearchMainTotCnt(BbsData bbsParam) throws SQLException {
		return mainDao.listBbsDataSearchMainTotCnt(bbsParam);
	}
	
	@Override
	public int listPgmSearchMainTotCnt(Pgm pgmParam) throws SQLException {
		return mainDao.listPgmSearchMainTotCnt(pgmParam);
	}
	
}
