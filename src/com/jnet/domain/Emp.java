package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class Emp extends Admin {
	
	//엑셀배치파일
	private MultipartFile batchFile;
	//직원번호
	private Integer empSeq;
	private Integer[] empSeqArr;
	//직원명
	private String empNm;
	//직위
	private String empPosition;
	//직무
	private String empJob;
	//퇴직유무
	private String empOutYn;
	//이메일1
	private String empEmail1;
	//이메일2
	private String empEmail2;
	//전화번호1
	private String empPhone1;
	//전화번호2
	private String empPhone2;
	//전화번호3
	private String empPhone3;
	//모바일1
	private String empMobile1;
	//모바일2
	private String empMobile2;
	//모바일3
	private String empMobile3;
	//부서명
	private String empDept;
	//파트명
	private String empPart;
	//사번
	private String empNo;
	//부서별정렬순서
	private int empOrder;
	
	//top에서 현재페이지 * 페이지당 갯수
	private int curPerPageNum = 0;
	
	public Integer[] getEmpSeqArr() {
		return empSeqArr;
	}
	public void setEmpSeqArr(Integer[] empSeqArr) {
		this.empSeqArr = empSeqArr;
	}
	public int getEmpOrder() {
		return empOrder;
	}
	public void setEmpOrder(int empOrder) {
		this.empOrder = empOrder;
	}
	public MultipartFile getBatchFile() {
		return batchFile;
	}
	public void setBatchFile(MultipartFile batchFile) {
		this.batchFile = batchFile;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	public Integer getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(Integer empSeq) {
		this.empSeq = empSeq;
	}
	public String getEmpPosition() {
		return empPosition;
	}
	public void setEmpPosition(String empPosition) {
		this.empPosition = empPosition;
	}
	public String getEmpJob() {
		return empJob;
	}
	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}
	public String getEmpOutYn() {
		return empOutYn;
	}
	public void setEmpOutYn(String empOutYn) {
		this.empOutYn = empOutYn;
	}
	public String getEmpEmail1() {
		return empEmail1;
	}
	public void setEmpEmail1(String empEmail1) {
		this.empEmail1 = empEmail1;
	}
	public String getEmpEmail2() {
		return empEmail2;
	}
	public void setEmpEmail2(String empEmail2) {
		this.empEmail2 = empEmail2;
	}
	public String getEmpPhone1() {
		return empPhone1;
	}
	public void setEmpPhone1(String empPhone1) {
		this.empPhone1 = empPhone1;
	}
	public String getEmpPhone2() {
		return empPhone2;
	}
	public void setEmpPhone2(String empPhone2) {
		this.empPhone2 = empPhone2;
	}
	public String getEmpPhone3() {
		return empPhone3;
	}
	public void setEmpPhone3(String empPhone3) {
		this.empPhone3 = empPhone3;
	}
	public String getEmpMobile1() {
		return empMobile1;
	}
	public void setEmpMobile1(String empMobile1) {
		this.empMobile1 = empMobile1;
	}
	public String getEmpMobile2() {
		return empMobile2;
	}
	public void setEmpMobile2(String empMobile2) {
		this.empMobile2 = empMobile2;
	}
	public String getEmpMobile3() {
		return empMobile3;
	}
	public void setEmpMobile3(String empMobile3) {
		this.empMobile3 = empMobile3;
	}
	public String getEmpDept() {
		return empDept;
	}
	public void setEmpDept(String empDept) {
		this.empDept = empDept;
	}
	public String getEmpPart() {
		return empPart;
	}
	public void setEmpPart(String empPart) {
		this.empPart = empPart;
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
