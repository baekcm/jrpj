package com.jnet.front.community.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.front.community.dao.CommunityBbsDao;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;

@Repository
public class CommunityBbsDaoImpl implements CommunityBbsDao {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public int communityListTotCnt(BbsFileReply bbsParam) throws SQLException {
		return (Integer)sql.selectOne("communitySql.communityListTotCnt", bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> communityList(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("communitySql.communityList", bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> communityView(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("communitySql.communityView", bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> communityPrev(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("communitySql.communityPrev", bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> communityNext(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("communitySql.communityNext", bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listCommonCode(Common commonParam) throws SQLException {
		
		return (ArrayList<Common>)sql.selectList("commonSql.listCommonCode", commonParam);
	}
	
	@Override
	public void updateHitCount(BbsFileReply bbsParam) throws SQLException {
		sql.update("commonSql.updateHitCount", bbsParam);
	}
	
	@Override
	public int saveCommunityData(BbsFileReply bbsParam) throws SQLException {
		return (Integer)sql.insert("communitySql.saveCommunityData", bbsParam);
	}

	@Override
	public void saveCommunityFile(BbsFileReply bbsFile) throws SQLException {
		sql.insert("communitySql.saveCommunityFile", bbsFile);
	}
	
	@Override
	public void updateCommunityData(BbsFileReply bbsParam) throws SQLException {
		sql.update("communitySql.updateCommunityData", bbsParam);
	}
	
	@Override
	public void removeCommunityFile(BbsFileReply bbsParam) throws SQLException {
		sql.delete("communitySql.removeCommunityFile", bbsParam);
	}
	
	@Override
	public void removeCommunityData(BbsFileReply bbsParam) throws SQLException {
		sql.update("communitySql.removeCommunityData", bbsParam);
	}
	
	@Override
	public int communityCommentListTotCnt(BbsFileReply bbsParam) throws SQLException {
		return (Integer)sql.selectOne("communitySql.communityCommentListTotCnt",bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> communityCommentList(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("communitySql.communityCommentList", bbsParam);
	}
	
	@Override
	public int saveCommunityCommentData(BbsFileReply bbsParam) throws SQLException {
		return (Integer)sql.insert("communitySql.saveCommunityCommentData", bbsParam);
	}
}
