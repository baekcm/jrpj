package com.jnet.front.community.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.ListIterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jnet.admin.bbsMng.service.AdminBbsMngService;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
import com.jnet.domain.Member;
import com.jnet.front.community.service.CommunityBbsService;
import com.jnet.front.notice.service.NoticeBbsService;
import com.jnet.util.FileUtil;
import com.jnet.util.PageUtil;
import com.jnet.util.CommonUtil;

@Controller
public class CommunityBbsController {

private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private CommunityBbsService communityBbsService;
	
	@Autowired
	private AdminBbsMngService adminCtsBbsService;
	
	@Autowired
	private NoticeBbsService noticeBbsService;
	
//	private String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Bbs" + File.separator;
	
	 /**
	  * 자유게시판 목록 조회
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping("/front/community/{boardSeq}")
	public String community_list(@PathVariable int boardSeq, Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		logger.info("CommunityBbsController - community_list");
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
			
			total_count = communityBbsService.communityListTotCnt(bbsParam);
			
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
	        
			ArrayList<BbsFileReply> communityListBbs = communityBbsService.communityList(bbsParam);
			BbsFileReply bbsResult = adminCtsBbsService.findBbs(bbsParam);
			model.addAttribute("bbs",bbsResult);
			Common commonParam = new Common();
	 	    commonParam.setCodeGbnCd("board_id");
			
	 	    // 사업장 목록조회
			ArrayList<Common> facilList = communityBbsService.listFacil(commonParam);
			model.addAttribute("facilList", facilList);
			
			// 목록번호를 화면에 출력하기 위한 로직
	        listNoSet(bbsParam, communityListBbs, start, total_count);
	        
	        model.addAttribute("communityListBbs", communityListBbs);
	        model.addAttribute("menuSeq", bbsResult.getMenuSeq());
	        //model.addAttribute("boardSeq", boardSeq);
	        
	        if(communityListBbs != null && communityListBbs.size() > 0)
	        	model.addAttribute("pageIndexList", PageUtil.pageIndexList(current_page, total_page));
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "front/community/community_list";
		
	}
	
	/**
	  * 자유게시판 상세 조회
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping(value="/front/community/community_view", method=RequestMethod.POST)
	public String community_view(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		logger.info("CommunityBbsController - community_view");
		
		try {
			
			Member userInfo = (Member) request.getSession().getAttribute("userInfo");
			
			if(userInfo != null)
			{
				model.addAttribute("userNm", userInfo.getUserNm());
			}
			
			System.out.println("boardSeq = "+ bbsParam.getBoardSeq());
			System.out.println("dataSeq = "+ bbsParam.getDataSeq());
			
			// 게시판 상세 보기
	   		ArrayList<BbsFileReply> communityViewResult = communityBbsService.communityView(bbsParam);
	   		 
	   		// 이전 글
	   		ArrayList<BbsFileReply> communityPrevResult = communityBbsService.communityPrev(bbsParam);
	   		
	   		// 다음 글
	   		ArrayList<BbsFileReply> communityNextResult = communityBbsService.communityNext(bbsParam);
	   		
	   		// 조회 카운트 증가 처리
	   		communityBbsService.updateHitCount(bbsParam);
	   		
	   		// 한줄 댓글 조회
	   		PageUtil PageUtil 		= new PageUtil();
	   		
    		int numPerPage   		= 10;  // 한 화면에 보여주는 게시물 수
 			int total_page 			= 0;
 			int commentListTotCnt 	= 0;
 			
 			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
 			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
 			int current_page = 1;   // 현재페이지 번호
 			
 			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) current_page = Integer.parseInt(bbsParam.getPageNum());
 			commentListTotCnt = communityBbsService.communityCommentListTotCnt(bbsParam);
 			
 			if(commentListTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage, commentListTotCnt);
 			
 			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
 	        if(total_page < current_page && total_page != 0) current_page = total_page;	

 	        // 리스트에 출력할 데이터를 가져오기
 	        int end   = current_page * numPerPage;
 	        int start = end - (numPerPage - 1);
 	        bbsParam.setStart(start);
 	        bbsParam.setEnd(end);
 	        
 			ArrayList<BbsFileReply> communityCommentResult = communityBbsService.communityCommentList(bbsParam);
 			model.addAttribute("listReply", communityCommentResult);
 			
 			// 목록번호를 화면에 출력하기 위한 로직
 	        if(communityCommentResult != null && communityCommentResult.size() > 0)  
 	        	model.addAttribute("pageIndexList", PageUtil.pageIndexList(current_page,total_page));
	   		
	   		model.addAttribute("boardSeq", bbsParam.getBoardSeq());
	   		model.addAttribute("dataSeq", bbsParam.getDataSeq());
	   		model.addAttribute("mode", request.getParameter("mode"));
	   		
	   		model.addAttribute("communityList", communityViewResult);
	   		model.addAttribute("communityPrev", communityPrevResult);
	   		model.addAttribute("communityNext", communityNextResult);
	   		model.addAttribute("communityCommentList", communityCommentResult);
	   		model.addAttribute("menuSeq", communityViewResult.get(0).getMenuSeq());
	   		
			Common commonParam = new Common();
	 	    commonParam.setCodeGbnCd("board_id");
			
	 	    // 사업장 목록조회
			ArrayList<Common> facilList = communityBbsService.listFacil(commonParam);
			model.addAttribute("facilList", facilList);
	   	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "front/community/community_view";
	}
	
	
	/**
	  * 자유게시판 등록 폼
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping(value="/front/community/community_writeForm", method=RequestMethod.POST)
	public String community_writeForm(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		logger.info("CommunityBbsController - community_writeForm");
		
		try {
			
			// 게시판 상세 보기
	   		ArrayList<BbsFileReply> communityViewResult = communityBbsService.communityView(bbsParam);
			
			Member userInfo = (Member) request.getSession().getAttribute("userInfo");
			
			// mode 값에 따라 등록/수정으로 구분
			model.addAttribute("mode", request.getParameter("mode"));
			model.addAttribute("userNm", userInfo.getUserNm());
			model.addAttribute("communityList", communityViewResult);
			model.addAttribute("boardSeq", bbsParam.getBoardSeq());
			model.addAttribute("dataSeq", bbsParam.getDataSeq());
			model.addAttribute("menuSeq", bbsParam.getMenuSeq());
			
			Common commonParam = new Common();
			commonParam.setCodeGbnCd("board_id");
			
			// 사업장 목록조회
			ArrayList<Common> facilList = noticeBbsService.listFacil(commonParam);
			model.addAttribute("facilList", facilList);
	   		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "front/community/community_writeForm";
	}
	
	/**
	  * 자유게시판 등록 및 수정
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping(value="/front/community/saveCommunityData", method=RequestMethod.POST)
	public String community_write(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		logger.info("CommunityBbsController - saveCommunityData");
		
    	try {
    		String mode = request.getParameter("mode");
    		
    		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
    		System.out.println("user_id = "+ userInfo.getUserId());
    		
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            
            bbsParam.setCreateNm(userInfo.getUserNm());
            bbsParam.setCreateYmd(inDate);
            bbsParam.setCreateHms(inTime);
            bbsParam.setCreateIp(request.getRemoteAddr());
            bbsParam.setCreateId(userInfo.getUserId());
            bbsParam.setModiNm(userInfo.getUserNm());
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setModiId(userInfo.getUserId());
            bbsParam.setSubject(CommonUtil.tagOff( bbsParam.getSubject()));
            bbsParam.setContent(CommonUtil.tagOff( bbsParam.getContent()));
            		
            if(mode.equals("insert"))
            {
            	communityBbsService.saveCommunityData(bbsParam);
            }
            else if(mode.equals("update"))
            {
            	communityBbsService.updateCommunityData(bbsParam);
            }
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "redirect:/front/community/6";
		
	}
	
	
	/**
	  * 자유게시판 삭제
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping(value="/front/community/removeCommunityData", method=RequestMethod.POST)
	public String community_remove(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		
		logger.info("CommunityBbsController - removeCommunityData");
		
	   	try
	   	{
	        communityBbsService.removeCommunityData(bbsParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   	
		return "redirect:/front/community/6";
		
	}
	
	@RequestMapping(value="/front/listReply")
    public String listReply(Model model, HttpServletRequest request, BbsFileReply bbsParam) {
		logger.info("CommunityBbsController - listReply");
    	try {
    		PageUtil PageUtil = new PageUtil();

    		int numPerPage   = 5;  // 한 화면에 보여주는 게시물 수
 			int total_page = 0;
 			int findReplytTotCnt = 0;
 			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
 			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
 			int current_page = 1;   // 현재페이지 번호
 			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) current_page = Integer.parseInt(bbsParam.getPageNum());
 			findReplytTotCnt = adminCtsBbsService.findReplytTotCnt(bbsParam);
 			if(findReplytTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findReplytTotCnt) ;
 			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
 	        if(total_page < current_page && total_page != 0) current_page = total_page;	

 	        // 리스트에 출력할 데이터를 가져오기
 	        int end   = current_page * numPerPage;
 	        int start = end - (numPerPage - 1);
 	        bbsParam.setStart(start);
 	        bbsParam.setEnd(end);
 			ArrayList<BbsFileReply> listReply = adminCtsBbsService.listReply(bbsParam);
 			// 목록번호를 화면에 출력하기 위한 로직
 	        model.addAttribute("listReply",listReply);
 	        if(listReply != null && listReply.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "front/community/listReply";
    }
    
    @RequestMapping(value="/front/saveReply",method=RequestMethod.POST)
    public String saveReply(Model model, HttpServletRequest request, HttpServletResponse response, BbsFileReply bbsParam) {
    	logger.info("CommunityBbsController - saveReply");
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Member userInfo = (Member) request.getSession().getAttribute("userInfo");
            
            bbsParam.setCreateId(userInfo.getUserId());
            bbsParam.setCreateIp(request.getRemoteAddr());
            bbsParam.setCreateYmd(inDate);
            bbsParam.setCreateHms(inTime);
            bbsParam.setCreateNm(userInfo.getUserNm());
            bbsParam.setReplyContent(CommonUtil.tagOff(bbsParam.getReplyContent()));
    		adminCtsBbsService.saveReply(bbsParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "redirect:/front/listReply?dataSeq="+bbsParam.getDataSeq();
    }
    
    @RequestMapping(value="/front/removeReply",method=RequestMethod.POST)
    public String removeReply(Model model, HttpServletRequest request, HttpServletResponse response, BbsFileReply bbsParam) {
    	logger.info("CommunityBbsController - removeReply");
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Member userInfo = (Member) request.getSession().getAttribute("userInfo");
            
            bbsParam.setModiId(userInfo.getUserId());
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            bbsParam.setModiNm(userInfo.getUserNm());
            
    		adminCtsBbsService.removeReply(bbsParam);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "redirect:/front/listReply?dataSeq="+bbsParam.getDataSeq();
    }
	
	/**
     * 파일 핸들링 공통 메서드
     * @param bbsParam bbsParam
     * @param bbsFileReply bbsFileReply
     * @param file file
     * @param filePath filePath
     * @param admInfo admInfo
     * @param fileList fileList
     * @return ArrayList ArrayList
     * @throws Exception Exception
     */
    @SuppressWarnings("unused")
	private ArrayList<BbsFileReply> fileObjectSetting(BbsFileReply bbsParam, BbsFileReply bbsFileReply, File file, String filePath, String userId, ArrayList<BbsFileReply> fileList) throws Exception{
    	for(MultipartFile multifile : bbsParam.getBoardFileList()) {
			if(!GenericValidator.isBlankOrNull(multifile.getOriginalFilename())) {
				bbsFileReply = new BbsFileReply();
    			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
        		file = new File(filePath);
        		
        		if(!file.exists()) {
        			file.mkdirs();
        		}
        		
        		//db 저장될 경로
        		String dbPath = "/resources/Pds/Bbs/";
        		String realFileNm = "";
        		
                realFileNm = userId+today+UUID.randomUUID().toString() + multifile.getOriginalFilename().substring(multifile.getOriginalFilename().lastIndexOf("."));
				bbsFileReply.setFileSize(multifile.getSize());
				bbsFileReply.setFilePath(dbPath);
				bbsFileReply.setOrgnlFileNm(multifile.getOriginalFilename());
				bbsFileReply.setRealFileNm(realFileNm);
				bbsFileReply.setThumbYn("N");
				bbsFileReply.setCommCodeSeq(bbsParam.getCommCodeSeq());
				
				bbsFileReply.setCreateId(bbsParam.getModiId());
				bbsFileReply.setCreateIp(bbsParam.getModiIp());
				bbsFileReply.setCreateYmd(bbsParam.getModiYmd());
				bbsFileReply.setCreateHms(bbsParam.getModiHms());
				fileList.add(bbsFileReply);
				
				//파일저장
				String rlFileNm = filePath + realFileNm;
				String thFileNm = filePath + "thumb_"+realFileNm ;
				file = new File(rlFileNm);
				multifile.transferTo(file);
				
				if(bbsParam.getBoardType().equals("GALL") || bbsParam.getBoardType().equals("LOSE")) {
					//썸네일 생성
					File thumbFile = new File(thFileNm);
					//썸네일 생성 부분
    		        boolean thumbYn = FileUtil.mkThumbNail(file, thumbFile, 100, 100);
    		        
    		        if(thumbYn){
    		        	bbsFileReply = new BbsFileReply();
    		        	bbsFileReply.setFilePath(dbPath);
    		        	bbsFileReply.setFileSize(thumbFile.length());
    		        	bbsFileReply.setOrgnlFileNm(multifile.getOriginalFilename());
    		        	bbsFileReply.setRealFileNm("thumb_"+realFileNm );
    		        	bbsFileReply.setThumbYn("Y");
    		        	bbsFileReply.setCommCodeSeq(bbsParam.getCommCodeSeq());
    		        	bbsFileReply.setCreateId(bbsParam.getModiId());
    		        	bbsFileReply.setCreateIp(bbsParam.getModiIp());
    		        	bbsFileReply.setCreateYmd(bbsParam.getModiYmd());
    		        	bbsFileReply.setCreateHms(bbsParam.getModiHms());
    					fileList.add(bbsFileReply);
    		        }
				}
			}
		}
    	return fileList;
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
