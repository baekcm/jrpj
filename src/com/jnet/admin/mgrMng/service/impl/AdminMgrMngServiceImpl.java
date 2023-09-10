package com.jnet.admin.mgrMng.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.commonMng.dao.AdminCommonMngDao;
import com.jnet.admin.mgrMng.dao.AdminMgrMngDao;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Common;
import com.jnet.domain.Menu;
import com.jnet.domain.TeacherImg;

@Service
public class AdminMgrMngServiceImpl implements AdminMgrMngService {
	private Logger logger = Logger.getLogger(this.getClass());	
	@Autowired
	private AdminMgrMngDao adminMgrMngDao;
	@Autowired
	private AdminCommonMngDao adminCommonMngDao;
	
	@Override
	public int findMgrTotCnt(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - findMgrTotCnt");
		return adminMgrMngDao.findMgrTotCnt(menuParam);
	}

	@Override
	public ArrayList<Menu> listMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - listMgrMng");
		return adminMgrMngDao.listMgrMng(menuParam);
	}

	@Override
	public int findDpAdmId(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - findDpAdmId");
		return adminMgrMngDao.findDpAdmId(menuParam);
	}

	@Override
	public void saveMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - saveMgrMng");
		// 1. 관리자 정보 저장
		adminMgrMngDao.saveMgrMng(menuParam);
		// 2. 관리자 권한목록 저장
		if(menuParam.getAdmType().equals("O")) {
			if(menuParam.getMenuSeqStrArr().length > 0) {
	    		for(int i=0; i<menuParam.getMenuSeqStrArr().length; i++) {
	    			if(menuParam.getPgmGbnCdArr()[i].equals("PGM")) {
						menuParam.setSaleId(menuParam.getSaleIdArr()[i]);
					} else {
						menuParam.setSaleId(null);
					}
	    			menuParam.setPgmGbnCd(menuParam.getPgmGbnCdArr()[i]);
					menuParam.setMenuSeqStr(menuParam.getMenuSeqStrArr()[i]);
	    			menuParam.setSlctFacilId(menuParam.getCodeIdArr()[i]);
	    			adminMgrMngDao.saveAdminAuth(menuParam);
	    		}
	    	}	
		}
	}

	@Override
	public void updateMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - updateMgrMng");
		// 1. 관리자 정보 수정
		adminMgrMngDao.updateMgrMng(menuParam);
		// 2. 관리자 권한목록 삭제 - 저장
		adminMgrMngDao.removeAdminAuth(menuParam);
		if(menuParam.getAdmType().equals("O")) {
			if(menuParam.getPgmGbnCdArr().length > 0) {
				for(int i=0; i<menuParam.getPgmGbnCdArr().length; i++) {
					
					if(menuParam.getPgmGbnCdArr()[i].equals("PGM")) {
						menuParam.setSaleId(menuParam.getSaleIdArr()[i]);
					} else {
						menuParam.setSaleId(null);
					}
					
					menuParam.setPgmGbnCd(menuParam.getPgmGbnCdArr()[i]);
					menuParam.setMenuSeqStr(menuParam.getMenuSeqStrArr()[i]);
	    			menuParam.setSlctFacilId(menuParam.getCodeIdArr()[i]);
	    			adminMgrMngDao.saveAdminAuth(menuParam);
	    		}
	    	}
		}
	}
	
	@Override
	public Map<String, Object> listAdminAuthWithMenu(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - listAdminAuthWithMenu");
		Map<String, Object> hmap = new HashMap<String, Object>();
		Menu menuResult = adminMgrMngDao.findAdminAuth(menuParam);
		hmap.put("findAdminAuth", menuResult);
		if(menuResult.getAdmType().equals("O")) {
			hmap.put("listAdminAuthMenu", adminMgrMngDao.listAdminAuthMenu(menuParam));	
		}
		return hmap;
	}

	@Override
	public void removeMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - removeMgrMng");
		adminMgrMngDao.removeMgrMng(menuParam);		
	}

	@Override
	public ArrayList<Common> listFacil(Common commonParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - listFacil");
		return adminCommonMngDao.listCommonCode(commonParam);
	}

	@Override
	public ArrayList<Menu> listMenuByType(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - listMenuByType");
		return adminCommonMngDao.listMenuByType(menuParam);
	}

	@Override
	public TeacherImg findPgmAuth(TeacherImg teacherImg) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - findPgmAuth");
		return adminMgrMngDao.findPgmAuth(teacherImg);
	}

	@Override
	public void updateAdmPwd(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngServiceImpl - updateAdmPwd");
		adminMgrMngDao.updateAdmPwd(menuParam);
	}
}
