package com.jnet.admin.bbsMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.bbsMng.dao.AdminBbsDataDao;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;

@Repository
public class AdminBbsDataDaoImpl implements AdminBbsDataDao {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public int findBbsDataTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-findBbsDataTotCnt");
		return (Integer)sql.selectOne("bbsSql.findBbsDataTotCnt",bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-listBbsData");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.listBbsData",bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> findBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-findBbsData");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.findBbsData",bbsParam);
	}

	@Override
	public void updateBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-updateBbsData");
		sql.update("bbsSql.updateBbsData",bbsParam);
	}

	@Override
	public int saveBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-saveBbsData");
		return (Integer)sql.insert("bbsSql.saveBbsData",bbsParam);
	}

	@Override
	public void saveBbsFile(BbsFileReply bbsFile) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-saveBbsFile");
		sql.insert("bbsSql.saveBbsFile",bbsFile);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listGallImgByFileSeq(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-listGallImgByFileSeq");
		return (ArrayList<BbsFileReply>) sql.selectList("bbsSql.listGallImgByFileSeq",bbsParam);
	}

	@Override
	public void removeGallImg(BbsFileReply bbs) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-removeGallImg");
		sql.delete("bbsSql.removeGallImg",bbs);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listFacilWithMenuSeq(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-listFacilWithMenuSeq");
		return (ArrayList<Common>)sql.selectList("bbsSql.listFacilWithMenuSeq",bbsParam);
	}

	@Override
	public int findReplytTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-findReplytTotCnt");
		return (Integer)sql.selectOne("bbsSql.findReplytTotCnt",bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listReply(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-listReply");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.listReply",bbsParam);
	}

	@Override
	public void saveReply(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-saveReply");
		sql.insert("bbsSql.saveReply",bbsParam);
	}

	@Override
	public void removeReply(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-removeReply");
		sql.update("bbsSql.removeReply",bbsParam);
	}

	@Override
	public void removeImg(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-removeImg");
		sql.delete("bbsSql.removeImg",bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listLeastBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-listLeastBbsData");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.listLeastBbsData",bbsParam);
	}

	@Override
	public int findLeastBbsDataTotCnt(BbsFileReply bbsParam) {
		logger.info("AdminBbsDataDaoImpl-findLeastBbsDataTotCnt");
		return (Integer)sql.selectOne("bbsSql.findLeastBbsDataTotCnt",bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listLeastBbsDataTotal(BbsFileReply bbsParam) {
		logger.info("AdminBbsDataDaoImpl-listLeastBbsDataTotal");
		return (ArrayList<BbsFileReply>)sql.selectList("bbsSql.listLeastBbsDataTotal",bbsParam);
	}

	@Override
	public void removeBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-removeBbsData");
		sql.update("bbsSql.removeBbsData",bbsParam);
	}

	@Override
	public void saveBbsTeacher(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-saveBbsTeacher");
		sql.insert("bbsSql.saveBbsTeacher",bbsParam);
	}

	@Override
	public void removeBbsTeacher(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-removeBbsTeacher");
		sql.delete("bbsSql.removeBbsTeacher",bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> listBbsTeacher(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsDataDaoImpl-listBbsTeacher");
		return (ArrayList<BbsFileReply>) sql.selectList("bbsSql.listBbsTeacher",bbsParam);
	}
}
