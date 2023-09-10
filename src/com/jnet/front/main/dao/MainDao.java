package com.jnet.front.main.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.BbsData;
import com.jnet.domain.Pgm;
import com.jnet.domain.Popup;

public interface MainDao {


	public abstract ArrayList<BbsData> listLeastBbsDataMain(BbsData bbsParam) throws SQLException;
	
	public abstract ArrayList<Popup> listPopupMain(Popup popParam) throws SQLException;
	
	public abstract ArrayList<BbsData> listLeastBbsDataSubMain(BbsData bbsParam) throws SQLException;
	
	public abstract ArrayList<Popup> listPopupSubMain(Popup popParam) throws SQLException;
	
	public abstract ArrayList<BbsData> listLeastBbsDataPhotoSubMain(BbsData bbsParam) throws SQLException;
	
	public abstract ArrayList<Pgm> listFrontLeastPgm(Pgm pgmParam) throws SQLException;
	
	public abstract ArrayList<Pgm> findOutPgmImgSubMain(Pgm pgmParam) throws SQLException;
	
	public abstract ArrayList<BbsData> listLeastBbsDataSearchMain(BbsData bbsParam) throws SQLException;
	
	public abstract ArrayList<BbsData> listBbsDataSearchMainMore(BbsData bbsParam) throws SQLException;
	
	public abstract int listBbsDataSearchMainTotCnt(BbsData bbsParam) throws SQLException;
	
	public abstract int listPgmSearchMainTotCnt(Pgm pgmParam) throws SQLException;
}
