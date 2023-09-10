package com.jnet.front.program.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jnet.domain.Pgm;
import com.jnet.front.program.dao.ProgramDao;

@Repository
public class ProgramDaoImpl implements ProgramDao {


	/*@Autowired
	@Resource(name="sqlSession")
	private SqlSession sql;*/
	
	@Autowired
	@Resource(name="sqlSession2")
	private SqlSession sql2;
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Pgm> listProgram(Pgm pgmParam) throws SQLException {
		return (ArrayList<Pgm>)sql2.selectList("pgmSql.findOutPgmMng",pgmParam);
	}

	@Override
	public int findFrontPgmTotCnt(Pgm pgmParam) throws SQLException {
		return (Integer)sql2.selectOne("pgmSql.findFrontPgmTotCnt", pgmParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Pgm> listFrontPgm(Pgm pgmParam) throws SQLException {
		// TODO Auto-generated method stub
		return (ArrayList<Pgm>)sql2.selectList("pgmSql.listFrontPgm",pgmParam);
	}
	
	
}
