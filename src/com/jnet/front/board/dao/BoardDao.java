package com.jnet.front.board.dao;

import java.sql.SQLException;

import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Minwon;

public interface BoardDao {


	public abstract void saveMinwonCommQ(Minwon minwonParam) throws SQLException;
	public abstract void saveMinwonQ(Minwon minwonParam) throws SQLException;
	
	public abstract void updateMinwonHit(Minwon minwonParam) throws SQLException;
	
	public abstract int saveSugest(BbsFileReply bbsParam) throws SQLException;

	public abstract void saveSugestFile(BbsFileReply bbsFile) throws SQLException;
	
	public abstract int saveClean(BbsFileReply bbsParam) throws SQLException;
	
	public abstract void saveCleanFile(BbsFileReply bbsFile) throws SQLException;
	
	public void removeSugestFile(BbsFileReply bbsParam) throws SQLException;
	
	public void updateSugest(BbsFileReply bbsParam) throws SQLException;
}
