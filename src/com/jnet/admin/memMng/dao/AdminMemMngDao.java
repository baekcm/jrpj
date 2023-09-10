package com.jnet.admin.memMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Common;
import com.jnet.domain.Member;




public interface AdminMemMngDao {

	/**
	 * 회원 목록 수 조회
	 * @param memberParam memberParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findMemTotCnt(Member memberParam) throws SQLException;
	
	/**
	 * 회원목록조회
	 * @param memberParam memberParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Member> listMemMng(Member memberParam) throws SQLException;

	/**
	 * 회원상세조회
	 * @param memberParam memberParam
	 * @return Member Member
	 * @throws SQLException SQLException
	 */
	public abstract Member findMemMng(Member memberParam) throws SQLException;
	
	/**
	 * 탈퇴회원 목록 수 조회
	 * @param memberParam memberParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findMemOutTotCnt(Member memberParam) throws SQLException;

	/**
	 * 탈퇴회원 목록 조회
	 * @param memberParam memberParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Member> listMemOutMng(Member memberParam) throws SQLException;

	/**
	 * 회원그룹 통계(나이대별)
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listMemStatByAge() throws SQLException;

	/**
	 * 회원그룹 통계(성별)
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listMemStatBySex() throws SQLException;

	/**
	 * 회원별 게시물수
	 * @param memberResult memberResult
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findBbsCntByUserId(Member memberResult) throws SQLException;

	/**
	 * 회원별 댓글수
	 * @param memberResult memberResult
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findReplyCntByUserId(Member memberResult) throws SQLException;

	/**
	 * 메일 수신회원 목록조회 
	 * @param memberParam memberParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Member> listMember(Member memberParam) throws SQLException;
}
