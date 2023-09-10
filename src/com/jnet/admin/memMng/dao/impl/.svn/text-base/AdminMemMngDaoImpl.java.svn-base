package com.jnet.admin.memMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.memMng.dao.AdminMemMngDao;
import com.jnet.domain.Common;
import com.jnet.domain.Member;

@Repository
public class AdminMemMngDaoImpl implements AdminMemMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;

	@Override
	public int findMemTotCnt(Member memberParam) throws SQLException {
		logger.info("AdminMemMngDaoImpl-findMemTotCnt");
		return (Integer)sql.selectOne("memMngSql.findMemTotCnt",memberParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Member> listMemMng(Member memberParam) throws SQLException {
		logger.info("AdminMemMngDaoImpl-listMemMng");
		return (ArrayList<Member>)sql.selectList("memMngSql.listMemMng",memberParam);
	}

	@Override
	public Member findMemMng(Member memberParam) throws SQLException {
		logger.info("AdminMemMngDaoImpl-findMemMng");
		return (Member)sql.selectOne("memMngSql.findMemMng",memberParam);
	}

	@Override
	public int findMemOutTotCnt(Member memberParam) throws SQLException {
		logger.info("AdminMemMngDaoImpl-findMemOutTotCnt");
		return (Integer)sql.selectOne("memMngSql.findMemOutTotCnt",memberParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Member> listMemOutMng(Member memberParam) throws SQLException {
		logger.info("AdminMemMngDaoImpl-listMemOutMng");
		return (ArrayList<Member>)sql.selectList("memMngSql.listMemOutMng",memberParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listMemStatByAge() throws SQLException {
		logger.info("AdminMemMngDaoImpl-listMemStatByAge");
		return (ArrayList<Common>) sql.selectList("memMngSql.listMemStatByAge");
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Common> listMemStatBySex() throws SQLException {
		logger.info("AdminMemMngDaoImpl-listMemStatBySex");
		return (ArrayList<Common>) sql.selectList("memMngSql.listMemStatBySex");
	}

	@Override
	public int findBbsCntByUserId(Member memberResult) throws SQLException {
		logger.info("AdminMemMngDaoImpl-findBbsCntByUserId");
		return (Integer)sql.selectOne("memMngSql.findBbsCntByUserId",memberResult);
	}

	@Override
	public int findReplyCntByUserId(Member memberResult) throws SQLException {
		logger.info("AdminMemMngDaoImpl-findReplyCntByUserId");
		return (Integer)sql.selectOne("memMngSql.findReplyCntByUserId",memberResult);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Member> listMember(Member memberParam) throws SQLException {
		logger.info("AdminMemMngDaoImpl-listMember");
		return (ArrayList<Member>) sql.selectList("memMngSql.listMember",memberParam);
	}
	
}
