package com.jnet.front.community.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;

public interface CommunityBbsService {

	/**
	 * 게시판 목록 카운트
	 * 
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int communityListTotCnt(BbsFileReply bbsParam) throws SQLException;
 
	/**
	 * 게시판 목록 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> communityList(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> communityView(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 이전글
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> communityPrev(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 다음글
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> communityNext(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 사업장 목록조회
	 * @param commonParam commonParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listFacil(Common commonParam) throws SQLException;
	
	/**
	 * 자유게시판 등록글 조회수
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateHitCount(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 자유게시판 등록
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveCommunityData(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 자유게시판 수정
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateCommunityData(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 자유게시판 삭제
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeCommunityData(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 한줄 댓글 목록수 조회
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int communityCommentListTotCnt(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 한줄 댓글 목록
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> communityCommentList(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 댓글 등록
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveCommunityCommentData(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시판 상세 조회 내의 댓글 삭제
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 *//*
	public abstract void removeCommunityCommentData(BbsFileReply bbsParam) throws SQLException;*/
	
}
