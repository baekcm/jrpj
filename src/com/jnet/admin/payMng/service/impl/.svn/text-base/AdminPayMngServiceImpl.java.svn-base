package com.jnet.admin.payMng.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.payMng.dao.AdminPayMngDao;
import com.jnet.admin.payMng.service.AdminPayMngService;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;
import com.jnet.util.CommonUtil;
import com.jnet.util.DateUtil;

@Service
public class AdminPayMngServiceImpl implements AdminPayMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private AdminPayMngDao adminPayMngDao;

	@Override
	public int findPayTotCnt(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngServiceImpl - findPayTotCnt");
		return adminPayMngDao.findPayTotCnt(outPgmParam);
	}

	@Override
	public ArrayList<OutPgm> listPayMng(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngServiceImpl - listPayMng");
		return adminPayMngDao.listPayMng(outPgmParam);
	}

	@Override
	public int findRefundTotCnt(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngServiceImpl - findRefundTotCnt");
		return adminPayMngDao.findRefundTotCnt(outPgmParam);
	}

	@Override
	public ArrayList<OutPgm> listRefundMng(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngServiceImpl - listRefundMng");
		return adminPayMngDao.listRefundMng(outPgmParam);
	}

	@Override
	public int findPayTotCntForFront(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngServiceImpl - findPayTotCntForFront");
		return adminPayMngDao.findPayTotCntForFront(outPgmParam);
	}

	@Override
	public ArrayList<OutPgm> listPayMngForFront(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPayMngServiceImpl - listPayMngForFront");
		return adminPayMngDao.listPayMngForFront(outPgmParam);
	}

	@Override
	public boolean saveRefundPop(Payment payParam) throws Exception {
		logger.info("AdminPayMngServiceImpl - saveRefundPop");
		/**
		 * 해당 부분에 환불 처리 및 로직 추가 (트랜잭션을 위함)
		 * adminPayMngDao / paySql.xml 페이지 이용
		 * dao 호출시 명명규칙
		 * select 리스트 호출 = listXXX
		 * select 단건 호출 = findXXX
		 * insert 호출 = saveXXX
		 * update 호출 = updateXXX
		 * delete 호출 = removeXXX
		 */
		boolean bSucc = true;
		//String mem_no = payParam.getMem_no();
		//String recp_no = payParam.getRecpNo();
		String today = DateUtil.getCurrentDate();
		payParam.setToday(today);

		Payment refund_card_sale = adminPayMngDao.findRefundCardSale(payParam);
		if(refund_card_sale == null) {
			bSucc = false;
		} else {
			refund_card_sale.setMem_no(payParam.getMem_no());
			refund_card_sale.setUp_id(payParam.getUp_id());
			refund_card_sale.setToday(payParam.getToday());
			refund_card_sale.setRecp_no(payParam.getRecp_no());
			if(today.equals(refund_card_sale.getSale_date())) { //당일결제취소
				refund_card_sale.setSt_tag("4");
				//###### CARD_SALE UPDATE ######
				if(adminPayMngDao.updateRefundCardSale(refund_card_sale)) {
					//카드순번조회
					int cardSeq = adminPayMngDao.findRefundCardSeq(refund_card_sale);
					if( cardSeq == 0 ) {
						adminPayMngDao.saveRefundCardSeq(refund_card_sale);
						refund_card_sale.setCard_seq(1);
					} else {
						adminPayMngDao.updateRefundCardSeq(refund_card_sale);
						refund_card_sale.setCard_seq(cardSeq);
					}
					
					//###### CARD_SALE INSERT ######
					adminPayMngDao.saveRefundCardSale(refund_card_sale);
					
					//###### 수강 상세 SGREGTB ######
					adminPayMngDao.updateRefundCourseDetail(refund_card_sale);
					//###### 수강 마스터 SGSPCTB ######
					adminPayMngDao.updateRefundCourse(refund_card_sale);
					//###### 영수 상세 SSRCDTB ######
					adminPayMngDao.updateRefundReceiptDetail(refund_card_sale);
					//###### 영수 마스터 SSRCHTB ######
					adminPayMngDao.updateRefundReceipt(refund_card_sale);
					//###### SCTRNTB 영수가입정보######
					adminPayMngDao.updateRefundReceiptJoin(refund_card_sale);
					//###### 쿠폰 SGCUPRTTB ######
					adminPayMngDao.removeRefundCoupon(refund_card_sale);
					//###### 취소요청 리스트 SGCCLTB ######
					adminPayMngDao.updateRefund(refund_card_sale);
				} else {
					bSucc = false;
				}
			} else { //당일결제취소가 아니면 카드환불
				refund_card_sale.setSt_tag("3");
				String yymm = DateUtil.getCurrentDate().substring(0, 6);
				refund_card_sale.setReceipt_no(yymm);
				refund_card_sale.setYymm(yymm);
				String refundRecpNo = "";
				//##### 영수증 번호 조회 #####
				int slipNo = adminPayMngDao.findRefundReceiptNo(refund_card_sale);
				if(slipNo == 0) {
					adminPayMngDao.saveRefundReceiptNo(refund_card_sale);
					refundRecpNo = yymm + "000001";
					
				} else {
					adminPayMngDao.updateRefundReceiptNo(refund_card_sale);
					refundRecpNo = yymm + CommonUtil.leftPad(slipNo+"", 6, '0');
				}
				
				//###### CARD_SALE UPDATE ######
				if(adminPayMngDao.updateRefundCardSale(refund_card_sale)) {
					//##### 카드 순번 조회 #####
					int cardSeq = adminPayMngDao.findRefundCardSeq(refund_card_sale);
					if( cardSeq == 0 ) {
						adminPayMngDao.saveRefundCardSeq(refund_card_sale);
						refund_card_sale.setCard_seq(1);
					} else {
						adminPayMngDao.updateRefundCardSeq(refund_card_sale);
						refund_card_sale.setCard_seq(cardSeq);
					}
					
					//###### CARD_SALE INSERT ######
					refund_card_sale.setSale_date(today);
					refund_card_sale.setRecp_no(refundRecpNo);
					adminPayMngDao.saveRefundCardSale(refund_card_sale);
					//###### 영수 마스터 SSRCHTB ######
					refund_card_sale.setRefundRecpNo(refundRecpNo);
					refund_card_sale.setRecp_no(payParam.getRecp_no());
					adminPayMngDao.saveRefundReceipt(refund_card_sale);
					//###### 영수 상세 SSRCDTB ######
					adminPayMngDao.saveRefundReceiptDetail(refund_card_sale);
					
					//###### 환불 SGREPTB ######
					List<Payment> list = adminPayMngDao.listRefund(refund_card_sale);
					//if(list !=null && !list.isEmpty()) {
					String repay_seq = "";
					for(int i = 0; i < list.size(); i ++) {
						refund_card_sale.setIn_seq(CommonUtil.checkNull(list.get(i).getIn_seq()));
						refund_card_sale.setRecpseqno(CommonUtil.checkNull(list.get(i).getRecpseqno()));
						refund_card_sale.setFg_cd(CommonUtil.checkNull(list.get(i).getFg_cd()));
						refund_card_sale.setBas_cd(CommonUtil.checkNull(list.get(i).getBas_cd()));
						refund_card_sale.setItem_cd(CommonUtil.checkNull(list.get(i).getItem_cd()));
						refund_card_sale.setPgm_cd(CommonUtil.checkNull(list.get(i).getPgm_cd()));
						refund_card_sale.setCard_amt(CommonUtil.checkNull(list.get(i).getCard_amt(), "0"));
						refund_card_sale.setReason(CommonUtil.checkNull(list.get(i).getReason()));
						repay_seq = adminPayMngDao.findCardRefundRepaySeq(refund_card_sale)+"";
						refund_card_sale.setRepay_seq(repay_seq); //쿼리에 직접 삽입
						//###### 환불 INSERT ######
						adminPayMngDao.saveCardRefund(refund_card_sale);
					}
					//###### 수강 상세 SGREGTB ######
					adminPayMngDao.updateRefundCourseDetail(refund_card_sale);
					//###### 수강 마스터 SGSPCTB ######
					adminPayMngDao.updateRefundCourse(refund_card_sale);
					//###### SCTRNTB 영수가입정보######
					adminPayMngDao.updateRefundReceiptJoin(refund_card_sale);
					//###### 쿠폰 SGCUPRTTB ######
					adminPayMngDao.removeRefundCoupon(refund_card_sale);
					//###### 취소요청 리스트 SGCCLTB ######
					adminPayMngDao.updateRefund(refund_card_sale);
					//} else {
					//	bSucc = false;
					//}
				} else {
					bSucc = false;
				}
			}
		}
		return bSucc;
	}

}
