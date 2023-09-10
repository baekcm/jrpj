package com.jnet.admin.pollMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.pollMng.dao.AdminPollMngDao;
import com.jnet.domain.APoll;
import com.jnet.domain.Poll;
import com.jnet.domain.QPoll;

@Repository
public class AdminPollMngDaoImpl implements AdminPollMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;

	@Override
	public int findPollTotCnt(Map<String, Object> hmap) throws SQLException {
		logger.info("AdminPollMngDaoImpl-findPollTotCnt");
		return (Integer)sql.selectOne("pollSql.findPollTotCnt",hmap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Poll> listPoll(Map<String, Object> hmap) throws SQLException {
		logger.info("AdminPollMngDaoImpl-listPoll");
		return (ArrayList<Poll>)sql.selectList("pollSql.listPoll",hmap);
	}

	@Override
	public int savePoll(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngDaoImpl-savePoll");
		return (Integer)sql.insert("pollSql.savePoll",qPoll);
	}

	@Override
	public int savePollProblem(QPoll qPoll) {
		logger.info("AdminPollMngDaoImpl-savePollProblem");
		return (Integer)sql.insert("pollSql.savePollProblem",qPoll);
	}

	@Override
	public void savePollQuestion(QPoll qPoll) {
		logger.info("AdminPollMngDaoImpl-savePollQuestion");
		sql.insert("pollSql.savePollQuestion",qPoll);
	}
	
	@Override
	public Poll findPoll(APoll aPoll) {
		logger.info("AdminPollMngDaoImpl-findPoll");
		return (Poll)sql.selectOne("pollSql.findPoll",aPoll);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<QPoll> listPollQuestion(APoll aPoll) {
		logger.info("AdminPollMngDaoImpl-listPollQuestion");
		return (ArrayList<QPoll>)sql.selectList("pollSql.listPollQuestion",aPoll);
	}

	@Override
	public void updatePoll(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngDaoImpl-updatePoll");
		sql.update("pollSql.updatePoll",qPoll);
	}

	@Override
	public void removePollProblemWithQuestion(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngDaoImpl-removePollProblemWithQuestion");
		sql.delete("pollSql.removePollProblemWithQuestion",qPoll);
	}

	@Override
	public void removePoll(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngDaoImpl-removePoll");
		sql.update("pollSql.removePoll",qPoll);
	}

	@Override
	public Poll findLeastPoll(Map<String, Object> map) throws SQLException {
		logger.info("AdminPollMngDaoImpl-findPollTotCnt");
		return (Poll)sql.selectOne("findLeastPoll",map);
	}

	@Override
	public void savePollAnswer(APoll aPoll) throws SQLException {
		logger.info("AdminPollMngDaoImpl-savePollAnswer");
		sql.insert("pollSql.savePollAnswer",aPoll);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<APoll> listPollViewer(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngDaoImpl-listPollViewer");
		return (ArrayList<APoll>)sql.selectList("pollSql.listPollViewer",qPoll);
	}

	@Override
	public int findPollViewerTotCnt(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngDaoImpl-findPollViewerTotCnt");
		return (Integer)sql.selectOne("pollSql.findPollViewerTotCnt",qPoll);
	}
}
