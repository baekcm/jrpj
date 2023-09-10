package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class APoll extends QPoll{
	private static final long serialVersionUID = 1L;
	/**
	 * 설문 페이지 = 링크 번호
	 */
	private int applicationGbnCd;
	
	/**
	 * 답변번호
	 */
	private int aSeq;
	/**
	 * 주관식 답변
	 */
	private String aShortAnswer;
	private String[] aShortAnswerArr;
	
	/**
	 * 기타문항 답변
	 */
	private String aEtc;
	private String[] aEtcArr;
	
	
	


	public String[] getaEtcArr() {
		return aEtcArr;
	}



	public void setaEtcArr(String[] aEtcArr) {
		this.aEtcArr = aEtcArr;
	}



	public int getApplicationGbnCd() {
		return applicationGbnCd;
	}



	public void setApplicationGbnCd(int applicationGbnCd) {
		this.applicationGbnCd = applicationGbnCd;
	}



	public int getaSeq() {
		return aSeq;
	}



	public void setaSeq(int aSeq) {
		this.aSeq = aSeq;
	}

	public String getaShortAnswer() {
		return aShortAnswer;
	}



	public void setaShortAnswer(String aShortAnswer) {
		this.aShortAnswer = aShortAnswer;
	}



	public String[] getaShortAnswerArr() {
		return aShortAnswerArr;
	}



	public void setaShortAnswerArr(String[] aShortAnswerArr) {
		this.aShortAnswerArr = aShortAnswerArr;
	}



	public String getaEtc() {
		return aEtc;
	}



	public void setaEtc(String aEtc) {
		this.aEtc = aEtc;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
