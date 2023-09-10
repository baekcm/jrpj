package com.jnet.front.program.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.domain.Pgm;
import com.jnet.front.program.dao.ProgramDao;
import com.jnet.front.program.service.ProgramService;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	private ProgramDao programDao;
	

	@Override
	public ArrayList<Pgm> listProgram(Pgm pgmParam) throws SQLException {
		return programDao.listProgram(pgmParam);
	}
	
	@Override
	public int findFrontPgmTotCnt(Pgm pgmParam) throws SQLException {
		return programDao.findFrontPgmTotCnt(pgmParam);
	}

	@Override
	public ArrayList<Pgm> listFrontPgm(Pgm pgmParam) throws SQLException {
		return programDao.listFrontPgm(pgmParam);
	}
}
