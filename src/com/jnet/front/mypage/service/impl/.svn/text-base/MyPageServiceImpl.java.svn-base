package com.jnet.front.mypage.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jnet.domain.CsMember;
import com.jnet.domain.Locker;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;
import com.jnet.front.mypage.dao.MyPageDao;
import com.jnet.front.mypage.service.MyPageService;
import com.jnet.util.CommonUtil;
import com.jnet.util.DateUtil;
import com.microsoft.sqlserver.jdbc.SQLServerException;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	public CsMember getCsMember(CsMember csMember) {
		return myPageDao.selectCsMember(csMember);
	}
	
	public String saveBasket(Map<String, Object> mapParam) {
		return myPageDao.insertBasket(mapParam);
	}
	
	public List<Payment> getBasketList(Map<String, Object> mapParam) {
		List<Payment> listBasket = new ArrayList<Payment>();
		HashMap<String, Object> dcCodeInfo = new HashMap<String, Object>();
		listBasket = myPageDao.selectBasketList(mapParam);
		
		//row별 할인코드리스트 가져오기
		for(int i = 0; i < listBasket.size(); i++) {
			mapParam.put("basCd", listBasket.get(i).getBas_cd());
			mapParam.put("saleComCd", listBasket.get(i).getSale_com_cd());
			//listDcCode = myPageDao.selectDcCodeList(mapParam);
			dcCodeInfo = myPageDao.selectDcCode(mapParam);
			//listBasket.get(i).put("listDcCode", listDcCode);
			try {
				listBasket.get(i).setDc_cd(CommonUtil.checkNull((String)dcCodeInfo.get("DC_CD"), "00001"));
				listBasket.get(i).setDc_nm(CommonUtil.checkNull((String)dcCodeInfo.get("DC_NM"), "할인없음"));
			} catch(NullPointerException e) {
				listBasket.get(i).setDc_cd("00001");
				listBasket.get(i).setDc_nm("할인없음");
			}
		}
		
		return listBasket;
	}
	
	public List<Locker> getLockerList(Locker locker) {
		List<Locker> listLocker = new ArrayList<Locker>();
		listLocker = myPageDao.selectLockerList(locker);
		return listLocker;
	}
	
	public int getLockerTotCnt(Locker locker) {
		return myPageDao.selectLockerTotCnt(locker);
	}
	
	public ArrayList<OutPgm> listMyProgram(OutPgm outPgm) {
		
		return myPageDao.listMyProgram(outPgm);
	}
	
	public int findMyPgmTotCnt(OutPgm outPgm) {
		return myPageDao.findMyPgmTotCnt(outPgm);
	}
	
	public List<HashMap<String, Object>> getDcCodeList(Map<String, Object> mapParam) {
		
		return myPageDao.selectDcCodeList(mapParam);
	}
	
	public void removeBasket(Map<String, Object> mapParam) {
		myPageDao.deleteBasket(mapParam);
	}
	
	//결제진행 프로세스
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class,SQLServerException.class,SQLException.class} ,readOnly = false)
	public boolean procPayment(Map<String, Object> mapParam, Payment payParam) throws Exception {
		boolean paySucc = true;
		CsMember sCsMember = (CsMember)mapParam.get("sCsMember");
		
		//mapParam.put("upId", sCsMember.getUp_id());
		mapParam.put("upId", payParam.getUp_id());
		mapParam.put("memNo", sCsMember.getMem_no());
		//mapParam.put("yymm", DateUtil.getCurrentDate().substring(0, 6));
		mapParam.put("yymm", DateUtil.getStrNextMonth("yyyyMM"));
		//할인코드가져올파라미터
		int age = Integer.parseInt(DateUtil.getStrCurrentYear()) - Integer.parseInt(sCsMember.getBirth().substring(0,4)) + 1;
		mapParam.put("age", age);
		mapParam.put("gender", sCsMember.getSex());
		mapParam.put("dcCd", sCsMember.getDc_cd());
		
		String today = DateUtil.getCurrentDate();
		String recpNo = today.substring(0, 6);
		
		int slip_no = 0;
		if(paySucc) {
			//payParam.setUp_id(sCsMember.getUp_id());
			payParam.setReceipt_no(recpNo);

			slip_no = getReceiptNo(payParam);
			if(slip_no == 0) { //영수증번호 추가
				payParam.setYymm(recpNo);
				saveReceiptNo(payParam);
				recpNo = recpNo + "000001";
			} else { //영수증번호 업데이트
				updateReceiptNo(payParam);
				recpNo = recpNo + CommonUtil.leftPad(slip_no+"", 6, '0');
			}
			//영수마스터 SSRCHTB 입력
			payParam.setReceipt_no(recpNo);
			payParam.setToday(today);
			payParam.setMem_no(sCsMember.getMem_no());
			payParam.setPay_amount(Integer.parseInt(CommonUtil.checkNull(mapParam.get("good_mny")+"", "0")));
			saveReceipt(payParam);
			
			//영수순번조회
			int receiptSeq = getReceiptSeq(payParam);
			
			//장바구니정보 가져오기
			List<Payment> list = getBasketList(mapParam);
			int basketCnt = list.size();
			
			Payment receiptDet = new Payment();
			receiptDet.setMem_no(sCsMember.getMem_no());
			receiptDet.setReceipt_no(recpNo);
			receiptDet.setReceipt_seq(receiptSeq+"");
			int sumSaleAmount = 0;
			for(int i = 0; i < basketCnt; i ++) {
				receiptDet.setSeq_no(list.get(i).getSeq_no());
				receiptDet.setUp_id(list.get(i).getUp_id());
				receiptDet.setBas_cd(list.get(i).getBas_cd());
				receiptDet.setItem_cd(list.get(i).getItem_cd());
				receiptDet.setPgm_cd(list.get(i).getPgm_cd());
				receiptDet.setPgm_nm(list.get(i).getPgm_nm());
				receiptDet.setDt_week_cd(list.get(i).getDt_week_cd());
				receiptDet.setStart_t(list.get(i).getStart_t());
				receiptDet.setEnd_t(list.get(i).getEnd_t());
				receiptDet.setTarget(list.get(i).getTarget());
				receiptDet.setTarget_cd(list.get(i).getTarget_cd());
				receiptDet.setSale_com_cd(list.get(i).getSale_com_cd());
				receiptDet.setMem_cnt(list.get(i).getMem_cnt());
				receiptDet.setOnline_yn(list.get(i).getOnline_yn());
				receiptDet.setVat_yn(list.get(i).getVat_yn());
				receiptDet.setDc_yn(list.get(i).getDc_yn());
				receiptDet.setU_price(list.get(i).getU_price());
				receiptDet.setDc_cd(list.get(i).getDc_cd());
				receiptDet.setStart_dt(list.get(i).getStart_dt());
				receiptDet.setEnd_dt(list.get(i).getEnd_dt());
				receiptDet.setToday(today);
				
				int uPrice = Integer.parseInt(list.get(i).getU_price()); //단가
				int dcRate = Integer.parseInt(list.get(i).getDc_cd().substring(0, 3)); //할인률
				
				int dcPrice = ((uPrice * dcRate /100) / 10) * 10; //할인금액
				int payPrice = uPrice - dcPrice; //결제금액
				receiptDet.setDc_amount(dcPrice);
				receiptDet.setPay_amount(payPrice);
				
				int saleAmount = 0, vatAmount = 0;
				if("Y".equals(list.get(i).getVat_yn())) {
					//saleAmount = CommonUtil.getDownForNumber(((Double.parseDouble(payPrice+"") / 1.1) / 10) * 10, 0);
					saleAmount = ((int)((Double.parseDouble(payPrice+"") / 1.1) / 10)) * 10;  //1원단위 절삭
					vatAmount = payPrice - saleAmount;
				} else {
					saleAmount = payPrice;
					vatAmount = 0;
				}
				sumSaleAmount += saleAmount;
				receiptDet.setSale_amount(saleAmount);
				receiptDet.setVat_amount(vatAmount);
				receiptDet.setIn_seq(receiptSeq+"");
	
				saveReceiptDetail(receiptDet); 	//영수상세정보입력 SSRCDTB
				saveCourse(receiptDet);			//수강 마스터입력 SGSPCTB
				receiptDet.setYymm(DateUtil.getStrNextMonth("yyyyMM"));
				saveCourseDetail(receiptDet);	//수강상세정보입력 SGREGTBhttp://
				saveReceiptJoin(receiptDet);	//영수가입정보연결테이블입력 SCTRNTB
				
				//쿠폰해당강좌조회
				if(!"41".equals(receiptDet.getUp_id()) && "01".equals(list.get(i).getBas_cd()) ) {
					int coupon_qty = 0;
					if("02".equals(list.get(i).getTarget_cd())) {
						coupon_qty = CommonUtil.getUpForNumber(((saleAmount / 30000) + 0.49), 0);
					} else {
						coupon_qty = CommonUtil.getUpForNumber(((saleAmount / 40000) + 0.49), 0);
					}
					receiptDet.setCoupon_qty(coupon_qty);
					saveCoupon(receiptDet);
				}
				receiptSeq = receiptSeq + 1;
			}
			//카드순번조회
			int card_seq = 0;
			card_seq = getCardSeq(payParam);
			if(card_seq == 0) { //카드순번 추가
				payParam.setYymm(recpNo);
				saveCardSeq(payParam);
				card_seq = 1;
			} else { //카드순번 업데이트
				updateCardSeq(payParam);
			}
			payParam.setCard_seq(card_seq);
			payParam.setCard_no(CommonUtil.checkNull((String)mapParam.get("card_no")));
			payParam.setCard_name(CommonUtil.checkNull((String)mapParam.get("card_name")));
			payParam.setApp_time(CommonUtil.checkNull((String)mapParam.get("app_time")));
			payParam.setApp_no(CommonUtil.checkNull((String)mapParam.get("app_no")));
			payParam.setRes_cd(CommonUtil.checkNull((String)mapParam.get("res_cd")));
			payParam.setTno(CommonUtil.checkNull((String)mapParam.get("tno")));
			payParam.setGood_mny(Integer.parseInt(CommonUtil.checkNull((String)mapParam.get("good_mny"), "")));
			payParam.setSum_sale_amt(sumSaleAmount);
			payParam.setYymm(CommonUtil.checkNull((String)mapParam.get("yymm")));
			saveCardSale(payParam);		//카드정보 CARD_SALE입력
			
			//payParam.setYymm(DateUtil.getCurrentDate().substring(0, 6));
			removeBasketByPayment(payParam);	//장바구니 삭제
			        				
		}
		
		return paySucc;
	}
	
	
	
	
	public int getReceiptNo(Payment payParam) {
		return myPageDao.selectReceiptNo(payParam);
	}
	
	public void saveReceiptNo(Payment payParam) {
		myPageDao.insertReceiptNo(payParam);
	}
	
	public void updateReceiptNo(Payment payParam) {
		myPageDao.updateReceiptNo(payParam);
	}
	
	public void saveReceipt(Payment payParam) {
		myPageDao.insertReceipt(payParam);
	}
	
	public int getReceiptSeq(Payment payParam) {
		return myPageDao.selectReceiptSeq(payParam);
	}
	
	public void saveReceiptDetail(Payment payParam) {
		myPageDao.insertReceiptDetail(payParam);
	}
	
	public void saveCourse(Payment payParam) {
		myPageDao.insertCourse(payParam);
	}
	
	public void saveCourseDetail(Payment payParam) {
		myPageDao.insertCourseDetail(payParam);
	}
	
	public void saveReceiptJoin(Payment payParam) {
		myPageDao.insertReceiptJoin(payParam);
	}
	
	public void saveCoupon(Payment payParam) {
		myPageDao.insertCoupon(payParam);
	}
	
	public int getCardSeq(Payment payParam) {
		return myPageDao.selectCardSeq(payParam);
	}
	
	public void saveCardSeq(Payment payParam) {
		myPageDao.insertCardSeq(payParam);
	}
	
	public void updateCardSeq(Payment payParam) {
		myPageDao.updateCardSeq(payParam);
	}
	
	public void saveCardSale(Payment payParam) {
		myPageDao.insertCardSale(payParam);
	}
	
	public void removeBasketByPayment(Payment payParam) {
		myPageDao.deleteBasketByPayment(payParam);
	}
	
	public void saveRefund(Payment payParam) {
		myPageDao.insertRefund(payParam);
	}
	
	public String findRefundCancel(Payment payParam) {
		return myPageDao.selectRefundCancel(payParam);
	}
	
	public void removeRefundCancel(Payment payParam) {
		myPageDao.deleteRefundCancel(payParam);
	}
	
}
