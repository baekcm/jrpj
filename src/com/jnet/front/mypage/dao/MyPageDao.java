package com.jnet.front.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jnet.domain.CsMember;
import com.jnet.domain.Locker;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;

public interface MyPageDao {
	
	public CsMember selectCsMember(CsMember domain);
	
	public String insertBasket(Map<String, Object> mapParam);
	
	public List<Payment> selectBasketList(Map<String, Object> mapParam);
	
	public List<HashMap<String, Object>> selectDcCodeList(Map<String, Object> mapParam);
	
	public HashMap<String, Object> selectDcCode(Map<String, Object> mapParam);
	
	public void deleteBasket(Map<String, Object> mapParam);
	
	public int selectReceiptNo(Payment payParam);
	
	public void insertReceiptNo(Payment payParam);
	
	public void updateReceiptNo(Payment payParam);
	
	public void insertReceipt(Payment payParam);
	
	public int selectReceiptSeq(Payment payParam);
	
	public void insertReceiptDetail(Payment payParam);
	
	public void insertCourse(Payment payParam);
	
	public void insertCourseDetail(Payment payParam);
	
	public void insertReceiptJoin(Payment payParam);
	
	public void insertCoupon(Payment payParam);
	
	public int selectCardSeq(Payment payParam);
	
	public void insertCardSeq(Payment payParam);
	
	public void updateCardSeq(Payment payParam);
	
	public void insertCardSale(Payment payParam);
	
	public void deleteBasketByPayment(Payment payParam);
	
	public List<Locker> selectLockerList(Locker locker);
	public int selectLockerTotCnt(Locker locker);
	
	public ArrayList<OutPgm> listMyProgram(OutPgm outPgm);
	public int findMyPgmTotCnt(OutPgm outPgm);
	
	public void insertRefund(Payment payParam);
	
	public String selectRefundCancel(Payment payParam);
	
	public void deleteRefundCancel(Payment payParam);

}
