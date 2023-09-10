package com.jnet.domain;

import java.util.ArrayList;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;



public class Teacher extends PgmImg {
	private static final long serialVersionUID = 1L;
	//프로그램 - 강사 번호
	private Integer pgmTeacherSeq;
	//강사번호
	private Integer teacherSeq;
	//강사배열번호
	private Integer[] teacherSeqArr;
	//강사번호 리스트
	private ArrayList<String> teacherSeqList;
	//강사이름
	private String teacherNm;
	//강사내역
	private String teacherHistory;
	
	//강사연락처1
	private String teacherPhone1;
	//강사연락처2
	private String teacherPhone2;
	//강사연락처3
	private String teacherPhone3;
	//강사메일1
	private String teacherEmail1;
	//강사메일2
	private String teacherEmail2;
	//강사기본주소
	private String teacherDftAddr;
	//강사상세주소
	private String teacherDtlAddr;
	
	//강사 우편1
	private String zipcode1;
	//강사 우편2
	private String zipcode2;
	
	public ArrayList<String> getTeacherSeqList() {
		return teacherSeqList;
	}
	public void setTeacherSeqList(ArrayList<String> teacherSeqList) {
		this.teacherSeqList = teacherSeqList;
	}
	public Integer getPgmTeacherSeq() {
		return pgmTeacherSeq;
	}
	public void setPgmTeacherSeq(Integer pgmTeacherSeq) {
		this.pgmTeacherSeq = pgmTeacherSeq;
	}
	public Integer getTeacherSeq() {
		return teacherSeq;
	}
	public void setTeacherSeq(Integer teacherSeq) {
		this.teacherSeq = teacherSeq;
	}
	public Integer[] getTeacherSeqArr() {
		return teacherSeqArr;
	}
	public void setTeacherSeqArr(Integer[] teacherSeqArr) {
		this.teacherSeqArr = teacherSeqArr;
	}
	public String getTeacherNm() {
		return teacherNm;
	}
	public void setTeacherNm(String teacherNm) {
		this.teacherNm = teacherNm;
	}
	public String getTeacherHistory() {
		return teacherHistory;
	}
	public void setTeacherHistory(String teacherHistory) {
		this.teacherHistory = teacherHistory;
	}
	public String getTeacherPhone1() {
		return teacherPhone1;
	}
	public void setTeacherPhone1(String teacherPhone1) {
		this.teacherPhone1 = teacherPhone1;
	}
	public String getTeacherPhone2() {
		return teacherPhone2;
	}
	public void setTeacherPhone2(String teacherPhone2) {
		this.teacherPhone2 = teacherPhone2;
	}
	public String getTeacherPhone3() {
		return teacherPhone3;
	}
	public void setTeacherPhone3(String teacherPhone3) {
		this.teacherPhone3 = teacherPhone3;
	}
	public String getTeacherEmail1() {
		return teacherEmail1;
	}
	public void setTeacherEmail1(String teacherEmail1) {
		this.teacherEmail1 = teacherEmail1;
	}
	public String getTeacherEmail2() {
		return teacherEmail2;
	}
	public void setTeacherEmail2(String teacherEmail2) {
		this.teacherEmail2 = teacherEmail2;
	}
	public String getTeacherDftAddr() {
		return teacherDftAddr;
	}
	public void setTeacherDftAddr(String teacherDftAddr) {
		this.teacherDftAddr = teacherDftAddr;
	}
	public String getTeacherDtlAddr() {
		return teacherDtlAddr;
	}
	public void setTeacherDtlAddr(String teacherDtlAddr) {
		this.teacherDtlAddr = teacherDtlAddr;
	}
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
