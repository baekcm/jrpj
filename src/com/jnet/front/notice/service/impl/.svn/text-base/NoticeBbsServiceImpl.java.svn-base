package com.jnet.front.notice.service.impl; 

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.front.notice.dao.NoticeBbsDao;
import com.jnet.front.notice.service.NoticeBbsService;
import com.jnet.admin.bbsMng.dao.AdminBbsDataDao;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
    
@Service
public class NoticeBbsServiceImpl implements NoticeBbsService {
	
	@Autowired
	private NoticeBbsDao noticeBbsDao;  
	
	@Autowired
	private AdminBbsDataDao adminBbsDataDao;  

	@Override
	public int noticeListBbsTotCnt(BbsFileReply bbsParam) throws SQLException {
		return noticeBbsDao.noticeListTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> noticeListBbs(BbsFileReply bbsParam)throws SQLException {
		ArrayList<BbsFileReply> listNotice =noticeBbsDao.noticeList(bbsParam);
		if(listNotice !=null && listNotice.size() >0){
			if("FREE".equals(listNotice.get(0).getBoardType()) ){
				for(int i = 0 ; i < listNotice.size() ; i ++ ){
					BbsFileReply parm = new BbsFileReply();
					parm = listNotice.get(i);
					ArrayList<BbsFileReply>  teacherList = adminBbsDataDao.listBbsTeacher(parm);
					listNotice.get(i).setTeacherList(teacherList);
				}
			}
		}
		return listNotice;
	}
	
	@Override
	public ArrayList<BbsFileReply> noticeViewBbs(BbsFileReply bbsParam)throws SQLException {
		return noticeBbsDao.noticeView(bbsParam);
	}
	
	@Override
	public ArrayList<BbsFileReply> noticePrevBbs(BbsFileReply bbsParam)throws SQLException {
		return noticeBbsDao.noticePrev(bbsParam);
	}
	
	@Override
	public ArrayList<BbsFileReply> noticeNextBbs(BbsFileReply bbsParam)throws SQLException {
		return noticeBbsDao.noticeNext(bbsParam);
	}
	
	@Override
	public ArrayList<Common> listFacil(Common commonParam) throws SQLException {
		return noticeBbsDao.listCommonCode(commonParam);
	}
	
	@Override
	public void updateHitCount(BbsFileReply bbsParam) throws SQLException {
		noticeBbsDao.updateHitCount(bbsParam);
	}
	
}