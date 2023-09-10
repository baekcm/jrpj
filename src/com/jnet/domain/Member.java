package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;


public class Member extends BbsFileReply {
	private static final long serialVersionUID = 1L;
	private Integer memSeq;
	private String memNo;
	private String adult;
	private Integer userSeq;
	private String userId;
	private String userNm;
	private String userPw;
	private String userDi;
	private String userCi;
	private String birthday;
	private String sex;
	private String[] memEmailArr;
	private String email;
	private String emailTitle;
	private String emailContent;
	private String emailYn;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String sms;
	private String zipcode;
	private String zipcode1;
	private String zipcode2;
	private String addr;
	private String addr2;
	private String poll;
	private String location;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String compZip;
	private String compZip1;
	private String compZip2;
	private String compAddr;
	private String compAddr2;
	private String userOut;
	private String signYmd;
	private String signHms;
	private String modiYmd;
	private String modiHms;
	private String modiIp;
	private String outDesc;
	private String vNumber;
	private String userNo;
	private Integer visitCnt;
	private String loginYmd;
	private String loginHms;
	private String loginIp;
	private Integer boardCnt;
	private Integer replyCnt;
	
	public String getEmailTitle() {
		return emailTitle;
	}

	public void setEmailTitle(String emailTitle) {
		this.emailTitle = emailTitle;
	}

	public String getEmailContent() {
		return emailContent;
	}

	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
	}

	public String[] getMemEmailArr() {
		return memEmailArr;
	}

	public void setMemEmailArr(String[] memEmailArr) {
		this.memEmailArr = memEmailArr;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getCompAddr2() {
		return compAddr2;
	}

	public void setCompAddr2(String compAddr2) {
		this.compAddr2 = compAddr2;
	}

	public Integer getBoardCnt() {
		return boardCnt;
	}

	public void setBoardCnt(Integer boardCnt) {
		this.boardCnt = boardCnt;
	}

	public Integer getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(Integer replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
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

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getCompZip1() {
		return compZip1;
	}

	public void setCompZip1(String compZip1) {
		this.compZip1 = compZip1;
	}

	public String getCompZip2() {
		return compZip2;
	}

	public void setCompZip2(String compZip2) {
		this.compZip2 = compZip2;
	}

	public Integer getVisitCnt() {
		return visitCnt;
	}

	public void setVisitCnt(Integer visitCnt) {
		this.visitCnt = visitCnt;
	}

	public String getLoginHms() {
		return loginHms;
	}

	public void setLoginHms(String loginHms) {
		this.loginHms = loginHms;
	}

	public String getLoginYmd() {
		return loginYmd;
	}

	public void setLoginYmd(String loginYmd) {
		this.loginYmd = loginYmd;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getvNumber() {
		return vNumber;
	}

	public void setvNumber(String vNumber) {
		this.vNumber = vNumber;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getOutDesc() {
		return outDesc;
	}

	public void setOutDesc(String outDesc) {
		this.outDesc = outDesc;
	}

	public Integer getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(Integer userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserDi() {
		return userDi;
	}

	public void setUserDi(String userDi) {
		this.userDi = userDi;
	}

	public String getUserCi() {
		return userCi;
	}

	public void setUserCi(String userCi) {
		this.userCi = userCi;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailYn() {
		return emailYn;
	}

	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSms() {
		return sms;
	}

	public void setSms(String sms) {
		this.sms = sms;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPoll() {
		return poll;
	}

	public void setPoll(String poll) {
		this.poll = poll;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAdult() {
		return adult;
	}

	public void setAdult(String adult) {
		this.adult = adult;
	}

	public Integer getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(Integer memSeq) {
		this.memSeq = memSeq;
	}

	public String getCompZip() {
		return compZip;
	}

	public void setCompZip(String compZip) {
		this.compZip = compZip;
	}

	public String getCompAddr() {
		return compAddr;
	}

	public void setCompAddr(String compAddr) {
		this.compAddr = compAddr;
	}

	public String getUserOut() {
		return userOut;
	}

	public void setUserOut(String userOut) {
		this.userOut = userOut;
	}

	public String getSignYmd() {
		return signYmd;
	}

	public void setSignYmd(String signYmd) {
		this.signYmd = signYmd;
	}

	public String getSignHms() {
		return signHms;
	}

	public void setSignHms(String signHms) {
		this.signHms = signHms;
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

	public String getModiIp() {
		return modiIp;
	}

	public void setModiIp(String modiIp) {
		this.modiIp = modiIp;
	}
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
}
