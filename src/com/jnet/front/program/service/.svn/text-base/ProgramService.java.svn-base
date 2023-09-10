package com.jnet.front.program.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Pgm;

public interface ProgramService {

	public ArrayList<Pgm> listProgram(Pgm pgmParam) throws SQLException;

	/**
	 * 사용자 프로그램 목록수조회
	 * @param pgmParam pgmParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findFrontPgmTotCnt(Pgm pgmParam) throws SQLException;
	
	/**
	 * 프로그램 목록 조회
	 * @param pgmParam pgmParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public ArrayList<Pgm> listFrontPgm(Pgm pgmParam) throws SQLException;
}
