package com.jnet.front.notice.service;
 
import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
    
public interface NoticeBbsService {
  
	/**
	 * 게시판 목록 카운트
	 * 
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int noticeListBbsTotCnt(BbsFileReply bbsParam) throws SQLException;
 
	/**
	 * 게시판 목록 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticeListBbs(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticeViewBbs(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 이전글
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticePrevBbs(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 다음글
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticeNextBbs(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 사업장 목록조회
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listFacil(Common commonParam) throws SQLException;
	
	/**
	 * 조회 카운트 증가
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateHitCount(BbsFileReply bbsParam) throws SQLException;

}