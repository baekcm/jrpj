package com.jnet.front.board.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.cptMng.dao.AdminCptMngDao;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Minwon;
import com.jnet.front.board.dao.BoardDao;
import com.jnet.front.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private AdminCptMngDao adminCptMngDao;
	
	
	@Override
	public void saveMinwonQ(Minwon minwonParam) throws SQLException{
		if(minwonParam.getqSeq() != null && minwonParam.getqSeq() > 0){
			adminCptMngDao.updateMinwonQ(minwonParam);
			if(minwonParam.getCommCodeSeqList().size()>0){
				for(int i =0 ; i <minwonParam.getCommCodeSeqList().size();i++ ){
					Minwon mwParm = new Minwon();
					mwParm=minwonParam;
					mwParm.setCommCodeSeq(minwonParam.getCommCodeSeqList().get(i));
					adminCptMngDao.updateMinwonCommQ(minwonParam);				
				}
			}

		}else{
			boardDao.saveMinwonQ(minwonParam);
			if(minwonParam.getCommCodeSeqList().size()>0){
				for(int i =0 ; i <minwonParam.getCommCodeSeqList().size();i++ ){
					Minwon mwParm = new Minwon();
					mwParm=minwonParam;
					mwParm.setCommCodeSeq(minwonParam.getCommCodeSeqList().get(i));
					boardDao.saveMinwonCommQ(minwonParam);				
				}
			}
		}
	}
	@Override
	public void saveAssess(Minwon minwonParam) throws SQLException{
			adminCptMngDao.updateMinwonQ(minwonParam);
	}
	
	@Override
	public void saveSugest(BbsFileReply bbsParam) throws SQLException {
		boardDao.saveSugest(bbsParam);
		
		// 파일정보 저장
		if(bbsParam.getBbsFileList() != null && bbsParam.getBbsFileList().size() > 0) {
			for(BbsFileReply bbsFile : bbsParam.getBbsFileList()) {
				bbsFile.setSuggestSeq(bbsParam.getSuggestSeq());
				boardDao.saveSugestFile(bbsFile);
			}
		}
	}
	
	
	@Override
	public void saveClean(BbsFileReply bbsParam) throws SQLException {
		boardDao.saveClean(bbsParam);
		
		// 파일정보 저장
		if(bbsParam.getBbsFileList() != null && bbsParam.getBbsFileList().size() > 0) {
			for(BbsFileReply bbsFile : bbsParam.getBbsFileList()) {
				bbsFile.setCleanSeq(bbsParam.getCleanSeq());
				boardDao.saveCleanFile(bbsFile);
			}
		}
	}
	
	@Override
	public void updateSugest(BbsFileReply bbsParam) throws SQLException {
		boardDao.updateSugest(bbsParam);
		// 파일정보 저장
		if(bbsParam.getBbsFileList() != null && bbsParam.getBbsFileList().size() > 0) {
			boardDao.removeSugestFile(bbsParam);
			for(BbsFileReply bbsFile : bbsParam.getBbsFileList()) {
				bbsFile.setSuggestSeq(bbsParam.getSuggestSeq());
				boardDao.saveSugestFile(bbsFile);
			}
		}
				
	}
	

}
