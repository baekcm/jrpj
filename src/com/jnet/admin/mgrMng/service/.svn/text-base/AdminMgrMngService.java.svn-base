package com.jnet.admin.mgrMng.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.jnet.domain.Common;
import com.jnet.domain.Menu;
import com.jnet.domain.TeacherImg;

public interface AdminMgrMngService {

	/**
	 * 관리자 목록수 조회
	 * 
	 * @param menuParam menuParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findMgrTotCnt(Menu menuParam) throws SQLException;

	/**
	 * 관리자 목록 조회
	 * 
	 * @param menuParam menuParam
	 * @return ArrayList<Menu> ArrayList<Menu>
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> listMgrMng(Menu menuParam) throws SQLException;

	/**
	 * 관리자 아이디 중복체크
	 * @param menuParam menuParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findDpAdmId(Menu menuParam) throws SQLException;

	/**
	 * 관리자 등록
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveMgrMng(Menu menuParam) throws SQLException;

	/**
	 * 관리자 수정
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateMgrMng(Menu menuParam) throws SQLException;
	
	/**
	 * 관리자 정보 + 권한 목록 조회
	 * 
	 * @param menuParam menuParam
	 * @return Map Map
	 * @throws SQLException SQLException
	 */
	public abstract Map<String, Object> listAdminAuthWithMenu(Menu menuParam) throws SQLException;

	/**
	 * 관리자 삭제
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeMgrMng(Menu menuParam) throws SQLException;

	/**
	 * 사업장 목록조회
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listFacil(Common commonParam) throws SQLException;

	/**
	 * 사업장/게시판타입별 목록조회
	 * @param menuParam menuParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> listMenuByType(Menu menuParam) throws SQLException;

	/**
	 * 프로그램 권한 목록 조회 (단일)
	 * 
	 * @param teacherImg teacherImg
	 * @return TeacherImg TeacherImg
	 * @throws SQLException SQLException
	 */
	public abstract TeacherImg findPgmAuth(TeacherImg teacherImg) throws SQLException;

	/**
	 * 관리자 비밀번호 변경
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateAdmPwd(Menu menuParam) throws SQLException;

}
