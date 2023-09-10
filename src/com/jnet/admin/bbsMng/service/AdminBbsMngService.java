package com.jnet.admin.bbsMng.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;



public interface AdminBbsMngService {

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
	 * 게시판 정보 상세조회
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
	 * 게시판별 게시데이터 목록수 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findBbsDataTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판별 게시데이터 목록조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판별 게시데이터 상세조회
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayLists
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> findBbsData(BbsFileReply bbsParam) throws SQLException;
	
	/**
	 * 메뉴별 담당자 정보조회
	 *  
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract BbsFileReply findEmpInfo(BbsFileReply bbsParam) throws SQLException;
	
	

	/**
	 * 게시판별 데이터 수정
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateBbsData(BbsFileReply bbsParam) throws SQLException;

	
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


	/**
	 * 게시물 저장
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 갤러리형 게시물 이미지 삭제
	 * @param bbsParam bbsParam
	 * @param request request
	 * @throws SQLException SQLException
	 */
	public abstract void removeGallImg(BbsFileReply bbsParam, HttpServletRequest request) throws SQLException;

	/**
	 * 권한별 사업장 목록 조회
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Common> listFacilWithMenuSeq(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 댓글 목록수 조회
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findReplytTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 댓글 목록 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listReply(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 댓글 등록
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveReply(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 댓글 삭제
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeReply(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 최근 게시물 목록 조회
	 * @return
	 * @throws SQLException
	 */
	public abstract ArrayList<BbsFileReply> listLeastBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 최근게시물 목록수 조회 더보기
	 * @param bbsParam bbsParam
	 * @return int int
	 */
	public abstract int findLeastBbsDataTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 최근게시물 목록 조회 더보기
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 */
	public abstract ArrayList<BbsFileReply> listLeastBbsDataTotal(BbsFileReply bbsParam) throws SQLException;

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

	/**
	 * 게시물 삭제(UPDATE)
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 무료강좌에 등록된 강사 목록 조회
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listBbsTeacher(BbsFileReply bbsParam) throws SQLException;

}
