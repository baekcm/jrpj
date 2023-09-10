package com.jnet.admin.bbsMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.ListIterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

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
import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Admin;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
import com.jnet.domain.Menu;
import com.jnet.util.FileUtil;
import com.jnet.util.PageUtil;
import com.jnet.util.ParsingUtil;

@Controller
public class AdminBbsMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminBbsMngService adminCtsBbsService;
	@Autowired
	private AdminLoginService adminLoginService;
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	
	@Autowired
	private AdminMgrMngService adminMgrMngService;
	
	private String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Bbs" + File.separator;
	 /**
	  * 게시판관리 목록 조회
	  * 
	  * @param model model
	  * @param bbsParam bbsParam
	  * @return String String
	  */
	@RequestMapping("/admin/listBbsMng")
    public String listBbsMng(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		logger.info("AdminBbsMngController - listBbsMng");
		try {
			commonMenu(model, bbsParam);
			
	        String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            bbsParam.setCreateYmd(inDate);
            
			ArrayList<BbsFileReply> listBbsMng = adminCtsBbsService.listBbsMng(bbsParam);
			model.addAttribute("listBbsMng",listBbsMng);
			
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/bbsMng/listBbsMng";
    }
    
    /**
     * 게시판관리 수정폼
     * 
     * @param model model
     * @param bbsParam bbsParam
     * @return String
     */
	@RequestMapping(value="/admin/formUpdateBbsMng",method=RequestMethod.POST)
    public String formUpdateBbsMng(Model model, BbsFileReply bbsParam) {
    	try {
    		logger.info("AdminBbsMngController - formUpdateBbsMng");
    		commonMenu(model, bbsParam);
    		
			//게시판 타입만 가져온다
			ArrayList<Map<String, String>> listTypeCd = new ArrayList<Map<String,String>>();
    		listTypeCd = listTypeCdMthd(listTypeCd);
			model.addAttribute("listTypeCd",listTypeCd);
    		
    		BbsFileReply bbsResult = adminCtsBbsService.findBbsMng(bbsParam);
    		model.addAttribute("bbs",bbsResult);
    		/*BbsFileReply empResult = adminCtsBbsService.findEmpInfo(bbsParam);
    		model.addAttribute("emp",empResult);*/
    		
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/bbsMng/formUpdateBbsMng";
    }
	
   /**
    * 게시판관리 수정
    * 
    * @param request request
    * @param bbsParam bbsParam
    * @return String String
    */
    @RequestMapping(value="/admin/updateBbsMng",method=RequestMethod.POST)
    public String updateBbsMng(HttpServletRequest request, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - updateBbsMng");
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            bbsParam.setCreateYmd(inDate);
            bbsParam.setCreateHms(inTime);
            bbsParam.setCreateIp(request.getRemoteAddr());
            bbsParam.setCreateId(admInfo.getAdmId());
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setModiId(admInfo.getAdmId());
            
    		adminCtsBbsService.updateBbsMng(bbsParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listBbsMng?gseq="+bbsParam.getGseq()+"&lseq="+bbsParam.getLseq();
    }
    
   /**
    * 게시판별 게시데이터 목록 조회
    * 
    * @param boardSeq boardSeq
    * @param model model
    * @param bbsParam bbsParam
    * @param request request
    * @return String String
    */
   @RequestMapping("/admin/listBbsData/{menuSeq}/{boardSeq}")
   public String listBbsData(@PathVariable int menuSeq, @PathVariable int boardSeq, Model model, BbsFileReply bbsParam, HttpServletRequest request) {
	    logger.info("AdminBbsMngController - listBbsData");
   		PageUtil PageUtil = new PageUtil();
		try {
			 commonMenu(model, bbsParam);
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findBbsDataTotCnt = 0;
			
			bbsParam.setBoardSeq(boardSeq);
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchKey())) bbsParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchVal())) bbsParam.setSearchVal("");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchFacil())) bbsParam.setSearchFacil("");
			
			model.addAttribute("searchFacil",bbsParam.getSearchFacil());
			model.addAttribute("searchKey",bbsParam.getSearchKey());
			model.addAttribute("searchVal",bbsParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) current_page = Integer.parseInt(bbsParam.getPageNum());
			findBbsDataTotCnt = adminCtsBbsService.findBbsDataTotCnt(bbsParam);
			if(findBbsDataTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findBbsDataTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        bbsParam.setStart(start);
	        bbsParam.setEnd(end);
	        
			ArrayList<BbsFileReply> listBbsData = adminCtsBbsService.listBbsData(bbsParam);
			
			BbsFileReply bbsResult = adminCtsBbsService.findBbs(bbsParam);
			model.addAttribute("bbs",bbsResult);
			
			 // 목록번호를 화면에 출력하기 위한 로직
	        listNoSet( bbsParam,listBbsData,  start,  findBbsDataTotCnt);
	        
	        model.addAttribute("listBbsData",listBbsData);
	        model.addAttribute("boardSeq",boardSeq);
	        model.addAttribute("menuSeq",menuSeq);
	        
	        if(bbsResult.getCatCdYn() != null && !bbsResult.getCatCdYn().equals("") && bbsResult.getCatCdYn().equals("Y")) {
	        	//사업소 목록 조회
				Common commonParam = new Common();
				commonParam.setCodeGbnCd("board_id");
				ArrayList<Common> listFacil =  adminMgrMngService.listFacil(commonParam);
				model.addAttribute("listFacil",listFacil); 	
	        }
	        if(listBbsData != null && listBbsData.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
       return "admin/bbsMng/listBbsData";
   }
   
   
   @RequestMapping(value="/admin/removeBbsData/{menuSeq}/{boardSeq}",method=RequestMethod.POST)
   public String removeBbsData(@PathVariable int menuSeq, @PathVariable int boardSeq, Model model, BbsFileReply bbsParam, HttpServletRequest request) {
	    logger.info("AdminBbsMngController - removeBbsData");
		try {
			Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            
            bbsParam.setModiId(admInfo.getAdmId());
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            
			adminCtsBbsService.removeBbsData(bbsParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
		return "redirect:/admin/listBbsData/"+menuSeq+"/"+boardSeq+"?gseq="+bbsParam.getGseq()+"&lseq="+bbsParam.getLseq();
   }
   
   /**
    * 게시판관리 등록폼
    *  
    * @param boardSeq boardSeq
    * @param model model
    * @param bbsParam bbsParam
    * @param request request
    * @return String String
    */
	@RequestMapping("/admin/formCreateBbsData/{menuSeq}/{boardSeq}")
   public String formCreateBbsData(@PathVariable int menuSeq, @PathVariable int boardSeq, Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		logger.info("AdminBbsMngController - formCreateBbsData");
   	try {
   		 ArrayList<Common> listUpId = null;
   		ArrayList<Common> listSaleId = null;
   		 Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
   		 commonMenu(model, bbsParam);
   		 bbsParam.setBoardSeq(boardSeq);
   		 BbsFileReply findBbs = adminCtsBbsService.findBbs(bbsParam);
   		Common commonParam = null;
		 // 관리자
		if(findBbs.getCatCdYn().equals("Y")) {
   			if(adminResult.getAdmAuthCode().equals("S")) {
   	   		    	commonParam = new Common();
   	   		    	commonParam.setCodeGbnCd("board_id");
   	   		    	listUpId = aminMgrMngService.listFacil(commonParam);
   			}else if(adminResult.getAdmAuthCode().equals("O")) {
   				bbsParam.setAdmId(adminResult.getAdmId());
   				listUpId = adminCtsBbsService.listFacilWithMenuSeq(bbsParam);
   				
   			}
   			model.addAttribute("upList",listUpId);
		}
   		 if(findBbs.getPgmCatCdYn().equals("Y")) {
	    	commonParam = new Common();
	    	commonParam.setCodeGbnCd("sale_id");
	    	listSaleId = aminMgrMngService.listFacil(commonParam);
	    	model.addAttribute("saleList",listSaleId);
    	 }
   		 
		 model.addAttribute("bbs",findBbs);
		 model.addAttribute("menuSeq",menuSeq);
   		 model.addAttribute("boardSeq",boardSeq);
	} catch (Exception e) {
			printStackTrace(e);
		}
   	return "admin/bbsMng/formCreateBbsData";
   }
	
	 /**
	    * 게시물 등록
	    * 
	    * @param request request
	    * @param bbsParam bbsParam
	    * @return String String
	    */
	    @RequestMapping(value="/admin/saveBbsData",method=RequestMethod.POST)
	    public String saveBbsData(HttpServletRequest request, BbsFileReply bbsParam) {
	    	logger.info("AdminBbsMngController - saveBbsData");
			ArrayList<BbsFileReply> fileList = null;
			//파일 기본경로
    		String dftFilePath = request.getServletContext().getRealPath("/");
    		//파일 기본경로 _ 상세경로
    		String filePath = dftFilePath + dtlFilePath;
	    	try {
	    		Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
	    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
	            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
	            
	            bbsParam.setCreateNm(admInfo.getAdmNm());
	            bbsParam.setCreateYmd(inDate);
	            bbsParam.setCreateHms(inTime);
	            bbsParam.setCreateIp(request.getRemoteAddr());
	            bbsParam.setCreateId(admInfo.getAdmId());
	            bbsParam.setModiNm(admInfo.getAdmNm());
	            bbsParam.setModiYmd(inDate);
	            bbsParam.setModiHms(inTime);
	            bbsParam.setModiIp(request.getRemoteAddr());
	            bbsParam.setModiId(admInfo.getAdmId());
	            
	            File file = null;
        		BbsFileReply bbsFileReply = null;
	            if(bbsParam.getBoardFileList() != null && bbsParam.getBoardFileList().size() > 0) {
	            	fileList = new ArrayList<BbsFileReply>();
	            	//파일 핸틀링
	    			bbsParam.setBbsFileList(fileObjectSetting(bbsParam, bbsFileReply, file, filePath, admInfo, fileList));
	    		}
	    		adminCtsBbsService.saveBbsData(bbsParam);
			} catch (Exception e) {
				File fileRemoveFile = null;
				if(fileList != null && fileList.size() > 0){
					for(BbsFileReply bbs : fileList) {
						fileRemoveFile = new File(dtlFilePath+bbs.getRealFileNm());
						if(fileRemoveFile.exists()) {
							fileRemoveFile.delete();
						}
					}
				}
				printStackTrace(e);
			}
	    	return "redirect:/admin/listBbsData/"+bbsParam.getMenuSeq()+"/"+bbsParam.getBoardSeq()+"?gseq="+bbsParam.getGseq()+"&lseq="+bbsParam.getLseq();
	    }
	  
    /**
     * 게시판관리 게시물 상세조회
     * 
     * @param model model
     * @return String String
     */
 	@RequestMapping(value="/admin/findBbsData",method=RequestMethod.POST)
    public String findBbsData(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
 		logger.info("AdminBbsMngController - findBbsData");
    	try {
    		 ArrayList<Common> listUpId = null;
    		 ArrayList<Common> listSaleId = null;
    		 commonMenu(model, bbsParam);
    		 ArrayList<BbsFileReply> bbsDataResult = adminCtsBbsService.findBbsData(bbsParam);
    		 
    		 if(bbsDataResult != null && bbsDataResult.size() > 0) {
    			 //무료강좌일경우
    			 if(bbsDataResult.get(0).getBoardType().equals("FREE")) {
    				 ArrayList<BbsFileReply> bbsTeacherResult = adminCtsBbsService.listBbsTeacher(bbsParam);
    				 model.addAttribute("bbsTeacherResult",bbsTeacherResult);
    			 }
    		 }
    		 
    		Common commonParam = null;
   		    commonParam = new Common();
	 	    commonParam.setCodeGbnCd("board_id");
			listUpId = aminMgrMngService.listFacil(commonParam);
			model.addAttribute("upList",listUpId);
			
			commonParam = new Common();
	 	    commonParam.setCodeGbnCd("sale_id");
			listSaleId = aminMgrMngService.listFacil(commonParam);
 	    	model.addAttribute("saleList",listSaleId);
    		model.addAttribute("bbs",bbsDataResult);
 		} catch (Exception e) {
 			printStackTrace(e);
 		}
    	return "admin/bbsMng/findBbsData";
    }
 	
   /**
    * 게시판관리 수정폼
    * 
    * @param model model
    * @return String String
    */
	@RequestMapping(value="/admin/formUpdateBbsData",method=RequestMethod.POST)
   public String formUpdateBbsData(Model model, BbsFileReply bbsParam, HttpServletRequest request) {
		logger.info("AdminBbsMngController - formUpdateBbsData");
   	try {
   		 ArrayList<Common> listUpId = null;
   		ArrayList<Common> listSaleId = null;
		 Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
   		 commonMenu(model, bbsParam);
   		 ArrayList<BbsFileReply> bbsDataResult = adminCtsBbsService.findBbsData(bbsParam);
   		 
   		Common commonParam = null;
   		
	   	 if(bbsDataResult != null && bbsDataResult.size() > 0) {
			 //무료강좌일경우
			 if(bbsDataResult.get(0).getBoardType().equals("FREE")) {
				 ArrayList<BbsFileReply> bbsTeacherResult = adminCtsBbsService.listBbsTeacher(bbsParam);
				 model.addAttribute("bbsTeacherResult",bbsTeacherResult);
			 }
		 }
	   	 
   		if(bbsDataResult != null && bbsDataResult.size() > 0) {
	   		  if(bbsDataResult.get(0).getCatCdYn().equals("Y")) {
		   			if(adminResult.getAdmAuthCode().equals("S")) {
			   		    commonParam = new Common();
				 	    commonParam.setCodeGbnCd("board_id");
						listUpId = aminMgrMngService.listFacil(commonParam);
					}else if(adminResult.getAdmAuthCode().equals("O")) {
						bbsParam.setAdmId(adminResult.getAdmId());
						listUpId = adminCtsBbsService.listFacilWithMenuSeq(bbsParam);
					}
		   			model.addAttribute("upList",listUpId);
	   		  }
	   		  if(bbsDataResult.get(0).getPgmCatCdYn().equals("Y")) {
		 	    	commonParam = new Common();
		 	    	commonParam.setCodeGbnCd("sale_id");
		 	    	listSaleId = aminMgrMngService.listFacil(commonParam);
		 	    	model.addAttribute("saleList",listSaleId);
	     	  }
	   		  model.addAttribute("bbs",bbsDataResult);
   		}
	} catch (Exception e) {
			printStackTrace(e);
	}
   	return "admin/bbsMng/formUpdateBbsData";
   }
   
	
	
	/**
     * 게시판관리 데이터 수정
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/updateBbsData",method=RequestMethod.POST)
    public String updateBbsData(HttpServletRequest request, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - updateBbsData");
		ArrayList<BbsFileReply> fileList = null;
		//파일 기본경로
		String dftFilePath = request.getServletContext().getRealPath("/");
		//파일 상세 경로
		//파일 기본경로 _ 상세경로
		String filePath = dftFilePath + dtlFilePath;
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setModiId(admInfo.getAdmId());
            
            File file = null;
    		BbsFileReply bbsFileReply = null;
            if(bbsParam.getBoardFileList() != null && bbsParam.getBoardFileList().size() > 0) {
            	fileList = new ArrayList<BbsFileReply>();
            	//파일 핸틀링
    			bbsParam.setBbsFileList(fileObjectSetting(bbsParam, bbsFileReply, file, filePath, admInfo, fileList));
    		}
            adminCtsBbsService.updateBbsData(bbsParam);
		} catch (Exception e) {
			File fileRemoveFile = null;
			if(fileList != null && fileList.size() > 0){
				for(BbsFileReply bbs : fileList) {
					fileRemoveFile = new File(dtlFilePath+bbs.getRealFileNm());
					if(fileRemoveFile.exists()) {
						fileRemoveFile.delete();
					}
				}
			}
			printStackTrace(e);
		}
    	return "redirect:/admin/listBbsData/"+bbsParam.getMenuSeq()+"/"+bbsParam.getBoardSeq()+"?gseq="+bbsParam.getGseq()+"&lseq="+bbsParam.getLseq();
    }
    
    /**
     * 게시판관리 클린신고센터 목록 조회
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/listClean")
    public String listClean(Model model, HttpServletRequest request, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - listClean");
    	try {
    		PageUtil PageUtil = new PageUtil();
    		commonMenu(model, bbsParam);
    		 
    		int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
 			int total_page = 0;
 			int findClenTotCnt = 0;
 			
 			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
 			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
 			
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchKey())) bbsParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchVal())) bbsParam.setSearchVal("");
			model.addAttribute("searchKey",bbsParam.getSearchKey());
			model.addAttribute("searchVal",bbsParam.getSearchVal());
			
 			int current_page = 1;   // 현재페이지 번호
 			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) current_page = Integer.parseInt(bbsParam.getPageNum());
 		     			
 			findClenTotCnt = adminCtsBbsService.findClenTotCnt(bbsParam);
 			if(findClenTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findClenTotCnt) ;
 			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
 	        if(total_page < current_page && total_page != 0) current_page = total_page;	

 	        // 리스트에 출력할 데이터를 가져오기
 	        int end   = current_page * numPerPage;
 	        int start = end - (numPerPage - 1);
 	        bbsParam.setStart(start);
 	        bbsParam.setEnd(end);
 	        
 	        String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            bbsParam.setCreateYmd(inDate);
 			ArrayList<BbsFileReply> listClean = adminCtsBbsService.listClean(bbsParam);
 			
 			 // 목록번호를 화면에 출력하기 위한 로직
 			listNoSet( bbsParam,listClean,  start,  findClenTotCnt);
 	        model.addAttribute("listClean",listClean);
 	        if(listClean != null && listClean.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/bbsMng/listClean";
    }
    
    /**
     * 게시판관리 클린신고센터 상세 조회
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/findClean/{cleanSeq}")
    public String findClean(Model model, HttpServletRequest request, BbsFileReply bbsParam, @PathVariable Integer cleanSeq) {
    	logger.info("AdminBbsMngController - findClean");
    	try {
    		bbsParam.setCleanSeq(cleanSeq);
    		commonMenu(model, bbsParam);
    		BbsFileReply cleanResult = adminCtsBbsService.findClean(bbsParam);
    		if(cleanResult != null && !GenericValidator.isBlankOrNull(cleanResult.getContent())) {
    			cleanResult.setContent(cleanResult.getContent().replaceAll("\r\n","<br/>"));
    		}
    		model.addAttribute("clean",cleanResult);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/bbsMng/findClean";
    }
    
    
    
    
    /**
     * 게시판관리 고객제안 목록 조회
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/listSuggest")
    public String listSuggest(Model model, HttpServletRequest request, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - listSuggest");
    	try {
    		PageUtil PageUtil = new PageUtil();
    		commonMenu(model, bbsParam);
    		int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
 			int total_page = 0;
 			int findSuggestTotCnt = 0;
 			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
 			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
 			if(GenericValidator.isBlankOrNull(bbsParam.getSearchKey())) bbsParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(bbsParam.getSearchVal())) bbsParam.setSearchVal("");
			model.addAttribute("searchKey",bbsParam.getSearchKey());
			model.addAttribute("searchVal",bbsParam.getSearchVal());
			model.addAttribute("statusCd",bbsParam.getStatusCd());
			model.addAttribute("suggestGbnCd",bbsParam.getSuggestGbnCd());
			
 			int current_page = 1;   // 현재페이지 번호
 			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) current_page = Integer.parseInt(bbsParam.getPageNum());
 			findSuggestTotCnt = adminCtsBbsService.findSuggestTotCnt(bbsParam);
 			
 			if(findSuggestTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findSuggestTotCnt) ;

 			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
 	        if(total_page < current_page && total_page != 0) current_page = total_page;	

 	        // 리스트에 출력할 데이터를 가져오기
 	        int end   = current_page * numPerPage;
 	        int start = end - (numPerPage - 1);
 	        bbsParam.setStart(start);
 	        bbsParam.setEnd(end);
 	        String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            bbsParam.setCreateYmd(inDate);
 			ArrayList<BbsFileReply> listSuggest = adminCtsBbsService.listSuggest(bbsParam);
 			// 목록번호를 화면에 출력하기 위한 로직
 			listNoSet( bbsParam,listSuggest,  start,  findSuggestTotCnt);
 	        model.addAttribute("listSuggest",listSuggest);
 	        if(listSuggest != null && listSuggest.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/bbsMng/listSuggest";
    }
    
    /**
     * 게시판관리 고객제안 상세 조회
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/findSuggest/{suggestSeq}")
    public String findSuggest(Model model, HttpServletRequest request, BbsFileReply bbsParam, @PathVariable Integer suggestSeq) {
    	try {
    		logger.info("AdminBbsMngController - findSuggest");
    		bbsParam.setSuggestSeq(suggestSeq);
    		commonMenu(model, bbsParam);
    		
    		BbsFileReply suggestResult = adminCtsBbsService.findSuggest(bbsParam);
    		
    		if(suggestResult.getStatusCd().equals("R")) {
    			String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
                String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
                Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
                
                bbsParam.setModiId(admInfo.getAdmId());
                bbsParam.setModiIp(request.getRemoteAddr());
                bbsParam.setModiYmd(inDate);
                bbsParam.setModiHms(inTime);
                bbsParam.setStatusCd("I");
                
        		adminCtsBbsService.updateSuggest(bbsParam);	
    		}

    		model.addAttribute("suggest",suggestResult);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/bbsMng/findSuggest";
    }
    
    @RequestMapping(value="/admin/updateSuggest")
    public String updateSuggest(Model model, HttpServletRequest request, BbsFileReply bbsParam) {
    	try {
    		logger.info("AdminBbsMngController - updateSuggest");
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            bbsParam.setModiId(admInfo.getAdmId());
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            
    		adminCtsBbsService.updateSuggest(bbsParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listSuggest?gseq="+bbsParam.getGseq()+"&lseq="+bbsParam.getLseq();
    }
    
    
    
    /**
     * 갤러리타입의 이미지 삭제(AJAX - JSON타입)
     * @param model model
     * @param request request
     * @param response response
     * @param bbsParam bbsParam
     */
    @RequestMapping(value="/admin/removeGallImg",method=RequestMethod.POST)
    public void removeGallImg(Model model, HttpServletRequest request, HttpServletResponse response, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - removeGallImg");
    	JSONObject jsonObj = null;
    	try {
    		jsonObj = new JSONObject(); 
        	adminCtsBbsService.removeGallImg(bbsParam,request);
        	jsonObj.put("flag", "Y");
		} catch (Exception e) {
			jsonObj = new JSONObject();
			printStackTrace(e);
			jsonObj.put("flag",e.toString());
		} finally{
			try {
				ParsingUtil.getjsonObj(response, jsonObj);
			} catch (IOException e) {
				printStackTrace(e);
			}
		}
    }
    
    /**
     * 게시판관리 고객제안 목록 조회
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/admin/listReply")
    public String listReply(Model model, HttpServletRequest request, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - listReply");
    	try {
    		PageUtil PageUtil = new PageUtil();
    		commonMenu(model, bbsParam);
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
			printStackTrace(e);
		}
    	return "admin/bbsMng/listReply";
    }
    
    @RequestMapping(value="/admin/saveReply",method=RequestMethod.POST)
    public String saveReply(Model model, HttpServletRequest request, HttpServletResponse response, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - saveReply");
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            bbsParam.setCreateId(admInfo.getAdmId());
            bbsParam.setCreateIp(request.getRemoteAddr());
            bbsParam.setCreateYmd(inDate);
            bbsParam.setCreateHms(inTime);
            bbsParam.setCreateNm(admInfo.getAdmNm());
    		adminCtsBbsService.saveReply(bbsParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listReply?dataSeq="+bbsParam.getDataSeq();
    }
    
    @RequestMapping(value="/admin/removeReply",method=RequestMethod.POST)
    public String removeReply(Model model, HttpServletRequest request, HttpServletResponse response, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - removeReply");
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            bbsParam.setModiId(admInfo.getAdmId());
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            bbsParam.setModiNm(admInfo.getAdmNm());
            
    		adminCtsBbsService.removeReply(bbsParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listReply?dataSeq="+bbsParam.getDataSeq();
    }
    
    /**
     * 게시판관리 고객제안 목록 조회
     * 
     * @param model model
     * @return String String
     */
	@RequestMapping(value="/admin/listLeastBbsData")
    public String listLeastBbsData(Model model, HttpServletRequest request, BbsFileReply bbsParam) {
    	logger.info("AdminBbsMngController - listLeastBbsData");
    	try {
    		PageUtil PageUtil = new PageUtil();
    		int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
 			int total_page = 0;
 			int findLeastBbsDataTotCnt = 0;
 			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
 			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
 			int current_page = 1;   // 현재페이지 번호
 			
 			if(!GenericValidator.isBlankOrNull(bbsParam.getPageNum())) current_page = Integer.parseInt(bbsParam.getPageNum());
 			findLeastBbsDataTotCnt = adminCtsBbsService.findLeastBbsDataTotCnt(bbsParam);
 			if(findLeastBbsDataTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findLeastBbsDataTotCnt) ;
 			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
 	        if(total_page < current_page && total_page != 0) current_page = total_page;	

 	        // 리스트에 출력할 데이터를 가져오기
 	        int end   = current_page * numPerPage;
 	        int start = end - (numPerPage - 1);
 	        bbsParam.setStart(start);
 	        bbsParam.setEnd(end);
 			ArrayList<BbsFileReply> listLeastBbsDataTotal = adminCtsBbsService.listLeastBbsDataTotal(bbsParam);
 			// 목록번호를 화면에 출력하기 위한 로직
 	        model.addAttribute("listLeastBbsData",listLeastBbsDataTotal);
 	       listNoSet( bbsParam, listLeastBbsDataTotal,  start,  findLeastBbsDataTotCnt);
 	        if(listLeastBbsDataTotal != null && listLeastBbsDataTotal.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/listLeastBbsData";
    }
    
    //메뉴 공통 메서드
    private void commonMenu(Model model, BbsFileReply bbsParam) throws SQLException{
		/////////////////////LNB 메뉴///////////////////
    		Menu menu = new Menu();
    		menu.setPageGbnCd("ADMIN");
    		menu.setMenuLvl(2);
    		menu.setGseq(bbsParam.getGseq());
    		ArrayList<Menu> lnbResult = adminLoginService.listMenu(menu);
    		model.addAttribute("gseq",bbsParam.getGseq());
    		model.addAttribute("lseq",bbsParam.getLseq());
    		model.addAttribute("lnb",lnbResult);	
		///////////////////////////////////////////////
    }
    
    /**
     * static 게시판 목록타입 
     * 
     * @param listTypeCd listTypeCd
     * @return ArrayList ArrayList
     */
    private ArrayList<Map<String, String>> listTypeCdMthd(ArrayList<Map<String, String>> listTypeCd) {
    	//파일첨부
		Map<String, String> hmap = null;
		
		//제목 + 내용 + 사업장 + 파일첨부
		hmap = new HashMap<String, String>();
		hmap.put("name", "공지형");
		hmap.put("value", "NOTI");
		listTypeCd.add(hmap);
		//제목 + 내용 + 사업장 + URL링크 + 파일첨부
		hmap = new HashMap<String, String>();
		hmap.put("name", "뉴스형");
		hmap.put("value", "NEWS");
		listTypeCd.add(hmap);
	
		//제목 + 사업장 + 이미지 파일첨부
		hmap = new HashMap<String, String>();
		hmap.put("name", "갤러리형");
		hmap.put("value", "GALL");
		listTypeCd.add(hmap);
		
		//제목 + 사업장 + 파일첨부
		hmap = new HashMap<String, String>();
		hmap.put("name", "커뮤니티형");
		hmap.put("value", "COMM");
		listTypeCd.add(hmap);
		
		hmap = new HashMap<String, String>();
		hmap.put("name", "무료체험강좌형");
		hmap.put("value", "FREE");
		listTypeCd.add(hmap);
		
		//제목 + 사업장 + 파일첨부
		hmap = new HashMap<String, String>();
		hmap.put("name", "분실물습득형");
		hmap.put("value", "LOSE");
		listTypeCd.add(hmap);
				
		return listTypeCd;
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
    private ArrayList<BbsFileReply> fileObjectSetting(BbsFileReply bbsParam, BbsFileReply bbsFileReply, File file, String filePath, Admin admInfo, ArrayList<BbsFileReply> fileList) throws Exception{
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
        		
        		
				realFileNm = admInfo.getAdmId()+today+UUID.randomUUID().toString() + multifile.getOriginalFilename().substring(multifile.getOriginalFilename().lastIndexOf("."));
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
				
				if(bbsParam.getBoardType().equals("GALL") || bbsParam.getBoardType().equals("LOSE") || bbsParam.getBoardType().equals("FREE")) {
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
    
    private void printStackTrace(Exception e){
    	logger.error("======= error =========");
		ByteArrayOutputStream out = new ByteArrayOutputStream();
	    PrintStream pinrtStream = new PrintStream(out);
	    e.printStackTrace(pinrtStream);
	    String stackTraceString = out.toString();
	    logger.error(stackTraceString);
    }
}