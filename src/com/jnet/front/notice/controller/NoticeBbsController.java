package com.jnet.front.notice.controller;

import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.front.notice.service.NoticeBbsService;
import com.jnet.admin.bbsMng.service.AdminBbsMngService;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
import com.jnet.util.PageUtil;

@Controller
public class NoticeBbsController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private NoticeBbsService noticeBbsService;
	
	
	@Autowired
	private AdminBbsMngService adminCtsBbsService;
	 /**
	  * 통합 게시판 목록 조회
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping("/front/notice/{boardSeq}")
	public String notice_list(@PathVariable int boardSeq, Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		logger.info("NoticeBbsController - notice_list");
   		PageUtil PageUtil = new PageUtil();
   		
		try {
			/*
			System.out.println("menuSeq = "+ menuSeq);
			System.out.println("boardSeq = "+ boardSeq);
			System.out.println("commCodeSeq = "+ request.getParameter("commCodeSeq"));
			System.out.println("bbsParam.getCommCodeSeq() = "+ bbsParam.getCommCodeSeq());
			System.out.println("searchVal = "+ request.getParameter("searchVal"));
			System.out.println("bbsParam.getSearchVal() = "+ bbsParam.getSearchVal());
			 */
			
			bbsParam.setBoardSeq(boardSeq);

			
			int numPerPage  = 10; // 한 화면에 보여주는 게시물 수
			int total_page 	= 0;
			int total_count = 0;
			if(boardSeq==7){
				numPerPage=12;
			}
			
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
	 	    commonParam.setCodeGbnCd("board_id");
			
	 	    // 사업장 목록조회
			ArrayList<Common> facilList = noticeBbsService.listFacil(commonParam);
			model.addAttribute("facilList", facilList);
			
			// 목록번호를 화면에 출력하기 위한 로직
	        listNoSet(bbsParam, noticeListBbs, start, total_count);
	        
	        model.addAttribute("noticeListBbs", noticeListBbs);
	        model.addAttribute("menuSeq", bbsResult.getMenuSeq());
	        
	        if(noticeListBbs != null && noticeListBbs.size() > 0)
	        	model.addAttribute("pageIndexList", PageUtil.pageIndexList(current_page, total_page));
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "front/notice/notice_list";
		
	}
	
	@RequestMapping("/front/notice/{boardSeq}/{comCd}")
	public String noticelist(@PathVariable int boardSeq,@PathVariable String comCd, Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		logger.info("NoticeBbsController - notice_list");
		PageUtil PageUtil = new PageUtil();
		
		try {
			/*
			System.out.println("menuSeq = "+ menuSeq);
			System.out.println("boardSeq = "+ boardSeq);
			System.out.println("commCodeSeq = "+ request.getParameter("commCodeSeq"));
			System.out.println("bbsParam.getCommCodeSeq() = "+ bbsParam.getCommCodeSeq());
			System.out.println("searchVal = "+ request.getParameter("searchVal"));
			System.out.println("bbsParam.getSearchVal() = "+ bbsParam.getSearchVal());
			 */
			
			bbsParam.setBoardSeq(boardSeq);
			bbsParam.setCommCodeSeq(comCd);
			
			int numPerPage  = 10; // 한 화면에 보여주는 게시물 수
			int total_page 	= 0;
			int total_count = 0;
			if(boardSeq==7){
				numPerPage=12;
			}
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchKey())) bbsParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchVal())) bbsParam.setSearchVal("");
			
			model.addAttribute("commCodeSeq", bbsParam.getCommCodeSeq());
			model.addAttribute("pgmCatGbnCd", bbsParam.getPgmCatGbnCd());
			model.addAttribute("searchKey", bbsParam.getSearchKey());
			model.addAttribute("searchVal", bbsParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			
			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) 
				current_page = Integer.parseInt(bbsParam.getPageNum());
			
			total_count = noticeBbsService.noticeListBbsTotCnt(bbsParam);
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>. total_count : " + total_count);			
			
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
			commonParam.setCodeGbnCd("board_id");
			
			
			// 사업장 목록조회
			ArrayList<Common> facilList = noticeBbsService.listFacil(commonParam);
			
			commonParam = new Common();
			commonParam.setCodeGbnCd("sale_id");
			ArrayList<Common> listSaleId = noticeBbsService.listFacil(commonParam);
			model.addAttribute("saleList",listSaleId);
			model.addAttribute("facilList", facilList);
			
			// 목록번호를 화면에 출력하기 위한 로직
			listNoSet(bbsParam, noticeListBbs, start, total_count);
			
			model.addAttribute("noticeListBbs", noticeListBbs);
			model.addAttribute("menuSeq", bbsResult.getMenuSeq());
			model.addAttribute("boardSeq", boardSeq);
			model.addAttribute("comCd", comCd);
			
			if(noticeListBbs != null && noticeListBbs.size() > 0)
				model.addAttribute("pageIndexList", PageUtil.pageIndexList(current_page, total_page));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "front/notice/notice_list";
		
	}
	
	 /**
	  * 통합 게시판 상세 조회
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping(value="/front/notice/notice_view", method=RequestMethod.POST)
	public String notice_view(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		try {
			
			// 게시판 상세 보기
	   		ArrayList<BbsFileReply> noticeViewResult = noticeBbsService.noticeViewBbs(bbsParam);
	   		 
	   		// 이전 글
	   		ArrayList<BbsFileReply> noticePrevResult = noticeBbsService.noticePrevBbs(bbsParam);
	   		
	   		// 다음 글
	   		ArrayList<BbsFileReply> noticeNextResult = noticeBbsService.noticeNextBbs(bbsParam);
	   		
	   		// 조회 카운트 증가 처리
	   		noticeBbsService.updateHitCount(bbsParam);
	   		
	   		Common commonParam = null;
	   		commonParam = new Common();
			commonParam.setCodeGbnCd("sale_id");
			ArrayList<Common> listSaleId = noticeBbsService.listFacil(commonParam);
			model.addAttribute("saleList",listSaleId);
			
	   		model.addAttribute("noticeList", noticeViewResult);
	   		
	   		
   		 if(noticeViewResult != null && noticeViewResult.size() > 0) {
			 //무료강좌일경우
			 if(noticeViewResult.get(0).getBoardType().equals("FREE")) {
				 ArrayList<BbsFileReply> bbsTeacherResult = adminCtsBbsService.listBbsTeacher(bbsParam);
				 model.addAttribute("bbsTeacherResult",bbsTeacherResult);
			 }
		 }
	   		
	   		
	   		model.addAttribute("noticePrev", noticePrevResult);
	   		model.addAttribute("noticeNext", noticeNextResult);
	   		model.addAttribute("menuSeq", noticeViewResult.get(0).getMenuSeq());
	   		model.addAttribute("boardSeq", bbsParam.getBoardSeq());
	   		model.addAttribute("comCd", noticeViewResult.get(0).getCommCodeSeq());
	   		 
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "front/notice/notice_view";
	}
	
	
	/**
     * 공통 목록 번호 set메서드
     * 
     * @param bbsParam bbsParam
     * @param list list
     * @param start start
     * @param totCnt totCnt
     */
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
    
}