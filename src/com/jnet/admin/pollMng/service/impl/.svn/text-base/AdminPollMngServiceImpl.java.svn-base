package com.jnet.admin.pollMng.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.pollMng.dao.AdminPollMngDao;
import com.jnet.admin.pollMng.service.AdminPollMngService;
import com.jnet.domain.APoll;
import com.jnet.domain.Poll;
import com.jnet.domain.QPoll;

@Service
public class AdminPollMngServiceImpl implements AdminPollMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private AdminPollMngDao adminPollMngDao;

	@Override
	public int findPollTotCnt(Map<String, Object> hmap) throws SQLException {
		logger.info("AdminPollMngServiceImpl - findPollTotCnt");
		return adminPollMngDao.findPollTotCnt(hmap);
	}

	@Override
	public ArrayList<Poll> listPoll(Map<String, Object> hmap) throws SQLException {
		logger.info("AdminPollMngServiceImpl - listPoll");
		return adminPollMngDao.listPoll(hmap);
	}

	@Override
	public void savePoll(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngServiceImpl - savePoll");
		/**
		 * 설문조사 기본사항 저장 (제목 , 신청기간)
		 */
		adminPollMngDao.savePoll(qPoll);
		
		/**
		 * 설문조사 질의 등록
		 */
		if(qPoll.getProblemContentArr() != null && qPoll.getProblemContentArr().length > 0) {
			int cnt = 0;
			int totCnt = 0;
			for(int i=0; i<qPoll.getProblemContentArr().length; i++) {
				qPoll.setProblemContent(qPoll.getProblemContentArr()[i]);
				qPoll.setProblemType(qPoll.getProblemTypeArr()[i]);
				adminPollMngDao.savePollProblem(qPoll);
				/*totCnt += Integer.parseInt(qPoll.getQuestionCntArr()[i]);*/
				if(!GenericValidator.isBlankOrNull(qPoll.getQuestionCntArr()[i])) {
					totCnt += Integer.parseInt(qPoll.getQuestionCntArr()[i]);
				}
				if(totCnt > 0) {
					for(int j=cnt; j<totCnt; j++) {
						qPoll.setqContent(qPoll.getqContentArr()[j]);
						qPoll.setqNoType(qPoll.getqNoTypeArr()[j]);
						adminPollMngDao.savePollQuestion(qPoll);
						cnt++;
					}
				}
			}
		}
		
	}

	@Override
	public Map<String, Object> findPoll(APoll aPoll) throws SQLException {
		logger.info("AdminPollMngServiceImpl - findPoll");
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("findPoll", adminPollMngDao.findPoll(aPoll));
		hmap.put("listPollQuestion", adminPollMngDao.listPollQuestion(aPoll));
		return hmap;
	}
	
	@Override
	public Map<String, Object> findLeastPoll(Map<String, Object> map) throws SQLException {
		logger.info("AdminPollMngServiceImpl - findLeastPoll");
		Map<String, Object> hmap = new HashMap<String, Object>();
		Poll findLeastPoll =  null;
		if(Integer.parseInt(String.valueOf(map.get("pollSeq"))) == 0) {
			findLeastPoll = adminPollMngDao.findLeastPoll(map);	
		} else {
			APoll aPoll = new APoll();
			aPoll.setPollSeq(Integer.parseInt(String.valueOf(map.get("pollSeq"))));
			aPoll.setCreateId(String.valueOf(map.get("userId")));
			findLeastPoll = adminPollMngDao.findPoll(aPoll);
		}
		APoll aPoll = null;
		if(findLeastPoll == null) {
			hmap.put("findLeastPoll", null);
			hmap.put("listPollQuestion", null);
		} else {
			aPoll = new APoll();
			aPoll.setPollSeq(findLeastPoll.getPollSeq());
			hmap.put("findLeastPoll", findLeastPoll);
			hmap.put("listPollQuestion", adminPollMngDao.listPollQuestion(aPoll));
			
		}
		return hmap;
	}

	@Override
	public void updatePoll(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngServiceImpl - updatePoll");
		/**
		 * 설문조사 기본사항 수정 (제목 , 신청기간)
		 */ 
		adminPollMngDao.updatePoll(qPoll);
		
		/**
		 * 하위 질문 + 선택내용 삭제
		 */
		adminPollMngDao.removePollProblemWithQuestion(qPoll);
		/**
		 * 설문조사 질의 등록
		 */
		if(qPoll.getProblemContentArr() != null && qPoll.getProblemContentArr().length > 0) {
			int cnt = 0;
			int totCnt = 0;
			for(int i=0; i<qPoll.getProblemContentArr().length; i++) {
				qPoll.setProblemContent(qPoll.getProblemContentArr()[i]);
				qPoll.setProblemType(qPoll.getProblemTypeArr()[i]);
				adminPollMngDao.savePollProblem(qPoll);
				if(!GenericValidator.isBlankOrNull(qPoll.getQuestionCntArr()[i])) {
					totCnt += Integer.parseInt(qPoll.getQuestionCntArr()[i]);
				}
				if(totCnt > 0) {
					for(int j=cnt; j<totCnt; j++) {
						qPoll.setqContent(qPoll.getqContentArr()[j]);
						qPoll.setqNoType(qPoll.getqNoTypeArr()[j]);
						adminPollMngDao.savePollQuestion(qPoll);
						cnt++;
					}
				}
			}
		}
	}

	@Override
	public void removePoll(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngServiceImpl - removePoll");
		adminPollMngDao.removePoll(qPoll);
	}

	@Override
	public void savePollAnswer(APoll aPoll) throws SQLException {
		logger.info("AdminPollMngServiceImpl - savePollAnswer");
		if(aPoll.getProblemSeqArr() != null && aPoll.getProblemSeqArr().length > 0) {
			for(int i=0; i<aPoll.getProblemSeqArr().length; i++) {
				if(aPoll.getaShortAnswerArr() != null && aPoll.getaShortAnswerArr().length > 0) {
					aPoll.setaShortAnswer(aPoll.getaShortAnswerArr()[i]);	
				} else {
					aPoll.setaShortAnswer("");
				}
				if(aPoll.getaEtcArr() != null && aPoll.getaEtcArr().length > 0) {
					aPoll.setaEtc(aPoll.getaEtcArr()[i]);	
				} else {
					aPoll.setaEtc("");
				}
				aPoll.setProblemSeq(aPoll.getProblemSeqArr()[i]);
				adminPollMngDao.savePollAnswer(aPoll);
			}
		}
	}

	@Override
	public ArrayList<APoll> listPollViewer(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngServiceImpl - listPollViewer");
		return adminPollMngDao.listPollViewer(qPoll);
	}

	@Override
	public int findPollViewerTotCnt(QPoll qPoll) throws SQLException {
		logger.info("AdminPollMngServiceImpl - findPollViewerTotCnt");
		return adminPollMngDao.findPollViewerTotCnt(qPoll);
	}
}
