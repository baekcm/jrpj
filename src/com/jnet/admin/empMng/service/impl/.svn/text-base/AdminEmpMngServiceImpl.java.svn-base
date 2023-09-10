package com.jnet.admin.empMng.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.empMng.dao.AdminEmpMngDao;
import com.jnet.admin.empMng.service.AdminEmpMngService;
import com.jnet.domain.Emp;

@Service
public class AdminEmpMngServiceImpl implements AdminEmpMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private AdminEmpMngDao adminEmpMngDao; 
	
	@Override
	public int findEmpTotCnt(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - findEmpTotCnt");
		return adminEmpMngDao.findEmpTotCnt(empParam);
	}

	@Override
	public ArrayList<Emp> listEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - listEmpMng");
		return adminEmpMngDao.listEmpMng(empParam);
	}
	
	@Override
	public Emp findEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - findEmpMng");
		return adminEmpMngDao.findEmpMng(empParam);
	}

	@Override
	public void saveEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - saveEmpMng");
		adminEmpMngDao.saveEmpMng(empParam);
	}

	@Override
	public void updateEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - updateEmpMng");
		adminEmpMngDao.updateEmpMng(empParam);
	}

	@Override
	public void saveEmpMngList(ArrayList<Emp> empList) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - saveEmpMngList");
		for(Emp emp : empList) {
			adminEmpMngDao.saveEmpMng(emp);
		}
	}

	@Override
	public ArrayList<Emp> listAllMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - listAllMng");
		return adminEmpMngDao.listAllMng(empParam);
	}
	
	@Override
	public ArrayList<Emp> listDept() throws SQLException {
		logger.info("AdminEmpMngServiceImpl - listDept");
		return adminEmpMngDao.listDept();
	}

	@Override
	public void removeEmpMng(Emp empParam) throws SQLException {
		logger.info("AdminEmpMngServiceImpl - removeEmpMng");
		if(empParam.getEmpSeqArr() != null && empParam.getEmpSeqArr().length > 0) {
			for(int i=0; i<empParam.getEmpSeqArr().length; i++) {
				empParam.setEmpSeq(empParam.getEmpSeqArr()[i]);
				adminEmpMngDao.removeEmpMng(empParam);
			}
		}
	}
}
