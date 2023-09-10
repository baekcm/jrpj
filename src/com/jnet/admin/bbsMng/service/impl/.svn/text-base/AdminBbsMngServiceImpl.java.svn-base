package com.jnet.admin.bbsMng.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.bbsMng.dao.AdminBbsDataDao;
import com.jnet.admin.bbsMng.dao.AdminBbsMngDao;
import com.jnet.admin.bbsMng.service.AdminBbsMngService;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;

@Service
public class AdminBbsMngServiceImpl implements AdminBbsMngService {
	private Logger logger = Logger.getLogger(this.getClass());	
	@Autowired
	private AdminBbsMngDao adminBbsMngDao;
	
	@Autowired
	private AdminBbsDataDao adminBbsDataDao;

	@Override
	public int findBbsTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findBbsTotCnt");
		return adminBbsMngDao.findBbsTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> listBbsMng(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listBbsMng");
		return adminBbsMngDao.listBbsMng(bbsParam);
	}

	@Override
	public BbsFileReply findBbsMng(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findBbsMng");
		return adminBbsMngDao.findBbsMng(bbsParam);
	}

	@Override
	public void updateBbsMng(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - updateBbsMng");		
		// 1. 컨텐츠 내용 저장
		if(bbsParam.getBoardSeq() == null) {
			//insert
			adminBbsMngDao.saveBbsMng(bbsParam);
		} else {
			//update
			adminBbsMngDao.updateBbsMng(bbsParam);
		}
		//담당자변경~
		adminBbsMngDao.updateMenuEmpSeq(bbsParam);
	}

	@Override
	public int findBbsDataTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findBbsDataTotCnt");
		return adminBbsDataDao.findBbsDataTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> listBbsData(BbsFileReply bbsParam)throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listBbsData");
		return adminBbsDataDao.listBbsData(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> findBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findBbsData");
		return adminBbsDataDao.findBbsData(bbsParam);
	}

	

	@Override
	public BbsFileReply findEmpInfo(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findEmpInfo");
		return adminBbsMngDao.findEmpInfo(bbsParam);
	}

	@Override
	public int findClenTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findClenTotCnt");
		return adminBbsMngDao.findClenTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> listClean(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listClean");
		return adminBbsMngDao.listClean(bbsParam);
	}

	@Override
	public int findSuggestTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findSuggestTotCnt");
		return adminBbsMngDao.findSuggestTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> listSuggest(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listSuggest");
		return adminBbsMngDao.listSuggest(bbsParam);
	}

	@Override
	public BbsFileReply findClean(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findClean");
		return adminBbsMngDao.findClean(bbsParam);
	}
	@Override
	public BbsFileReply findCleanFile(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findCleanFile");
		return adminBbsMngDao.findCleanFile(bbsParam);
	}

	@Override
	public BbsFileReply findSuggest(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findSuggest");
		adminBbsMngDao.updateSugestHit(bbsParam);
		return adminBbsMngDao.findSuggest(bbsParam);
	}
	
	@Override
	public BbsFileReply findSuggestFile(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findSuggestFile");
		return adminBbsMngDao.findSuggestFile(bbsParam);
	}

	@Override
	public String findBbsType(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findBbsType");
		return adminBbsMngDao.findBbsType(bbsParam);
	}

	@Override
	public BbsFileReply findBbs(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findBbs");
		return adminBbsMngDao.findBbs(bbsParam);
	}

	@Override
	public void saveBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - saveBbsData");
		adminBbsDataDao.saveBbsData(bbsParam);
		
		//무료강좌 강사 등록
		if(bbsParam.getTeacherSeqArr() != null && bbsParam.getTeacherSeqArr().length > 0) {
			for(int i=0; i<bbsParam.getTeacherSeqArr().length; i++) {
				bbsParam.setTeacherSeq(bbsParam.getTeacherSeqArr()[i]);
				adminBbsDataDao.saveBbsTeacher(bbsParam);
			}
		}
		// 파일정보 저장
		if(bbsParam.getBbsFileList() != null && bbsParam.getBbsFileList().size() > 0) {
			for(BbsFileReply bbsFile : bbsParam.getBbsFileList()) {
				bbsFile.setDataSeq(bbsParam.getDataSeq());
				adminBbsDataDao.saveBbsFile(bbsFile);
			}
		}
	}
	
	@Override
	public void updateBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - updateBbsData");
		adminBbsDataDao.updateBbsData(bbsParam);
		
		//무료강좌 강사 삭제 + 등록
		if(bbsParam.getTeacherSeqArr() != null && bbsParam.getTeacherSeqArr().length > 0) {
			adminBbsDataDao.removeBbsTeacher(bbsParam);
			for(int i=0; i<bbsParam.getTeacherSeqArr().length; i++) {
				bbsParam.setTeacherSeq(bbsParam.getTeacherSeqArr()[i]);
				adminBbsDataDao.saveBbsTeacher(bbsParam);
			}
		}
		
		// 파일정보 저장
		if(bbsParam.getBbsFileList() != null && bbsParam.getBbsFileList().size() > 0) {
			if(!"LOSE".equals(bbsParam.getBoardType()) && !"FREE".equals(bbsParam.getBoardType()) && !"GALL".equals(bbsParam.getBoardType())) {
				//분실물, 무료강좌, 갤러리가 아닐경우에만 삭제
				adminBbsDataDao.removeImg(bbsParam);
			} 
			for(BbsFileReply bbsFile : bbsParam.getBbsFileList()) {
				bbsFile.setDataSeq(bbsParam.getDataSeq());
				adminBbsDataDao.saveBbsFile(bbsFile);
			}
		}
				
	}
	

	@Override
	public void removeGallImg(BbsFileReply bbsParam, HttpServletRequest request) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - removeGallImg");
		ArrayList<BbsFileReply> listGallImgResult = adminBbsDataDao.listGallImgByFileSeq(bbsParam);
		if(listGallImgResult != null && listGallImgResult.size() > 0) {
			for(BbsFileReply bbs : listGallImgResult) {
				//*********파일삭제*********
				//파일 기본경로
	    		String dftFilePath = request.getServletContext().getRealPath("/");
	    		//파일 상세 경로
	    		String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Bbs" + File.separator;
	    		//파일 기본경로 _ 상세경로
	    		String filePath = dftFilePath + dtlFilePath;
	    		File file = new File(filePath+bbs.getRealFileNm());
	    		if(file.exists()) {
	    			file.delete();
	    		}	
	    		adminBbsDataDao.removeGallImg(bbs);
			}
		}
	}

	@Override
	public ArrayList<Common> listFacilWithMenuSeq(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listFacilWithMenuSeq");
		return adminBbsDataDao.listFacilWithMenuSeq(bbsParam);
	}

	@Override
	public int findReplytTotCnt(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findReplytTotCnt");
		return adminBbsDataDao.findReplytTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> listReply(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listReply");
		return adminBbsDataDao.listReply(bbsParam);
	}

	@Override
	public void saveReply(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - saveReply");
		adminBbsDataDao.saveReply(bbsParam);
	}

	@Override
	public void removeReply(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - removeReply");
		adminBbsDataDao.removeReply(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> listLeastBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listLeastBbsData");
		return adminBbsDataDao.listLeastBbsData(bbsParam);
	}

	@Override
	public int findLeastBbsDataTotCnt(BbsFileReply bbsParam) {
		logger.info("AdminBbsMngServiceImpl - findLeastBbsDataTotCnt");
		return adminBbsDataDao.findLeastBbsDataTotCnt(bbsParam);
	}

	@Override
	public ArrayList<BbsFileReply> listLeastBbsDataTotal(BbsFileReply bbsParam) {
		logger.info("AdminBbsMngServiceImpl - listLeastBbsDataTotal");
		return adminBbsDataDao.listLeastBbsDataTotal(bbsParam);
	}

	@Override
	public void updateSuggest(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - updateSuggest");
		adminBbsMngDao.updateSuggest(bbsParam);
	}

	@Override
	public BbsFileReply findBbsDataFile(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - findBbsDataFile");
		return adminBbsMngDao.findBbsDataFile(bbsParam);
	}

	@Override
	public void removeBbsData(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - removeBbsData");
		if(bbsParam.getDataSeqArr() != null && bbsParam.getDataSeqArr().length > 0) {
			for(int i=0; i<bbsParam.getDataSeqArr().length; i++){
				bbsParam.setDataSeq(bbsParam.getDataSeqArr()[i]);
				adminBbsDataDao.removeBbsData(bbsParam);		
			}
		}
	}

	@Override
	public ArrayList<BbsFileReply> listBbsTeacher(BbsFileReply bbsParam) throws SQLException {
		logger.info("AdminBbsMngServiceImpl - listBbsTeacher");
		return adminBbsDataDao.listBbsTeacher(bbsParam);
	}

	

	
}
