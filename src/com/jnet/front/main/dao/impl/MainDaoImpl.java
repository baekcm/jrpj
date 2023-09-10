package com.jnet.front.main.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.domain.BbsData;
import com.jnet.domain.Pgm;
import com.jnet.domain.Popup;
import com.jnet.front.main.dao.MainDao;

@Repository
public class MainDaoImpl implements MainDao {
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	@Autowired
	@Resource(name="sqlSession2")
	private SqlSession sql2;
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsData> listLeastBbsDataMain(BbsData bbsParam) throws SQLException {
		return (ArrayList<BbsData>)sql.selectList("mainSql.listLeastBbsDataMain",bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Popup> listPopupMain(Popup popParam) throws SQLException {
		return (ArrayList<Popup>)sql.selectList("mainSql.listPopupMain",popParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsData> listLeastBbsDataSubMain(BbsData bbsParam) throws SQLException {
		return (ArrayList<BbsData>)sql.selectList("mainSql.listLeastBbsDataSubMain",bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Popup> listPopupSubMain(Popup popParam) throws SQLException {
		return (ArrayList<Popup>)sql.selectList("mainSql.listPopupSubMain",popParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsData> listLeastBbsDataPhotoSubMain(BbsData bbsParam) throws SQLException {
		return (ArrayList<BbsData>)sql.selectList("mainSql.listLeastBbsDataPhotoSubMain",bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Pgm> listFrontLeastPgm(Pgm pgmParam) throws SQLException {
		return (ArrayList<Pgm>)sql2.selectList("mainSql.listFrontLeastPgm",pgmParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Pgm> findOutPgmImgSubMain(Pgm pgmParam) throws SQLException {
		return (ArrayList<Pgm>)sql.selectList("mainSql.findOutPgmImgSubMain",pgmParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsData> listLeastBbsDataSearchMain(BbsData bbsParam) throws SQLException {
		return (ArrayList<BbsData>)sql.selectList("mainSql.listLeastBbsDataSearchMain",bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsData> listBbsDataSearchMainMore(BbsData bbsParam) throws SQLException {
		return (ArrayList<BbsData>)sql.selectList("mainSql.listBbsDataSearchMainMore",bbsParam);
	}

	@Override
	public int listBbsDataSearchMainTotCnt(BbsData bbsParam) throws SQLException {
		return (Integer)sql.selectOne("mainSql.listBbsDataSearchMainTotCnt", bbsParam);
	}
	
	@Override
	public int listPgmSearchMainTotCnt(Pgm pgmParam) throws SQLException {
		return (Integer)sql2.selectOne("mainSql.listPgmSearchMainTotCnt", pgmParam);
	}
}
