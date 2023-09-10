package com.jnet.admin.pollMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.jnet.domain.APoll;
import com.jnet.domain.Poll;
import com.jnet.domain.QPoll;




public interface AdminPollMngDao {
	/**savepoll
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
	 * 설문조사 기본사항 저장 (제목 , 신청기간)
	 * @param qPoll qPoll
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int savePoll(QPoll qPoll) throws SQLException;

	/**
	 * 설문조사 질의 등록
	 * @param int int
	 * @throws SQLException SQLException
	 */
	public abstract int savePollProblem(QPoll qPoll) throws SQLException;

	/**
	 * 설문조사 선택 등록
	 * @param qPoll qPoll
	 */
	public abstract void savePollQuestion(QPoll qPoll) throws SQLException;
	
	/**
	 * 설문조사 기본사항 상세조회
	 * @param aPoll aPoll
	 * @return Poll Poll
	 */
	public abstract Poll findPoll(APoll aPoll) throws SQLException;

	/**
	 * 설문조사 질의 상세 조회
	 * @param aPoll aPoll
	 * @return QPoll QPollㄴ
	 */
	public abstract ArrayList<QPoll> listPollQuestion(APoll aPoll) throws SQLException;

	/**
	 * 설문조사 기본정보 수정
	 * @param qPoll qPoll
	 * @throws SQLException SQLException
	 */
	public abstract void updatePoll(QPoll qPoll) throws SQLException;

	/**
	 * 설문조사 모든질문 및 선택사항 삭제
	 * @param qPoll qPoll
	 * @throws SQLException SQLException
	 */
	public abstract void removePollProblemWithQuestion(QPoll qPoll) throws SQLException;

	/**
	 * 설문조사 삭제(관리자)
	 * 설문 진행중에는 삭제 불가
	 * 
	 * @param qPoll qPoll
	 * @throws SQLException SQLException
	 */
	public abstract void removePoll(QPoll qPoll) throws SQLException;

	/**
	 * 최근에 진행하고있는 설문조사 상세조회
	 * @return APoll APoll
	 * @throws SQLException SQLException
	 */
	public abstract Poll findLeastPoll(Map<String, Object> map) throws SQLException;

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
