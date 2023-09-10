package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;


public class OutPgm extends Menu {
	private static final long serialVersionUID = 1L;
	private String basCd;
	private String timeCd;
	private String upId;
	private String basId;
	private String yymm;
	private String yymmdd;
	//강좌코드
	private String pgmCd;
	//종목명
	private String comNm1;
	private String comNm2;
	private String comNm3;
	private String comNm4;
	private String comNm5;
	//종목코드
	private String comCd1;
	private String comCd2;
	private String comCd3;
	private String comCd4;
	private String comCd5;
	//강좌명
	private String pgmNm;
	//요일
	private String dtWeekCd;
	//금액
	private String uPrice;
	
	private String startT;
	private String endT;
	private String saleComCd;
	private String onlineYn;
	private String targetCd;
	
	private String offlineAcceptCnt;
	private String onlineAcceptCnt;
	
	private String pgmFileImg;
	
	private String memNo;
	private String issueDt;
	private int amt;
	private String cardNm;
	private String tno;
	private String state;
	private int cnt;
	private String cancelYn;
	private String tag;
	private String memNm;
	private String recpNo;
	private String prt;
	private String tradeYmd;
	private String tradeHms;
	private String reason;
	private String fEnterDt;
	
	
	public String getComNm5() {
		return comNm5;
	}
	public void setComNm5(String comNm5) {
		this.comNm5 = comNm5;
	}
	public String getComCd5() {
		return comCd5;
	}
	public void setComCd5(String comCd5) {
		this.comCd5 = comCd5;
	}
	public String getfEnterDt() {
		return fEnterDt;
	}
	public void setfEnterDt(String fEnterDt) {
		this.fEnterDt = fEnterDt;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getTradeYmd() {
		return tradeYmd;
	}
	public void setTradeYmd(String tradeYmd) {
		this.tradeYmd = tradeYmd;
	}
	public String getTradeHms() {
		return tradeHms;
	}
	public void setTradeHms(String tradeHms) {
		this.tradeHms = tradeHms;
	}
	public String getPrt() {
		return prt;
	}
	public void setPrt(String prt) {
		this.prt = prt;
	}
	public String getRecpNo() {
		return recpNo;
	}
	public void setRecpNo(String recpNo) {
		this.recpNo = recpNo;
	}
	public String getYymmdd() {
		return yymmdd;
	}
	public void setYymmdd(String yymmdd) {
		this.yymmdd = yymmdd;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getIssueDt() {
		return issueDt;
	}
	public void setIssueDt(String issueDt) {
		this.issueDt = issueDt;
	}
	public int getAmt() {
		return amt;
	}
	public void setAmt(int amt) {
		this.amt = amt;
	}
	public String getCardNm() {
		return cardNm;
	}
	public void setCardNm(String cardNm) {
		this.cardNm = cardNm;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getCancelYn() {
		return cancelYn;
	}
	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getPgmFileImg() {
		return pgmFileImg;
	}
	public void setPgmFileImg(String pgmFileImg) {
		this.pgmFileImg = pgmFileImg;
	}
	
	public String getComCd1() {
		return comCd1;
	}
	public void setComCd1(String comCd1) {
		this.comCd1 = comCd1;
	}
	public String getComCd2() {
		return comCd2;
	}
	public void setComCd2(String comCd2) {
		this.comCd2 = comCd2;
	}
	public String getComCd3() {
		return comCd3;
	}
	public void setComCd3(String comCd3) {
		this.comCd3 = comCd3;
	}
	public String getComCd4() {
		return comCd4;
	}
	public void setComCd4(String comCd4) {
		this.comCd4 = comCd4;
	}
	public String getBasId() {
		return basId;
	}
	public void setBasId(String basId) {
		this.basId = basId;
	}
	public String getComNm4() {
		return comNm4;
	}
	public void setComNm4(String comNm4) {
		this.comNm4 = comNm4;
	}
	public String getStartT() {
		return startT;
	}
	public void setStartT(String startT) {
		this.startT = startT;
	}
	public String getEndT() {
		return endT;
	}
	public void setEndT(String endT) {
		this.endT = endT;
	}
	public String getSaleComCd() {
		return saleComCd;
	}
	public void setSaleComCd(String saleComCd) {
		this.saleComCd = saleComCd;
	}
	public String getOnlineYn() {
		return onlineYn;
	}
	public void setOnlineYn(String onlineYn) {
		this.onlineYn = onlineYn;
	}
	public String getTargetCd() {
		return targetCd;
	}
	public void setTargetCd(String targetCd) {
		this.targetCd = targetCd;
	}
	public String getOfflineAcceptCnt() {
		return offlineAcceptCnt;
	}
	public void setOfflineAcceptCnt(String offlineAcceptCnt) {
		this.offlineAcceptCnt = offlineAcceptCnt;
	}
	public String getOnlineAcceptCnt() {
		return onlineAcceptCnt;
	}
	public void setOnlineAcceptCnt(String onlineAcceptCnt) {
		this.onlineAcceptCnt = onlineAcceptCnt;
	}
	public String getPgmCd() {
		return pgmCd;
	}
	public void setPgmCd(String pgmCd) {
		this.pgmCd = pgmCd;
	}
	public String getComNm1() {
		return comNm1;
	}
	public void setComNm1(String comNm1) {
		this.comNm1 = comNm1;
	}
	public String getComNm2() {
		return comNm2;
	}
	public void setComNm2(String comNm2) {
		this.comNm2 = comNm2;
	}
	public String getComNm3() {
		return comNm3;
	}
	public void setComNm3(String comNm3) {
		this.comNm3 = comNm3;
	}
	public String getPgmNm() {
		return pgmNm;
	}
	public void setPgmNm(String pgmNm) {
		this.pgmNm = pgmNm;
	}
	public String getDtWeekCd() {
		return dtWeekCd;
	}
	public void setDtWeekCd(String dtWeekCd) {
		this.dtWeekCd = dtWeekCd;
	}
	public String getuPrice() {
		return uPrice;
	}
	public void setuPrice(String uPrice) {
		this.uPrice = uPrice;
	}
	public String getBasCd() {
		return basCd;
	}
	public void setBasCd(String basCd) {
		this.basCd = basCd;
	}
	public String getTimeCd() {
		return timeCd;
	}
	public void setTimeCd(String timeCd) {
		this.timeCd = timeCd;
	}
	public String getUpId() {
		return upId;
	}
	public void setUpId(String upId) {
		this.upId = upId;
	}
	public String getYymm() {
		return yymm;
	}
	public void setYymm(String yymm) {
		this.yymm = yymm;
	}
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
