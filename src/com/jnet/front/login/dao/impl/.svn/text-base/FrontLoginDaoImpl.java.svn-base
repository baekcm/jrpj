package com.jnet.front.login.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.domain.Log;
import com.jnet.domain.Member;
import com.jnet.front.login.dao.FrontLoginDao;

@Repository
public class FrontLoginDaoImpl implements FrontLoginDao {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Autowired
	@Resource(name="sqlSession2")
	private SqlSession sql2;
	
	@Override
	public void saveMember(Member member) throws SQLException {
		sql.insert("memberSql.saveMember",member);
	}
	
	@Override
	public void saveSggsttb(Member member) throws SQLException {
		sql2.insert("memberSql.saveSggsttb",member);
	}
	
	@Override
	public void saveScmemnotb(Member member) throws SQLException {
		sql2.insert("memberSql.saveScmemnotb",member);
	}
	
	@Override
	public void updateSggsttb(Member member) throws SQLException {
		sql2.update("memberSql.updateSggsttb",member);
	}
	
	@Override
	public void updateDi(Member member) throws SQLException {
		sql.update("memberSql.updateDi",member);
	}
	
	@Override
	public void updateVisit(Member member) throws SQLException {
		sql.update("memberSql.updateVisit",member);
	}
	
	
	@Override
	public void updateMember(Member member) throws SQLException {
		sql.update("memberSql.updateMember",member);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Member> findOldMember(Member member) throws SQLException {
		return (ArrayList<Member>)sql.selectList("memberSql.findOldMember",member);
	}
	
	
	@Override
	public Member findMemberLoginInfo(Member member) throws SQLException {
		return (Member) sql.selectOne("memberSql.findMemberLogin",member);
	}
	
	
	@Override
	public Member findMemberInfo(Member member) throws SQLException {
		return (Member) sql.selectOne("memberSql.findMemberInfo",member);
	}
	
	
	@Override
	public Member findMemberIdPw(Member member) throws SQLException {
		return (Member) sql.selectOne("memberSql.findMemberIdPw",member);
	}
	
	@Override
	public int findMemberIdDup(Map<String, String> hmap) throws SQLException {
		return (Integer)sql.selectOne("memberSql.findMemberIdDuplicate", hmap);
	}
	
	@Override
	public int findMemberDuplicate(Map<String, String> hmap) throws SQLException {
		return (Integer)sql.selectOne("memberSql.findMemberDuplicate", hmap);
	}
	
	@Override
	public Member findOffMember(Map<String, String> hmap) throws SQLException {
		return (Member)sql2.selectOne("memberSql.findOffMember", hmap);
	}
	
	@Override
	public String offKey() throws SQLException {
		return (String)sql2.selectOne("memberSql.offKey", null);
	}

	@Override
	public void saveLog(Log logParam) throws SQLException {
		sql.insert("memberSql.saveLog",logParam);
	}
}
