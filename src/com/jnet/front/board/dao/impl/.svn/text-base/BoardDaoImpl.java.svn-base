package com.jnet.front.board.dao.impl;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Minwon;
import com.jnet.front.board.dao.BoardDao;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	
	@Override
	public void saveMinwonCommQ(Minwon minwonParam) throws SQLException {
		sql.insert("cptSql.saveMinwonCommQ",minwonParam);
	}
	
	@Override
	public void saveMinwonQ(Minwon minwonParam) throws SQLException {
		sql.insert("cptSql.saveMinwonQ",minwonParam);
	}
	
	@Override
	public void updateMinwonHit(Minwon minwonParam) throws SQLException {
		sql.update("cptSql.updateMinwonHit",minwonParam);
	}
	

	@Override
	public int saveSugest(BbsFileReply bbsParam) throws SQLException {
		return (Integer)sql.insert("bbsSql.saveSugest",bbsParam);
	}

	@Override
	public void saveSugestFile(BbsFileReply bbsFile) throws SQLException {
		sql.insert("bbsSql.saveSugestFile",bbsFile);
	}
	

	@Override
	public void removeSugestFile(BbsFileReply bbsParam) throws SQLException {
		sql.delete("bbsSql.removeSugestFile",bbsParam);
	}
	
	@Override
	public void updateSugest(BbsFileReply bbsParam) throws SQLException {
		sql.update("bbsSql.updateSugest",bbsParam);
	}

	
	@Override
	public int saveClean(BbsFileReply bbsParam) throws SQLException {
		return (Integer)sql.insert("bbsSql.saveClean",bbsParam);
	}
	
	@Override
	public void saveCleanFile(BbsFileReply bbsFile) throws SQLException {
		sql.insert("bbsSql.saveCleanFile",bbsFile);
	}

}

