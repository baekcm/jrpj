package com.jnet.admin.pgmMng.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.admin.pgmMng.dao.AdminPgmMngDao;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Pgm;
import com.jnet.domain.PgmImg;
import com.jnet.domain.Teacher;
import com.jnet.domain.TeacherImg;

@Repository
public class AdminPgmMngDaoImpl implements AdminPgmMngDao {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;
	@Autowired
	@Resource(name="sqlSession2")
	private SqlSession sql2;
	@Override
	public int findPgmTotCnt(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-findPgmTotCnt");
		return (Integer)sql2.selectOne("pgmSql.findPgmTotCnt",outPgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OutPgm> listPgmMng(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listPgmMng");
		return (ArrayList<OutPgm>)sql2.selectList("pgmSql.listPgmMng",outPgmParam);
	}
	@Override
	public PgmImg findPgmMng(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-findPgmMng");
		return (PgmImg)sql.selectOne("pgmSql.findPgmMng",pgmParam);
	}
	
	@Override
	public int savePgmMng(TeacherImg teacherImgParam) throws SQLException{
		logger.info("AdminPgmMngDaoImpl-savePgmMng");
		return (Integer)sql.insert("pgmSql.savePgmMng",teacherImgParam);
	}
	
	@Override
	public void updatePgmMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-updatePgmMng");
		sql.update("pgmSql.updatePgmMng",teacherImgParam);
	}
	
	@Override
	public void savePgmTeacher(TeacherImg teacherImgParam) throws SQLException  {
		logger.info("AdminPgmMngDaoImpl-savePgmTeacher");
		sql.insert("pgmSql.savePgmTeacher",teacherImgParam);
	}
	@Override
	public void removePgmTeacher(TeacherImg teacherImgParam) throws SQLException  {
		logger.info("AdminPgmMngDaoImpl-removePgmTeacher");
		sql.delete("pgmSql.removePgmTeacher",teacherImgParam);
	}
	@Override
	public void savePgmImg(TeacherImg teacherImgParam) throws SQLException  {
		logger.info("AdminPgmMngDaoImpl-savePgmImg");
		sql.insert("pgmSql.savePgmImg",teacherImgParam);
	}
	@Override
	public void removePgmImg(TeacherImg teacherImgParam) throws SQLException  { 
		logger.info("AdminPgmMngDaoImpl-removePgmImg");
		sql.delete("pgmSql.removePgmImg",teacherImgParam);
	}
	@Override
	public int findTeacherTotCnt() throws SQLException {
		logger.info("AdminPgmMngDaoImpl-findTeacherTotCnt");
		return (Integer)sql.selectOne("teacherSql.findTeacherTotCnt");
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Teacher> listTeacherMng(Teacher teacherParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listTeacherMng");
		return (ArrayList<Teacher>)sql.selectList("teacherSql.listTeacherMng",teacherParam);
	}
	@Override
	public int saveTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-saveTeacherMng");
		return (Integer)sql.insert("teacherSql.saveTeacherMng",teacherImgParam);
	}
	@Override
	public void saveTeacherImg(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-saveTeacherImg");
		sql.insert("teacherSql.saveTeacherImg",teacherImgParam);
	}
	@Override
	public void updateTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-updateTeacherMng");
		sql.update("teacherSql.updateTeacherMng",teacherImgParam);
	}
	@Override
	public void removeTeacherImg(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-removeTeacherImg");
		sql.delete("teacherSql.removeTeacherImg",teacherImgParam);
	}
	@Override
	public TeacherImg findTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-findTeacherMng");
		return (TeacherImg)sql.selectOne("teacherSql.findTeacherMng",teacherImgParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OutPgm> listUpId() throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listUpId");
		return (ArrayList<OutPgm>)sql2.selectList("pgmSql.listUpId");
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OutPgm> listSaleIdByUpId(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listSaleIdByUpId");
		return (ArrayList<OutPgm>)sql2.selectList("pgmSql.listSaleIdByUpId",outPgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OutPgm> listBasIdBySaleId(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listBasIdBySaleId");
		return (ArrayList<OutPgm>)sql2.selectList("pgmSql.listBasIdBySaleId",outPgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Pgm> findOutPgmMng(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-findOutPgmMng");
		return (ArrayList<Pgm>)sql2.selectList("pgmSql.findOutPgmMng",pgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<TeacherImg> listTeacherInfoByPgmSeq(PgmImg pgmResult) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listTeacherInfoByPgmSeq");
		return (ArrayList<TeacherImg>)sql.selectList("teacherSql.listTeacherInfoByPgmSeq",pgmResult);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Pgm> listAcceptDate(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listAcceptDate");
		return (ArrayList<Pgm>)sql.selectList("pgmSql.listAcceptDate",pgmParam);
	}
	@Override
	public void updateAccept(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-updateAccept");
		sql.update("pgmSql.updateAccept",pgmParam);
	}
	@Override
	public int findAcceptDateByUpId(Map<String, Object> mapParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-findAcceptDateByUpId");
		return (Integer)sql.selectOne("pgmSql.findAcceptDateByUpId", mapParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Pgm> findOutPgmMngforAdminPage(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-findOutPgmMngforAdminPage");
		return (ArrayList<Pgm>)sql2.selectList("pgmSql.findOutPgmMngDtlInfo",pgmParam);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<TeacherImg> listTeacherImgByFileSeq(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngDaoImpl-listTeacherImgByFileSeq");
		return (ArrayList<TeacherImg>)sql.selectList("teacherSql.listTeacherImgByFileSeq",teacherImgParam);
	}
	@Override
	public void removeTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		sql.update("teacherSql.removeTeacherMng",teacherImgParam);
	}
}
