package com.jnet.admin.login.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Admin;
import com.jnet.domain.Common;
import com.jnet.domain.Member;
import com.jnet.domain.Menu;

public interface AdminLoginDao {
	/**
	 * 관리자 조회 테스트
	 * 
	 * @param adminParam adminParam
	 * @return Admin Admin
	 * @throws SQLException SQLException
	 */
	public abstract Admin findAdminLoginInfo(Admin adminParam) throws SQLException;

	/**
	 * 관리자 메뉴별 권한 목록 조회
	 * @param adminResult adminResult
	 * @return ArrayList  ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> listAdminAuth(Admin adminResult) throws SQLException;

	/**
	 * DB 메뉴 조회
	 * @param menuParam menuParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> listMenu(Menu menuParam) throws SQLException;

	/**
	 * 관리자 메인화면 회원수 + 민원수 조회
	 * @param commonParam commonParam
	 * @return Common Common
	 * @throws SQLException SQLException
	 */
	public abstract Common findMemMinGrpCnt(Common commonParam) throws SQLException;

	
	/**
	 * 관리자 월별 회원통계 목록조회
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listMemMonth(Common commonParam) throws SQLException;
	
	/**
	 * 관리자 일별 회원통계 목록조회(당월만가능)
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listMemDay(Common commonParam) throws SQLException;
	
	/**
	 * 관리자 요일별 회원통계 목록조회
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listMemDate() throws SQLException;
	
	/**
	 * 사이트방문 월별 회원통계 목록조회
	 * @param commonParam
	 * @return
	 * @throws SQLException
	 */
	public abstract ArrayList<Common> listSiteMonth(Common commonParam) throws SQLException;

	/**
	 * 사이트방문 일별 회원통계 목록조회(당월만가능)
	 * @param commonParam
	 * @return
	 * @throws SQLException
	 */
	public abstract ArrayList<Common> listSiteDay(Common commonParam) throws SQLException;

	/**
	 * 사이트방문 요일별 회원통계 목록조회
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listSiteDate() throws SQLException;

	/**
	 * 관리자 로그인 접속정보 UPDATE
	 * @param adminParam adminParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateAdmLoginInfo(Admin adminParam) throws SQLException;

	/**
	 * 회원가입통계 연도별
	 * @param commonParam commonParam
	 * @return listMemYear listMemYear
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listMemYear(Common commonParam) throws SQLException;

	/**
	 * 접속통계 연도별
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listSiteYear(Common commonParam) throws SQLException;

	/**
	 * 회원가입통계 기간별
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Member> listMemSlctDate(Common commonParam) throws SQLException;

	/**
	 * 접속통계 기간별
	 * @param commonParam
	 * @return
	 * @throws SQLException
	 */
	public abstract ArrayList<Member> listSiteSlctDate(Common commonParam) throws SQLException;
}
