package com.jnet.admin.mgrMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Menu;
import com.jnet.domain.TeacherImg;

public interface AdminMgrMngDao {

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
	 * 아이디 중복체크
	 * @param menuParam menuParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findDpAdmId(Menu menuParam) throws SQLException;

	/**
	 * 관리자 정보 저장
	 * 
	 * @param menuParam menuParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int saveMgrMng(Menu menuParam) throws SQLException;

	/**
	 * 관리자 정보 수정
	 * 
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateMgrMng(Menu menuParam) throws SQLException;

	/**
	 * 관리자 권한 메뉴 삭제
	 * 
	 * @param menuParam
	 * @throws SQLException
	 */
	public abstract void removeAdminAuth(Menu menuParam) throws SQLException;
	
	/**
	 * 관리자 권한목록 저장
	 * 
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveAdminAuth(Menu menuParam) throws SQLException;

	/**
	 * 관리자 정보조회
	 * 
	 * @param menuParam menuParam
	 * @return Menu Menu
	 * @throws SQLException SQLException
	 */
	public abstract Menu findAdminAuth(Menu menuParam) throws SQLException;

	/**
	 * 권한 저장목록 조회
	 * 
	 * @param menuParam menuParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> listAdminAuthMenu(Menu menuParam) throws SQLException;

	/**
	 * 관리자 삭제
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeMgrMng(Menu menuParam) throws SQLException;

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
