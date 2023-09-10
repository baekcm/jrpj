package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;


public class Cts extends Menu {
	private static final long serialVersionUID = 1L;
	//컨텐츠 번호
	private Integer ctsSeq;
	//컨텐츠내용
	private String contents;
	
	public Integer getCtsSeq() {
		return ctsSeq;
	}
	public void setCtsSeq(Integer ctsSeq) {
		this.ctsSeq = ctsSeq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
