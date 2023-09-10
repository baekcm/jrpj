package com.jnet.domain;

import java.util.ArrayList;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;


public class Popup extends Cts {
	private static final long serialVersionUID = 1L;
	private ArrayList<MultipartFile> popFileArr;
	private MultipartFile popFile;
	//팝업번호
	private int popSeq;
	//팝업번호 배열
	private int[] popSeqArr;
	//팝업저장경로
	private String filePath;
	//원본파일명
	private String orgnlFileNm;
	//저장파일명
	private String realFileNm;
	//링크URL
	private String linkUrl;
	//등록 링크URL배열
	private String[] linkUrlArr;
	//업데이트 링크URL배열
	private String[] ulinkUrlArr;
	//링크위치
	private String linkTgt;
	//링크위치배열
	private String[] linkTgtArr;
	//수정링크위치배열
	private String[] ulinkTgtArr;
	
	//팝업설명
	private String descript;
	//팝업등록설명배열
	private String[] descriptArr;
	//팝업수정설명배열
	private String[] udescriptArr;
	
	//썸네일구분
	private String thumbYn;
	//팝업구문코드(팝업 : POPUP , 배너 : BANNER)
	private String popGbnCd;
	
	//정렬순서
	private int ordinary;
	private int[] ordinaryArr;
	
	//한줄알리미
	private String[] titleArr;
	private String title;
	private String[] utitleArr;
	private String[] showYnArr;
	private String showYn;
	private int oneNotiSeq;
	private int[] oneNotiSeqArr;
	
	public int getOneNotiSeq() {
		return oneNotiSeq;
	}
	public void setOneNotiSeq(int oneNotiSeq) {
		this.oneNotiSeq = oneNotiSeq;
	}
	public int[] getOneNotiSeqArr() {
		return oneNotiSeqArr;
	}
	public void setOneNotiSeqArr(int[] oneNotiSeqArr) {
		this.oneNotiSeqArr = oneNotiSeqArr;
	}
	public String[] getTitleArr() {
		return titleArr;
	}
	public void setTitleArr(String[] titleArr) {
		this.titleArr = titleArr;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String[] getUtitleArr() {
		return utitleArr;
	}
	public void setUtitleArr(String[] utitleArr) {
		this.utitleArr = utitleArr;
	}
	public String[] getShowYnArr() {
		return showYnArr;
	}
	public void setShowYnArr(String[] showYnArr) {
		this.showYnArr = showYnArr;
	}
	public String getShowYn() {
		return showYn;
	}
	public void setShowYn(String showYn) {
		this.showYn = showYn;
	}
	public int getOrdinary() {
		return ordinary;
	}
	public void setOrdinary(int ordinary) {
		this.ordinary = ordinary;
	}
	public int[] getOrdinaryArr() {
		return ordinaryArr;
	}
	public void setOrdinaryArr(int[] ordinaryArr) {
		this.ordinaryArr = ordinaryArr;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String[] getDescriptArr() {
		return descriptArr;
	}
	public void setDescriptArr(String[] descriptArr) {
		this.descriptArr = descriptArr;
	}
	public String[] getUdescriptArr() {
		return udescriptArr;
	}
	public void setUdescriptArr(String[] udescriptArr) {
		this.udescriptArr = udescriptArr;
	}
	public String[] getUlinkTgtArr() {
		return ulinkTgtArr;
	}
	public void setUlinkTgtArr(String[] ulinkTgtArr) {
		this.ulinkTgtArr = ulinkTgtArr;
	}
	private ArrayList<Popup> listPopup;
	
	public String getLinkTgt() {
		return linkTgt;
	}
	public void setLinkTgt(String linkTgt) {
		this.linkTgt = linkTgt;
	}
	public String[] getLinkTgtArr() {
		return linkTgtArr;
	}
	public void setLinkTgtArr(String[] linkTgtArr) {
		this.linkTgtArr = linkTgtArr;
	}
	public int[] getPopSeqArr() {
		return popSeqArr;
	}
	public void setPopSeqArr(int[] popSeqArr) {
		this.popSeqArr = popSeqArr;
	}
	public String[] getUlinkUrlArr() {
		return ulinkUrlArr;
	}
	public void setUlinkUrlArr(String[] ulinkUrlArr) {
		this.ulinkUrlArr = ulinkUrlArr;
	}
	public void setPopSeq(Integer popSeq) {
		this.popSeq = popSeq;
	}
	public ArrayList<Popup> getListPopup() {
		return listPopup;
	}
	public void setListPopup(ArrayList<Popup> listPopup) {
		this.listPopup = listPopup;
	}
	public ArrayList<MultipartFile> getPopFileArr() {
		return popFileArr;
	}
	public void setPopFileArr(ArrayList<MultipartFile> popFileArr) {
		this.popFileArr = popFileArr;
	}
	public String[] getLinkUrlArr() {
		return linkUrlArr;
	}
	public void setLinkUrlArr(String[] linkUrlArr) {
		this.linkUrlArr = linkUrlArr;
	}
	public MultipartFile getPopFile() {
		return popFile;
	}
	public void setPopFile(MultipartFile popFile) {
		this.popFile = popFile;
	}
	public int getPopSeq() {
		return popSeq;
	}
	public void setPopSeq(int popSeq) {
		this.popSeq = popSeq;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getThumbYn() {
		return thumbYn;
	}
	public void setThumbYn(String thumbYn) {
		this.thumbYn = thumbYn;
	}
	public String getPopGbnCd() {
		return popGbnCd;
	}
	public void setPopGbnCd(String popGbnCd) {
		this.popGbnCd = popGbnCd;
	}
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
