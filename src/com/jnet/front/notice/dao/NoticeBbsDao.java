package com.jnet.front.notice.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
 
public interface NoticeBbsDao {
	
	/**
	 * 게시판 목록 카운트
	 * 
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException 
	 */
	public abstract int noticeListTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판 목록 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticeList(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticeView(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 이전 글
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticePrev(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 다음 글
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> noticeNext(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 공통코드 목록조회
	 * 
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listCommonCode(Common commonParam) throws SQLException;
	
	/**
	 * 게시판 등록글 조회수
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateHitCount(BbsFileReply bbsParam) throws SQLException;

}