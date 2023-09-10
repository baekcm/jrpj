package com.jnet.front.community.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.front.community.dao.CommunityBbsDao;
import com.jnet.front.community.service.CommunityBbsService;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;

@Service
public class CommunityBbsServiceImpl implements CommunityBbsService {

	@Autowired
	private CommunityBbsDao communityBbsDao;  

	@Override
	public int communityListTotCnt(BbsFileReply bbsParam) throws SQLException {
		return communityBbsDao.communityListTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> communityList(BbsFileReply bbsParam)throws SQLException {
		return communityBbsDao.communityList(bbsParam);
	}
	
	@Override
	public ArrayList<BbsFileReply> communityView(BbsFileReply bbsParam)throws SQLException {
		return communityBbsDao.communityView(bbsParam);
	}
	
	@Override
	public ArrayList<BbsFileReply> communityPrev(BbsFileReply bbsParam)throws SQLException {
		return communityBbsDao.communityPrev(bbsParam);
	}
	
	@Override
	public ArrayList<BbsFileReply> communityNext(BbsFileReply bbsParam)throws SQLException {
		return communityBbsDao.communityNext(bbsParam);
	}
	
	@Override
	public ArrayList<Common> listFacil(Common commonParam) throws SQLException {
		return communityBbsDao.listCommonCode(commonParam);
	}
	
	@Override
	public void updateHitCount(BbsFileReply bbsParam) throws SQLException {
		communityBbsDao.updateHitCount(bbsParam);
	}
	
	@Override
	public void saveCommunityData(BbsFileReply bbsParam) throws SQLException {
		communityBbsDao.saveCommunityData(bbsParam);
		
		// 파일정보 저장
		/*
		if(bbsParam.getBbsFileList() != null && bbsParam.getBbsFileList().size() > 0) {
			for(BbsFileReply bbsFile : bbsParam.getBbsFileList()) {
				bbsFile.setDataSeq(bbsParam.getDataSeq());
				communityBbsDao.saveCommunityFile(bbsFile);
			}
		}
		*/
	}
	
	@Override
	public void updateCommunityData(BbsFileReply bbsParam) throws SQLException {
		communityBbsDao.updateCommunityData(bbsParam);
		
		// 파일정보 저장
		/*
		if(bbsParam.getBbsFileList() != null && bbsParam.getBbsFileList().size() > 0) {
			communityBbsDao.removeCommunityFile(bbsParam);
			for(BbsFileReply bbsFile : bbsParam.getBbsFileList()) {
				bbsFile.setDataSeq(bbsParam.getDataSeq());
				communityBbsDao.saveCommunityFile(bbsFile);
			}
		}
		*/
				
	}
	
	@Override
	public void removeCommunityData(BbsFileReply bbsParam) throws SQLException {
		communityBbsDao.removeCommunityData(bbsParam);
	}
	
	@Override
	public int communityCommentListTotCnt(BbsFileReply bbsParam) throws SQLException {
		return communityBbsDao.communityCommentListTotCnt(bbsParam);
	}
	
	@Override
	public ArrayList<BbsFileReply> communityCommentList(BbsFileReply bbsParam)throws SQLException {
		return communityBbsDao.communityCommentList(bbsParam);
	}
	
	@Override
	public void saveCommunityCommentData(BbsFileReply bbsParam) throws SQLException {
		communityBbsDao.saveCommunityCommentData(bbsParam);
	}
	
}
