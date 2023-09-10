package com.jnet.admin.bbsMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Menu;



public interface AdminBbsMngDao {
	
	/**
	 * 게시판 등록수 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findBbsTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판 목록 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listBbsMng(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판 생성
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveBbsMng(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판 데이터 상세조회
	 * @param bbsParam bbsParam
	 * @return  BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findBbsMng(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판 정보 수정
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateBbsMng(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 메뉴 담당자변경
	 * @param menuParam menuParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateMenuEmpSeq(Menu menuParam) throws SQLException;
	
	/**
	 * 메뉴별 담당자 정보조회
	 *  
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findEmpInfo(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 클린신고 목록수조회
	 * @param bbsParam bbsParam
	 * @return  int int
	 * @throws SQLException SQLException
	 */
	public abstract int findClenTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 클린신고목록조회
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listClean(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 고객제안 목록수조회
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findSuggestTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 고객제안 목록 조회
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */ 
	public abstract ArrayList<BbsFileReply> listSuggest(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 클린신고센터 상세조회
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findClean(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 클린신고센터 파일다운정보조회
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findCleanFile(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 고객제안 상세조회
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findSuggest(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 고객제안 파일다운정보조회
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findSuggestFile(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 게시물 등록시 템플릿 타입 조회
	 * @param bbsParam bbsParam
	 * @return String String
	 * @throws SQLException SQLException
	 */
	public abstract String findBbsType(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 상단 게시물 종류 타이틀
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findBbs(BbsFileReply bbsParam) throws SQLException;
	
	
	public abstract void updateSugestHit(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 고객제안 처리상태 변경
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateSuggest(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시물 파일정보조회
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findBbsDataFile(BbsFileReply bbsParam) throws SQLException;	
}

