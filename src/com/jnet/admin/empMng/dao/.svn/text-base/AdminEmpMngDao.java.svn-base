package com.jnet.admin.empMng.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jnet.domain.Emp;



public interface AdminEmpMngDao {

	/**
	 * 조직 목록수 조회
	 * 
	 * @param empParam empParam
	 * @return int int
	 * @throws SQLException SQLException
	 */
	public abstract int findEmpTotCnt(Emp empParam) throws SQLException;

	/**
	 * 조직 목록 조회
	 * @param empParam empParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Emp> listEmpMng(Emp empParam) throws SQLException;

	/**
	 * 조직정보 상세조회
	 * @param empParam empParam
	 * @return Emp Emp
	 * @throws SQLException SQLException
	 */
	public abstract Emp findEmpMng(Emp empParam) throws SQLException;
	
	/**
	 * 조직 저장
	 * @param empParam empParam
	 * @throws SQLException SQLException
	 */
	public abstract void saveEmpMng(Emp empParam) throws SQLException;

	/**
	 * 조직 수정
	 * @param empParam empParam
	 * @throws SQLException SQLException
	 */
	public abstract void updateEmpMng(Emp empParam) throws SQLException;

	/**
	 * 조직 모두 조회
	 * @param empParam empParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Emp> listAllMng(Emp empParam) throws SQLException;
	
	/**
	 * 부서리스트
	 * @param empParam empParam
	 * @return ArrayList ArrayList
	 * @throws SQLException SQLException
	 */
	public abstract ArrayList<Emp> listDept() throws SQLException;

	/**
	 * 직원 삭제
	 * @param empParam empParam
	 * @throws SQLException SQLException
	 */
	public abstract void removeEmpMng(Emp empParam) throws SQLException;
}
