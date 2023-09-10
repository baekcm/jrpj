package com.jnet.front.notice.dao.impl;
  
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.front.notice.dao.NoticeBbsDao;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;

@Repository
public class NoticeBbsDaoImpl implements NoticeBbsDao {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Override
	public int noticeListTotCnt(BbsFileReply bbsParam) throws SQLException {
		return (Integer)sql.selectOne("noticeSql.noticeListTotCnt", bbsParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> noticeList(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("noticeSql.noticeList", bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> noticeView(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("noticeSql.noticeView", bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> noticePrev(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("noticeSql.noticePrev", bbsParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<BbsFileReply> noticeNext(BbsFileReply bbsParam) throws SQLException {
		return (ArrayList<BbsFileReply>)sql.selectList("noticeSql.noticeNext", bbsParam);
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

}