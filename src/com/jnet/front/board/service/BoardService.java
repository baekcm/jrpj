package com.jnet.front.board.service;

import java.sql.SQLException;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Minwon;

public interface BoardService {

	
	public abstract void saveMinwonQ(Minwon minwonParam) throws SQLException;

	public abstract void saveSugest(BbsFileReply bbsParam) throws SQLException;

	public void updateSugest(BbsFileReply bbsParam) throws SQLException ;	

	public abstract void saveClean(BbsFileReply bbsParam) throws SQLException;
	
	public void saveAssess(Minwon minwonParam) throws SQLException;
	
}
