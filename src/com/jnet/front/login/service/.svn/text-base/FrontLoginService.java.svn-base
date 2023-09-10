package com.jnet.front.login.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.jnet.domain.Log;
import com.jnet.domain.Member;

public interface FrontLoginService {

	public abstract void saveMember(Member member,String userNo) throws SQLException;
	public abstract void updateDi(Member member) throws SQLException;
	public abstract void updateVisit(Member member) throws SQLException;
	
	public abstract Member findMemberLoginInfo(Member member) throws SQLException;
	public abstract Member findMemberInfo(Member member) throws SQLException;
	
	public abstract Member findMemberIdPw(Member member) throws SQLException;
	
	public abstract int findMemberIdDup(Map<String, String> hmap) throws SQLException;
	
	public abstract int findMemberDuplicate(Map<String, String> hmap) throws SQLException;
	public abstract ArrayList<Member> findOldMember(Member member) throws SQLException;
	public abstract Member findOffMember(Map<String, String> hmap) throws SQLException;
	public abstract String offKey() throws SQLException;
	
	public abstract void updatePassword(Member member) throws SQLException;
	public abstract void updateOut(Member member) throws SQLException;
	public abstract void saveLog(Log logParam) throws SQLException;
}
