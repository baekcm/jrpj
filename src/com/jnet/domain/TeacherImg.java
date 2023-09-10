package com.jnet.domain;

import java.util.ArrayList;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;


public class TeacherImg extends Teacher {
	private static final long serialVersionUID = 1L;
	//프로그램 - 대표이미지 파일객체
	private MultipartFile teacherImg;
	//프로그램 대표이미지번호
	private int imgSeq;
	
	private ArrayList<TeacherImg> fileList;
	
	public ArrayList<TeacherImg> getFileList() {
		return fileList;
	}
	public void setFileList(ArrayList<TeacherImg> fileList) {
		this.fileList = fileList;
	}
	public MultipartFile getTeacherImg() {
		return teacherImg;
	}
	public void setTeacherImg(MultipartFile teacherImg) {
		this.teacherImg = teacherImg;
	}
	public int getImgSeq() {
		return imgSeq;
	}
	public void setImgSeq(int imgSeq) {
		this.imgSeq = imgSeq;
	}
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
