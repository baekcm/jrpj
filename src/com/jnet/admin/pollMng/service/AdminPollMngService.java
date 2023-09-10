package com.jnet.admin.pollMng.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.jnet.domain.APoll;
import com.jnet.domain.Poll;
import com.jnet.domain.QPoll;



public interface AdminPollMngService {
	/**
	 * 설문조사 목록 총 갯수 조회
	 * @param hmap hmap
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findPollTotCnt(Map<String, Object> hmap) throws SQLException;

	/**
	 * 설문조사 목록 조회
	 * @param hmap hmap
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Poll> listPoll(Map<String, Object> hmap) throws SQLException;

	/**
	 * 설문조사 기본정보 + 질문내용 저장
	 * 
	 * @param qPoll qPoll
	 * @throws SQLException SQLException
	 */
	public abstract void savePoll(QPoll qPoll) throws SQLException;

	/**
	 * 설문기본정보 + 질문내용 상세조회
	 * @param aPoll aPoll
	 * @return Map Map
	 * @throws SQLException SQLException
	 */
	public abstract Map<String, Object> findPoll(APoll aPoll) throws SQLException;
	
	/**
	 * 사용자 최근 설문 가능 상세조회
	 * @return
	 * @throws SQLException
	 */
	public abstract Map<String, Object> findLeastPoll(Map<String, Object> map) throws SQLException;
	

	/**
	 * 설문조사 기본정보 + 질문내용 저장
	 * 
	 * @param qPoll qPoll
	 * @throws SQLException SQLException
	 */
	public abstract void updatePoll(QPoll qPoll) throws SQLException;

	/**
	 * 설문조사 삭제
	 * @param qPoll
	 * @throws SQLException
	 */
	public abstract void removePoll(QPoll qPoll) throws SQLException;

	/**
	 * 설문조사 저장
	 * @param aPoll aPoll
	 * @throws SQLException SQLException
	 */
	public abstract void savePollAnswer(APoll aPoll) throws SQLException;

	/**
	 * 기타선택 상세내용 보기
	 * 
	 * @param qPoll qPoll
	 * @return 
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<APoll> listPollViewer(QPoll qPoll) throws SQLException;

	/**
	 * 기타목록 갯수 조회
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findPollViewerTotCnt(QPoll qPoll) throws SQLException;
}
