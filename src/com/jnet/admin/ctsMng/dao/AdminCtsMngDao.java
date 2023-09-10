package com.jnet.admin.ctsMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Cts;
import com.jnet.domain.Menu;
import com.jnet.domain.Popup;


public interface AdminCtsMngDao {

	/**
	 * 컨텐츠관리 목록 수 조회
	 * @param ctsParam ctsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findCtsTotCnt(Cts ctsParam) throws SQLException;

	/**
	 * 컨텐츠 관리 목록 조회
	 * @param ctsParam ctsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Cts> listCtsMng(Cts ctsParam) throws SQLException;

	/**
	 * 컨텐츠 관리 상세조회
	 * @param ctsParam ctsParam
	 * @return Cts Cts
	 * @throws SQLException SQLException
	 */
	public abstract Cts findCtsMng(Cts ctsParam) throws SQLException;

	/**
	 * 컨텐츠 저장
	 * 
	 * @param ctsParam ctsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveCts(Cts ctsParam) throws SQLException;

	/**
	 * 컨텐츠 수정
	 * 
	 * @param ctsParam ctsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateCts(Cts ctsParam) throws SQLException;

	/**
	 * 담당자정보 수정
	 * 
	 * @param ctsParam ctsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateMenuEmpSeq(Cts ctsParam) throws SQLException;
	
	/**
	 * 팝업목록조회
	 * @param popUpParam popUpParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Popup> listPopMng(Popup popUpParam) throws SQLException;

	/**
	 * 팝업 저장
	 * @param pop pop
	 * @throws SQLException SQLException
	 */
	public abstract void savePopMng(Popup pop) throws SQLException;

	/**
	 * 팝업수정
	 * @param pop pop
	 * @throws SQLException SQLException
	 */
	public abstract void updatePopMng(Popup pop) throws SQLException;

	/**
	 * 팝업 상세조회(썸네일 + 원본)
	 * @param popUpParam popUpParam
	 * @return  ArrayList<Popup> ArrayList<Popup>
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Popup> listPopMngByPopSeq(Popup popUpParam) throws SQLException;

	/**
	 * 팝업 삭제
	 * @param popUpParam popUpParam
	 * @throws SQLException SQLException
	 */
	public abstract void removePopMng(Popup popUpParam) throws SQLException;

	/**
	 * 팝업 정렬순서 변경
	 * @param popUpParam popUpParam
	 * @throws Exception Exception
	 */
	public abstract void updatePopOrdinary(Popup popUpParam) throws Exception;

	/**
	 * 컨텐츠 카테고리 목록 조회
	 * @param ctsParam ctsParam
	 * @return ArrayList<Menu> ArrayList<Menu>
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Menu> listDepthCat(Cts ctsParam) throws SQLException;

	/**
	 * 한줄 알리미 저장
	 * @param ctsParam ctsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveOneNotiMng(Popup popUpParam) throws SQLException;

	/**
	 * 알리미 목록 조회
	 * @param popUpParam popUpParam
	 * @return ArrayList<Popup> ArrayList<Popup>
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Popup> listOneNotiMng(Popup popUpParam) throws SQLException;

	/**
	 * 대표문구 공개변경
	 * @param popUpParam popUpParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateShowOneNoti(Popup popUpParam) throws SQLException;

	/**
	 * 대표문구 그외 비공개변경
	 * @param popUpParam popUpParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateHideOneNoti(Popup popUpParam) throws SQLException;

	/**
	 * 한줄 알리미 수정
	 * @param pop pop
	 * @throws SQLException SQLException
	 */
	public abstract void updateOneNotiMng(Popup pop) throws SQLException;

	/**
	 * 알리미 완전삭제
	 * @param popUpParam
	 * @throws SQLException
	 */
	public abstract void removeOneNotiMngByOneNotiSeq(Popup popUpParam) throws SQLException;
	
}
