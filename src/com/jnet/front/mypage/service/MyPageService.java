package com.jnet.front.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jnet.domain.CsMember;
import com.jnet.domain.Locker;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;

public interface MyPageService {
	
	public CsMember getCsMember(CsMember csMember);
	
	public String saveBasket(Map<String, Object> mapParam);
	
	public List<Payment> getBasketList(Map<String, Object> mapParam);
	
	public List<HashMap<String, Object>> getDcCodeList(Map<String, Object> mapParam);
	
	public boolean procPayment(Map<String, Object> mapParam, Payment payParam) throws Exception;
	
	public void removeBasket(Map<String, Object> mapParam);
	
	public int getReceiptNo(Payment payParam);
	
	public void saveReceiptNo(Payment payParam);
	
	public void updateReceiptNo(Payment payParam);
	
	public void saveReceipt(Payment payParam);
	
	public int getReceiptSeq(Payment payParam);
	
	public void saveReceiptDetail(Payment payParam);
	
	public void saveCourse(Payment payParam);
	
	public void saveCourseDetail(Payment payParam);
	
	public void saveReceiptJoin(Payment payParam);
	
	public void saveCoupon(Payment payParam);
	
	public int getCardSeq(Payment payParam);
	
	public void saveCardSeq(Payment payParam);
	
	public void updateCardSeq(Payment payParam);
	
	public void saveCardSale(Payment payParam);
	
	public void removeBasketByPayment(Payment payParam);
	
	public List<Locker> getLockerList(Locker locker);
	public int getLockerTotCnt(Locker locker);
	public ArrayList<OutPgm> listMyProgram(OutPgm outPgm);
	public int findMyPgmTotCnt(OutPgm outPgm);
	
	public void saveRefund(Payment payParam);
	
	public String findRefundCancel(Payment payParam);
	
	public void removeRefundCancel(Payment payParam);

}
