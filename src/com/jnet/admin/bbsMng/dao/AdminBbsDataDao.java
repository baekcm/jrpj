package com.jnet.admin.bbsMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;



public interface AdminBbsDataDao {
	
	/**
	 * 게시판별 게시데이터 목록 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findBbsDataTotCnt(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판별 게시데이터 목록 조회
	 * 
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판별 게시데이터 상세조회
	 * @param bbsParam bbsParam
	 * @return BbsFileReply BbsFileReply
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> findBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시판별 데이터 수정
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 게시물 저장
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract int saveBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 파일저장
	 * @param bbsFile bbsFile
	 * @throws SQLException SQLException
	 */
	public abstract void saveBbsFile(BbsFileReply bbsFile) throws SQLException;

	/**
	 * 썸네일 번호로 원본 이미지 정보포함 목록 조회
	 * @param bbsParam bbsParam
	 * @return  ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listGallImgByFileSeq(BbsFileReply bbsParam) throws SQLException;

	/**
	 * listGallImgByPopSeq에서 목록 조회한 파일정보 삭제
	 * @param bbs bbs
	 * @throws SQLException SQLException
	 */
	public abstract void removeGallImg(BbsFileReply bbs) throws SQLException;

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
	 * 파일삭제
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeImg(BbsFileReply bbsParam) throws SQLException;

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
	public abstract int findLeastBbsDataTotCnt(BbsFileReply bbsParam);

	/**
	 * 최근게시물 목록 조회 더보기
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 */
	public abstract ArrayList<BbsFileReply> listLeastBbsDataTotal(BbsFileReply bbsParam);

	/**
	 * 게시물 삭제(UPDATE)
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeBbsData(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 무료강좌 강사 등록
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveBbsTeacher(BbsFileReply bbsParam) throws SQLException;

	/**
	 * 무료강좌 강사 삭제
	 * @param bbsParam bbsParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeBbsTeacher(BbsFileReply bbsParam) throws SQLException;

	
	/**
	 * 무료강좌에 등록된 강사 목록 조회
	 * @param bbsParam bbsParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<BbsFileReply> listBbsTeacher(BbsFileReply bbsParam) throws SQLException;
}
