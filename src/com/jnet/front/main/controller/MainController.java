package com.jnet.front.main.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jnet.admin.ctsMng.service.AdminCtsMngService;
import com.jnet.domain.BbsData;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Pgm;
import com.jnet.domain.Popup;
import com.jnet.front.main.service.MainService;
import com.jnet.front.program.service.ProgramService;
import com.jnet.util.PageUtil;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private ProgramService programService;
	
	@Autowired
	private AdminCtsMngService adminCtsMngService;
	/**
	 * 종로시설관리공단 메인페이지
	 * @param model
	 * @param request
	 * @param bbsParam
	 * @return
	 */
	@RequestMapping("/main")
    public String main(Model model, HttpServletRequest request, BbsData bbsParam, Popup popParam) throws Exception {
				
		bbsParam.setBoardSeq(4);
		ArrayList<BbsData> listNotice = mainService.listLeastBbsDataMain(bbsParam);
		
		bbsParam.setBoardSeq(9);
		ArrayList<BbsData> listTender = mainService.listLeastBbsDataMain(bbsParam);
		
		bbsParam.setBoardSeq(10);
		ArrayList<BbsData> listRecruit = mainService.listLeastBbsDataMain(bbsParam);
		
		bbsParam.setBoardSeq(8);
		ArrayList<BbsData> listLecture = mainService.listLeastBbsDataMain(bbsParam);
		
		popParam.setPopGbnCd("POPUP");
		popParam.setCommCodeSeq("0");
		ArrayList<Popup> listPopup = mainService.listPopupMain(popParam);
		
		popParam.setPopGbnCd("BANNER");
		ArrayList<Popup> listBanner = mainService.listPopupMain(popParam);
		
		
	    Popup popUpParam = new Popup();
	
		popUpParam.setCommCodeSeq("0");
		popUpParam.setShowYn("Y");
		ArrayList<Popup> listOneNotiMng = adminCtsMngService.listOneNotiMng(popUpParam);
		model.addAttribute("listOneNotiMng",listOneNotiMng);
	 		
		model.addAttribute("listNotice",listNotice);
		model.addAttribute("listTender",listTender);
		model.addAttribute("listRecruit",listRecruit);
		model.addAttribute("listLecture",listLecture);
		
		model.addAttribute("listPopup",listPopup);
		model.addAttribute("listBanner",listBanner);
		
        return "front/index";
    }
	
	@RequestMapping("/front/ontNoti")
    public String top(Model model, HttpServletRequest request, BbsData bbsParam, Popup popParam) throws Exception {
				
		
	    Popup popUpParam = new Popup();
	
		popUpParam.setCommCodeSeq("0");
		popUpParam.setShowYn("Y");
		ArrayList<Popup> listOneNotiMng = adminCtsMngService.listOneNotiMng(popUpParam);
		model.addAttribute("listNotiMng",listOneNotiMng);
	 		
		
        return "front/common/ontNoti";
    }
	
	
	/**
	 * 문화체육시설 메인페이지
	 * @param model
	 * @param request
	 * @param bbsParam
	 * @return
	 */
	@RequestMapping("/front/main/{upId}")
    public String frontMain(Model model, HttpServletRequest request, @PathVariable("upId") String upId, 
    		BbsData bbsParam, Popup popParam, Pgm pgmParam) throws Exception {
		String path = "";
		Popup popUpParam = new Popup();
		if(GenericValidator.isBlankOrNull(pgmParam.getYymm())) {
			String inDate   = new SimpleDateFormat("yyyyMM").format(new Date());
			pgmParam.setYymm(inDate);	
		}
		model.addAttribute("yymm",pgmParam.getYymm());
		
		
		if("11".equals(upId)){
			path = "olympic";
			bbsParam.setCommCodeSeq("80");
			popParam.setCommCodeSeq("2");
			popUpParam.setCommCodeSeq("2");
		}else if("21".equals(upId)){
			path = "gumin";
			bbsParam.setCommCodeSeq("81");
			popParam.setCommCodeSeq("3");
			popUpParam.setCommCodeSeq("3");
		}else if("31".equals(upId)){
			path = "eastcult";
			bbsParam.setCommCodeSeq("82");
			popParam.setCommCodeSeq("4");
			popUpParam.setCommCodeSeq("4");
		}else if("32".equals(upId)){
			path = "youth";
			bbsParam.setCommCodeSeq("83");
			popParam.setCommCodeSeq("5");
			popUpParam.setCommCodeSeq("5");
		}else if("33".equals(upId)){
			path = "stennis";
			bbsParam.setCommCodeSeq("84");
			popParam.setCommCodeSeq("6");
			popUpParam.setCommCodeSeq("6");
		}else if("41".equals(upId)){
			path = "jculture";
			bbsParam.setCommCodeSeq("85");
			popParam.setCommCodeSeq("7");
			popUpParam.setCommCodeSeq("7");
		}else{
			path = "olympic";
			bbsParam.setCommCodeSeq("80");
			popParam.setCommCodeSeq("2");
			popUpParam.setCommCodeSeq("2");
		}
		
		bbsParam.setBoardSeq(4);
		ArrayList<BbsData> listNotice = mainService.listLeastBbsDataSubMain(bbsParam);
		
		bbsParam.setBoardSeq(9);
		ArrayList<BbsData> listTender = mainService.listLeastBbsDataSubMain(bbsParam);
		
		bbsParam.setBoardSeq(10);
		ArrayList<BbsData> listRecruit = mainService.listLeastBbsDataSubMain(bbsParam);
		
		bbsParam.setBoardSeq(8);
		ArrayList<BbsData> listLecture = mainService.listLeastBbsDataSubMain(bbsParam);
		
		bbsParam.setBoardSeq(7);
		ArrayList<BbsData> listPhoto = mainService.listLeastBbsDataPhotoSubMain(bbsParam);
		
		ArrayList<Popup> listPopup = mainService.listPopupSubMain(popParam);
		
		pgmParam.setUpId(upId);
		
        ArrayList<Pgm> listProgram = mainService.listFrontLeastPgm(pgmParam);
        
        if(listProgram != null && listProgram.size() > 0){
        	for(int i=0; i<listProgram.size(); i++){
        		pgmParam = listProgram.get(i);       		
        		
        		ArrayList<Pgm> listImg = mainService.findOutPgmImgSubMain(pgmParam);
        		if(listImg.size() > 0){
        			pgmParam.setPgmFileImg(listImg.get(0).getPgmFileImg());            		
        		}else{
        			pgmParam.setPgmFileImg("/resources/include/commonfile/image/common/propic01.gif");        			
        		}
        	}
        }
        
        
	    
		
		
		popUpParam.setShowYn("Y");
		ArrayList<Popup> listOneNotiMng = adminCtsMngService.listOneNotiMng(popUpParam);
		model.addAttribute("listOneNotiMng",listOneNotiMng);
		model.addAttribute("listNotice",listNotice);
		model.addAttribute("listTender",listTender);
		model.addAttribute("listRecruit",listRecruit);
		model.addAttribute("listLecture",listLecture);
		model.addAttribute("listPhoto",listPhoto);
		model.addAttribute("listPopup",listPopup);
		model.addAttribute("listProgram",listProgram);
		model.addAttribute("path",path);
        return "front/main/index";
    }
	
	@RequestMapping("/main/search/{upId}")
    public String mainSearch(Model model, HttpServletRequest request, BbsData bbsParam, 
    		Pgm pgmParam, @PathVariable("upId") String upId) throws Exception {
		
		if(GenericValidator.isBlankOrNull(pgmParam.getYymm())) {
			String inDate   = new SimpleDateFormat("yyyyMM").format(new Date());
			pgmParam.setYymm(inDate);	
		}
		model.addAttribute("yymm",pgmParam.getYymm());
		
		String menuId = upId;
		String word = bbsParam.getSearchVal();
		
		if("11".equals(upId)){			
			bbsParam.setCommCodeSeq("80");			
		}else if("21".equals(upId)){			
			bbsParam.setCommCodeSeq("81");			
		}else if("31".equals(upId)){			
			bbsParam.setCommCodeSeq("82");			
		}else if("32".equals(upId)){			
			bbsParam.setCommCodeSeq("83");			
		}else if("33".equals(upId)){			
			bbsParam.setCommCodeSeq("84");			
		}else if("41".equals(upId)){			
			bbsParam.setCommCodeSeq("85");			
		}else{			
			bbsParam.setCommCodeSeq("");			
		}
				
		ArrayList<BbsData> listBoard = mainService.listLeastBbsDataSearchMain(bbsParam);
		
		int boardTotCnt = mainService.listBbsDataSearchMainTotCnt(bbsParam);
				
		pgmParam.setUpId(upId);
		
		ArrayList<Pgm> listProgram = mainService.listFrontLeastPgm(pgmParam);
		int pgmTotCnt = mainService.listPgmSearchMainTotCnt(pgmParam);
		
		model.addAttribute("listBoard",listBoard);
		model.addAttribute("boardTotCnt",boardTotCnt);
		model.addAttribute("menuId",menuId);
		model.addAttribute("word",word);
		
		model.addAttribute("listProgram",listProgram);
		model.addAttribute("pgmTotCnt",pgmTotCnt);
		model.addAttribute("pgmParam",pgmParam);
		
		
		
		return "front/search/result";
	}
	
	@RequestMapping("/main/search/board/{upId}")
    public String mainSearchBoard(Model model, HttpServletRequest request, BbsData bbsParam, @PathVariable("upId") String upId) throws Exception {
		
		if("11".equals(upId)){			
			bbsParam.setCommCodeSeq("80");			
		}else if("21".equals(upId)){			
			bbsParam.setCommCodeSeq("81");			
		}else if("31".equals(upId)){			
			bbsParam.setCommCodeSeq("82");			
		}else if("32".equals(upId)){			
			bbsParam.setCommCodeSeq("83");			
		}else if("33".equals(upId)){			
			bbsParam.setCommCodeSeq("84");			
		}else if("41".equals(upId)){			
			bbsParam.setCommCodeSeq("85");			
		}else{			
			bbsParam.setCommCodeSeq("");			
		}
		PageUtil PageUtil = new PageUtil();
		int current_page = 1;   // 현재페이지 번호
		int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		
		if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
		if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) current_page = Integer.parseInt(bbsParam.getPageNum());
		
		int boardTotCnt = mainService.listBbsDataSearchMainTotCnt(bbsParam);
		
		if(boardTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  boardTotCnt);
		if(total_page < current_page && total_page != 0) current_page = total_page;
		
		int end   = current_page * numPerPage;
        int start = end - (numPerPage - 1);
        bbsParam.setStart(start);
        bbsParam.setEnd(end);
        
		ArrayList<BbsData> listBoard = mainService.listBbsDataSearchMainMore(bbsParam);
		
		if(listBoard != null && listBoard.size() > 0)	
	        model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
			model.addAttribute("listBoard",listBoard);
			model.addAttribute("boardTotCnt",boardTotCnt);
			model.addAttribute("searchVal",bbsParam.getSearchVal());
			model.addAttribute("upId",upId);
		return "front/search/result_board_list";
	}
	
	@RequestMapping("/main/search/pgm/{upId}")
    public String mainSearchPgm(Model model,@PathVariable("upId") String upId, Pgm pgmParam) throws Exception {
		PageUtil PageUtil = new PageUtil();
    	try {
    		int current_page = 1;   // 현재페이지 번호
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findPgmMngCnt = 0;
			
			pgmParam.setUpId(upId);
    					
    		OutPgm outPgmParam =new OutPgm();
    		outPgmParam.setUpId(upId);    		
    		
			if(GenericValidator.isBlankOrNull(pgmParam.getYymm())) {
				String inDate   = new SimpleDateFormat("yyyyMM").format(new Date());
	    		pgmParam.setYymm(inDate);	
	    		outPgmParam.setYymm(inDate);
			}
			
			if(GenericValidator.isBlankOrNull(pgmParam.getBasId())) {
				pgmParam.setBasId(null);	
			}
			
			model.addAttribute("yymm", pgmParam.getYymm());
			model.addAttribute("basId",pgmParam.getBasId());
			model.addAttribute("timeCd", pgmParam.getTimeCd());
			
			if(GenericValidator.isBlankOrNull(pgmParam.getPageNum())) pgmParam.setPageNum("1");
			if(!GenericValidator.isBlankOrNull(pgmParam.getPageNum())) current_page = Integer.parseInt(pgmParam.getPageNum());
    		
			findPgmMngCnt = mainService.listPgmSearchMainTotCnt(pgmParam);
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
	        
	        pgmParam.setNumperPage(numPerPage);
			pgmParam.setCurrentPage(current_page*numPerPage);
			
    		ArrayList<Pgm> listProgram = programService.listFrontPgm(pgmParam);
			
	        if(listProgram != null && listProgram.size() > 0)	
	        model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
	        model.addAttribute("listProgram",listProgram);
	        model.addAttribute("pgmTotCnt",findPgmMngCnt);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "front/search/result_pgm_list";
	}
	

}
