package com.jnet.admin.pgmMng.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jnet.admin.pgmMng.dao.AdminPgmMngDao;
import com.jnet.admin.pgmMng.service.AdminPgmMngService;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Pgm;
import com.jnet.domain.PgmImg;
import com.jnet.domain.Teacher;
import com.jnet.domain.TeacherImg;

@Service
public class AdminPgmMngServiceImpl implements AdminPgmMngService {
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminPgmMngDao adminPgmMngDao;

	@Override
	public int findPgmTotCnt(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - findPgmTotCnt");
		return adminPgmMngDao.findPgmTotCnt(outPgmParam);
	}

	@Override
	public ArrayList<OutPgm> listPgmMng(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - listPgmMng");
		return adminPgmMngDao.listPgmMng(outPgmParam);
	}

	@Override
	public PgmImg findPgmMng(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - findPgmMng");
		return adminPgmMngDao.findPgmMng(pgmParam);
	}

	@Override
	public void updatePgmMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - updatePgmMng");
		//1. pgmSeq == 0 insert
		//2. pgmSeq > 0 update
		if(teacherImgParam.getPgmSeq() != null && teacherImgParam.getPgmSeq() > 0) {
			//프로그램 부가정보 update jongno_pgm 테이블
			// (필요 key값)pgm_seq, out_db_pgm_seq
			adminPgmMngDao.updatePgmMng(teacherImgParam);
		} else {
			//프로그램 부가정보 insert jongno_pgm 테이블
			// (필요 key값)pgm_seq
			adminPgmMngDao.savePgmMng(teacherImgParam);
		}
		
		// 대표이미지 delete insert jongno_pgm_img 테이블
		//  (필요 key값)pgm_seq
		if(teacherImgParam.getFileList() != null && teacherImgParam.getFileList().size() >0) {
			adminPgmMngDao.removePgmImg(teacherImgParam);
			for(TeacherImg img : teacherImgParam.getFileList()) {
				img.setModiId(teacherImgParam.getModiId());
				img.setModiIp(teacherImgParam.getModiIp());
				img.setModiYmd(teacherImgParam.getModiYmd());
				img.setModiHms(teacherImgParam.getModiHms());
				img.setPgmSeq(teacherImgParam.getPgmSeq());
				adminPgmMngDao.savePgmImg(img);	
			}
		}
		
		//3. 강사정보 = delete + insert jongno_pgm_teacher 테이블
		//  (필요 key값)teacher_seq , pgm_seq
		if(teacherImgParam.getTeacherSeqArr() != null && teacherImgParam.getTeacherSeqArr().length > 0){
				adminPgmMngDao.removePgmTeacher(teacherImgParam);
			for(int i=0; i<teacherImgParam.getTeacherSeqArr().length;i++) {
				teacherImgParam.setTeacherSeq(teacherImgParam.getTeacherSeqArr()[i]);
				adminPgmMngDao.savePgmTeacher(teacherImgParam);	
			}
		}
	}

	@Override
	public int findTeacherTotCnt() throws SQLException {
		logger.info("AdminPgmMngServiceImpl - findTeacherTotCnt");
		return adminPgmMngDao.findTeacherTotCnt();
	}

	@Override
	public ArrayList<Teacher> listTeacherMng(Teacher teacherParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - listTeacherMng");
		return adminPgmMngDao.listTeacherMng(teacherParam);
	}

	@Override
	public void saveTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - saveTeacherMng");
		//강사 정보 저장
		adminPgmMngDao.saveTeacherMng(teacherImgParam);
		
		// 강사 이미지 저장(일반 + 썸네일)
		if(teacherImgParam.getFileList() != null && teacherImgParam.getFileList().size() >0) {
			for(TeacherImg img : teacherImgParam.getFileList()) {
				img.setCreateId(teacherImgParam.getCreateId());
				img.setCreateIp(teacherImgParam.getCreateIp());
				img.setCreateYmd(teacherImgParam.getCreateYmd());
				img.setCreateHms(teacherImgParam.getCreateHms());
				img.setTeacherSeq(teacherImgParam.getTeacherSeq());
				adminPgmMngDao.saveTeacherImg(img);	
			}
		}
	}

	@Override
	public void updateTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - updateTeacherMng");
		adminPgmMngDao.updateTeacherMng(teacherImgParam);
		
		// 대표이미지 delete insert jongno_pgm_img 테이블
		//  (필요 key값)pgm_seq
		if(teacherImgParam.getFileList() != null && teacherImgParam.getFileList().size() >0) {
			adminPgmMngDao.removeTeacherImg(teacherImgParam);
			for(TeacherImg img : teacherImgParam.getFileList()) {
				img.setCreateId(teacherImgParam.getCreateId());
				img.setCreateIp(teacherImgParam.getCreateIp());
				img.setCreateYmd(teacherImgParam.getCreateYmd());
				img.setCreateHms(teacherImgParam.getCreateHms());
				img.setTeacherSeq(teacherImgParam.getTeacherSeq());
				adminPgmMngDao.saveTeacherImg(img);	
			}
		}
	}

	@Override
	public TeacherImg findTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - findTeacherMng");
		return adminPgmMngDao.findTeacherMng(teacherImgParam);
	}

	@Override
	public ArrayList<OutPgm> listUpId() throws SQLException {
		logger.info("AdminPgmMngServiceImpl - listUpId");
		return adminPgmMngDao.listUpId();
	}

	@Override
	public ArrayList<OutPgm> listSaleIdByUpId(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - listSaleIdByUpId");
		return adminPgmMngDao.listSaleIdByUpId(outPgmParam);
	}

	@Override
	public ArrayList<OutPgm> listBasIdBySaleId(OutPgm outPgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - listBasIdBySaleId");
		return adminPgmMngDao.listBasIdBySaleId(outPgmParam);
	}

	@Override
	public ArrayList<Pgm> findOutPgmMng(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - findOutPgmMng");
		return adminPgmMngDao.findOutPgmMng(pgmParam);
	}

	@Override
	public ArrayList<TeacherImg> listTeacherInfoByPgmSeq(PgmImg pgmResult) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - listTeacherInfoByPgmSeq");
		return adminPgmMngDao.listTeacherInfoByPgmSeq(pgmResult);
	}

	@Override
	public ArrayList<Pgm> listAcceptDate(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - listAcceptDate");
		return adminPgmMngDao.listAcceptDate(pgmParam);
	}

	@Override
	public void updateAccept(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - updateAccept");
		if(pgmParam.getAcceptDateSeqArr() != null && pgmParam.getAcceptDateSeqArr().length > 0){
			for(int i=0; i<pgmParam.getAcceptDateSeqArr().length; i++) {
				//where절 acceptDataSeq로 조회하기때문에
				pgmParam.setAcceptDateSeq(pgmParam.getAcceptDateSeqArr()[i]);
				
				//시작날짜
				if(GenericValidator.isBlankOrNull(pgmParam.getAcceptStYmdArr()[i])){
					pgmParam.setAcceptStYmd(null);	
				} else {
					pgmParam.setAcceptStYmd(pgmParam.getAcceptStYmdArr()[i]);
				}
				//말일 체크유무
				if(pgmParam.getLastDayChkYnArr()[i].equals("Y")) {
					//체크면 마지막일 null
					pgmParam.setAcceptEdYmd(null);
					//체크에 Y
					pgmParam.setLastDayChkYn(pgmParam.getLastDayChkYnArr()[i]);
				} else {
					//체크아니면 마지막일에 마지막 일 입력
					pgmParam.setAcceptEdYmd(pgmParam.getAcceptEdYmdArr()[i]);
					//체크에 N
					pgmParam.setLastDayChkYn("N");
				}
				adminPgmMngDao.updateAccept(pgmParam);	
			}
		}
		
	}
	
	@Override
	public int findAcceptDateByUpId(Map<String, Object> mapParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - findAcceptDateByUpId");
		return adminPgmMngDao.findAcceptDateByUpId(mapParam);
	}

	@Override
	public ArrayList<Pgm> findOutPgmMngforAdminPage(Pgm pgmParam) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - findOutPgmMngforAdminPage");
		return adminPgmMngDao.findOutPgmMngforAdminPage(pgmParam);
	}

	@Override
	public void removeTeacherImg(TeacherImg teacherImgParam, HttpServletRequest request) throws SQLException {
		logger.info("AdminPgmMngServiceImpl - removeTeacherImg");
		ArrayList<TeacherImg> listTeacherImgResult = adminPgmMngDao.listTeacherImgByFileSeq(teacherImgParam);
		if(listTeacherImgResult != null && listTeacherImgResult.size() > 0) {
			for(TeacherImg teacherImg : listTeacherImgResult) {
				//*********파일삭제*********
				//파일 기본경로
	    		String dftFilePath = request.getServletContext().getRealPath("/");
	    		//파일 상세 경로
	    		String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Member" + File.separator + "Lecturer" + File.separator;
	    		//파일 기본경로 _ 상세경로
	    		String filePath = dftFilePath + dtlFilePath;
	    		File file = new File(filePath+teacherImg.getRealFileNm());
	    		if(file.exists()) {
	    			file.delete();
	    		}	
	    		adminPgmMngDao.removeTeacherImg(teacherImg);
			}
		}
	}

	@Override
	public void removeTeacherMng(TeacherImg teacherImgParam) throws SQLException {
		adminPgmMngDao.removeTeacherMng(teacherImgParam);
	}
}
