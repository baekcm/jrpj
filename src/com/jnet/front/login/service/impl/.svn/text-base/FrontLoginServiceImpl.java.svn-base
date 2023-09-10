package com.jnet.front.login.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.domain.Log;
import com.jnet.domain.Member;
import com.jnet.front.login.dao.FrontLoginDao;
import com.jnet.front.login.service.FrontLoginService;

@Service
public class FrontLoginServiceImpl implements FrontLoginService {

	@Autowired
	private FrontLoginDao frontLoginDao;

	@Override
	public void saveMember(Member member,String userNo) throws SQLException{
		Member outParm = new Member();
		outParm=frontLoginDao.findMemberInfo(member);
		if(!GenericValidator.isBlankOrNull(member.getUserNo())){
			frontLoginDao.updateSggsttb(member);
		}else{
			member.setUserNo(userNo);
			frontLoginDao.saveScmemnotb(member);
			frontLoginDao.saveSggsttb(member);
		}
		if(outParm!=null){
			frontLoginDao.updateMember(member);
		}else{
			frontLoginDao.saveMember(member);
		}
	}
	
	
	@Override
	public void updateDi(Member member) throws SQLException{
		frontLoginDao.updateDi(member);
	}
	
	
	@Override
	public void updateVisit(Member member) throws SQLException{
		frontLoginDao.updateVisit(member);
	}
	
	
	@Override
	public Member findMemberLoginInfo(Member member) throws SQLException{
		return frontLoginDao.findMemberLoginInfo(member);
	}
	
	
	@Override
	public ArrayList<Member> findOldMember(Member member) throws SQLException{
		return frontLoginDao.findOldMember(member);
	}
	
	
	@Override
	public Member findMemberInfo(Member member) throws SQLException{
		return frontLoginDao.findMemberInfo(member);
	}
	
	
	@Override
	public int findMemberIdDup(Map<String, String> hmap) throws SQLException{
		return frontLoginDao.findMemberIdDup(  hmap);
	}
	
	
	@Override
	public int findMemberDuplicate(Map<String, String> hmap) throws SQLException{
		return frontLoginDao.findMemberDuplicate( hmap);
	}
	
	
	@Override
	public Member findOffMember(Map<String, String> hmap) throws SQLException{
		return frontLoginDao.findOffMember( hmap);
	}
	
	@Override
	public String offKey() throws SQLException{
		return frontLoginDao.offKey();
	}
	
	@Override
	public Member findMemberIdPw(Member member) throws SQLException{
		return frontLoginDao.findMemberIdPw(member);
	}
	
	@Override
	public void updatePassword(Member member) throws SQLException{
		frontLoginDao.updateSggsttb(member);
		frontLoginDao.updateMember(member);
	}
	
	@Override
	public void updateOut(Member member) throws SQLException{
		frontLoginDao.updateMember(member);
	}


	@Override
	public void saveLog(Log logParam) throws SQLException {
		frontLoginDao.saveLog(logParam);
	}
}


