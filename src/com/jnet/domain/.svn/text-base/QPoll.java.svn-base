package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class QPoll extends ProblemPoll{
	private static final long serialVersionUID = 1L;	
	/**
	 * 문항번호
	 */
	private int qSeq;
	
	/**
	 * 번호별 타입 
	 * 0 : 선택형
	 * 1 : 선택형 - 기타
	 */
	private String qNoType;
	private String[] qNoTypeArr;
	
	/**
	 * 문답 내용
	 */
	private String qContent;
	private String[] qContentArr;
	
	public String[] getqNoTypeArr() {
		return qNoTypeArr;
	}
	public void setqNoTypeArr(String[] qNoTypeArr) {
		this.qNoTypeArr = qNoTypeArr;
	}
	public String[] getqContentArr() {
		return qContentArr;
	}
	public void setqContentArr(String[] qContentArr) {
		this.qContentArr = qContentArr;
	}
	public int getqSeq() {
		return qSeq;
	}
	public void setqSeq(int qSeq) {
		this.qSeq = qSeq;
	}
	public String getqNoType() {
		return qNoType;
	}
	public void setqNoType(String qNoType) {
		this.qNoType = qNoType;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
