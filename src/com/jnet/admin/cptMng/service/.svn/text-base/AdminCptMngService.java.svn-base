package com.jnet.admin.cptMng.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Menu;
import com.jnet.domain.Minwon;




public interface AdminCptMngService {

	/**
	 * 민원관리 목록수조회
	 * @param minwonParam minwonParam
	 * @return  int int
	 * @throws SQLException SQLException
	 */
	public abstract int findCptTotCnt(Minwon minwonParam) throws SQLException;

	/**
	 * 민원관리 목록조회
	 * @param minwonParam minwonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Minwon> listCptMng(Minwon minwonParam) throws SQLException;

	/**
	 * 민원상세조회
	 * @param minwonParam minwonParam
	 * @return  Minwon Minwon
	 * @throws SQLException SQLException
	 */
	public abstract Minwon findCptMng(Minwon minwonParam) throws SQLException;

	/**
	 * 민원 수정
	 * @param minwonParam minwonParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateCptMng(Minwon minwonParam) throws SQLException;

	/**
	 * 민원통계(우측)
	 * @param minwonParam minwonParam
	 * @return ArrayList ArrayList
	 */
	public abstract ArrayList<Minwon> listCptStatsRight(Minwon minwonParam) throws SQLException;

	/**
	 * 만족도 평가
	 * @return
	 * @throws SQLException
	 */
	public abstract ArrayList<Menu> listSatisFactionStats() throws SQLException;

	/**
	 * 사용자 메뉴목록 조회
	 * @return
	 * @throws SQLException
	 */
	public abstract ArrayList<Menu> listSiteMap() throws SQLException;

	/**
	 * 민원통계 그룹별 접수사항 수
	 * @param minwonParam minwonParam
	 * @return  ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Minwon> listCptStatsTotCnt(Minwon minwonParam) throws SQLException;

}
