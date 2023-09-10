package com.jnet.admin.payMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;




public interface AdminPayMngDao {
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
	 * 결제 조회??
	 * @param payParam payParam
	 * @return  Payment Payment
	 * @throws SQLException SQLException
	 */
	public abstract Payment findPayInfo(Payment payParam) throws SQLException;
	
	/**
	 * 환불 시 CARD_SALE데이터 가져오기
	 * @param payParam
	 * @return
	 * @throws SQLException
	 */
	public Payment findRefundCardSale(Payment payParam) throws SQLException;
	
	/**
	 * 당일결제취소 시 CARD_SALE update
	 * @param payParam
	 * @return
	 */
	public boolean updateRefundCardSale(Payment payParam)throws SQLException;
	
	/**
	 * 결제취소 시 카드순번 가져오기
	 * @param payParam
	 * @return
	 * @throws SQLException
	 */
	public int findRefundCardSeq(Payment payParam) throws SQLException;

	/**
	 * 결제취소 시 카드순번 등록
	 * @param payParam
	 * @throws SQLException
	 */
	public void saveRefundCardSeq(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 카드순번 업데이트
	 * @param payParam
	 * @throws SQLException
	 */
	public void updateRefundCardSeq(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 CARD_SALE insert
	 * @param payParam
	 * @throws SQLException
	 */
	public void saveRefundCardSale(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 수강상세 업데이트 
	 * @param payParam
	 * @throws SQLException
	 */
	public void updateRefundCourseDetail(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 수강마스터 업데이트 
	 * @param payParam
	 * @throws SQLException
	 */
	public void updateRefundCourse(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 영수상세 업데이트 
	 * @param payParam
	 * @throws SQLException
	 */	
	public void updateRefundReceiptDetail(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 영수마스터 업데이트 
	 * @param payParam
	 * @throws SQLException
	 */	
	public void updateRefundReceipt(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 영수가입정보 업데이트 
	 * @param payParam
	 * @throws SQLException
	 */
	public void updateRefundReceiptJoin(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 쿠폰정보삭제 
	 * @param payParam
	 * @throws SQLException
	 */
	public void removeRefundCoupon(Payment payParam) throws SQLException;
	
	/**
	 * 결제취소 시 취소요청리스트 업데이트 
	 * @param payParam
	 * @throws SQLException
	 */
	public void updateRefund(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 영수증 번호 조회
	 * @param payParam
	 * @return
	 * @throws SQLException
	 */
	public int findRefundReceiptNo(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 영수증 번호 추가
	 * @param payParam
	 * @throws SQLException
	 */
	public void saveRefundReceiptNo(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 영수증 번호 업데이트
	 * @param payParam
	 * @throws SQLException
	 */
	public void updateRefundReceiptNo(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 영수마스터 추가
	 * @param payParam
	 * @throws SQLException
	 */
	public void saveRefundReceipt(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 영수상세 추가
	 * @param payParam
	 * @throws SQLException
	 */
	public void saveRefundReceiptDetail(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 환불 정보
	 * @param payParam
	 * @return
	 * @throws SQLException
	 */
	public List<Payment> listRefund(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 환불번호 맥스값
	 * @param payParam
	 * @return
	 * @throws SQLException
	 */
	public int findCardRefundRepaySeq(Payment payParam) throws SQLException;
	
	/**
	 * 카드환불 시 환불정보 추가
	 * @param payParam
	 * @throws SQLException
	 */
	public void saveCardRefund(Payment payParam) throws SQLException;

}
