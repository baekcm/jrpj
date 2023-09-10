package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;


public class Bbs extends Menu {
	
	private static final long serialVersionUID = 1L;
	//게시판번호
	private Integer boardSeq;
	//게시판명
	private String boardNm;
	//게시판설명
	private String boardExplain;
	//게시판종류
	private String boardType;
	//회원전용여부
	private String memberYn;
	//오늘 게시물 수
	private int todayCnt;
	//총 게시물 수
	private int totalCnt;
	//게시판 URL 생성유무
	private String urlUseYn;
	//사업장 카테고리 사용유무
	private String catCdYn;
	//프로그램 카테고리 사용유무
	private String pgmCatCdYn;
	
	public String getPgmCatCdYn() {
		return pgmCatCdYn;
	}
	public void setPgmCatCdYn(String pgmCatCdYn) {
		this.pgmCatCdYn = pgmCatCdYn;
	}
	public String getUrlUseYn() {
		return urlUseYn;
	}
	public void setUrlUseYn(String urlUseYn) {
		this.urlUseYn = urlUseYn;
	}
	public String getCatCdYn() {
		return catCdYn;
	}
	public void setCatCdYn(String catCdYn) {
		this.catCdYn = catCdYn;
	}
	public int getTodayCnt() {
		return todayCnt;
	}
	public void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public Integer getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(Integer boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getBoardNm() {
		return boardNm;
	}
	public void setBoardNm(String boardNm) {
		this.boardNm = boardNm;
	}
	public String getBoardExplain() {
		return boardExplain;
	}
	public void setBoardExplain(String boardExplain) {
		this.boardExplain = boardExplain;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getMemberYn() {
		return memberYn;
	}
	public void setMemberYn(String memberYn) {
		this.memberYn = memberYn;
	}
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
