package com.jnet.admin.bbsMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.bbsMng.dao.AdminBbsMngDao;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Menu;

@Repository
public class AdminBbsMngDaoImpl implements AdminBbsMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public int findBbsTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findBbsTotCnt");
		return (Integer)sql.selectOne("bbsSql.findBbsTotCnt",bbsParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listBbsMng(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-listBbsMng");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.listBbsMng",bbsParam);
	}
	@Override
	public void saveBbsMng(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-saveBbsMng");
		sql.insert("bbsSql.saveBbsMng",bbsParam);
	}
	@Override
	public BbsFileReply findBbsMng(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findBbsMng");
		return (BbsFileReply)sql.selectOne("bbsSql.findBbsMng",bbsParam);
	}
	@Override
	public void updateBbsMng(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-updateBbsMng");
		sql.update("bbsSql.updateBbsMng",bbsParam);
	}
	@Override
	public void updateMenuEmpSeq(Menu menuParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-updateMenuEmpSeq");
		sql.update("bbsSql.updateMenuEmpSeq",menuParam);
	}
	@Override
	public BbsFileReply findEmpInfo(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findEmpInfo");
		return (BbsFileReply)sql.selectOne("bbsSql.findEmpInfo",bbsParam);
	}
	@Override
	public int findClenTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findClenTotCnt");
		return (Integer)sql.selectOne("bbsSql.findClenTotCnt",bbsParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listClean(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-listClean");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.listClean",bbsParam);
	}
	@Override
	public int findSuggestTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findSuggestTotCnt");
		return (Integer)sql.selectOne("bbsSql.findSuggestTotCnt",bbsParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listSuggest(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-listSuggest");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.listSuggest",bbsParam);
	}
	@Override
	public BbsFileReply findClean(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findClean");
		return (BbsFileReply)sql.selectOne("bbsSql.findClean",bbsParam);
	}
	@Override
	public BbsFileReply findCleanFile(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findCleanFile");
		return (BbsFileReply)sql.selectOne("bbsSql.findCleanFile",bbsParam);
	}
	
	@Override
	public BbsFileReply findSuggest(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findSuggest");
		return (BbsFileReply)sql.selectOne("bbsSql.findSuggest",bbsParam);
	}
	@Override
	public BbsFileReply findSuggestFile(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findSuggestFile");
		return (BbsFileReply)sql.selectOne("bbsSql.findSuggestFile",bbsParam);
	}
	
	@Override
	public String findBbsType(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findBbsType");
		return (String)sql.selectOne("bbsSql.findBbsType",bbsParam);
	}
	@Override
	public BbsFileReply findBbs(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findBbs");
		return (BbsFileReply)sql.selectOne("bbsSql.findBbs",bbsParam);
	}
	@Override
	public void updateSugestHit(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-updateSugestHit");
		sql.update("bbsSql.updateSugestHit",bbsParam);
	}
	@Override
	public void updateSuggest(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-updateSuggest");
		sql.update("bbsSql.updateSugestStatusCd",bbsParam);
	}
	@Override
	public BbsFileReply findBbsDataFile(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngDaoImpl-findBbsDataFile");
		return (BbsFileReply)sql.selectOne("bbsSql.findBbsDataFile",bbsParam);
	}
	
	
}
