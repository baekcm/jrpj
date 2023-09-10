package com.jnet.admin.ctsMng.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.bbsMng.dao.AdminBbsMngDao;
import com.jnet.admin.ctsMng.dao.AdminCtsMngDao;
import com.jnet.admin.ctsMng.service.AdminCtsMngService;
import com.jnet.domain.Cts;
import com.jnet.domain.Menu;
import com.jnet.domain.Popup;

@Service
public class AdminCtsMngServiceImpl implements AdminCtsMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private AdminCtsMngDao adminCtsMngDao;

	@Autowired
	private AdminBbsMngDao adminBbsMngDao;
	
	@Override
	public int findCtsTotCnt(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - findCtsTotCnt");
		return adminCtsMngDao.findCtsTotCnt(ctsParam);
	}

	@Override
	public ArrayList<Cts> listCtsMng(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - listCtsMng");
		return adminCtsMngDao.listCtsMng(ctsParam);
	}

	@Override
	public Cts findCtsMng(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - findCtsMng");
		return adminCtsMngDao.findCtsMng(ctsParam);
	}

	@Override
	public void updateCtsMng(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - updateCtsMng");
		// 1. 컨텐츠 내용 저장
		if(ctsParam.getCtsSeq() == null) {
			//insert
			adminCtsMngDao.saveCts(ctsParam);
		} else {
			//update
			adminCtsMngDao.updateCts(ctsParam);
		}
		//담당자변경~
		adminBbsMngDao.updateMenuEmpSeq(ctsParam);
	}

	@Override
	public ArrayList<Popup> listPopMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - listPopMng");
		return adminCtsMngDao.listPopMng(popUpParam);
	}

	@Override
	public void savePopMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - savePopMng");
		if(popUpParam.getListPopup() != null && popUpParam.getListPopup().size() >0) {
			for(int i=0; i<popUpParam.getListPopup().size(); i++) {
				adminCtsMngDao.savePopMng(popUpParam.getListPopup().get(i));	
			}
		}
		
		if(popUpParam.getUlinkUrlArr() != null && popUpParam.getUlinkUrlArr().length > 0) {
			Popup pop = null;
			for(int j=0;j<popUpParam.getUlinkUrlArr().length; j++) {
				pop = new Popup();
				pop.setModiId(popUpParam.getCreateId());
				pop.setModiIp(popUpParam.getCreateIp());
				pop.setModiYmd(popUpParam.getCreateYmd());
				pop.setModiHms(popUpParam.getCreateHms());
				pop.setRmYn(popUpParam.getRmYnArr()[j]);
				pop.setPopSeq(popUpParam.getPopSeqArr()[j]);
				pop.setLinkUrl(popUpParam.getUlinkUrlArr()[j]);
				//추가
				pop.setDescript(popUpParam.getUdescriptArr()[j]);
				pop.setLinkTgt(popUpParam.getUlinkTgtArr()[j]);
				adminCtsMngDao.updatePopMng(pop);
			}
		}
	}

	@Override
	public void removePopMngByPopSeq(Popup popUpParam, HttpServletRequest request) throws Exception {
		logger.info("AdminCtsMngServiceImpl - removePopMngByPopSeq");
		ArrayList<Popup> listPopResult = adminCtsMngDao.listPopMngByPopSeq(popUpParam);
		if(listPopResult != null && listPopResult.size() > 0) {
			for(Popup p : listPopResult) {
				//*********파일삭제*********
				//파일 기본경로
	    		String dftFilePath = request.getServletContext().getRealPath("/");
	    		//파일 상세 경로
	    		String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Pop" + File.separator;
	    		//파일 기본경로 _ 상세경로
	    		String filePath = dftFilePath + dtlFilePath;
	    		File file = new File(filePath+p.getRealFileNm());
	    		if(file.exists()) {
	    			file.delete();
	    		}	
	    		adminCtsMngDao.removePopMng(p);
			}
		}
	}

	@Override
	public void updatePopOrdinary(Popup popUpParam) throws Exception {
		logger.info("AdminCtsMngServiceImpl - updatePopOrdinary");
		if(popUpParam.getPopSeqArr() != null && popUpParam.getPopSeqArr().length > 0) {
			for(int i=0; i<popUpParam.getPopSeqArr().length; i++) {
				popUpParam.setOrdinary(popUpParam.getOrdinaryArr()[i]);
				popUpParam.setPopSeq(popUpParam.getPopSeqArr()[i]);
				adminCtsMngDao.updatePopOrdinary(popUpParam);	
			}
		}
		
	}

	@Override
	public ArrayList<Menu> listDepthCat(Cts ctsParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - listDepthCat");
		return adminCtsMngDao.listDepthCat(ctsParam);
	}

	@Override
	public void saveOneNotiMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - saveOneNotiMng");
		
		//insert
		Popup pop = null;
		if(popUpParam != null && popUpParam.getTitleArr() != null && popUpParam.getTitleArr().length > 0){
			for(int i=0; i<popUpParam.getTitleArr().length; i++) {
				pop = new Popup();
				pop.setTitle(popUpParam.getTitleArr()[i]);
				pop.setLinkUrl(popUpParam.getLinkUrlArr()[i]);
				pop.setLinkTgt(popUpParam.getLinkTgtArr()[i]);
				pop.setCreateYmd(popUpParam.getCreateYmd());
				pop.setCreateHms(popUpParam.getCreateHms());
				pop.setCreateId(popUpParam.getCreateId());
				pop.setCreateIp(popUpParam.getCreateIp());
				pop.setCommCodeSeq(popUpParam.getCommCodeSeq());
				adminCtsMngDao.saveOneNotiMng(pop);	
			}
		}
		//update
		if(popUpParam != null && popUpParam.getUtitleArr() != null && popUpParam.getUtitleArr().length > 0){
			for(int i=0; i<popUpParam.getUtitleArr().length; i++) {
				pop = new Popup(); 
				pop.setOneNotiSeq(popUpParam.getOneNotiSeqArr()[i]);
				pop.setTitle(popUpParam.getUtitleArr()[i]);
				pop.setLinkUrl(popUpParam.getUlinkUrlArr()[i]);
				pop.setLinkTgt(popUpParam.getUlinkTgtArr()[i]);
				pop.setRmYn(popUpParam.getRmYnArr()[i]);
				pop.setModiYmd(popUpParam.getCreateYmd());
				pop.setModiHms(popUpParam.getCreateHms());
				pop.setModiId(popUpParam.getCreateId());
				pop.setModiIp(popUpParam.getCreateIp());
				pop.setCommCodeSeq(popUpParam.getCommCodeSeq());
				adminCtsMngDao.updateOneNotiMng(pop);	
			}
		}
	}

	@Override
	public ArrayList<Popup> listOneNotiMng(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - listOneNotiMng");
		return adminCtsMngDao.listOneNotiMng(popUpParam);
	}

	@Override
	public void updateShowOneNoti(Popup popUpParam) throws SQLException {
		logger.info("AdminCtsMngServiceImpl - updateShowOneNoti");
		adminCtsMngDao.updateHideOneNoti(popUpParam);
		adminCtsMngDao.updateShowOneNoti(popUpParam);
	}

	@Override
	public void removeOneNotiMngByOneNotiSeq(Popup popUpParam) throws SQLException {
		adminCtsMngDao.removeOneNotiMngByOneNotiSeq(popUpParam);
	}
}
