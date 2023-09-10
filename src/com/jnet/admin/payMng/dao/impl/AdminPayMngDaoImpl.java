package com.jnet.admin.payMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.payMng.dao.AdminPayMngDao;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;

@Repository
public class AdminPayMngDaoImpl implements AdminPayMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	@Resource(name="sqlSession2")
	private SqlSession sql2;
	
	@Override
	public int findPayTotCnt(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findPayTotCnt");
		return (Integer)sql2.selectOne("paySql.findPayTotCnt",outPgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OutPgm> listPayMng(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-listPayMng");
		return (ArrayList<OutPgm>)sql2.selectList("paySql.listPayMng",outPgmParam);
	}
	@Override
	public int findRefundTotCnt(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findRefundTotCnt");
		return (Integer)sql2.selectOne("paySql.findRefundTotCnt",outPgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OutPgm> listRefundMng(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-listRefundMng");
		return (ArrayList<OutPgm>)sql2.selectList("paySql.listRefundMng",outPgmParam);
	}
	@Override
	public int findPayTotCntForFront(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findPayTotCntForFront");
		return (Integer)sql2.selectOne("paySql.findPayTotCntForFront",outPgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OutPgm> listPayMngForFront(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-listPayMngForFront");
		return (ArrayList<OutPgm>)sql2.selectList("paySql.listPayMngForFront",outPgmParam);
	}
	@Override
	public Payment findPayInfo(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findPayInfo");
		return (Payment)sql2.selectOne("paySql.findPayInfo",payParam);
	}
	
	/**
	 * ====================================== 관리자 환불 관련 DAO ====================================== 
	 */
	@Override
	public Payment findRefundCardSale(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findRefundCardSale");
		return (Payment)sql2.selectOne("paySql.findRefundCardSale", payParam);
	}
	
	@Override
	public boolean updateRefundCardSale(Payment payParam) throws SQLException{
		logger.info("AdminPayMngDaoImpl-updateRefundCardSale");
		boolean bl = false;
		try {
			sql2.update("paySql.updateRefundCardSale", payParam);
			bl = true;
		} catch(Exception e) {
			bl = false;
		}	
			
		return bl;
	}
	
	@Override
	public int findRefundCardSeq(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findRefundCardSeq");
		return (Integer)sql2.selectOne("paySql.findCardSeq", payParam);
	}
	
	@Override
	public void saveRefundCardSeq(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-saveRefundCardSeq");
		sql2.insert("paySql.insertCardSeq", payParam);
	}
	
	@Override
	public void updateRefundCardSeq(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefundCardSeq");
		sql2.insert("paySql.updateCardSeq", payParam);
	}
	
	@Override
	public void saveRefundCardSale(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-saveRefundCardSale");
		sql2.insert("paySql.insertRefundCardSale", payParam);
	}
	
	@Override
	public void updateRefundCourseDetail(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefundCourseDetail");
		sql2.update("paySql.updateRefundCourseDetail", payParam);
	}
	
	@Override
	public void updateRefundCourse(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefundCourse");
		sql2.update("paySql.updateRefundCourse", payParam);
	}
	
	@Override
	public void updateRefundReceiptDetail(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefundReceiptDetail");
		sql2.update("paySql.updateRefundReceiptDetail", payParam);
	}
	
	@Override
	public void updateRefundReceipt(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefundReceipt");
		sql2.update("paySql.updateRefundReceipt", payParam);
	}
	
	@Override
	public void updateRefundReceiptJoin(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefundReceiptJoin");
		sql2.update("paySql.updateRefundReceiptJoin", payParam);
	}
	
	@Override
	public void removeRefundCoupon(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-removeRefundCoupon");
		sql2.delete("paySql.deleteRefundCoupon", payParam);
	}
	
	@Override
	public void updateRefund(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefund");
		sql2.update("paySql.updateRefund", payParam);
	}
	
	@Override
	public int findRefundReceiptNo(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findRefundReceiptNo");
		return (Integer)sql2.selectOne("paySql.findReceiptNo", payParam);
	}
	
	@Override
	public void saveRefundReceiptNo(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-saveRefundReceiptNo");
		sql2.insert("paySql.insertReceiptNo", payParam);
	}
	
	@Override
	public void updateRefundReceiptNo(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-updateRefundReceiptNo");
		sql2.update("paySql.updateReceiptNo", payParam);
	}
	
	@Override
	public void saveRefundReceipt(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-saveRefundReceipt");
		sql2.insert("paySql.insertRefundReceipt", payParam);
	}
	
	@Override
	public void saveRefundReceiptDetail(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-saveRefundReceiptDetail");
		sql2.insert("paySql.insertRefundReceiptDetail", payParam);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> listRefund(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-listRefund");
		return (List<Payment>)sql2.selectList("paySql.listRefund", payParam);
	}
	
	@Override
	public int findCardRefundRepaySeq(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-findCardRefundRepaySeq");
		return (Integer)sql2.selectOne("paySql.findCardRefundRepaySeq", payParam);
	}
	
	@Override
	public void saveCardRefund(Payment payParam) throws SQLException {
		logger.info("AdminPayMngDaoImpl-saveCardRefund");
		sql2.insert("paySql.insertCardRefund", payParam);
	}
	
	
}
