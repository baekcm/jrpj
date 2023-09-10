package com.jnet.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;


public class PgmImg extends Pgm {
	private static final long serialVersionUID = 1L;
	//프로그램 - 대표이미지 파일객체
	private MultipartFile delegateImg;
	//프로그램 대표이미지번호
	private int pgmImgSeq;
	//프로그램 대표이미지 경로
	private String imgPath;
	//프로그램 대표이미지 원본파일명
	private String orgnlFileNm;
	//프로그램 대표이미지 실제파일명
	private String realFileNm;
	//프로그램 대표이미지 썸네일유무
	private String thumbYn;
	//프로그램 대표이미지 사이즈
	private Long fileSize;
	
	public MultipartFile getDelegateImg() {
		return delegateImg;
	}
	public void setDelegateImg(MultipartFile delegateImg) {
		this.delegateImg = delegateImg;
	}
	public int getPgmImgSeq() {
		return pgmImgSeq;
	}
	public void setPgmImgSeq(int pgmImgSeq) {
		this.pgmImgSeq = pgmImgSeq;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getOrgnlFileNm() {
		return orgnlFileNm;
	}
	public void setOrgnlFileNm(String orgnlFileNm) {
		this.orgnlFileNm = orgnlFileNm;
	}
	public String getRealFileNm() {
		return realFileNm;
	}
	public void setRealFileNm(String realFileNm) {
		this.realFileNm = realFileNm;
	}
	public String getThumbYn() {
		return thumbYn;
	}
	public void setThumbYn(String thumbYn) {
		this.thumbYn = thumbYn;
	}
	public Long getFileSize() {
		return fileSize;
	}
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
