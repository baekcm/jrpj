package com.jnet.admin.cptMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.cptMng.dao.AdminCptMngDao;
import com.jnet.domain.Menu;
import com.jnet.domain.Minwon;

@Repository
public class AdminCptMngDaoImpl implements AdminCptMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public int findCptTotCnt(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-findCptTotCnt");
		return (Integer)sql.selectOne("cptSql.findCptTotCnt",minwonParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Minwon> listCptMng(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-listCptMng");
		return (ArrayList<Minwon>)sql.selectList("cptSql.listCptMng",minwonParam);
	}
	@Override
	public Minwon findCptMng(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-findCptMng");
		return (Minwon)sql.selectOne("cptSql.findCptMng",minwonParam);
	}
	@Override
	public void updateMinwonCommQ(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-updateMinwonCommQ");
		sql.update("cptSql.updateMinwonCommQ",minwonParam);
	}
	@Override
	public void updateMinwonA(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-updateMinwonA");
		sql.update("cptSql.updateMinwonA",minwonParam);
	}
	@Override
	public void updateMinwonCommA(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-updateMinwonCommA");
		sql.update("cptSql.updateMinwonCommA",minwonParam);
	}
	@Override
	public int saveMinwonA(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-saveMinwonA");
		return (Integer)sql.insert("cptSql.saveMinwonA",minwonParam);
	}
	@Override
	public void saveMinwonCommA(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-saveMinwonCommA");
		sql.insert("cptSql.saveMinwonCommA",minwonParam);
	}
	@Override
	public void updateMinwonQ(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-updateMinwonQ");
		sql.update("cptSql.updateMinwonQ",minwonParam);
	}
	
	@Override
	public void updateMinwonHit(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-updateMinwonHit");
		sql.update("cptSql.updateMinwonHit",minwonParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Minwon> listCptStatsRight(Minwon minwonParam) {
		logger.info("AdminCptMngDaoImpl-listCptStatsRight");
		return (ArrayList<Minwon>) sql.selectList("cptSql.listCptStatsRight",minwonParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listSatisFactionStats() throws SQLException {
		logger.info("AdminCptMngDaoImpl-listSatisFactionStats");
		return (ArrayList<Menu>) sql.selectList("satfactSql.listSatisFactionStats");
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listSiteMap() throws SQLException {
		logger.info("AdminCptMngDaoImpl-listSiteMap");
		return (ArrayList<Menu>) sql.selectList("satfactSql.listSiteMap");
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Minwon> listCptStatsTotCnt(Minwon minwonParam) throws SQLException {
		logger.info("AdminCptMngDaoImpl-listCptStatsTotCnt");
		return (ArrayList<Minwon>) sql.selectList("cptSql.listCptStatsTotCnt",minwonParam);
	}
}
