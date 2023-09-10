package com.jnet.domain;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class Payment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2442128484590351434L;

	//주문-관련
	private String orderNo = ""; //주문번호
	private String orderPgmCd = ""; //주문 프로그램번호
	private String orderPgmNm = ""; //주문 프로그램명
	private String orderAmount = ""; //주문금액
	private String orderer = ""; //주문자명
	private String ordererEmail = ""; //주문자Email
	private String ordererTel = ""; //주문자연락처
	private String ordererHp = ""; //주문자 핸드폰번호
	private String orderDate = ""; //주문일자
	private int orderBasketCnt = 0; //장바구니에 담은 주문갯수
	
	//basket관련
	private String seq_no = "";
	private String up_id = "";
	private String mem_no = "";
	private String bas_cd = "";
	private String item_cd = "";
	private String pgm_cd = "";
	private String pgm_nm = "";
	private String dt_week_cd = "";
	private String start_t = "";
	private String end_t = "";
	private String target = "";
	private String target_cd = "";
	private String sale_com_cd = "";
	private String mem_cnt = "";
	private String online_yn = "";
	private String vat_yn = "";


	private String dc_yn = "";
	private String u_price = "";
	private String start_dt = "";
	private String end_dt = "";
	private String yymm = "";
	private String today = "";
	private int pay_amount = 0;
	private int sale_amount = 0;
	private int vat_amount = 0;
	private int dc_amount = 0;
	
	

	//할인코드
	private String dc_cd = "";
	private String dc_nm = "";
	
	//영수증관련
	private String receipt_no = ""; //영수번호
	private String receipt_seq = ""; //영수순번
	
	//쿠폰관련
	private int coupon_qty = 0;
	
	//카드관련
	private int card_seq = 0;
	private String card_no = "";
	private String card_name = "";
	private String quota = "";
	private int good_mny = 0;
	private String app_time = "";
	private String app_no = "";
	
	
	//결제취소관련
	private String upId = "";
	private String recpNo = "";
	private String pgmNm = "";
	private String issueDt = "";
	private String cancelYn = "";
	private String reason = "";
	private String gbn = "";
	private String req_tx = "";
	
	//환불관련
	//private String up_id ="";
	private String sale_date = ""; 
	private String sequence_no = ""; 
	private String credit_no = ""; 
	private String credit_company_name = "";
	private String validity_period = "";
	private String quota_month = "";
	private int approval_amt = 0;
	private String trade_date = "";
	private String trade_time = "";
	private String agreement_no = "";
	private String buy_co_code = "";
	private String buy_co_name = "";
	private String merchant_id = "";
	private String credit_id = "";
	private int pos_no  = 0;
	private String recp_no = "";
	private String ret_status = "";
	private String ret_message = "";
	private float receive_rate = 0;
	private int receive_amt = 0;
	private String refundRecpNo = "";
	private String st_tag = "";
	
	private String in_seq = "";
	private String recpseqno = "";
	private String fg_cd = "";
	private String card_amt = "";
	private String repay_seq = "";
	
	
	/**
	 * @return the card_no
	 */
	public String getCard_no() {
		return card_no;
	}

	/**
	 * @param card_no the card_no to set
	 */
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	/**
	 * @return the card_name
	 */
	public String getCard_name() {
		return card_name;
	}

	/**
	 * @param card_name the card_name to set
	 */
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	/**
	 * @return the quota
	 */
	public String getQuota() {
		return quota;
	}

	/**
	 * @param quota the quota to set
	 */
	public void setQuota(String quota) {
		this.quota = quota;
	}

	/**
	 * @return the good_mny
	 */
	public int getGood_mny() {
		return good_mny;
	}

	/**
	 * @param good_mny the good_mny to set
	 */
	public void setGood_mny(int good_mny) {
		this.good_mny = good_mny;
	}

	/**
	 * @return the app_time
	 */
	public String getApp_time() {
		return app_time;
	}

	/**
	 * @param app_time the app_time to set
	 */
	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}

	/**
	 * @return the app_no
	 */
	public String getApp_no() {
		return app_no;
	}

	/**
	 * @param app_no the app_no to set
	 */
	public void setApp_no(String app_no) {
		this.app_no = app_no;
	}

	/**
	 * @return the res_cd
	 */
	public String getRes_cd() {
		return res_cd;
	}

	/**
	 * @param res_cd the res_cd to set
	 */
	public void setRes_cd(String res_cd) {
		this.res_cd = res_cd;
	}

	/**
	 * @return the tno
	 */
	public String getTno() {
		return tno;
	}

	/**
	 * @param tno the tno to set
	 */
	public void setTno(String tno) {
		this.tno = tno;
	}

	/**
	 * @return the sum_sale_amt
	 */
	public int getSum_sale_amt() {
		return sum_sale_amt;
	}

	/**
	 * @param sum_sale_amt the sum_sale_amt to set
	 */
	public void setSum_sale_amt(int sum_sale_amt) {
		this.sum_sale_amt = sum_sale_amt;
	}

	private String res_cd = "";
	private String tno = "";
	private int sum_sale_amt = 0;
	
	
	
	
	
	/**
	 * @return the card_seq
	 */
	public int getCard_seq() {
		return card_seq;
	}

	/**
	 * @param card_seq the card_seq to set
	 */
	public void setCard_seq(int card_seq) {
		this.card_seq = card_seq;
	}

	/**
	 * @return the coupon_qty
	 */
	public int getCoupon_qty() {
		return coupon_qty;
	}

	/**
	 * @param coupon_qty the coupon_qty to set
	 */
	public void setCoupon_qty(int coupon_qty) {
		this.coupon_qty = coupon_qty;
	}

	/**
	 * @return the receipt_no
	 */
	public String getReceipt_no() {
		return receipt_no;
	}

	/**
	 * @param receipt_no the receipt_no to set
	 */
	public void setReceipt_no(String receipt_no) {
		this.receipt_no = receipt_no;
	}

	//환불관련
	private String refundDate = ""; //환불일자

	/**
	 * @return the orderNo
	 */
	public String getOrderNo() {
		return orderNo;
	}

	/**
	 * @return the orderPgmCd
	 */
	public String getOrderPgmCd() {
		return orderPgmCd;
	}

	/**
	 * @param orderPgmCd the orderPgmCd to set
	 */
	public void setOrderPgmCd(String orderPgmCd) {
		this.orderPgmCd = orderPgmCd;
	}

	/**
	 * @param orderNo the orderNo to set
	 */
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * @return the orderPgmNm
	 */
	public String getOrderPgmNm() {
		return orderPgmNm;
	}

	/**
	 * @param orderPgmNm the orderPgmNm to set
	 */
	public void setOrderPgmNm(String orderPgmNm) {
		this.orderPgmNm = orderPgmNm;
	}

	/**
	 * @return the orderAmount
	 */
	public String getOrderAmount() {
		return orderAmount;
	}

	/**
	 * @param orderAmount the orderAmount to set
	 */
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	/**
	 * @return the orderer
	 */
	public String getOrderer() {
		return orderer;
	}

	/**
	 * @param orderer the orderer to set
	 */
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}

	/**
	 * @return the ordererEmail
	 */
	public String getOrdererEmail() {
		return ordererEmail;
	}

	/**
	 * @param ordererEmail the ordererEmail to set
	 */
	public void setOrdererEmail(String ordererEmail) {
		this.ordererEmail = ordererEmail;
	}

	/**
	 * @return the ordererTel
	 */
	public String getOrdererTel() {
		return ordererTel;
	}

	/**
	 * @param ordererTel the ordererTel to set
	 */
	public void setOrdererTel(String ordererTel) {
		this.ordererTel = ordererTel;
	}

	/**
	 * @return the ordererHp
	 */
	public String getOrdererHp() {
		return ordererHp;
	}

	/**
	 * @param ordererHp the ordererHp to set
	 */
	public void setOrdererHp(String ordererHp) {
		this.ordererHp = ordererHp;
	}

	/**
	 * @return the orderDate
	 */
	public String getOrderDate() {
		return orderDate;
	}

	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	/**
	 * @return the orderBasketCnt
	 */
	public int getOrderBasketCnt() {
		return orderBasketCnt;
	}

	/**
	 * @param orderBasketCnt the orderBasketCnt to set
	 */
	public void setOrderBasketCnt(int orderBasketCnt) {
		this.orderBasketCnt = orderBasketCnt;
	}

	/**
	 * @return the refundDate
	 */
	public String getRefundDate() {
		return refundDate;
	}

	/**
	 * @param refundDate the refundDate to set
	 */
	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}

	/**
	 * @return the seq_no
	 */
	public String getSeq_no() {
		return seq_no;
	}

	/**
	 * @param seq_no the seq_no to set
	 */
	public void setSeq_no(String seq_no) {
		this.seq_no = seq_no;
	}

	/**
	 * @return the up_id
	 */
	public String getUp_id() {
		return up_id;
	}

	/**
	 * @param up_id the up_id to set
	 */
	public void setUp_id(String up_id) {
		this.up_id = up_id;
	}

	/**
	 * @return the mem_no
	 */
	public String getMem_no() {
		return mem_no;
	}

	/**
	 * @param mem_no the mem_no to set
	 */
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	/**
	 * @return the bas_cd
	 */
	public String getBas_cd() {
		return bas_cd;
	}

	/**
	 * @param bas_cd the bas_cd to set
	 */
	public void setBas_cd(String bas_cd) {
		this.bas_cd = bas_cd;
	}

	/**
	 * @return the item_cd
	 */
	public String getItem_cd() {
		return item_cd;
	}

	/**
	 * @param item_cd the item_cd to set
	 */
	public void setItem_cd(String item_cd) {
		this.item_cd = item_cd;
	}

	/**
	 * @return the pgm_cd
	 */
	public String getPgm_cd() {
		return pgm_cd;
	}

	/**
	 * @param pgm_cd the pgm_cd to set
	 */
	public void setPgm_cd(String pgm_cd) {
		this.pgm_cd = pgm_cd;
	}

	/**
	 * @return the pgm_nm
	 */
	public String getPgm_nm() {
		return pgm_nm;
	}

	/**
	 * @param pgm_nm the pgm_nm to set
	 */
	public void setPgm_nm(String pgm_nm) {
		this.pgm_nm = pgm_nm;
	}

	/**
	 * @return the dt_week_cd
	 */
	public String getDt_week_cd() {
		return dt_week_cd;
	}

	/**
	 * @param dt_week_cd the dt_week_cd to set
	 */
	public void setDt_week_cd(String dt_week_cd) {
		this.dt_week_cd = dt_week_cd;
	}

	/**
	 * @return the start_t
	 */
	public String getStart_t() {
		return start_t;
	}

	/**
	 * @param start_t the start_t to set
	 */
	public void setStart_t(String start_t) {
		this.start_t = start_t;
	}

	/**
	 * @return the end_t
	 */
	public String getEnd_t() {
		return end_t;
	}

	/**
	 * @param end_t the end_t to set
	 */
	public void setEnd_t(String end_t) {
		this.end_t = end_t;
	}

	/**
	 * @return the target
	 */
	public String getTarget() {
		return target;
	}

	/**
	 * @param target the target to set
	 */
	public void setTarget(String target) {
		this.target = target;
	}

	/**
	 * @return the target_cd
	 */
	public String getTarget_cd() {
		return target_cd;
	}

	/**
	 * @param target_cd the target_cd to set
	 */
	public void setTarget_cd(String target_cd) {
		this.target_cd = target_cd;
	}

	/**
	 * @return the sale_com_cd
	 */
	public String getSale_com_cd() {
		return sale_com_cd;
	}

	/**
	 * @param sale_com_cd the sale_com_cd to set
	 */
	public void setSale_com_cd(String sale_com_cd) {
		this.sale_com_cd = sale_com_cd;
	}

	/**
	 * @return the mem_cnt
	 */
	public String getMem_cnt() {
		return mem_cnt;
	}

	/**
	 * @param mem_cnt the mem_cnt to set
	 */
	public void setMem_cnt(String mem_cnt) {
		this.mem_cnt = mem_cnt;
	}

	/**
	 * @return the online_yn
	 */
	public String getOnline_yn() {
		return online_yn;
	}

	/**
	 * @param online_yn the online_yn to set
	 */
	public void setOnline_yn(String online_yn) {
		this.online_yn = online_yn;
	}

	/**
	 * @return the vat_yn
	 */
	public String getVat_yn() {
		return vat_yn;
	}

	/**
	 * @param vat_yn the vat_yn to set
	 */
	public void setVat_yn(String vat_yn) {
		this.vat_yn = vat_yn;
	}

	/**
	 * @return the dc_yn
	 */
	public String getDc_yn() {
		return dc_yn;
	}

	/**
	 * @param dc_yn the dc_yn to set
	 */
	public void setDc_yn(String dc_yn) {
		this.dc_yn = dc_yn;
	}

	/**
	 * @return the u_price
	 */
	public String getU_price() {
		return u_price;
	}

	/**
	 * @param u_price the u_price to set
	 */
	public void setU_price(String u_price) {
		this.u_price = u_price;
	}

	/**
	 * @return the start_dt
	 */
	public String getStart_dt() {
		return start_dt;
	}

	/**
	 * @param start_dt the start_dt to set
	 */
	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}

	/**
	 * @return the end_dt
	 */
	public String getEnd_dt() {
		return end_dt;
	}

	/**
	 * @param end_dt the end_dt to set
	 */
	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}

	/**
	 * @return the dc_cd
	 */
	public String getDc_cd() {
		return dc_cd;
	}

	/**
	 * @param dc_cd the dc_cd to set
	 */
	public void setDc_cd(String dc_cd) {
		this.dc_cd = dc_cd;
	}

	/**
	 * @return the dc_nm
	 */
	public String getDc_nm() {
		return dc_nm;
	}

	/**
	 * @param dc_nm the dc_nm to set
	 */
	public void setDc_nm(String dc_nm) {
		this.dc_nm = dc_nm;
	}
	
	/**
	 * @return the sale_amount
	 */
	public int getSale_amount() {
		return sale_amount;
	}

	/**
	 * @param sale_amount the sale_amount to set
	 */
	public void setSale_amount(int sale_amount) {
		this.sale_amount = sale_amount;
	}

	/**
	 * @return the dc_amount
	 */
	public int getDc_amount() {
		return dc_amount;
	}

	/**
	 * @param dc_amount the dc_amount to set
	 */
	public void setDc_amount(int dc_amount) {
		this.dc_amount = dc_amount;
	}
	
	/**
	 * @return the vat_amount
	 */
	public int getVat_amount() {
		return vat_amount;
	}

	/**
	 * @param vat_amount the vat_amount to set
	 */
	public void setVat_amount(int vat_amount) {
		this.vat_amount = vat_amount;
	}

	/**
	 * @return the pay_amount
	 */
	public int getPay_amount() {
		return pay_amount;
	}

	/**
	 * @param pay_amount the pay_amount to set
	 */
	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}

	/**
	 * @return the today
	 */
	public String getToday() {
		return today;
	}

	/**
	 * @param today the today to set
	 */
	public void setToday(String today) {
		this.today = today;
	}

	/**
	 * @return the yymm
	 */
	public String getYymm() {
		return yymm;
	}

	/**
	 * @param yymm the yymm to set
	 */
	public void setYymm(String yymm) {
		this.yymm = yymm;
	}

	/**
	 * @return the receipt_seq
	 */
	public String getReceipt_seq() {
		return receipt_seq;
	}

	/**
	 * @param receipt_seq the receipt_seq to set
	 */
	public void setReceipt_seq(String receipt_seq) {
		this.receipt_seq = receipt_seq;
	}

	/**
	 * @return the upId
	 */
	public String getUpId() {
		return upId;
	}

	/**
	 * @param upId the upId to set
	 */
	public void setUpId(String upId) {
		this.upId = upId;
	}

	/**
	 * @return the recpNo
	 */
	public String getRecpNo() {
		return recpNo;
	}

	/**
	 * @param recpNo the recpNo to set
	 */
	public void setRecpNo(String recpNo) {
		this.recpNo = recpNo;
	}

	/**
	 * @return the pgmNm
	 */
	public String getPgmNm() {
		return pgmNm;
	}

	/**
	 * @param pgmNm the pgmNm to set
	 */
	public void setPgmNm(String pgmNm) {
		this.pgmNm = pgmNm;
	}

	/**
	 * @return the issueDt
	 */
	public String getIssueDt() {
		return issueDt;
	}

	/**
	 * @param issueDt the issueDt to set
	 */
	public void setIssueDt(String issueDt) {
		this.issueDt = issueDt;
	}

	/**
	 * @return the cancelYn
	 */
	public String getCancelYn() {
		return cancelYn;
	}

	/**
	 * @param cancelYn the cancelYn to set
	 */
	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}

	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}

	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	 * @return the gbn
	 */
	public String getGbn() {
		return gbn;
	}

	/**
	 * @param gbn the gbn to set
	 */
	public void setGbn(String gbn) {
		this.gbn = gbn;
	}

	public String getReq_tx() {
		return req_tx;
	}

	public void setReq_tx(String req_tx) {
		this.req_tx = req_tx;
	}

	public String getSale_date() {
		return sale_date;
	}

	public void setSale_date(String sale_date) {
		this.sale_date = sale_date;
	}

	public String getSequence_no() {
		return sequence_no;
	}

	public void setSequence_no(String sequence_no) {
		this.sequence_no = sequence_no;
	}

	public String getCredit_no() {
		return credit_no;
	}

	public void setCredit_no(String credit_no) {
		this.credit_no = credit_no;
	}

	public String getCredit_company_name() {
		return credit_company_name;
	}

	public void setCredit_company_name(String credit_company_name) {
		this.credit_company_name = credit_company_name;
	}

	public String getValidity_period() {
		return validity_period;
	}

	public void setValidity_period(String validity_period) {
		this.validity_period = validity_period;
	}

	public String getQuota_month() {
		return quota_month;
	}

	public void setQuota_month(String quota_month) {
		this.quota_month = quota_month;
	}

	public int getApproval_amt() {
		return approval_amt;
	}

	public void setApproval_amt(int approval_amt) {
		this.approval_amt = approval_amt;
	}

	public String getTrade_date() {
		return trade_date;
	}

	public void setTrade_date(String trade_date) {
		this.trade_date = trade_date;
	}

	public String getTrade_time() {
		return trade_time;
	}

	public void setTrade_time(String trade_time) {
		this.trade_time = trade_time;
	}

	public String getAgreement_no() {
		return agreement_no;
	}

	public void setAgreement_no(String agreement_no) {
		this.agreement_no = agreement_no;
	}

	public String getBuy_co_code() {
		return buy_co_code;
	}

	public void setBuy_co_code(String buy_co_code) {
		this.buy_co_code = buy_co_code;
	}

	public String getBuy_co_name() {
		return buy_co_name;
	}

	public void setBuy_co_name(String buy_co_name) {
		this.buy_co_name = buy_co_name;
	}

	public String getMerchant_id() {
		return merchant_id;
	}

	public void setMerchant_id(String merchant_id) {
		this.merchant_id = merchant_id;
	}

	public String getCredit_id() {
		return credit_id;
	}

	public void setCredit_id(String credit_id) {
		this.credit_id = credit_id;
	}

	public int getPos_no() {
		return pos_no;
	}

	public void setPos_no(int pos_no) {
		this.pos_no = pos_no;
	}

	public String getRecp_no() {
		return recp_no;
	}

	public void setRecp_no(String recp_no) {
		this.recp_no = recp_no;
	}

	public String getRet_status() {
		return ret_status;
	}

	public void setRet_status(String ret_status) {
		this.ret_status = ret_status;
	}

	public String getRet_message() {
		return ret_message;
	}

	public void setRet_message(String ret_message) {
		this.ret_message = ret_message;
	}

	public float getReceive_rate() {
		return receive_rate;
	}

	public void setReceive_rate(float receive_rate) {
		this.receive_rate = receive_rate;
	}

	public int getReceive_amt() {
		return receive_amt;
	}

	public void setReceive_amt(int receive_amt) {
		this.receive_amt = receive_amt;
	}

	public String getRefundRecpNo() {
		return refundRecpNo;
	}

	public void setRefundRecpNo(String refundRecpNo) {
		this.refundRecpNo = refundRecpNo;
	}
	
	public String getSt_tag() {
		return st_tag;
	}

	public void setSt_tag(String st_tag) {
		this.st_tag = st_tag;
	}

	public String getIn_seq() {
		return in_seq;
	}

	public void setIn_seq(String in_seq) {
		this.in_seq = in_seq;
	}

	public String getRecpseqno() {
		return recpseqno;
	}

	public void setRecpseqno(String recpseqno) {
		this.recpseqno = recpseqno;
	}

	public String getFg_cd() {
		return fg_cd;
	}

	public void setFg_cd(String fg_cd) {
		this.fg_cd = fg_cd;
	}

	public String getCard_amt() {
		return card_amt;
	}

	public void setCard_amt(String card_amt) {
		this.card_amt = card_amt;
	}

	public String getRepay_seq() {
		return repay_seq;
	}

	public void setRepay_seq(String repay_seq) {
		this.repay_seq = repay_seq;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
