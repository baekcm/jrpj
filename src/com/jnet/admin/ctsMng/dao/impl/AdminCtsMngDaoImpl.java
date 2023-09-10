package com.jnet.admin.ctsMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.ctsMng.dao.AdminCtsMngDao;
import com.jnet.domain.Cts;
import com.jnet.domain.Menu;
import com.jnet.domain.Popup;

@Repository
public class AdminCtsMngDaoImpl implements AdminCtsMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public int findCtsTotCnt(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-findCtsTotCnt");
		return (Integer)sql.selectOne("ctsSql.findCtsTotCnt",ctsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Cts> listCtsMng(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-listCtsMng");
		return (ArrayList<Cts>)sql.selectList("ctsSql.listCtsMng",ctsParam);
	}

	@Override
	public Cts findCtsMng(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-findCtsMng");
		return (Cts)sql.selectOne("ctsSql.findCtsMng",ctsParam);
	}

	@Override
	public void saveCts(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-saveCts");
		sql.insert("ctsSql.saveCts",ctsParam);
	}

	@Override
	public void updateCts(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-updateCts");
		sql.update("ctsSql.updateCts",ctsParam);
	}

	@Override
	public void updateMenuEmpSeq(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-updateMenuEmpSeq");
		sql.update("ctsSql.updateMenuEmpSeq",ctsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Popup> listPopMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-listPopMng");
		return (ArrayList<Popup>)sql.selectList("ctsSql.listPopMng",popUpParam);
	}

	@Override
	public void savePopMng(Popup pop) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-savePopMng");
		sql.insert("ctsSql.savePopMng",pop);
	}

	@Override
	public void updatePopMng(Popup pop) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-updatePopMng");
		sql.update("ctsSql.updatePopMng",pop);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Popup> listPopMngByPopSeq(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-listPopMngByPopSeq");
		return (ArrayList<Popup>)sql.selectList("ctsSql.listPopMngByPopSeq",popUpParam);
	}

	@Override
	public void removePopMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-removePopMng");
		sql.delete("ctsSql.removePopMng",popUpParam);
	}

	@Override
	public void updatePopOrdinary(Popup popUpParam) throws Exception {
		logger.info("AdminCtsMngDaoImpl-updatePopOrdinary");
		sql.update("ctsSql.updatePopOrdinary",popUpParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listDepthCat(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-listDepthCat");
		return (ArrayList<Menu>)sql.selectList("ctsSql.listDepthCat",ctsParam);
	}

	@Override
	public void saveOneNotiMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-saveOneNotiMng");
		sql.insert("ctsSql.saveOneNotiMng",popUpParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Popup> listOneNotiMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-listOneNotiMng");
		return (ArrayList<Popup>)sql.selectList("ctsSql.listOneNotiMng",popUpParam);
	}

	@Override
	public void updateShowOneNoti(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-updateShowOneNoti");
		sql.update("ctsSql.updateShowOneNoti",popUpParam);
	}

	@Override
	public void updateHideOneNoti(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-updateHideOneNoti");
		sql.update("ctsSql.updateHideOneNoti",popUpParam);
	}

	@Override
	public void updateOneNotiMng(Popup pop) throws SQLException {
		logger.info("AdminCtsMngDaoImpl-updateOneNotiMng");
		sql.update("ctsSql.updateOneNotiMng",pop);
	}

	@Override
	public void removeOneNotiMngByOneNotiSeq(Popup popUpParam) throws SQLException {
		sql.delete("ctsSql.removeOneNotiMngByOneNotiSeq",popUpParam);
	}
}
