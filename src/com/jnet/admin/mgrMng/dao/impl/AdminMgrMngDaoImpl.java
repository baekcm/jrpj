package com.jnet.admin.mgrMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.mgrMng.dao.AdminMgrMngDao;
import com.jnet.domain.Menu;
import com.jnet.domain.TeacherImg;

@Repository
public class AdminMgrMngDaoImpl implements AdminMgrMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	
	@Autowired
	@Resource(name="sqlSession2")
	private SqlSession sql2;

	@Override
	public int findMgrTotCnt(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-findMgrTotCnt");
		return (Integer) sql.selectOne("mgrSql.findMgrTotCnt",menuParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-listMgrMng");
		return (ArrayList<Menu>) sql.selectList("mgrSql.listMgrMng",menuParam);
	}

	@Override
	public int findDpAdmId(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-findDpAdmId");
		return (Integer)sql.selectOne("mgrSql.findDpAdmId",menuParam);
	}

	@Override
	public int saveMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-saveMgrMng");
		return (Integer)sql.insert("mgrSql.saveMgrMng",menuParam);
	}

	@Override
	public void updateMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-updateMgrMng");
		sql.update("mgrSql.updateMgrMng",menuParam);
	}

	@Override
	public void removeAdminAuth(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-removeAdminAuth");
		sql.delete("mgrSql.removeAdminAuth",menuParam);
	}
	
	@Override
	public void saveAdminAuth(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-saveAdminAuth");
		sql.insert("mgrSql.saveAdminAuth",menuParam);
	}

	@Override
	public Menu findAdminAuth(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-findAdminAuth");
		return (Menu)sql.selectOne("mgrSql.findAdminAuth",menuParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Menu> listAdminAuthMenu(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-listAdminAuthMenu");
		return (ArrayList<Menu>)sql.selectList("mgrSql.listAdminAuthMenu",menuParam);
	}

	@Override
	public void removeMgrMng(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-removeMgrMng");
		sql.update("mgrSql.removeMgrMng",menuParam);
	}

	@Override
	public TeacherImg findPgmAuth(TeacherImg teacherImg) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-findPgmAuth");
		return (TeacherImg)sql2.selectOne("pgmSql.findPgmAuth",teacherImg);
	}

	@Override
	public void updateAdmPwd(Menu menuParam) throws SQLException {
		logger.info("AdminMgrMngDaoImpl-updateAdmPwd");
		sql.update("mgrSql.updateAdmPwd",menuParam);	
	}
}
