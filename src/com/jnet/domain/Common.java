package com.jnet.domain;

import java.util.ArrayList;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class Common {
	
	private String sty;
	private String stm;
	private String stYmd;
	private String edYmd;
	private String logYmd;
	private String flag;
	private int numperPage;
	private int currentPage;
	private int showPage;
	//top�뿉�꽌 �쁽�옱�럹�씠吏� * �럹�씠吏��떦 媛��닔
	private int curPerPageNum = 0;
	//gnb menu seq
	private int gseq;
	//lnb select seq
	private int lseq;
	//tab1 select seq
	private int t1;
	//tab2 select seq
	private int t2;
	private String slctFacilId;
	private String saleId;
	private String[] saleIdArr;
	private String pgmGbnCd;
	private String[] pgmGbnCdArr;
	//�궗�뾽�옣 寃��깋媛�
	private String searchFacil;
	
	//愿�由ъ옄 愿�由� - 硫붾돱�꽑�깮�뿉 愿��젴�맂 �궗�뾽�옣紐�
	//�깮�꽦�뿰�썡�씪
	private String createYmd;
	
	//�깮�꽦�떆遺꾩큹
	private String createHms;
	
	//�깮�꽦�븘�씠�뵒
	private String createId;
	
	//�깮�꽦�옄�씠由�
	private String createNm;
	
	//�깮�꽦�븘�씠�뵾
	private String createIp;
	
	//�닔�젙�뿰�썡�씪
	private String modiYmd;
	
	//�닔�젙�떆遺꾩큹
	private String modiHms;
	
	//�닔�젙�븘�씠�뵒
	private String modiId;
	
	//�닔�젙�옄�씠由�
	private String modiNm;
	
	//�닔�젙�븘�씠�뵾
	private String modiIp;
	
	//�궘�젣�쑀臾�
	private String rmYn;
	private String[] rmYnArr;
	
	//�럹�씠吏�踰덊샇
	private String pageNum;
	
	//由ъ뒪�듃踰덊샇
	private int listNo;
	
	//�떆�옉踰덊샇
	private int start;
	
	//醫낅즺踰덊샇
	private int end;
	
	//寃��깋�궎�썙�뱶
	private String searchKey;
	
	//寃��깋媛�
	private String searchVal;
	
	//愿�由ъ옄 寃��깋 �젅踰�
	private String searchLvl;
	
	//怨듯넻肄붾뱶媛�
	private String codeId;
	private String leftCodeId;
	private String leftCodeNm;
	private String middleCodeId;
	private String middleCodeNm;
	private String rightCodeId;
	private String rightCodeNm;
	//誘쇱썝�넻怨꾩퐫�뱶�닔
	private int cnt;
	//怨듯넻肄붾뱶紐�
	private String codeNm;
	//怨듯넻肄붾뱶援щ텇
	private String codeGbnCd;
	//怨듯넻肄붾뱶踰덊샇(�떆���뒪)
	private String commCodeSeq;
	
	//�뙘�뾽二쇱냼媛믪쓣 �쟾�떖諛쏄린 �쐞�븳 蹂��닔
	private String zip1;
	private String zip2;
	private String addr;
	
	private ArrayList<String> slctFacilIdList;
	private ArrayList<String> saleIdList;
	private ArrayList<String> commCodeSeqList;
	
	private int allMemCnt;
	private int todayMemCnt;
	private int allMinwonCnt;
	private int todayMinwonCnt;
	private String todayYmd;
	
	private String memYear;
	private String memMonth;
	private String memDay;
	private String siteYear;
	private String siteMonth;
	private String siteDay;
	private String memAge;
	private String memSex;
	private int memCnt;
	private Integer logSeq;
	private String logUrl;
	
	//�삤�뒛 援щ텇 肄붾뱶
	private String dateGbnCd;

	public String getSiteYear() {
		return siteYear;
	}
	public void setSiteYear(String siteYear) {
		this.siteYear = siteYear;
	}
	public String getSty() {
		return sty;
	}
	public void setSty(String sty) {
		this.sty = sty;
	}
	public String getStm() {
		return stm;
	}
	public void setStm(String stm) {
		this.stm = stm;
	}
	public String getLogYmd() {
		return logYmd;
	}
	public void setLogYmd(String logYmd) {
		this.logYmd = logYmd;
	}
	public String getStYmd() {
		return stYmd;
	}
	public void setStYmd(String stYmd) {
		this.stYmd = stYmd;
	}
	public String getEdYmd() {
		return edYmd;
	}
	public void setEdYmd(String edYmd) {
		this.edYmd = edYmd;
	}
	public String getMemYear() {
		return memYear;
	}
	public void setMemYear(String memYear) {
		this.memYear = memYear;
	}
	public String getLeftCodeId() {
		return leftCodeId;
	}
	public void setLeftCodeId(String leftCodeId) {
		this.leftCodeId = leftCodeId;
	}
	public String getLeftCodeNm() {
		return leftCodeNm;
	}
	public void setLeftCodeNm(String leftCodeNm) {
		this.leftCodeNm = leftCodeNm;
	}
	public String getMiddleCodeId() {
		return middleCodeId;
	}
	public void setMiddleCodeId(String middleCodeId) {
		this.middleCodeId = middleCodeId;
	}
	public String getMiddleCodeNm() {
		return middleCodeNm;
	}
	public void setMiddleCodeNm(String middleCodeNm) {
		this.middleCodeNm = middleCodeNm;
	}
	public String getRightCodeId() {
		return rightCodeId;
	}
	public void setRightCodeId(String rightCodeId) {
		this.rightCodeId = rightCodeId;
	}
	public String getRightCodeNm() {
		return rightCodeNm;
	}
	public void setRightCodeNm(String rightCodeNm) {
		this.rightCodeNm = rightCodeNm;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getSearchFacil() {
		return searchFacil;
	}
	public void setSearchFacil(String searchFacil) {
		this.searchFacil = searchFacil;
	}
	public String getDateGbnCd() {
		return dateGbnCd;
	}
	public void setDateGbnCd(String dateGbnCd) {
		this.dateGbnCd = dateGbnCd;
	}
	public int getShowPage() {
		return showPage;
	}
	public void setShowPage(int showPage) {
		this.showPage = showPage;
	}
	public String getMemAge() {
		return memAge;
	}
	public void setMemAge(String memAge) {
		this.memAge = memAge;
	}
	public String getMemSex() {
		return memSex;
	}
	public void setMemSex(String memSex) {
		this.memSex = memSex;
	}
	public String getLogUrl() {
		return logUrl;
	}
	public void setLogUrl(String logUrl) {
		this.logUrl = logUrl;
	}
	public Integer getLogSeq() {
		return logSeq;
	}
	public void setLogSeq(Integer logSeq) {
		this.logSeq = logSeq;
	}
	public String getSiteMonth() {
		return siteMonth;
	}
	public void setSiteMonth(String siteMonth) {
		this.siteMonth = siteMonth;
	}
	public String getSiteDay() {
		return siteDay;
	}
	public void setSiteDay(String siteDay) {
		this.siteDay = siteDay;
	}
	public String getMemDay() {
		return memDay;
	}
	public void setMemDay(String memDay) {
		this.memDay = memDay;
	}
	public String getMemMonth() {
		return memMonth;
	}
	public void setMemMonth(String memMonth) {
		this.memMonth = memMonth;
	}
	public int getMemCnt() {
		return memCnt;
	}
	public void setMemCnt(int memCnt) {
		this.memCnt = memCnt;
	}
	public int getAllMemCnt() {
		return allMemCnt;
	}
	public void setAllMemCnt(int allMemCnt) {
		this.allMemCnt = allMemCnt;
	}
	public int getTodayMemCnt() {
		return todayMemCnt;
	}
	public void setTodayMemCnt(int todayMemCnt) {
		this.todayMemCnt = todayMemCnt;
	}
	public int getAllMinwonCnt() {
		return allMinwonCnt;
	}
	public void setAllMinwonCnt(int allMinwonCnt) {
		this.allMinwonCnt = allMinwonCnt;
	}
	public int getTodayMinwonCnt() {
		return todayMinwonCnt;
	}
	public void setTodayMinwonCnt(int todayMinwonCnt) {
		this.todayMinwonCnt = todayMinwonCnt;
	}
	public String getTodayYmd() {
		return todayYmd;
	}
	public void setTodayYmd(String todayYmd) {
		this.todayYmd = todayYmd;
	}
	public ArrayList<String> getCommCodeSeqList() {
		return commCodeSeqList;
	}
	public void setCommCodeSeqList(ArrayList<String> commCodeSeqList) {
		this.commCodeSeqList = commCodeSeqList;
	}

	public int getNumperPage() {
		return numperPage;
	}
	public void setNumperPage(int numperPage) {
		this.numperPage = numperPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public ArrayList<String> getSlctFacilIdList() {
		return slctFacilIdList;
	}
	public void setSlctFacilIdList(ArrayList<String> slctFacilIdList) {
		this.slctFacilIdList = slctFacilIdList;
	}
	public ArrayList<String> getSaleIdList() {
		return saleIdList;
	}
	public void setSaleIdList(ArrayList<String> saleIdList) {
		this.saleIdList = saleIdList;
	}
	public String[] getSaleIdArr() {
		return saleIdArr;
	}
	public void setSaleIdArr(String[] saleIdArr) {
		this.saleIdArr = saleIdArr;
	}
	public String[] getPgmGbnCdArr() {
		return pgmGbnCdArr;
	}
	public void setPgmGbnCdArr(String[] pgmGbnCdArr) {
		this.pgmGbnCdArr = pgmGbnCdArr;
	}
	public String getSaleId() {
		return saleId;
	}
	public void setSaleId(String saleId) {
		this.saleId = saleId;
	}
	public String getPgmGbnCd() {
		return pgmGbnCd;
	}
	public void setPgmGbnCd(String pgmGbnCd) {
		this.pgmGbnCd = pgmGbnCd;
	}
	public String getZip1() {
		return zip1;
	}
	public void setZip1(String zip1) {
		this.zip1 = zip1;
	}
	public String getZip2() {
		return zip2;
	}
	public void setZip2(String zip2) {
		this.zip2 = zip2;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String[] getRmYnArr() {
		return rmYnArr;
	}
	public void setRmYnArr(String[] rmYnArr) {
		this.rmYnArr = rmYnArr;
	}
	public String getSlctFacilId() {
		return slctFacilId;
	}
	public void setSlctFacilId(String slctFacilId) {
		this.slctFacilId = slctFacilId;
	}
	public int getT1() {
		return t1;
	}

	public void setT1(int t1) {
		this.t1 = t1;
	}

	public int getT2() {
		return t2;
	}

	public void setT2(int t2) {
		this.t2 = t2;
	}

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public String getCodeGbnCd() {
		return codeGbnCd;
	}

	public void setCodeGbnCd(String codeGbnCd) {
		this.codeGbnCd = codeGbnCd;
	}

	public String getCommCodeSeq() {
		return commCodeSeq;
	}

	public void setCommCodeSeq(String commCodeSeq) {
		this.commCodeSeq = commCodeSeq;
	}

	public String getSearchLvl() {
		return searchLvl;
	}

	public void setSearchLvl(String searchLvl) {
		this.searchLvl = searchLvl;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public int getLseq() {
		return lseq;
	}

	public void setLseq(int lseq) {
		this.lseq = lseq;
	}

	public int getGseq() {
		return gseq;
	}

	public void setGseq(int gseq) {
		this.gseq = gseq;
	}

	public String getModiNm() {
		return modiNm;
	}

	public void setModiNm(String modiNm) {
		this.modiNm = modiNm;
	}

	public String getCreateNm() {
		return createNm;
	}

	public void setCreateNm(String createNm) {
		this.createNm = createNm;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getCreateYmd() {
		return createYmd;
	}

	public void setCreateYmd(String createYmd) {
		this.createYmd = createYmd;
	}

	public String getCreateHms() {
		return createHms;
	}

	public void setCreateHms(String createHms) {
		this.createHms = createHms;
	}

	public String getCreateId() {
		return createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}

	public String getCreateIp() {
		return createIp;
	}

	public void setCreateIp(String createIp) {
		this.createIp = createIp;
	}

	public String getModiYmd() {
		return modiYmd;
	}

	public void setModiYmd(String modiYmd) {
		this.modiYmd = modiYmd;
	}

	public String getModiHms() {
		return modiHms;
	}

	public void setModiHms(String modiHms) {
		this.modiHms = modiHms;
	}

	public String getModiId() {
		return modiId;
	}

	public void setModiId(String modiId) {
		this.modiId = modiId;
	}

	public String getModiIp() {
		return modiIp;
	}

	public void setModiIp(String modiIp) {
		this.modiIp = modiIp;
	}

	public String getRmYn() {
		return rmYn;
	}

	public void setRmYn(String rmYn) {
		this.rmYn = rmYn;
	}
	public int getCurPerPageNum() {
		return curPerPageNum;
	}
	public void setCurPerPageNum(int curPerPageNum) {
		this.curPerPageNum = curPerPageNum;
	}
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
