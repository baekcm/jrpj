package com.jnet.admin.payMng.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;



public interface AdminPayMngService {

	/**
	 * 온라인 결제 목록수 조회 - 관리자
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findPayTotCnt(OutPgm outPgmParam) throws SQLException;

	/**
	 * 온라인 결제 목록조회- 관리자
	 * @param outPgmParam outPgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<OutPgm> listPayMng(OutPgm outPgmParam) throws SQLException;

	/**
	 * 온라인 환불요청 목록 수 조회- 관리자
	 * @param outPgmParam outPgmParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findRefundTotCnt(OutPgm outPgmParam) throws SQLException;

	/**
	 * 온라인 환불요청 목록 조회- 관리자
	 * @param outPgmParam outPgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<OutPgm> listRefundMng(OutPgm outPgmParam) throws SQLException;

	/**
	 * 온라인 결제 목록수조회- 사용자
	 * @param outPgmParam outPgmParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findPayTotCntForFront(OutPgm outPgmParam) throws SQLException;

	/**
	 * 온라인 결제 목록조회 - 사용자
	 * @param outPgmParam outPgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<OutPgm> listPayMngForFront(OutPgm outPgmParam) throws SQLException;

	/**
	 * 환불 처리
	 * @param payParam payParam
	 * @throws SQLException SQLException
	 */
	public abstract boolean saveRefundPop(Payment payParam) throws Exception;
}
