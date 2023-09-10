package com.jnet.admin.pgmMng.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jnet.domain.OutPgm;
import com.jnet.domain.Pgm;
import com.jnet.domain.PgmImg;
import com.jnet.domain.Teacher;
import com.jnet.domain.TeacherImg;


public interface AdminPgmMngService {

	/**
	 * 외부프로그램 목록수 조회
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findPgmTotCnt(OutPgm outPgmParam) throws SQLException;

	/**
	 * 외부프로그램 목록 조회
	 * @param outPgmParam outPgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<OutPgm> listPgmMng(OutPgm outPgmParam) throws SQLException;

	/**
	 * 외부프로그램 정보 상세조회
	 * @param pgmParam pgmParam
	 * @return PgmImg PgmImg
	 * @throws SQLException SQLException
	 */
	public abstract PgmImg findPgmMng(Pgm pgmParam) throws SQLException;

	/**
	 * 프로그램정보 수정
	 * @param teacherImgParam teacherImgParam
	 * @throws SQLException SQLException
	 */ 
	public abstract void updatePgmMng(TeacherImg teacherImgParam) throws SQLException;

	/**
	 * 강사 총 등록수 조회
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findTeacherTotCnt() throws SQLException;

	/**
	 * 강사 목록 조회
	 * @param teacherParam teacherParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Teacher> listTeacherMng(Teacher teacherParam) throws SQLException;

	/**
	 * 강사 저장
	 * @param teacherImgParam teacherImgParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveTeacherMng(TeacherImg teacherImgParam) throws SQLException;

	/**
	 * 강사수정 
	 * @param teacherImgParam teacherImgParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateTeacherMng(TeacherImg teacherImgParam) throws SQLException;

	/**
	 * 강사 정보 상세조회
	 * @param teacherImgParam teacherImgParam
	 * @return TeacherImg TeacherImg
	 * @throws SQLException SQLException
	 */
	public abstract TeacherImg findTeacherMng(TeacherImg teacherImgParam) throws SQLException;

	/**
	 * 사업장 조회 
	 * 
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<OutPgm> listUpId() throws SQLException;

	/**
	 * 사엄장별 프로그램 선택
	 * 
	 * @param outPgmParam outPgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<OutPgm> listSaleIdByUpId(OutPgm outPgmParam) throws SQLException;

	/**
	 * 사업장에 프로그램별 카테고리 
	 * @param outPgmParam outPgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<OutPgm> listBasIdBySaleId(OutPgm outPgmParam) throws SQLException;

	/**
	 * cs 원본 프로그램 목록 조회
	 * @param pgmParam pgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Pgm> findOutPgmMng(Pgm pgmParam) throws SQLException;

	/**
	 * 프로그램번호로 강사 목록 조회
	 * @param pgmResult pgmResult
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<TeacherImg> listTeacherInfoByPgmSeq(PgmImg pgmResult) throws SQLException;

	/**
	 * 접수일 설정 목록조회 
	 * 
	 * @param pgmParam pgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Pgm> listAcceptDate(Pgm pgmParam) throws SQLException;

	/**
	 * 접수일 변경
	 * @param pgmParam pgmParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateAccept(Pgm pgmParam) throws SQLException;
	
	/**
	 * 현재날짜기준 장바구니 사용여부 체크
	 * 리턴값 0이상 사용가능 
	 * @param mapParam
	 * @return
	 * @throws SQLException
	 */
	public int findAcceptDateByUpId(Map<String, Object> mapParam) throws SQLException;

	/**
	 * 프로그램 상세조회 - 관리자
	 * 
	 * @param pgmParam pgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Pgm> findOutPgmMngforAdminPage(Pgm pgmParam) throws SQLException;

	/**
	 * 강사이미지 삭제
	 * @param teacherImgParam teacherImgParam
	 * @param request request
	 * @throws SQLException SQLException
	 */
	public abstract void removeTeacherImg(TeacherImg teacherImgParam, HttpServletRequest request) throws SQLException;

	/**
	 * 강사 삭제
	 * @param teacherImgParam teacherImgParam
	 * @throws SQLException  SQLException
	 */
	public abstract void removeTeacherMng(TeacherImg teacherImgParam) throws SQLException;

}
