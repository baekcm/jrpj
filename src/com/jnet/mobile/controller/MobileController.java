package com.jnet.mobile.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jnet.admin.bbsMng.service.AdminBbsMngService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.admin.pgmMng.service.AdminPgmMngService;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Pgm;
import com.jnet.domain.PgmImg;
import com.jnet.domain.TeacherImg;
import com.jnet.front.notice.service.NoticeBbsService;
import com.jnet.front.program.service.ProgramService;
import com.jnet.util.PageUtil;

@Controller
public class MobileController {
	
	@Autowired
	private NoticeBbsService noticeBbsService;

	@Autowired
	private AdminBbsMngService adminCtsBbsService;
	
	@Autowired
	private ProgramService programService;
	
	@Autowired
	private AdminPgmMngService adminPgmMngService;
	
	@Autowired
	private AdminMgrMngService adminMgrMngService;
	
	@RequestMapping("/m/index")
	public String mobileIndex(Model model,BbsFileReply bbsParam, HttpServletRequest request) {
		/*PageUtil PageUtil = new PageUtil();*/
		try {
			int numPerPage  = 5; // 한 화면에 보여주는 게시물 수
			/*int total_page 	= 0;*/
			int total_count = 0;
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");

	        // 리스트에 출력할 데이터를 가져오기 
	        int end   = 5;
	        int start = end - (numPerPage - 1);
	        bbsParam.setStart(start);
	        bbsParam.setEnd(end);
	        bbsParam.setCurrentPage(5);
	        bbsParam.setShowPage(5);
	        bbsParam.setBoardSeq(4);
			ArrayList<BbsFileReply> noticeListBbs = noticeBbsService.noticeListBbs(bbsParam);
			bbsParam.setBoardSeq(9);
			ArrayList<BbsFileReply> listTender = noticeBbsService.noticeListBbs(bbsParam);
			bbsParam.setBoardSeq(10);
			ArrayList<BbsFileReply> listRecruit = noticeBbsService.noticeListBbs(bbsParam);
			bbsParam.setBoardSeq(8);
			ArrayList<BbsFileReply> listLecture = noticeBbsService.noticeListBbs(bbsParam);
			BbsFileReply bbsResult = adminCtsBbsService.findBbs(bbsParam);
			model.addAttribute("bbs",bbsResult);
			Common commonParam = new Common();
	 	    commonParam.setCodeGbnCd("up_id");
			
	 	    // 사업장 목록조회
			ArrayList<Common> facilList = noticeBbsService.listFacil(commonParam);
			model.addAttribute("facilList", facilList);
			
			// 목록번호를 화면에 출력하기 위한 로직
	        listNoSet(bbsParam, noticeListBbs, start, total_count);
	        
	        model.addAttribute("noticeListBbs", noticeListBbs);
	        model.addAttribute("listTender", listTender);
	        model.addAttribute("listRecruit", listRecruit);
	        model.addAttribute("listLecture", listLecture);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "front/mobile/index";
	}
	
	
	@RequestMapping("/m/{depth1}/{depth2}")
	public String mobile(@PathVariable("depth1") String depth1,@PathVariable("depth2") String depth2) {
		String returnStr="front/mobile";
		try{
			if(!GenericValidator.isBlankOrNull(depth1)){
				returnStr=returnStr+"/"+depth1;			
				if(!GenericValidator.isBlankOrNull(depth2)){
					returnStr=returnStr+"/"+depth2;	
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return returnStr;
	}
	

	@RequestMapping("/m/{depth1}/{depth2}/{depth3}")
	public String mobile(@PathVariable("depth1") String depth1,@PathVariable("depth2") String depth2,@PathVariable("depth3") String depth3) {
		String returnStr="front/mobile";
		try{
			if(!GenericValidator.isBlankOrNull(depth1)){
				returnStr=returnStr+"/"+depth1;			
				if(!GenericValidator.isBlankOrNull(depth2)){
					returnStr=returnStr+"/"+depth2;	
					if(!GenericValidator.isBlankOrNull(depth3)){
						returnStr=returnStr+"/"+depth3;
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return returnStr;
	}
	
	
	@RequestMapping("/m/findNotice")
	public String findNotice(Model model,BbsFileReply bbsParam, HttpServletRequest request) {
		try{
	   		ArrayList<BbsFileReply> noticeViewResult = noticeBbsService.noticeViewBbs(bbsParam);
	   		 
	   		// 조회 카운트 증가 처리
	   		noticeBbsService.updateHitCount(bbsParam);
			Common commonParam = new Common();
	 	    commonParam.setCodeGbnCd("up_id");
			
	 	    // 사업장 목록조회
			ArrayList<Common> facilList = noticeBbsService.listFacil(commonParam);
			
			BbsFileReply bbsResult = adminCtsBbsService.findBbs(bbsParam);
			model.addAttribute("facilList", facilList);
	   		model.addAttribute("noticeList", noticeViewResult);
	   		model.addAttribute("pTitle", bbsResult.getBoardNm());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "front/mobile/notice/notice_view";
	}
	
	
	@RequestMapping("/m/listNotice")
	public String listNotice(Model model,BbsFileReply bbsParam, HttpServletRequest request) {
		PageUtil PageUtil = new PageUtil();
   		
		try {
			
			int numPerPage  = 8; // 한 화면에 보여주는 게시물 수
			int total_page 	= 0;
			int total_count = 0;
			//bbsParam.setBoardSeq(4);
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchKey())) bbsParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchVal())) bbsParam.setSearchVal("");
			
			model.addAttribute("commCodeSeq", bbsParam.getCommCodeSeq());
			model.addAttribute("searchKey", bbsParam.getSearchKey());
			model.addAttribute("searchVal", bbsParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			
			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) 
				current_page = Integer.parseInt(bbsParam.getPageNum());
			
			total_count = noticeBbsService.noticeListBbsTotCnt(bbsParam);
			
			if(total_count > 0) 
				total_page = PageUtil.getPageCount(numPerPage, total_count);

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기 
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        bbsParam.setStart(start);
	        bbsParam.setEnd(end);
	        
	        if(total_page > current_page) {
  	        	//최종페이지 기본 수 만큼 set
  	        	bbsParam.setShowPage(numPerPage);
  	        }else {
  	        	if(current_page == 1) {
  	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
  	        		bbsParam.setShowPage(total_count);
  	        	} else {
  	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
  	        		bbsParam.setShowPage(total_count - ((current_page-1) * numPerPage));	
  	        	}
  	        }
	        
  	        bbsParam.setNumperPage(numPerPage);
  	        bbsParam.setCurrentPage(current_page*numPerPage);
			ArrayList<BbsFileReply> noticeListBbs = noticeBbsService.noticeListBbs(bbsParam);
			BbsFileReply bbsResult = adminCtsBbsService.findBbs(bbsParam);
			model.addAttribute("bbs",bbsResult);
			Common commonParam = new Common();
	 	    commonParam.setCodeGbnCd("up_id");
			
	 	    // 사업장 목록조회
			ArrayList<Common> facilList = noticeBbsService.listFacil(commonParam);
			model.addAttribute("facilList", facilList);
			
			// 목록번호를 화면에 출력하기 위한 로직
	        listNoSet(bbsParam, noticeListBbs, start, total_count);
	        
	        model.addAttribute("noticeListBbs", noticeListBbs);
	        model.addAttribute("pTitle", bbsResult.getBoardNm());
	        model.addAttribute("boardSeq", bbsResult.getBoardSeq());
	        if(noticeListBbs != null && noticeListBbs.size() > 0)
	        	model.addAttribute("pageIndexList", PageUtil.mPageIndexList(current_page, total_page));
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "front/mobile/notice/notice_list";
	}
	
    private void listNoSet(BbsFileReply bbsParam,ArrayList<BbsFileReply> list, int start, int totCnt){
    	
		int listNum, n = 0;
        ListIterator<BbsFileReply> it = list.listIterator();
        
        while(it.hasNext()) {
        	bbsParam = (BbsFileReply)it.next();
       	 	listNum = totCnt - (start + n) + 1;
       	 	bbsParam.setListNo(listNum);
			n++;
		}
        
    }
    
    /**
     * 프로그램 메인 페이지 (프로그램 카테고리 목록 페이지)
     * @param model model
     * @param pgmParam pgmParam
     * @param upId upId
     * @return String String
     */
    @RequestMapping("/m/program/index/{upId}")
    public String programIndex(Model model, Pgm pgmParam,@PathVariable("upId") String upId) {
		try {
			commonPgmMthd(model, pgmParam, upId, null, null, null);
			/**
			 * 사업장아이디별 카테고리 목록 조회 
			 */
			ArrayList<OutPgm> listSaleIdByUpId = adminPgmMngService.listSaleIdByUpId(pgmParam);
			model.addAttribute("listSaleIdByUpId",listSaleIdByUpId);
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return "front/mobile/program/index";
    }
    
    @RequestMapping("/m/program/listPgm/{upId}/{saleId}")
    public String programList(Model model, Pgm pgmParam,@PathVariable("upId") String upId,@PathVariable("saleId") String saleId) {
    	try {
    		commonPgmMthd(model, pgmParam, upId, saleId, null, null);
    		/**
    		 * 프로그램 목록 조회
    		 */
    		PageUtil PageUtil = new PageUtil();
    		
    		int current_page = 1;   // 현재페이지 번호
			int numPerPage   = 6;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findPgmMngCnt = 0;
			
			String inDate   = new SimpleDateFormat("yyyyMM").format(new Date());
			pgmParam.setYymm(inDate);
			if(GenericValidator.isBlankOrNull(pgmParam.getPageNum())) pgmParam.setPageNum("1");
			if(!GenericValidator.isBlankOrNull(pgmParam.getPageNum())) current_page = Integer.parseInt(pgmParam.getPageNum());
    		
			findPgmMngCnt = programService.findFrontPgmTotCnt(pgmParam);
			if(findPgmMngCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findPgmMngCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        pgmParam.setStart(start);
	        pgmParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	pgmParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
		        	pgmParam.setShowPage(findPgmMngCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
		        	pgmParam.setShowPage(findPgmMngCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        /*pgmParam.setNumperPage(numPerPage);*/
			pgmParam.setCurrentPage(numPerPage*current_page);
			
    		ArrayList<Pgm> listProgram = programService.listFrontPgm(pgmParam);
			
			// 목록번호를 화면에 출력하기 위한 로직
			int listNum, n = 0;
	        ListIterator<Pgm> it = listProgram.listIterator();
	        while(it.hasNext()) {
	        	pgmParam = (Pgm)it.next();
	       	 	listNum = findPgmMngCnt - (start + n) + 1;
	       	 	pgmParam.setListNo(listNum);
				n++;
			}
	        if(listProgram != null && listProgram.size() > 0)	
	        model.addAttribute("pageIndexList",PageUtil.mPageIndexList(current_page,total_page));
	        model.addAttribute("listProgram",listProgram);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "front/mobile/program/listPgm";
    }
    
	
    @RequestMapping(value="/m/program/findPgm/{upId}/{saleId}/{pgmCd}/{comCd3}")
    public String programView(Model model, Pgm	pgmParam,@PathVariable("upId") String upId,@PathVariable("saleId") String saleId,@PathVariable("pgmCd") String pgmCd,@PathVariable("comCd3") String comCd3) {
    	try {
    		commonPgmMthd(model, pgmParam, upId, saleId, pgmCd, comCd3);
    		/**
    		 * 프로그램 안내 상세조회
    		 */
    		String inDate   = new SimpleDateFormat("yyyyMM").format(new Date());
    		pgmParam.setUpId(upId);
    		pgmParam.setSaleId(saleId);
    		pgmParam.setYymm(inDate);
    		model.addAttribute("upId",upId);
    		model.addAttribute("saleId",saleId);
    		
    		ArrayList<Pgm> outPgmResult = adminPgmMngService.findOutPgmMng(pgmParam);
    		PgmImg pgmResult = adminPgmMngService.findPgmMng(pgmParam);
    		ArrayList<TeacherImg> teacherResult = adminPgmMngService.listTeacherInfoByPgmSeq(pgmResult);
    		model.addAttribute("outpgm",outPgmResult);
    		model.addAttribute("pgm",pgmResult);
    		model.addAttribute("teacher",teacherResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
    	return "front/mobile/program/findPgm";
    }
    
    private void commonPgmMthd(Model model, Pgm	pgmParam, String upId, String saleId, String pgmCd, String comCd3){

    	try {
    		/**
    		 * 사업장 아이디 SET (모든 시설프로그램 index 적용)
    		 */
    		if(!GenericValidator.isBlankOrNull(upId)) {
    			pgmParam.setUpId(upId);
            	model.addAttribute("upId",pgmParam.getUpId());	
    		}
        	
    		if(!GenericValidator.isBlankOrNull(saleId)) {
    			pgmParam.setSaleId(saleId);
        		model.addAttribute("saleId",pgmParam.getSaleId());	
    		}
    		
    		if(!GenericValidator.isBlankOrNull(pgmCd)) {
    			pgmParam.setPgmCd(pgmCd);
        		model.addAttribute("pgmCd",pgmParam.getPgmCd());	
    		}
    		if(!GenericValidator.isBlankOrNull(comCd3)) {
    			pgmParam.setComCd3(comCd3);
        		model.addAttribute("comCd3",pgmParam.getComCd3());    			
    		}
    		
    		/**
    		 * 모바일 상단 사업장 목록에 위치할 사업장 목록 조회
    		 */
    		pgmParam.setCodeGbnCd("up_id");
    		ArrayList<Common> listFacil =  adminMgrMngService.listFacil(pgmParam);
    		model.addAttribute("listFacil",listFacil);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
