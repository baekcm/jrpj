package com.jnet.front.mypage.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.domain.CsMember;
import com.jnet.domain.Locker;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;
import com.jnet.front.mypage.dao.MyPageDao;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Autowired
	@Resource(name="sqlSession2")
	private SqlSession sql2;
	
	public CsMember selectCsMember(CsMember domain) {
		return (CsMember)sql2.selectOne("myPageSql.findCsMemberInfo", domain);
	}
	
	public String insertBasket(Map<String, Object> mapParam) {
		return (String)sql2.selectOne("myPageSql.insertBasket", mapParam);
	}
	
	@SuppressWarnings("unchecked")
	public List<Payment> selectBasketList(Map<String, Object> mapParam) {
		return (List<Payment>)sql2.selectList("myPageSql.listBasket", mapParam);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Locker> selectLockerList(Locker locker) {
		return (List<Locker>)sql2.selectList("myPageSql.listLocker", locker);
	}
	
	public int selectLockerTotCnt(Locker locker) {
		return (Integer)sql2.selectOne("myPageSql.selectLockerTotCnt", locker);
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<OutPgm> listMyProgram(OutPgm outPgm) {
		return (ArrayList<OutPgm>)sql2.selectList("myPageSql.listMyProgram", outPgm);
	}
	
	public int findMyPgmTotCnt(OutPgm outPgm) {
		return (Integer)sql2.selectOne("myPageSql.findMyPgmTotCnt", outPgm);
	}
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectDcCodeList(Map<String, Object> mapParam) {
		return (List<HashMap<String, Object>>)sql2.selectList("myPageSql.listDcCode", mapParam);
	}
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectDcCode(Map<String, Object> mapParam) {
		return (HashMap<String, Object>)sql2.selectOne("myPageSql.listDcCode", mapParam);
	}
	
	public void deleteBasket(Map<String, Object> mapParam) {
		sql2.selectOne("myPageSql.removeBasket", mapParam);
	}
	
	public int selectReceiptNo(Payment payParam) {
		int receipt_no = 0;
		try {
			receipt_no = (Integer)sql2.selectOne("paySql.findReceiptNo", payParam);
		} catch(NullPointerException e) {
			receipt_no = 0;
		}
		return receipt_no;
	}
	
	public void insertReceiptNo(Payment payParam) {
		sql2.insert("paySql.insertReceiptNo", payParam);
	}
	
	public void updateReceiptNo(Payment payParam) {
		sql2.insert("paySql.updateReceiptNo", payParam);
	}
	
	public void insertReceipt(Payment payParam) {
		sql2.insert("paySql.insertReceipt", payParam);
	}
	
	public int selectReceiptSeq(Payment payParam) {
		return (Integer)sql2.selectOne("paySql.findReceiptSeq", payParam);
	}
	
	public void insertReceiptDetail(Payment payParam) {
		sql2.insert("paySql.insertReceiptDetail", payParam);
	}
	
	public void insertCourse(Payment payParam) {
		sql2.insert("paySql.insertCourse", payParam);
	}
	
	public void insertCourseDetail(Payment payParam) {
		sql2.insert("paySql.insertCourseDetail", payParam);
	}
	
	public void insertReceiptJoin(Payment payParam) {
		sql2.insert("paySql.insertReceiptJoin", payParam);
	}
	
	public void insertCoupon(Payment payParam) {
		sql2.insert("paySql.insertCoupon", payParam);
	}
	
	public int selectCardSeq(Payment payParam) {
		int card_seq = 0;
		try {
			card_seq = (Integer)sql2.selectOne("paySql.findCardSeq", payParam);
		} catch(NullPointerException e) {
			card_seq = 0;
		}
		
		return card_seq;
	}
	
	public void insertCardSeq(Payment payParam) {
		sql2.insert("paySql.insertCardSeq", payParam);
	}
	
	public void updateCardSeq(Payment payParam) {
		sql2.insert("paySql.updateCardSeq", payParam);
	}
	
	public void insertCardSale(Payment payParam) {
		sql2.insert("paySql.insertCardSale", payParam);
	}
	
	public void deleteBasketByPayment(Payment payParam) {
		sql2.delete("paySql.deleteBasketByPayment", payParam);
	}
	
	public void insertRefund(Payment payParam) {
		sql2.insert("paySql.insertRefund", payParam);
	}
	
	public String selectRefundCancel(Payment payParam) {
		return (String)sql2.selectOne("paySql.selectRefundCancel", payParam);
	}
	
	public void deleteRefundCancel(Payment payParam) {
		sql2.delete("paySql.deleteRefundCancel", payParam);
	}

}
