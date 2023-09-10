package com.jnet.admin.pgmMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.ListIterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.jnet.admin.pgmMng.service.AdminPgmMngService;
import com.jnet.domain.Admin;
import com.jnet.domain.Menu;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Pgm;
import com.jnet.domain.PgmImg;
import com.jnet.domain.Teacher;
import com.jnet.domain.TeacherImg;
import com.jnet.front.program.service.ProgramService;
import com.jnet.util.FileUtil;
import com.jnet.util.PageUtil;
import com.jnet.util.ParsingUtil;

@Controller
public class AdminPgmMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminPgmMngService adminPgmMngService;
	@Autowired
	private ProgramService programService;
	 /**
     * 프로그램 목록 조회
     * @return String String
     */
    @SuppressWarnings("unchecked")
	@RequestMapping("/admin/listPgmMng")
    public String listPgmMng(Model model, Pgm outPgmParam, HttpServletRequest request) {
    	logger.info("AdminPgmMngController - listPgmMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			if(request.getSession().getAttribute("redirectSession") != null){
				PgmImg sessionParam = (PgmImg) request.getSession().getAttribute("redirectSession");
				request.getSession().removeAttribute("redirectSession");
				outPgmParam.setPageNum(sessionParam.getPageNum());
				outPgmParam.setUpId(sessionParam.getUpId());
				outPgmParam.setSaleId(sessionParam.getSaleId());
				outPgmParam.setBasId(sessionParam.getBasId());
				outPgmParam.setTimeCd(sessionParam.getTimeCd());
				outPgmParam.setYymm(sessionParam.getYymm());
			}
				
			Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
			ArrayList<Menu> pgmAuthInfo =(ArrayList<Menu>) request.getSession().getAttribute("pgmAuthInfo");
			int current_page = 1;   // 현재페이지 번호
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findPgmMngCnt = 0;

			commonMenu(model, outPgmParam);
    		
			if(GenericValidator.isBlankOrNull(outPgmParam.getYymm())) {
				String inDate   = new SimpleDateFormat("yyyyMM").format(new Date());
	    		outPgmParam.setYymm(inDate);	
			}
			ArrayList<OutPgm> listUpId = null;
			ArrayList<OutPgm> listSaleIdByUpId = null;
			ArrayList<OutPgm> listBasIdBySaleId = null;
			
			ArrayList<OutPgm> listUpIdTmp = null;
			ArrayList<String> listSaleId = null;
			ArrayList<String> listBasId = null;
    		if(GenericValidator.isBlankOrNull(outPgmParam.getUpId())){
    			if(adminResult.getAdmAuthCode().equals("S")) {
    				listUpId = adminPgmMngService.listUpId();
    				outPgmParam.setUpId(listUpId.get(0).getCodeId());
    	    		listSaleIdByUpId = adminPgmMngService.listSaleIdByUpId(outPgmParam);
    	    		outPgmParam.setSaleId(listSaleIdByUpId.get(0).getCodeId());
    	    		listBasIdBySaleId = adminPgmMngService.listBasIdBySaleId(outPgmParam);
    				outPgmParam.setBasId(listBasIdBySaleId.get(0).getCodeId());	
    			}else if(adminResult.getAdmAuthCode().equals("O")) {
    				listUpId = new ArrayList<OutPgm>();
    				listUpIdTmp = adminPgmMngService.listUpId();
    				
    				if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
    					for(int i=0; i<pgmAuthInfo.size(); i++) {
    		    			for(int j=0; j<listUpIdTmp.size(); j++ ) {
			    				if(pgmAuthInfo.get(i).getSlctFacilId().equals(listUpIdTmp.get(j).getCodeId()) && !listUpId.contains(listUpIdTmp.get(j))) {
			    					listUpId.add(listUpIdTmp.get(j));
			    					continue;
			    				}
    		    			}
    		    		}
	    			}
    				outPgmParam.setUpId(listUpId.get(0).getCodeId());
    				
    				if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
    					listSaleId = new ArrayList<String>();
    					for(int i=0; i<pgmAuthInfo.size(); i++) {
    						if(pgmAuthInfo.get(i).getSlctFacilId().equals(outPgmParam.getUpId())) {
    							listSaleId.add(pgmAuthInfo.get(i).getSaleId());
    						}
    					}
    					outPgmParam.setSaleIdList(listSaleId);
    					outPgmParam.setSaleId(listSaleId.get(0));
    				}
    				
    				listSaleIdByUpId = adminPgmMngService.listSaleIdByUpId(outPgmParam);
    				
    				if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
    					listBasId = new ArrayList<String>();
    					for(int i=0; i<pgmAuthInfo.size(); i++) {
    						if(pgmAuthInfo.get(i).getSlctFacilId().equals(outPgmParam.getUpId()) && pgmAuthInfo.get(i).getSaleId().equals(outPgmParam.getSaleId())) {
    							listBasId.add(pgmAuthInfo.get(i).getMenuSeq());
    						}
    					}
    					outPgmParam.setMenuSeqList(listBasId);
    					outPgmParam.setBasId(listBasId.get(0));
    				}
    				
    				listBasIdBySaleId = adminPgmMngService.listBasIdBySaleId(outPgmParam);
    			}
    		} else {
    			if(adminResult.getAdmAuthCode().equals("S")) {
	    			listUpId = adminPgmMngService.listUpId();
		    		listSaleIdByUpId = adminPgmMngService.listSaleIdByUpId(outPgmParam);
		    		listBasIdBySaleId = adminPgmMngService.listBasIdBySaleId(outPgmParam);
    			}else if(adminResult.getAdmAuthCode().equals("O")) {
    				listUpId = new ArrayList<OutPgm>();
    				listUpIdTmp = adminPgmMngService.listUpId();
    				
    				if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
    					for(int i=0; i<pgmAuthInfo.size(); i++) {
    		    			for(int j=0; j<listUpIdTmp.size(); j++ ) {
			    				if(pgmAuthInfo.get(i).getSlctFacilId().equals(listUpIdTmp.get(j).getCodeId()) && !listUpId.contains(listUpIdTmp.get(j))) {
			    					listUpId.add(listUpIdTmp.get(j));
			    					continue;
			    				}
    		    			}
    		    		}
	    			}
    				
    				if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
    					listSaleId = new ArrayList<String>();
    					for(int i=0; i<pgmAuthInfo.size(); i++) {
    						if(pgmAuthInfo.get(i).getSlctFacilId().equals(outPgmParam.getUpId())) {
    							listSaleId.add(pgmAuthInfo.get(i).getSaleId());
    						}
    					}
    					outPgmParam.setSaleIdList(listSaleId);
    				}
    				
    				listSaleIdByUpId = adminPgmMngService.listSaleIdByUpId(outPgmParam);
    				
    				if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
    					listBasId = new ArrayList<String>();
    					for(int i=0; i<pgmAuthInfo.size(); i++) {
    						if(pgmAuthInfo.get(i).getSlctFacilId().equals(outPgmParam.getUpId()) && pgmAuthInfo.get(i).getSaleId().equals(outPgmParam.getSaleId())) {
    							listBasId.add(pgmAuthInfo.get(i).getMenuSeq());
    						}
    					}
    					outPgmParam.setMenuSeqList(listBasId);
    				}
    				
    				listBasIdBySaleId = adminPgmMngService.listBasIdBySaleId(outPgmParam);
    			}
    		}
    		
    		model.addAttribute("upList",listUpId);
    		model.addAttribute("saleList",listSaleIdByUpId);
    		model.addAttribute("basList",listBasIdBySaleId);
    		
			if(GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) { //blank or null 체크
				outPgmParam.setPageNum("1");
		     }
			
			if(!GenericValidator.isBlankOrNull(outPgmParam.getPageNum())){
				current_page = Integer.parseInt(outPgmParam.getPageNum());
		    } 
    		
    		model.addAttribute("upId",outPgmParam.getUpId());
    		model.addAttribute("saleId",outPgmParam.getSaleId());
    		model.addAttribute("basId",outPgmParam.getBasId());
    		
    		model.addAttribute("timeCd",outPgmParam.getTimeCd());
    		model.addAttribute("yymm",outPgmParam.getYymm());
    		model.addAttribute("pageNum",outPgmParam.getPageNum());
    		findPgmMngCnt = programService.findFrontPgmTotCnt(outPgmParam);
			if(findPgmMngCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findPgmMngCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        outPgmParam.setStart(start);
	        outPgmParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	outPgmParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		outPgmParam.setShowPage(findPgmMngCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		outPgmParam.setShowPage(findPgmMngCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        /*outPgmParam.setNumperPage(numPerPage);*/
	        outPgmParam.setCurrentPage(numPerPage*current_page);
			
    		ArrayList<Pgm> listProgram = programService.listFrontPgm(outPgmParam);
			
			// 목록번호를 화면에 출력하기 위한 로직
			int listNum, n = 0;
	        ListIterator<Pgm> it = listProgram.listIterator();
	        while(it.hasNext()) {
	        	outPgmParam = (Pgm)it.next();
	       	 	listNum = findPgmMngCnt - (start + n) + 1;
	       	 	outPgmParam.setListNo(listNum);
				n++;
			}
	        model.addAttribute("listPgmMng",listProgram);
	        if(listProgram != null && listProgram.size() > 0) {
	        	model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
	        }
	        
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/pgmMng/listPgmMng";
    }
    
    /**
     * 프로그램 수정폼
     * 
     * @param model model
     * @param bbsParam bbsParam
     * @return String
     */
	@RequestMapping(value="/admin/formUpdatePgmMng",method=RequestMethod.POST)
    public String formUpdatePgmMng(Model model, HttpServletRequest request, PgmImg pgmParam) {
    	try {
    		logger.info("AdminPgmMngController - formUpdatePgmMng");
    		commonMenu(model, pgmParam);
    		
    		if(request.getSession().getAttribute("redirectSession") != null || request.getSession().getAttribute("redirectSession") != "") {
        		request.getSession().removeAttribute("redirectSession");
        	}
        	request.getSession().setAttribute("redirectSession", pgmParam);
    		pgmParam.setStart(1);
    		pgmParam.setEnd(10);
    		ArrayList<Pgm> outPgmResult = adminPgmMngService.findOutPgmMngforAdminPage(pgmParam);
    		PgmImg pgmResult = adminPgmMngService.findPgmMng(pgmParam);
    		pgmResult.setUpId(pgmParam.getUpId());
    		ArrayList<TeacherImg> teacherResult = adminPgmMngService.listTeacherInfoByPgmSeq(pgmResult);
    		//pgmResult.setStrTarget(pgmResult.getStrTarget().replaceAll("\r\n", "<br/>"));
    		model.addAttribute("pgmParam",pgmParam);
    		model.addAttribute("outpgm",outPgmResult);
    		model.addAttribute("pgm",pgmResult);
    		model.addAttribute("teacher",teacherResult);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/pgmMng/formUpdatePgmMng";
    }
	
	/**
     * 프로그램 수정
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/updatePgmMng",method=RequestMethod.POST)
    public String updatePgmMng(HttpServletRequest request, TeacherImg teacherImgParam) {
    	logger.info("AdminPgmMngController - updatePgmMng");
    	String rlFileNm = "";
		String thFileNm = "";
		//파일 기본경로
		String dftFilePath = request.getServletContext().getRealPath("/");
		//파일 상세 경로
		String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Pgm" + File.separator;
		//파일 기본경로 _ 상세경로
		String filePath = dftFilePath + dtlFilePath;
		ArrayList<TeacherImg> fileList = null;
    	try {
    		Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            
            teacherImgParam.setModiYmd(inDate);
            teacherImgParam.setModiHms(inTime);
            teacherImgParam.setModiIp(request.getRemoteAddr());
            teacherImgParam.setModiId(admInfo.getAdmId());
    		File file = null;
    		TeacherImg tmpTeacherImg = null;
    		//파일처리
    		if(teacherImgParam.getDelegateImg() != null && teacherImgParam.getDelegateImg().getOriginalFilename() != null && !teacherImgParam.getDelegateImg().getOriginalFilename().equals("")) {
    			tmpTeacherImg = new TeacherImg();
    			fileList = new ArrayList<TeacherImg>();
    			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());

        		//파일 교체시 기존 파일 삭제
        		if(!GenericValidator.isBlankOrNull(teacherImgParam.getRealFileNm())){
    				file = new File(filePath + teacherImgParam.getRealFileNm());
    				if(file.exists()) {
    					if(file.delete()){
    						file = new File(filePath + teacherImgParam.getRealFileNm().replaceAll("thumb_", ""));
    						if(file.exists()) {
    							file.delete();
    						}
    					}
    				}
    			}
        		
        		file = new File(filePath);
        		
        		if(!file.exists()) {
        			file.mkdirs();
        		}
        		//db 저장될 경로
        		String dbPath = "/resources/Pds/Pgm/";
        		String realFileNm = "";
        		
				realFileNm = admInfo.getAdmId()+today+UUID.randomUUID().toString() + teacherImgParam.getDelegateImg().getOriginalFilename().substring(teacherImgParam.getDelegateImg().getOriginalFilename().lastIndexOf("."));
				
				tmpTeacherImg.setImgPath(dbPath);
				tmpTeacherImg.setOrgnlFileNm(teacherImgParam.getDelegateImg().getOriginalFilename());
				tmpTeacherImg.setRealFileNm(realFileNm);
				tmpTeacherImg.setFileSize(teacherImgParam.getDelegateImg().getSize());
				tmpTeacherImg.setThumbYn("N");
				fileList.add(tmpTeacherImg);
				//파일저장
				rlFileNm = filePath + realFileNm;
				thFileNm = filePath + "thumb_"+realFileNm ;
				
				file = new File(rlFileNm);
				teacherImgParam.getDelegateImg().transferTo(file);
				File thumbFile = new File(thFileNm);
				//썸네일 생성 부분
		        boolean thumbYn = FileUtil.mkThumbNail(file, thumbFile, 145, 145);
		        if(thumbYn){
		        	tmpTeacherImg = new TeacherImg();
		        	
		        	tmpTeacherImg.setImgPath(dbPath);
		        	tmpTeacherImg.setOrgnlFileNm(teacherImgParam.getDelegateImg().getOriginalFilename());
		        	tmpTeacherImg.setRealFileNm("thumb_"+realFileNm );
		        	tmpTeacherImg.setFileSize(thumbFile.length());
		        	tmpTeacherImg.setThumbYn("Y");
					fileList.add(tmpTeacherImg);
		        }
		        teacherImgParam.setFileList(fileList);
    		}
            adminPgmMngService.updatePgmMng(teacherImgParam);
		} catch (Exception e) {
			File fileRemoveFile = null;
			if(fileList != null && fileList.size() > 0){
				for(TeacherImg teacherImg : fileList) {
					fileRemoveFile = new File(dtlFilePath+teacherImg.getRealFileNm());
					if(fileRemoveFile.exists()) {
						fileRemoveFile.delete();
					}
				}
			}
			printStackTrace(e);
		}
    	return "redirect:/admin/listPgmMng?gseq="+teacherImgParam.getGseq()+"&lseq="+teacherImgParam.getLseq();
    }
    
    
    @RequestMapping(value="/admin/removeTeacherImg",method=RequestMethod.POST)
    public void removeTeacherImg(Model model, HttpServletRequest request, HttpServletResponse response, TeacherImg teacherImgParam) {
    	logger.info("AdminPgmMngController - removeTeacherImg");
    	JSONObject jsonObj = null;
    	try {
    		jsonObj = new JSONObject(); 
    		adminPgmMngService.removeTeacherImg(teacherImgParam,request);
        	jsonObj.put("flag", "Y");
		} catch (Exception e) {
			jsonObj = new JSONObject();
			printStackTrace(e);
			jsonObj.put("flag",e.toString());
		} finally{
			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				printStackTrace(e);
			}
		}
    }
    
    /**
     * 강사 삭제
     * @param model model
     * @param request request
     * @param response response
     * @param teacherImgParam  teacherImgParam
     * @return
     */
    @RequestMapping(value="/admin/removeTeacherMng",method=RequestMethod.POST)
    public String removeTeacherMng(Model model, HttpServletRequest request, HttpServletResponse response, TeacherImg teacherImgParam) {
    	logger.info("AdminPgmMngController - removeTeacherMng");
    	try {
    		ArrayList<String> teacherSeqList = null;
    		if(teacherImgParam.getTeacherSeqArr() != null && teacherImgParam.getTeacherSeqArr().length > 0) {
    			teacherSeqList = new ArrayList<String>();
    			for(int i=0; i<teacherImgParam.getTeacherSeqArr().length; i++){
    				teacherSeqList.add(String.valueOf(teacherImgParam.getTeacherSeqArr()[i]));
        		}	
    		}
    		
    		if(teacherSeqList != null && teacherSeqList.size() > 0) {
    			teacherImgParam.setTeacherSeqList(teacherSeqList);
    		}
    		adminPgmMngService.removeTeacherMng(teacherImgParam);
    		
		} catch (Exception e) {
			printStackTrace(e);
		} 
		return "redirect:/admin/listTeacherMng?gseq="+teacherImgParam.getGseq()+"&lseq="+teacherImgParam.getLseq();
    }
    
    
    
    /**
     * 강사 목록 조회
     * @return String String
     */
    @RequestMapping("/admin/listTeacherMng")
    public String listTeacherMng(Model model, Teacher teacherParam) {
    	logger.info("AdminPgmMngController - listTeacherMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			commonMenu(model, teacherParam);
	
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findTeacherTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(teacherParam.getPageNum())) teacherParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(teacherParam.getSearchKey()))  teacherParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(teacherParam.getSearchVal())) teacherParam.setSearchVal("");
			
			model.addAttribute("searchKey",teacherParam.getSearchKey());
			model.addAttribute("searchVal",teacherParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(teacherParam.getPageNum())) current_page = Integer.parseInt(teacherParam.getPageNum());
			findTeacherTotCnt = adminPgmMngService.findTeacherTotCnt();
			
			if(findTeacherTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findTeacherTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        teacherParam.setStart(start);
	        teacherParam.setEnd(end);
	        
			ArrayList<Teacher> listTeacherMng = adminPgmMngService.listTeacherMng(teacherParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
				int listNum, n = 0;
		        ListIterator<Teacher> it = listTeacherMng.listIterator();
		        while(it.hasNext()) {
		        	teacherParam = (Teacher)it.next();
		       	 	listNum = findTeacherTotCnt - (start + n) + 1;
		       	 teacherParam.setListNo(listNum);
					n++;
				}
	        model.addAttribute("listTeacherMng",listTeacherMng);
	        if(listTeacherMng != null && listTeacherMng.size() > 0) {
	        	model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
	        }
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/pgmMng/listTeacherMng";
    }
    
    /**
     * 강사 등록폼
     * 
     * @param model model
     * @param bbsParam bbsParam
     * @return String
     */
	@RequestMapping("/admin/formCreateTeacherMng")
    public String formCreateTeacherMng(Model model, Pgm	pgmParam) {
		try {
			logger.info("AdminPgmMngController - formCreateTeacherMng");
			commonMenu(model, pgmParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/pgmMng/formCreateTeacherMng";
    }


	/**
     * 강사 등록폼
     * 
     * @param model model
     * @param bbsParam bbsParam
     * @return String
     */
	@RequestMapping(value="/admin/saveTeacherMng",method=RequestMethod.POST)
    public String saveTeacherMng(HttpServletRequest request, Model model, TeacherImg teacherImgParam) {
		logger.info("AdminPgmMngController - saveTeacherMng");
		String rlFileNm = "";
		String thFileNm = "";
		//파일 기본경로
		String dftFilePath = request.getServletContext().getRealPath("/");
		//파일 상세 경로
		String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Member" + File.separator + "Lecturer" + File.separator;
		//파일 기본경로 _ 상세경로
		String filePath = dftFilePath + dtlFilePath;
		ArrayList<TeacherImg> fileList = null;
		try {
			Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            
            teacherImgParam.setCreateYmd(inDate);
            teacherImgParam.setCreateHms(inTime);
            teacherImgParam.setCreateIp(request.getRemoteAddr());
            teacherImgParam.setCreateId(admInfo.getAdmId());
    		File file = null;
    		TeacherImg tmpTeacherImg = null;
    		//파일처리
    		if(teacherImgParam.getTeacherImg() != null && teacherImgParam.getTeacherImg().getOriginalFilename() != null && !teacherImgParam.getTeacherImg().getOriginalFilename().equals("")) {
    			tmpTeacherImg = new TeacherImg();
    			fileList = new ArrayList<TeacherImg>();
    			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());

        		//파일 교체시 기존 파일 삭제
        		if(!GenericValidator.isBlankOrNull(teacherImgParam.getRealFileNm())){
    				file = new File(filePath + teacherImgParam.getRealFileNm());
    				if(file.exists()) {
    					if(file.delete()){
    						file = new File(filePath + teacherImgParam.getRealFileNm().replaceAll("thumb_", ""));
    						if(file.exists()) {
    							file.delete();
    						}
    					}
    				}
    			}
        		
        		file = new File(filePath);
        		
        		if(!file.exists()) {
        			file.mkdirs();
        		}
        		//db 저장될 경로
        		String dbPath = "/resources/Pds/Member/Lecturer/";
        		String realFileNm = "";
        		
				realFileNm = admInfo.getAdmId()+today+UUID.randomUUID().toString() + teacherImgParam.getTeacherImg().getOriginalFilename().substring(teacherImgParam.getTeacherImg().getOriginalFilename().lastIndexOf("."));
				
				tmpTeacherImg.setImgPath(dbPath);
				tmpTeacherImg.setOrgnlFileNm(teacherImgParam.getTeacherImg().getOriginalFilename());
				tmpTeacherImg.setRealFileNm(realFileNm);
				tmpTeacherImg.setThumbYn("N");
				fileList.add(tmpTeacherImg);
				//파일저장
				rlFileNm = filePath + realFileNm;
				thFileNm = filePath + "thumb_"+realFileNm ;
				file = new File(rlFileNm);
				teacherImgParam.getTeacherImg().transferTo(file);
				File thumbFile = new File(thFileNm);
				//썸네일 생성 부분
		        boolean thumbYn = FileUtil.mkThumbNail(file, thumbFile, 120, 120);
		        if(thumbYn){
		        	tmpTeacherImg = new TeacherImg();
		        	
		        	tmpTeacherImg.setImgPath(dbPath);
		        	tmpTeacherImg.setOrgnlFileNm(teacherImgParam.getTeacherImg().getOriginalFilename());
		        	tmpTeacherImg.setRealFileNm("thumb_"+realFileNm );
		        	tmpTeacherImg.setFileSize(thumbFile.length());
		        	tmpTeacherImg.setThumbYn("Y");
					fileList.add(tmpTeacherImg);
		        }
		        teacherImgParam.setFileList(fileList);
    		}
            adminPgmMngService.saveTeacherMng(teacherImgParam);
		} catch (Exception e) {
			File fileRemoveFile = null;
			if(fileList != null && fileList.size() > 0){
				for(TeacherImg teacherImg : fileList) {
					fileRemoveFile = new File(dtlFilePath+teacherImg.getRealFileNm());
					if(fileRemoveFile.exists()) {
						fileRemoveFile.delete();
					}
				}
			}
			printStackTrace(e);
		}
    	return "redirect:/admin/listTeacherMng?gseq="+teacherImgParam.getGseq()+"&lseq="+teacherImgParam.getLseq();
    }
	
	
	 /**
     * 강사 수정폼
     * 
     * @param model model
     * @param teacherImgParam teacherImgParam
     * @return String String
     */
	@RequestMapping(value="/admin/formUpdateTeacherMng",method=RequestMethod.POST)
    public String formUpdateTeacherMng(Model model, TeacherImg teacherImgParam) {
		logger.info("AdminPgmMngController - formUpdateTeacherMng");
		try {
			commonMenu(model, teacherImgParam);
			
			//강사정보 상세조회
			TeacherImg teacherResult = adminPgmMngService.findTeacherMng(teacherImgParam);
			model.addAttribute("teacher",teacherResult);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/pgmMng/formUpdateTeacherMng";
    }
	
	
	/**
     * 강사 수정
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/updateTeacherMng",method=RequestMethod.POST)
    public String updateTeacherMng(HttpServletRequest request, TeacherImg teacherImgParam) {
    	try {
    		logger.info("AdminPgmMngController - updateTeacherMng");
    		Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            
            teacherImgParam.setModiYmd(inDate);
            teacherImgParam.setModiHms(inTime);
            teacherImgParam.setModiIp(request.getRemoteAddr());
            teacherImgParam.setModiId(admInfo.getAdmId());
            teacherImgParam.setCreateYmd(inDate);
            teacherImgParam.setCreateHms(inTime);
            teacherImgParam.setCreateIp(request.getRemoteAddr());
            teacherImgParam.setCreateId(admInfo.getAdmId());
    		
    		File file = null;
    		ArrayList<TeacherImg> fileList = null;
    		TeacherImg tmpTeacherImg = null;
    		//파일처리
    		if(teacherImgParam.getTeacherImg() != null && teacherImgParam.getTeacherImg().getOriginalFilename() != null && !teacherImgParam.getTeacherImg().getOriginalFilename().equals("")) {
    			tmpTeacherImg = new TeacherImg();
    			fileList = new ArrayList<TeacherImg>();
    			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				
    			//파일 기본경로
        		String dftFilePath = request.getServletContext().getRealPath("/");
        		//파일 상세 경로
        		String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Member" + File.separator + "Lecturer" + File.separator;
        		//파일 기본경로 _ 상세경로
        		String filePath = dftFilePath + dtlFilePath;

        		//파일 교체시 기존 파일 삭제
        		if(!GenericValidator.isBlankOrNull(teacherImgParam.getRealFileNm())){
    				file = new File(filePath + teacherImgParam.getRealFileNm());
    				if(file.exists()) {
    					if(file.delete()){
    						file = new File(filePath + teacherImgParam.getRealFileNm().replaceAll("thumb_", ""));
    						if(file.exists()) {
    							file.delete();
    						}
    					}
    				}
    			}
        		
        		file = new File(filePath);
        		
        		if(!file.exists()) {
        			file.mkdirs();
        		}
        		//db 저장될 경로
        		String dbPath = "/resources/Pds/Member/Lecturer/";
        		String realFileNm = "";
        		
				realFileNm = admInfo.getAdmId()+today+UUID.randomUUID().toString() + teacherImgParam.getTeacherImg().getOriginalFilename().substring(teacherImgParam.getTeacherImg().getOriginalFilename().lastIndexOf("."));
				
				tmpTeacherImg.setImgPath(dbPath);
				tmpTeacherImg.setOrgnlFileNm(teacherImgParam.getTeacherImg().getOriginalFilename());
				tmpTeacherImg.setRealFileNm(realFileNm);
				tmpTeacherImg.setFileSize(teacherImgParam.getTeacherImg().getSize());
				tmpTeacherImg.setThumbYn("N");
				fileList.add(tmpTeacherImg);
				//파일저장
				file = new File(filePath + realFileNm);
				teacherImgParam.getTeacherImg().transferTo(file);
				File thumbFile = new File(filePath + "thumb_"+realFileNm );
				//썸네일 생성 부분
		        boolean thumbYn = FileUtil.mkThumbNail(file, thumbFile, 120, 120);
		        if(thumbYn){
		        	tmpTeacherImg = new TeacherImg();
		        	
		        	tmpTeacherImg.setImgPath(dbPath);
		        	tmpTeacherImg.setOrgnlFileNm(teacherImgParam.getTeacherImg().getOriginalFilename());
		        	tmpTeacherImg.setRealFileNm("thumb_"+realFileNm );
		        	tmpTeacherImg.setFileSize(thumbFile.length());
		        	tmpTeacherImg.setThumbYn("Y");
					fileList.add(tmpTeacherImg);
		        }
		        teacherImgParam.setFileList(fileList);
    		}
            adminPgmMngService.updateTeacherMng(teacherImgParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listTeacherMng?gseq="+teacherImgParam.getGseq()+"&lseq="+teacherImgParam.getLseq();
    }
    
    /**
     * 조직관리 목록 조회
     * @return String String
     */
    @RequestMapping("/admin/listTeacherMngPop")
    public String listTeacherMngPop(Model model, Teacher teacherParam) {
    	logger.info("AdminPgmMngController - listTeacherMngPop");
    	PageUtil PageUtil = new PageUtil();
		try {
			commonMenu(model, teacherParam);
	
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findTeacherTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(teacherParam.getPageNum())) teacherParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(teacherParam.getSearchKey()))  teacherParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(teacherParam.getSearchVal())) teacherParam.setSearchVal("");
			
			model.addAttribute("searchKey",teacherParam.getSearchKey());
			model.addAttribute("searchVal",teacherParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(teacherParam.getPageNum())) current_page = Integer.parseInt(teacherParam.getPageNum());
			findTeacherTotCnt = adminPgmMngService.findTeacherTotCnt();
			if(findTeacherTotCnt > 0)
				total_page = PageUtil.getPageCount(numPerPage,  findTeacherTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        teacherParam.setStart(start);
	        teacherParam.setEnd(end);
	        
			ArrayList<Teacher> listTeacherMng = adminPgmMngService.listTeacherMng(teacherParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
				int listNum, n = 0;
		        ListIterator<Teacher> it = listTeacherMng.listIterator();
		        while(it.hasNext()) {
		        	teacherParam = (Teacher)it.next();
		       	 	listNum = findTeacherTotCnt - (start + n) + 1;
		       	 teacherParam.setListNo(listNum);
					n++;
				}
	        model.addAttribute("listTeacherMng",listTeacherMng);
	        if(listTeacherMng != null && listTeacherMng.size() > 0) {
	        	model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
	        }
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/pgmMng/listTeacherMngPop";
    }
    
	
    /**
     * 1차카테고리 ajax 목록조회
     * @param response response
     * @param outPgmParam outPgmParam
     */
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/listSaleIdByUpId",method=RequestMethod.POST)
    public void listSaleIdByUpId(HttpServletRequest request, HttpServletResponse response, OutPgm outPgmParam) {
    	logger.info("AdminPgmMngController - listSaleIdByUpId");
    	JSONObject jsonObj = null;
    	try {
    		ArrayList<Menu> pgmAuthInfo =(ArrayList<Menu>) request.getSession().getAttribute("pgmAuthInfo");
    		Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
    		
			ArrayList<OutPgm> listSaleIdByUpId = null;
			ArrayList<String> listSaleId = null;
			
    		JSONArray jsonArr = new JSONArray();
    		//popSeq 팝업테이블 조회
    		if(adminResult.getAdmAuthCode().equals("S")) {
    			listSaleIdByUpId = adminPgmMngService.listSaleIdByUpId(outPgmParam);	
    		} else if(adminResult.getAdmAuthCode().equals("O")) {
    			if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
					listSaleId = new ArrayList<String>();
					for(int i=0; i<pgmAuthInfo.size(); i++) {
						if(pgmAuthInfo.get(i).getSlctFacilId().equals(outPgmParam.getUpId())) {
							listSaleId.add(pgmAuthInfo.get(i).getSaleId());
						}
					}
					outPgmParam.setSaleIdList(listSaleId);
					outPgmParam.setSaleId(listSaleId.get(0));
				}
    			
    			listSaleIdByUpId = adminPgmMngService.listSaleIdByUpId(outPgmParam);
    			
    		}
        	
        	for(OutPgm outPgm : listSaleIdByUpId) {
        		jsonObj = new JSONObject();
        		jsonObj.put("id", outPgm.getCodeId());
        		jsonObj.put("nm", outPgm.getCodeNm());
        		jsonArr.add(jsonObj);
        	}
        	jsonObj = new JSONObject();
        	jsonObj.put("listSaleIdByUpId",jsonArr);
        	jsonObj.put("flag", "Y");
		} catch (Exception e) {
			jsonObj = new JSONObject();
			printStackTrace(e);
			jsonObj.put("flag",e.toString());
		} finally{
			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				printStackTrace(e);
			}
		}
    }
    
    /**
     * 2차카테고리 ajax 목록 조회
     * @param response response
     * @param outPgmParam outPgmParam
     */
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/listBasIdBySaleId",method=RequestMethod.POST)
    public void listBasIdBySaleId(HttpServletRequest request, HttpServletResponse response, OutPgm outPgmParam) {
    	logger.info("AdminPgmMngController - listBasIdBySaleId");
    	JSONObject jsonObj = null;
    	try {
    		ArrayList<Menu> pgmAuthInfo =(ArrayList<Menu>) request.getSession().getAttribute("pgmAuthInfo");
    		Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
    		
    		JSONArray jsonArr = new JSONArray();
    		
			ArrayList<OutPgm> listBasIdBySaleId = null;
			ArrayList<String> listBasId = null;
			
    		//popSeq 팝업테이블 조회
    		if(adminResult.getAdmAuthCode().equals("S")) {
    			listBasIdBySaleId = adminPgmMngService.listBasIdBySaleId(outPgmParam);
    		} else if(adminResult.getAdmAuthCode().equals("O")) {
    			if(pgmAuthInfo != null && pgmAuthInfo.size() > 0) {
					listBasId = new ArrayList<String>();
					for(int i=0; i<pgmAuthInfo.size(); i++) {
						if(pgmAuthInfo.get(i).getSlctFacilId().equals(outPgmParam.getUpId()) && pgmAuthInfo.get(i).getSaleId().equals(outPgmParam.getSaleId())) {
							listBasId.add(pgmAuthInfo.get(i).getMenuSeq());
						}
					}
					outPgmParam.setMenuSeqList(listBasId);
					outPgmParam.setBasId(listBasId.get(0));
				}
    			
    			listBasIdBySaleId = adminPgmMngService.listBasIdBySaleId(outPgmParam);
    		}
        	
        	for(OutPgm outPgm : listBasIdBySaleId) {
        		jsonObj = new JSONObject();
        		jsonObj.put("id", outPgm.getCodeId());
        		jsonObj.put("nm", outPgm.getCodeNm());
        		jsonArr.add(jsonObj);
        	}
        	jsonObj = new JSONObject();
        	jsonObj.put("listBasIdBySaleId",jsonArr);
        	jsonObj.put("flag", "Y");
		} catch (Exception e) {
			jsonObj = new JSONObject();
			printStackTrace(e);
			jsonObj.put("flag",e.toString());
		} finally{
			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				printStackTrace(e);
			}
		}
    }
    
    
    /**
     * 프로그램 수정폼
     * 
     * @param model model
     * @param bbsParam bbsParam
     * @return String
     */
	@RequestMapping(value="/admin/formAccept")
    public String formAccept(Model model, Pgm	pgmParam, HttpServletRequest request) {
    	try {
    		logger.info("AdminPgmMngController - formAccept");
    		commonMenu(model, pgmParam);
    		Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
			
    		pgmParam.setCodeGbnCd("up_id");
    		pgmParam.setAdmAuthCode(adminResult.getAdmAuthCode());
    		pgmParam.setAdmSeq(adminResult.getAdmSeq());
    		pgmParam.setPgmGbnCd("PGM");
			ArrayList<Pgm> listAcceptDate = adminPgmMngService.listAcceptDate(pgmParam);
			
			if(listAcceptDate != null && listAcceptDate.size() > 0) {
				  Calendar cal = Calendar.getInstance(); 
				  cal.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),1);
				  int year = cal.get ( Calendar.YEAR ); 
				  int month = cal.get ( Calendar.MONTH )+1; 
				  int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); 
				  
				for(Pgm pgm : listAcceptDate) {
					pgm.setThisMaxDate(cal.getActualMaximum ( Calendar.DATE ));
					if(!GenericValidator.isBlankOrNull(pgm.getAcceptStYmd())){
						//말일이 null일경우
						if(GenericValidator.isBlankOrNull(pgm.getAcceptEdYmd())) {
							//항상 말일에 체크일경우
							if(!GenericValidator.isBlankOrNull(pgm.getLastDayChkYn()) && pgm.getLastDayChkYn().equals("Y")){
								String st = year+"년" + month+"월" +  pgm.getAcceptStYmd() + "일";
								String ed = year+"년" + month+"월" +  endDay + "일";
								pgm.setThisDateYmd(st + "~" + ed);
							}
						}else{
							String st = year+"년" + month+"월" +  pgm.getAcceptStYmd() + "일";
							String ed = year+"년" + month+"월" +  pgm.getAcceptEdYmd() + "일";
							pgm.setThisDateYmd(st + "~" + ed);
						}
					}
				}
			}
			model.addAttribute("listAcceptDate",listAcceptDate);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/pgmMng/formAccept";
    }
	
	
	/**
	 * 접수일설정 변경
	 * @param request request
	 * @param pgmParam pgmParam
	 * @return String String
	 */
	@RequestMapping(value="/admin/updateAccept",method=RequestMethod.POST)
    public String updateAccept(HttpServletRequest request, Pgm pgmParam) {
    	try {
    		logger.info("AdminPgmMngController - updateAccept");
            adminPgmMngService.updateAccept(pgmParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/formAccept?gseq="+pgmParam.getGseq()+"&lseq="+pgmParam.getLseq();
    }
	
    //메뉴 공통 메서드
    private void commonMenu(Model model, Menu menuParam) throws SQLException{
		/////////////////////LNB 메뉴///////////////////
		model.addAttribute("gseq",menuParam.getGseq());
		model.addAttribute("lseq",menuParam.getLseq());
		///////////////////////////////////////////////
    }
    
    private void printStackTrace(Exception e){
    	logger.error("======= error =========");
		ByteArrayOutputStream out = new ByteArrayOutputStream();
	    PrintStream pinrtStream = new PrintStream(out);
	    e.printStackTrace(pinrtStream);
	    String stackTraceString = out.toString();
	    logger.error(stackTraceString);
    }
}