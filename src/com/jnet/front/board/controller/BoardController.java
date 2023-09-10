package com.jnet.front.board.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import Kisinfo.Check.IPINClient;
import NiceID.Check.CPClient;

import com.jnet.admin.bbsMng.service.AdminBbsMngService;
import com.jnet.admin.cptMng.service.AdminCptMngService;
import com.jnet.admin.empMng.service.AdminEmpMngService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
import com.jnet.domain.Emp;
import com.jnet.domain.Member;
import com.jnet.domain.Minwon;
import com.jnet.front.board.service.BoardService;
import com.jnet.util.CheckUtil;
import com.jnet.util.CommonUtil;
import com.jnet.util.FileUtil;
import com.jnet.util.IPINUtil;
import com.jnet.util.PageUtil;
import com.jnet.util.ParsingUtil;

@Controller
public class BoardController {
	

	@Autowired
	private AdminCptMngService adminCptMngService;
	
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	
	@Autowired
	private AdminBbsMngService adminCtsBbsService;
	
	@Autowired
	private AdminEmpMngService adminEmpMngService;
	
	@Autowired
	private BoardService boardService;
	
	/**
	 *  IPIN 서비스 사이트 코드		(NICE신용평가정보에서 발급한 사이트코드)
	 */
	private static final  String IPIN_SITECODE				= "C436";			
	/**
	 *  IPIN 서비스 사이트 패스워드	(NICE신용평가정보에서 발급한 사이트패스워드)
	 */
	private static final String IPIN_SITEPWD					= "90029549";
	
	/**
	 *  안심체크 서비스 사이트 코드		(NICE신용평가정보에서 발급한 사이트코드)
	 */
	private static final  String CHECK_SITECODE				= "O792";			
	/**
	 *  안심체크 서비스 사이트 패스워드	(NICE신용평가정보에서 발급한 사이트패스워드)
	 */
	private static final String CHECK_SITEPWD					= "35355775";
	
	private String dtlFilePath = "resources" + File.separator + "Pds" + File.separator + "Sugest" + File.separator;
	/**
	 * 민원관리 목록 조회
	 * @param model model
	 * @param request request
	 * @param bbsParam
	 * @return
	 */
	@RequestMapping("/front/listCpt")
    public String listBbsMng(Model model, HttpServletRequest request, Minwon minwonParam) {
    	PageUtil PageUtil = new PageUtil();
		try {
			String my = (String )request.getParameter("my");
			//commonMenu(model, minwonParam);
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findCptTotCnt = 0;
			Member userInfo = (Member) request.getSession().getAttribute("userInfo");
			if(userInfo !=null && !GenericValidator.isBlankOrNull(my)){
				if(!GenericValidator.isBlankOrNull(userInfo.getUserId())){
					minwonParam.setqIdDi(userInfo.getUserId());
				}else if(!GenericValidator.isBlankOrNull(userInfo.getUserDi())){
					minwonParam.setqIdDi(userInfo.getUserDi());
				}
			}
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(minwonParam.getPageNum())) { //blank or null 체크
				minwonParam.setPageNum("1");
		     }
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(minwonParam.getPageNum())){
				current_page = Integer.parseInt(minwonParam.getPageNum());
		    } 
			
			findCptTotCnt = adminCptMngService.findCptTotCnt(minwonParam);
			
			if(findCptTotCnt > 0)
				total_page = PageUtil.getPageCount(numPerPage,  findCptTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0){
	        	current_page = total_page;	
	        }

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        minwonParam.setStart(start);
	        minwonParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	minwonParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		minwonParam.setShowPage(findCptTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		minwonParam.setShowPage(findCptTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        minwonParam.setNumperPage(numPerPage);
	        minwonParam.setCurrentPage(numPerPage*current_page);
	        
			ArrayList<Minwon> listCptMng = adminCptMngService.listCptMng(minwonParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
			int listNum, n = 0;
	        ListIterator<Minwon> it = listCptMng.listIterator();
	        while(it.hasNext()) {
	        	minwonParam = (Minwon)it.next();
	       	 	listNum = findCptTotCnt - (start + n) + 1;
	       	 minwonParam.setListNo(listNum);
				n++;
			}
	        model.addAttribute("listParm",listCptMng);
	        if(listCptMng != null && listCptMng.size() > 0) {
	        	model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "front/board/boardList";
    }
	
	@RequestMapping("/front/listSugest")
	public String listSugest(Model model, HttpServletRequest request, BbsFileReply bbsParam) {
		try {
			String my = (String )request.getParameter("my");
    		PageUtil PageUtil = new PageUtil();
    		int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
 			int total_page = 0;
 			int findSuggestTotCnt = 0;
 			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.

			Member userInfo = (Member) request.getSession().getAttribute("userInfo");
			if(userInfo != null && !GenericValidator.isBlankOrNull(my)){
				if(!GenericValidator.isBlankOrNull(userInfo.getUserId())){
					bbsParam.setCreateId(userInfo.getUserId());
				}else if(!GenericValidator.isBlankOrNull(userInfo.getUserDi())){
					bbsParam.setCreateId(userInfo.getUserDi());
				}
			}
 			if(GenericValidator.isBlankOrNull(bbsParam.getPageNum())) bbsParam.setPageNum("1");
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
 	        model.addAttribute("listParm",listSuggest);
 	        if(listSuggest != null && listSuggest.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return "front/board/sugList";
	}

	@RequestMapping("/front/cleanMain")
    public String cleanMain(Model model) {
		try{
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        return "front/board/clean_main";
    }
	
	
	@RequestMapping("/front/formUpdateClean")
	public String formUpdateClean(Model model) {
		try{
			Common comParam = null;
    		listSetSlct(comParam, "mail",  model, "mailList");
    		listSetSlct(comParam, "phonearea",  model, "phoneList");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "front/board/clean_write";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/front/saveClean",method=RequestMethod.POST)
	public String saveClean(HttpServletRequest request, BbsFileReply bbsParam) {
	    	
		ArrayList<BbsFileReply> fileList = null;
		// 파일 기본경로
 		String dftFilePath = request.getServletContext().getRealPath("/");
 		// 파일 기본경로 _ 상세경로
 		String filePath = dftFilePath + dtlFilePath;
 		String userId="";
 		
    	try {
    		String inDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime = new SimpleDateFormat("HHmmss").format(new Date());

            bbsParam.setCreateYmd(inDate);
            bbsParam.setCreateHms(inTime);
            bbsParam.setCreateIp(request.getRemoteAddr());
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            bbsParam.setModiIp(request.getRemoteAddr());
            
            File file = null;
     		BbsFileReply bbsFileReply = null;
            if(bbsParam.getBoardFileList() != null && bbsParam.getBoardFileList().size() > 0) {
            	fileList = new ArrayList<BbsFileReply>();
            	//파일 핸틀링
    			bbsParam.setBbsFileList(fileObjectSetting(bbsParam, bbsFileReply, file, filePath,  fileList,"Clean"));
    		}
            bbsParam.setSubject(CommonUtil.tagOff(bbsParam.getSubject()));
            bbsParam.setUserNm(CommonUtil.tagOff(bbsParam.getUserNm()));
            bbsParam.setEmail1(CommonUtil.tagOff(bbsParam.getEmail1()));
            bbsParam.setEmail2(CommonUtil.tagOff(bbsParam.getEmail2()));
            bbsParam.setContent(CommonUtil.tagOff(bbsParam.getContent()));
    		boardService.saveClean(bbsParam);
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
			e.printStackTrace();
		}
    	return "redirect:/front/cleanMain";
    }
 
	
    

	@RequestMapping("/front/minwonList")
    public String minwonList(Model model) {
		try{
			ArrayList<Common> listUpId = null;
			Common commonParam = null;
			commonParam = new Common();
			commonParam.setCodeGbnCd("minwon");
			listUpId = aminMgrMngService.listFacil(commonParam);
			model.addAttribute("listUpId", listUpId);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        return "front/board/minwon_list";
    }
	
	
	@RequestMapping("/front/minwonMyList")
	public String minwonMyList(Model model) {
		try{
			ArrayList<Common> listUpId = null;
			Common commonParam = null;
			commonParam = new Common();
			commonParam.setCodeGbnCd("minwon");
			listUpId = aminMgrMngService.listFacil(commonParam);
			model.addAttribute("listUpId", listUpId);
			model.addAttribute("my", "my");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "front/board/minwon_list";
	}
	
	
	@RequestMapping("/front/sugestList")
	public String sugestList(Model model) {
		try{
			ArrayList<Common> listUpId = null;
			Common commonParam = null;
			commonParam = new Common();
			commonParam.setCodeGbnCd("up_id");
			listUpId = aminMgrMngService.listFacil(commonParam);
			model.addAttribute("listUpId", listUpId);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "front/board/sugest_list";
	}
	
	@RequestMapping("/front/sugestMyList")
	public String sugestMyList(Model model) {
		try{
			ArrayList<Common> listUpId = null;
			Common commonParam = null;
			commonParam = new Common();
			commonParam.setCodeGbnCd("up_id");
			listUpId = aminMgrMngService.listFacil(commonParam);
			model.addAttribute("listUpId", listUpId);
			model.addAttribute("my", "my");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "front/board/sugest_list";
	}
	
	@RequestMapping("/front/minwonMain")
	public String minwonMain(Model model,HttpServletRequest request) {
		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
		model.addAttribute("userInfo", userInfo);
		return "front/board/minwon_main";
	}
	
    @RequestMapping("/front/formCreateMinwon/{upId}")
    public String formCreateMinwon(Model model,HttpServletRequest request,Minwon minwonParam,@PathVariable("upId") String upId) {
    	try {
    		ArrayList<Common> listUpId = null;
    		ArrayList<Common> listGbnId = null;
			Common commonParam = null;
   		    commonParam = new Common();
	 	    commonParam.setCodeGbnCd("minwon");
	 	    Common commonParam1 = null;
	 	    commonParam1 = new Common();
	 	    commonParam1.setCodeGbnCd("AREA");
			listUpId = aminMgrMngService.listFacil(commonParam);
			listGbnId = aminMgrMngService.listFacil(commonParam1);
			model.addAttribute("listUpId", listUpId);
			model.addAttribute("listGbnId", listGbnId);
			model.addAttribute("upId", upId);
			Member userInfo = (Member) request.getSession().getAttribute("userInfo");
			if(userInfo !=null){
				model.addAttribute("qNm", userInfo.getUserNm());
				model.addAttribute("qBirth", userInfo.getBirthday());
				model.addAttribute("qSex", userInfo.getSex());
				if(!"".equals(userInfo.getUserId()) && userInfo.getUserId()!=null){
					model.addAttribute("qIdDi", userInfo.getUserId());
					model.addAttribute("zipcode1", userInfo.getZipcode().substring(0, 3));
					model.addAttribute("zipcode2", userInfo.getZipcode().substring(3, 6));
					model.addAttribute("addr", userInfo.getAddr());
					model.addAttribute("addr2", userInfo.getAddr2());
					model.addAttribute("phone1", userInfo.getPhone().split("-")[0]);
					model.addAttribute("phone2", userInfo.getPhone().split("-")[1]);
					model.addAttribute("phone3", userInfo.getPhone().split("-")[2]);
					model.addAttribute("email1", userInfo.getEmail()==""?"":userInfo.getEmail().split("@")[0]);
					model.addAttribute("email2", userInfo.getEmail()==""?"":userInfo.getEmail().split("@")[1]);
				}else{
					model.addAttribute("qIdDi", userInfo.getUserDi());
				}
				
			}else{
				model.addAttribute("qNm", minwonParam.getqNm());
				model.addAttribute("qBirth", minwonParam.getqBirth());
				model.addAttribute("qIdDi", minwonParam.getqIdDi());
				model.addAttribute("qSex", minwonParam.getqSex());
				
			}
			
			Common comParam = null;
    		listSetSlct(comParam, "mail",  model, "mailList");
    		listSetSlct(comParam, "phonearea",  model, "phoneList");
	    	
    	} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return "front/board/minwon_write";
    }
    
	
	@RequestMapping("/front/findMinwon")
	public String findMinwon(Model model,HttpServletRequest request,Minwon minwonParam) {

		try{
			Minwon outMinwon =new Minwon();
			outMinwon=adminCptMngService.findCptMng(minwonParam);
			model.addAttribute("outMinwon", outMinwon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "front/board/minwon_view";
	}
	
	
    
	@RequestMapping("/front/findSugest")
	public String findSugest(Model model,HttpServletRequest request,BbsFileReply bbsParam) {
		Member userInfo = null;
		userInfo=(Member) request.getSession().getAttribute("userInfo");
		try{
			BbsFileReply outBbs =new BbsFileReply();
			outBbs=adminCtsBbsService.findSuggest(bbsParam);
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("outBbs", outBbs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "front/board/sugest_view";
	}
	
	
	
	@RequestMapping("/front/formUpdateMinwon")
	public String formUpdateMinwon(Model model,HttpServletRequest request,Minwon minwonParam) {
		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
		model.addAttribute("userInfo", userInfo);
		try{
    		ArrayList<Common> listUpId = null;
    		ArrayList<Common> listGbnId = null;
			Common commonParam = null;
   		    commonParam = new Common();
	 	    commonParam.setCodeGbnCd("minwon");
	 	    Common commonParam1 = null;
	 	    commonParam1 = new Common();
	 	    commonParam1.setCodeGbnCd("AREA");
			listUpId = aminMgrMngService.listFacil(commonParam);
			listGbnId = aminMgrMngService.listFacil(commonParam1);
			model.addAttribute("listUpId", listUpId);
			model.addAttribute("listGbnId", listGbnId);
			Minwon outMinwon =new Minwon();
			outMinwon=adminCptMngService.findCptMng(minwonParam);
			model.addAttribute("outMinwon", outMinwon);
			Common comParam = null;
    		listSetSlct(comParam, "mail",  model, "mailList");
    		listSetSlct(comParam, "phonearea",  model, "phoneList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "front/board/minwon_update";
	}
	
	
    @RequestMapping("/front/formCreateSugest")
    public String formCreateSugest(Model model,HttpServletRequest request,BbsFileReply bbsParam) {
    	try {
    		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
    		if(userInfo !=null){
    			model.addAttribute("userNm", userInfo.getUserNm());
    			if(!"".equals(userInfo.getUserId()) && userInfo.getUserId()!=null){
					model.addAttribute("phone1", userInfo.getPhone().split("-")[0]);
					model.addAttribute("phone2", userInfo.getPhone().split("-")[1]);
					model.addAttribute("phone3", userInfo.getPhone().split("-")[2]);
					model.addAttribute("email1", userInfo.getEmail()==""?"":userInfo.getEmail().split("@")[0]);
					model.addAttribute("email2", userInfo.getEmail()==""?"":userInfo.getEmail().split("@")[1]);
    			}
    			
    		}else{
    			model.addAttribute("userNm", bbsParam.getUserNm());
    		}
			Common comParam = null;
    		listSetSlct(comParam, "mail",  model, "mailList");
    		listSetSlct(comParam, "phonearea",  model, "phoneList");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return "front/board/sugest_write";
    }
    

	
	@RequestMapping("/front/formUpdateSugest")
	public String formUpdateSugest(Model model,HttpServletRequest request,BbsFileReply bbsParam) {
		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
		try{

			BbsFileReply outBbs =new BbsFileReply();
			outBbs=adminCtsBbsService.findSuggest(bbsParam);
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("outBbs", outBbs);
			Common comParam = null;
    		listSetSlct(comParam, "mail",  model, "mailList");
    		listSetSlct(comParam, "phonearea",  model, "phoneList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "front/board/sugest_update";
	}
	
	/**
     * 게시판관리 데이터 수정
     * 
     * @param model model
     * @return String String
     */
    @RequestMapping(value="/front/updateSugest",method=RequestMethod.POST)
    public String updateBbsData(HttpServletRequest request, BbsFileReply bbsParam) {
		ArrayList<BbsFileReply> fileList = null;
		//파일 기본경로
		String dftFilePath = request.getServletContext().getRealPath("/");
		//파일 상세 경로
		//파일 기본경로 _ 상세경로
		String filePath = dftFilePath + dtlFilePath;
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Member userInfo = (Member) request.getSession().getAttribute("userInfo");
            
            bbsParam.setModiYmd(inDate);
            bbsParam.setModiHms(inTime);
            bbsParam.setModiIp(request.getRemoteAddr());
            bbsParam.setCreateYmd(inDate);
            bbsParam.setCreateHms(inTime);
            bbsParam.setCreateIp(request.getRemoteAddr());
            if(!GenericValidator.isBlankOrNull(userInfo.getUserId())){
            	bbsParam.setCreateId(userInfo.getUserId());
            	bbsParam.setModiId(userInfo.getUserId());
            }else{
            	bbsParam.setCreateId(userInfo.getUserDi());
            	bbsParam.setModiId(userInfo.getUserDi());
            }
            File file = null;
    		BbsFileReply bbsFileReply = null;
            if(bbsParam.getBoardFileList() != null && bbsParam.getBoardFileList().size() > 0) {
            	fileList = new ArrayList<BbsFileReply>();
            	//파일 핸틀링
    			bbsParam.setBbsFileList(fileObjectSetting(bbsParam, bbsFileReply, file, filePath,  fileList,"Sugest"));
    		}
            bbsParam.setSubject(CommonUtil.tagOff(bbsParam.getSubject()));
            bbsParam.setUserNm(CommonUtil.tagOff(bbsParam.getUserNm()));
            bbsParam.setEmail1(CommonUtil.tagOff(bbsParam.getEmail1()));
            bbsParam.setEmail2(CommonUtil.tagOff(bbsParam.getEmail2()));
            bbsParam.setPurpose(CommonUtil.tagOff(bbsParam.getPurpose()));
            bbsParam.setProblem(CommonUtil.tagOff(bbsParam.getProblem()));
            bbsParam.setWay(CommonUtil.tagOff(bbsParam.getWay()));
            bbsParam.setEffect(CommonUtil.tagOff(bbsParam.getEffect()));
            
            boardService.updateSugest(bbsParam);
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
			e.printStackTrace();
		}
    	return "redirect:/front/sugestList";
    }
    
    /**
     * 게시판관리 데이터 수정
     * 
     * @param model model
     * @return String String
     */
	@RequestMapping(value="/front/removeSugest",method=RequestMethod.POST)
    public String removeSugest(HttpServletRequest request, BbsFileReply bbsParam) {
    	ArrayList<BbsFileReply> fileList = null;
    	//파일 기본경로
    	String dftFilePath = request.getServletContext().getRealPath("/");
    	//파일 상세 경로
    	//파일 기본경로 _ 상세경로
    	String filePath = dftFilePath + dtlFilePath;
    	try {
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
    		String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
    		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
    		
    		bbsParam.setModiYmd(inDate);
    		bbsParam.setModiHms(inTime);
    		bbsParam.setModiIp(request.getRemoteAddr());
    		bbsParam.setRmYn("Y");
    		if(!GenericValidator.isBlankOrNull(userInfo.getUserId())){
    			bbsParam.setCreateId(userInfo.getUserId());
    			bbsParam.setModiId(userInfo.getUserId());
    		}else{
    			bbsParam.setCreateId(userInfo.getUserDi());
    			bbsParam.setModiId(userInfo.getUserDi());
    		}
    		File file = null;
    		BbsFileReply bbsFileReply = null;
    		if(bbsParam.getBoardFileList() != null && bbsParam.getBoardFileList().size() > 0) {
    			fileList = new ArrayList<BbsFileReply>();
    			//파일 핸틀링
    			bbsParam.setBbsFileList(fileObjectSetting(bbsParam, bbsFileReply, file, filePath,  fileList,"Sugest"));
    		}
    		boardService.updateSugest(bbsParam);
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
    		e.printStackTrace();
    	}
    	return "redirect:/front/sugestList";
    }
    
	
    
	    @SuppressWarnings("unused")
		@RequestMapping(value="/front/saveMinwon",method=RequestMethod.POST)
	    public String saveMinwon(HttpServletRequest request, Minwon minwonParam) {
	    	String userNm="";
	    	String userBirth="";
	    	String userSex="";
	    	try {
	    		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
	    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
	            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
	            if(userInfo != null){	      //로그인했을때      	
	            	minwonParam.setqNm(userInfo.getUserNm());
	            	minwonParam.setqBirth(userInfo.getBirthday());
	            	minwonParam.setqSex(userInfo.getSex());
	    	    	if(!"".equals(userInfo.getUserId()) && userInfo.getUserId()!=null){
	    	    		minwonParam.setqIdDi(userInfo.getUserId());
	    	    		minwonParam.setCreateIdDi(userInfo.getUserId());
	    	    		minwonParam.setModiIdDi(userInfo.getUserId());
	    	    	}else{
	    	    		minwonParam.setqIdDi(userInfo.getUserDi());
	    	    		minwonParam.setCreateIdDi(userInfo.getUserDi());
	    	    		minwonParam.setModiIdDi(userInfo.getUserDi());
	    	    	}
	            }else{
	            	minwonParam.setCreateIdDi(minwonParam.getqIdDi());
	            	minwonParam.setModiIdDi(minwonParam.getqIdDi());
	            }
	            minwonParam.setCreateYmd(inDate);
	            minwonParam.setCreateHms(inTime);
	            minwonParam.setCreateIp(request.getRemoteAddr());
	            minwonParam.setModiYmd(inDate);
	            minwonParam.setModiHms(inTime);
	            minwonParam.setModiIp(request.getRemoteAddr());
	            
	            
	            minwonParam.setSubject(CommonUtil.tagOff(minwonParam.getSubject()));
	            minwonParam.setDtlAddr(CommonUtil.tagOff(minwonParam.getDtlAddr()));
	            minwonParam.setContent(CommonUtil.tagOff(minwonParam.getContent()));
	            minwonParam.setEmail1(CommonUtil.tagOff(minwonParam.getEmail1()));
	            minwonParam.setEmail2(CommonUtil.tagOff(minwonParam.getEmail2()));
	            minwonParam.setSubject(CommonUtil.tagOff(minwonParam.getSubject()));
	    		//세이브
	            boardService.saveMinwonQ(minwonParam);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    	return "redirect:/front/minwonList";
	    }
	    	    
	    @RequestMapping(value="/front/saveAssess" , method=RequestMethod.POST)
		public void saveAssess(HttpServletRequest request, HttpServletResponse response, int score,String assess,int qSeq) throws Exception {
			JSONObject jsonObj = new JSONObject();
			try {
				Minwon minwon = new Minwon();
				minwon.setScore(score);
				minwon.setAssess(assess);
				minwon.setqSeq(qSeq);
				minwon.setAssess(CommonUtil.tagOff(minwon.getAssess()));
				boardService.saveAssess(minwon);
				ParsingUtil.getjsonObj(response, jsonObj);
				
			} catch (SQLException e) {
				e.getStackTrace();
			}
		}
	    
	    
	    @SuppressWarnings("unused")
		@RequestMapping(value="/front/removeMinwon",method=RequestMethod.POST)
	    public String removeMinwon(HttpServletRequest request, Minwon minwonParam) {
	    	String userNm="";
	    	String userBirth="";
	    	String userSex="";
	    	try {
	    		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
	    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
	    		String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
	    		if(userInfo != null){	      //로그인했을때      	
	    			minwonParam.setqNm(userInfo.getUserNm());
	    			minwonParam.setqBirth(userInfo.getBirthday());
	    			minwonParam.setqIdDi(userInfo.getUserId());
	    			minwonParam.setqSex(userInfo.getSex());
	    			minwonParam.setCreateIdDi(userInfo.getUserId());
	    			minwonParam.setModiIdDi(userInfo.getUserId());
	    		}else{
	    			minwonParam.setCreateIdDi(minwonParam.getqIdDi());
	    			minwonParam.setModiIdDi(minwonParam.getqIdDi());
	    		}
	    		minwonParam.setCreateYmd(inDate);
	    		minwonParam.setCreateHms(inTime);
	    		minwonParam.setCreateIp(request.getRemoteAddr());
	    		minwonParam.setModiYmd(inDate);
	    		minwonParam.setModiHms(inTime);
	    		minwonParam.setModiIp(request.getRemoteAddr());
	    		minwonParam.setRmYn("Y");
	    		
	    		//세이브
	    		boardService.saveMinwonQ(minwonParam);
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return "redirect:/front/minwonList";
	    }
	    
	    
	    @SuppressWarnings("unused")
		@RequestMapping(value="/front/saveSugest",method=RequestMethod.POST)
	    public String saveSugest(HttpServletRequest request, BbsFileReply bbsParam) {
	    	
			ArrayList<BbsFileReply> fileList = null;
			//파일 기본경로
    		String dftFilePath = request.getServletContext().getRealPath("/");
    		//파일 기본경로 _ 상세경로
    		String filePath = dftFilePath + dtlFilePath;
    		String userId="";
	    	try {
	    		Member userInfo = (Member) request.getSession().getAttribute("userInfo");
	    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
	            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
	            
	            if(!GenericValidator.isBlankOrNull(userInfo.getUserId())){
	            	bbsParam.setCreateId(userInfo.getUserId());
	            	bbsParam.setModiId(userInfo.getUserId());
	            }else{
	            	bbsParam.setCreateId(userInfo.getUserDi());
	            	bbsParam.setModiId(userInfo.getUserDi());
	            }
	            bbsParam.setCreateNm(userInfo.getUserNm());
	            bbsParam.setCreateYmd(inDate);
	            bbsParam.setCreateHms(inTime);
	            bbsParam.setCreateIp(request.getRemoteAddr());
	            bbsParam.setModiYmd(inDate);
	            bbsParam.setModiHms(inTime);
	            bbsParam.setModiIp(request.getRemoteAddr());
	            
	            File file = null;
        		BbsFileReply bbsFileReply = null;
	            if(bbsParam.getBoardFileList() != null && bbsParam.getBoardFileList().size() > 0) {
	            	fileList = new ArrayList<BbsFileReply>();
	            	//파일 핸틀링
	    			bbsParam.setBbsFileList(fileObjectSetting(bbsParam, bbsFileReply, file, filePath,  fileList,"Sugest"));
	    		}
	            bbsParam.setSubject(CommonUtil.tagOff(bbsParam.getSubject()));
	            bbsParam.setUserNm(CommonUtil.tagOff(bbsParam.getUserNm()));
	            bbsParam.setEmail1(CommonUtil.tagOff(bbsParam.getEmail1()));
	            bbsParam.setEmail2(CommonUtil.tagOff(bbsParam.getEmail2()));
	            bbsParam.setPurpose(CommonUtil.tagOff(bbsParam.getPurpose()));
	            bbsParam.setProblem(CommonUtil.tagOff(bbsParam.getProblem()));
	            bbsParam.setWay(CommonUtil.tagOff(bbsParam.getWay()));
	            bbsParam.setEffect(CommonUtil.tagOff(bbsParam.getEffect()));
	    		boardService.saveSugest(bbsParam);
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
				e.printStackTrace();
			}
	    	return "redirect:/front/sugestList";
	    }
    
	
	@RequestMapping("/front/selfCerty")
	public String selfCerty(Model model,HttpServletRequest request) {
    	String retUrl1="certyIpin";
    	String retUrl2="certyCheck";
    	Map<String, Object> ipinInfo = IPINUtil.setIpin(request,retUrl1);
    	Map<String, Object> checkInfo = CheckUtil.setCheck(request,retUrl2,"","");
    	model.addAttribute("ipinInfo",ipinInfo);
    	model.addAttribute("checkInfo",checkInfo);
    	model.addAttribute("returnUrl",request.getParameter("returnUrl"));

		return "front/board/self_certy";
	}
	
	/**
   	 * 회원가입2(회원정보입력)
   	 * @return
   	 */
       @SuppressWarnings("unused")
	@RequestMapping(value="/certyIpin")
       public String certyIpin(Model model,HttpServletRequest request) {
    	   String retStr="";
//       	ModelAndView mav = new ModelAndView("front/member/findIpinInfoByJoinus"); //new ModelAndView("front/member/joinus_2");
       	/********************************************************************************************************************************************
   			NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
   			
   			서비스명 : 가상주민번호서비스 (IPIN) 서비스
   			페이지명 : 가상주민번호서비스 (IPIN) 사용자 인증 정보 처리 페이지
   		
   		     수신받은 데이터(인증결과)를 메인화면으로 되돌려주고, close를 하는 역활을 합니다.
   		 *********************************************************************************************************************************************/
   		// 사용자 정보 및 CP 요청번호를 암호화한 데이타입니다. (ipin_main.jsp 페이지에서 암호화된 데이타와는 다릅니다.)
   		String sResponseData = requestReplace(request.getParameter("enc_data"), "encodeData");
   		String sReservedParam1  = request.getParameter("param_r1");
   		
   		// ipin_main.jsp 페이지에서 설정한 데이타가 있다면, 아래와 같이 확인가능합니다.
   	    IPINClient pClient = new IPINClient();
   	    int iRtn = pClient.fnResponse(IPIN_SITECODE, IPIN_SITEPWD, sResponseData);
   		String sDupInfo				= pClient.getDupInfo();			// 중복가입 확인값 (DI - 64 byte 고유값)
   		String sAgeCode = pClient.getAgeCode();
   		String sName = pClient.getName();
   		String birthday = pClient.getBirthDate();
   		String sGenderCode = pClient.getGenderCode();
   		request.getSession().setAttribute("di", sDupInfo);
   		if(!GenericValidator.isBlankOrNull(sResponseData)) {
   			try {
   				model.addAttribute("sDi", sDupInfo);
   				model.addAttribute("iRtn",iRtn);
   				model.addAttribute("sBirth",birthday);
   				model.addAttribute("sName",sName);
   				model.addAttribute("sGenderCode","1".equals(sGenderCode)?"1":"0");
   				if(iRtn==1){
   					Member memberResult = new Member();
   					memberResult.setUserDi(sDupInfo);
   					memberResult.setBirthday(birthday);
   					memberResult.setUserNm(sName);
   					memberResult.setSex("1".equals(sGenderCode)?"1":"0");
   					request.getSession().setAttribute("userInfo", memberResult);
   				}
   			} catch (Exception e) {
   				e.getStackTrace();
   				 
   	 			ByteArrayOutputStream out = new ByteArrayOutputStream();
   	 			PrintStream pinrtStream = new PrintStream(out);
   	 			e.printStackTrace(pinrtStream);
   	 			String stackTraceString = out.toString(); // 찍은 값을 가져오고.
   	 			  
   	 			model.addAttribute("errCd",e.toString().replaceAll("---", "<br/>"));
 				model.addAttribute("errMsg", stackTraceString.replaceAll("---", "<br/>"));
   	 			//return new ModelAndView("exceptionPage","errCode",hmap);
   	 		    retStr="exceptionPage";
   	 			return retStr;
   			}
   			
   		} else {
   			//mav = new ModelAndView("exceptionScriptPage","scriptCd","sResponseData가 NULL이거나 비어있습니다.\\n관리자에게문의주세요");
   			model.addAttribute("scriptCd","sResponseData가 NULL이거나 비어있습니다.\\n관리자에게문의주세요");
   			retStr="exceptionScriptPage";
   		}
   	    //return mav;
   		return "front/board/findIpinInfoByJoinus";
       }
       
       
       /**
      	 * 회원가입2(회원정보입력)
      	 * @return
      	 */
          @SuppressWarnings({ "unused", "rawtypes" })
		@RequestMapping(value="/certyCheck")
          public String certyCheck(Model model,HttpServletRequest request) {
       	   String retStr="";
      		// 사용자 정보 및 CP 요청번호를 암호화한 데이타입니다. (ipin_main.jsp 페이지에서 암호화된 데이타와는 다릅니다.)
      		String sResponseData = requestReplace(request.getParameter("enc_data"), "encodeData");
        		
      		// ipin_main.jsp 페이지에서 설정한 데이타가 있다면, 아래와 같이 확인가능합니다.
      		
      	    String sCipherTime = "";						// 복호화한 시간
      	    String sRequestNO = "";						// 요청 번호
      	    String sPlainData = "";
      	    
      	    String sMessage = "";
      	    String sResult = "";
      	    
      	   CPClient niceCheck = new  CPClient();
      	    int iRtn = niceCheck.fnDecode(CHECK_SITECODE, CHECK_SITEPWD, sResponseData);
      	    sPlainData = niceCheck.getPlainData();
      	   
      	   HashMap mapresult = niceCheck.fnParse(sPlainData);
      		
      	    String sDupInfo =(String)mapresult.get("IPIN_DI");
      	    String sGenderCode			= (String)mapresult.get("GENDER");
      		if(!GenericValidator.isBlankOrNull(sResponseData)) {
      			try {
      				if( iRtn == 0 )
      			    {
      			    	sMessage = "본인인증 성공하였습니다.";
      			        sCipherTime = niceCheck.getCipherDateTime();
      			        
      			        String session_sRequestNumber = (String)request.getSession().getAttribute("REQ_SEQ");
      			       sRequestNO=(String)mapresult.get("REQ_SEQ");
      			        if(!sRequestNO.equals(session_sRequestNumber))
      			        {
      			            sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
      			            sRequestNO = "";
      			            iRtn=1;
      			        }
         				if("M".equals(sGenderCode) || "A".equals(sGenderCode)){
         					sGenderCode="1";
         				}else if("F".equals(sGenderCode) || "B".equals(sGenderCode)){
         					sGenderCode="2";
         				}
         				model.addAttribute("sGenderCode",sGenderCode);
      			        model.addAttribute("sDi", sDupInfo);
      			        model.addAttribute("sResponseData",sResponseData);
      			        model.addAttribute("iRtn",iRtn);
      			        model.addAttribute("sBirth",(String)mapresult.get("BIRTHDATE"));
      			        model.addAttribute("sName",(String)mapresult.get("NAME"));
  	   					Member memberResult = new Member();
  	   					//세션관리
  	   					memberResult.setUserDi(sDupInfo);
  	   					memberResult.setBirthday((String)mapresult.get("BIRTHDATE"));
  	   					memberResult.setUserNm((String)mapresult.get("NAME"));
  	   					memberResult.setSex(sGenderCode);
  	   					request.getSession().setAttribute("userInfo", memberResult);
      			        
      			    }
      			} catch (Exception e) {
      				e.getStackTrace();
      				 
      	 			ByteArrayOutputStream out = new ByteArrayOutputStream();
      	 			PrintStream pinrtStream = new PrintStream(out);
      	 			e.printStackTrace(pinrtStream);
      	 			String stackTraceString = out.toString(); // 찍은 값을 가져오고.
      	 			model.addAttribute("errCd",e.toString().replaceAll("---", "<br/>"));
    				model.addAttribute("errMsg", stackTraceString.replaceAll("---", "<br/>"));
      	 			//return new ModelAndView("exceptionPage","errCode",hmap);
      	 		    retStr="exceptionPage";
      	 			return retStr;
      			}
      			
      		} else {
      			//mav = new ModelAndView("exceptionScriptPage","scriptCd","sResponseData가 NULL이거나 비어있습니다.\\n관리자에게문의주세요");
      			model.addAttribute("scriptCd","sResponseData가 NULL이거나 비어있습니다.\\n관리자에게문의주세요");
      			retStr="exceptionScriptPage";
      		}
      	    //return mav;
      		return "front/board/findCheckInfoByJoinus";
          }
          
          public static String requestReplace (String paramValue, String gubun) {
              String result = "";
              
              if (paramValue != null) {
              	
              	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

              	paramValue = paramValue.replaceAll("\\*", "");
              	paramValue = paramValue.replaceAll("\\?", "");
              	paramValue = paramValue.replaceAll("\\[", "");
              	paramValue = paramValue.replaceAll("\\{", "");
              	paramValue = paramValue.replaceAll("\\(", "");
              	paramValue = paramValue.replaceAll("\\)", "");
              	paramValue = paramValue.replaceAll("\\^", "");
              	paramValue = paramValue.replaceAll("\\$", "");
              	paramValue = paramValue.replaceAll("'", "");
              	paramValue = paramValue.replaceAll("@", "");
              	paramValue = paramValue.replaceAll("%", "");
              	paramValue = paramValue.replaceAll(";", "");
              	paramValue = paramValue.replaceAll(":", "");
              	paramValue = paramValue.replaceAll("-", "");
              	paramValue = paramValue.replaceAll("#", "");
              	paramValue = paramValue.replaceAll("--", "");
              	paramValue = paramValue.replaceAll("-", "");
              	paramValue = paramValue.replaceAll(",", "");
              	
              	if(gubun != "encodeData"){
              		paramValue = paramValue.replaceAll("\\+", "");
              		paramValue = paramValue.replaceAll("/", "");
                  paramValue = paramValue.replaceAll("=", "");
              	}
              	
              	result = paramValue;
                  
              }
              return result;
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
          private ArrayList<BbsFileReply> fileObjectSetting(BbsFileReply bbsParam, BbsFileReply bbsFileReply, File file, String filePath, ArrayList<BbsFileReply> fileList, String boardNm) throws Exception{
        	  
          	for(MultipartFile multifile : bbsParam.getBoardFileList()) {
      			if(!GenericValidator.isBlankOrNull(multifile.getOriginalFilename())) {
      				bbsFileReply = new BbsFileReply();
          			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
      				String today = formatter.format(new java.util.Date());
              		file = new File(filePath);
              		
              		if(!file.exists()) {
              			file.mkdirs();
              		}
              		
              		//db 저장될 경로
              		String dbPath = "/resources/Pds/"+boardNm+"/";
              		String realFileNm = "";
              		
      				realFileNm = today+UUID.randomUUID().toString() + multifile.getOriginalFilename().substring(multifile.getOriginalFilename().lastIndexOf("."));
      				bbsFileReply.setFileSize(multifile.getSize());
      				bbsFileReply.setFilePath(dbPath);
      				bbsFileReply.setOrgnlFileNm(multifile.getOriginalFilename());
      				bbsFileReply.setRealFileNm(realFileNm);
      				bbsFileReply.setThumbYn("N");
      				bbsFileReply.setSuggestFileSeq(bbsParam.getSuggestFileSeq());
      				
      				bbsFileReply.setCreateId(bbsParam.getModiId());
      				bbsFileReply.setCreateIp(bbsParam.getModiIp());
      				bbsFileReply.setCreateYmd(bbsParam.getModiYmd());
      				bbsFileReply.setCreateHms(bbsParam.getModiHms());
      				fileList.add(bbsFileReply);
      				
      				//파일저장
      				String rlFileNm = filePath + realFileNm;
      				//String thFileNm = filePath + "thumb_"+realFileNm ;
      				file = new File(rlFileNm);
      				multifile.transferTo(file);
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
          
          /**
           * 조직관리 목록 조회
           * @return String String
           */
          @RequestMapping("/front/listEmp")
          public String listEmp(Model model, Emp empParam) {
          	PageUtil PageUtil = new PageUtil();
      		try {
      			
      			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
      			int total_page = 0;
      			int findEmpTotCnt = 0;
      			
      			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
      			if(GenericValidator.isBlankOrNull(empParam.getPageNum())) empParam.setPageNum("1");
      			if(GenericValidator.isBlankOrNull(empParam.getSearchKey()))  empParam.setSearchKey("all");
      			if(GenericValidator.isBlankOrNull(empParam.getSearchVal())) empParam.setSearchVal("");
      			
      			model.addAttribute("searchKey",empParam.getSearchKey());
      			model.addAttribute("searchVal",empParam.getSearchVal());
      			model.addAttribute("empDept",empParam.getEmpDept());
      			model.addAttribute("menuSeq","180");//만족도조사를 위한 별도의 menuSeq
      			
      			int current_page = 1;   // 현재페이지 번호
      			if(!GenericValidator.isBlankOrNull(empParam.getPageNum())){
      				current_page = Integer.parseInt(empParam.getPageNum());
      		    } 
      			
      			findEmpTotCnt = adminEmpMngService.findEmpTotCnt(empParam);
      			
      			if(findEmpTotCnt > 0)
      				total_page = PageUtil.getPageCount(numPerPage,  findEmpTotCnt) ;

      			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
      	        if(total_page < current_page && total_page != 0){
      	        	current_page = total_page;	
      	        }

      	        // 리스트에 출력할 데이터를 가져오기
      	        int end   = current_page * numPerPage;
      	        int start = end - (numPerPage - 1);
      	        empParam.setStart(start);
      	        empParam.setEnd(end);
      	        
      	        if(total_page > current_page) {
	  	        	//최종페이지 기본 수 만큼 set
	  	        	empParam.setShowPage(numPerPage);
	  	        }else {
	  	        	if(current_page == 1) {
	  	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	  	        		empParam.setShowPage(findEmpTotCnt);
	  	        	} else {
	  	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	  	        		empParam.setShowPage(findEmpTotCnt - ((current_page-1) * numPerPage));	
	  	        	}
	  	        }
	  	        
	  	        empParam.setNumperPage(numPerPage);
	  	        empParam.setCurrentPage(current_page*numPerPage);
      	        
      			ArrayList<Emp> listEmpMng = adminEmpMngService.listEmpMng(empParam);
      			ArrayList<Emp> listDept = adminEmpMngService.listDept();
      			 // 목록번호를 화면에 출력하기 위한 로직
      	        listNoSet( empParam,listEmpMng, start, findEmpTotCnt);
      	        model.addAttribute("listEmpMng",listEmpMng);
      	        model.addAttribute("listDept",listDept);
      	        if(listEmpMng != null && listEmpMng.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
      		} catch (Exception e) {
      			e.printStackTrace();
      		}
              return "front/board/listEmp";
          }
          
          @RequestMapping("/front/listEmpPop")
          public String listEmpPop(Model model, Emp empParam) {
          	PageUtil PageUtil = new PageUtil();
      		try {
      			
      			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
      			int total_page = 0;
      			int findEmpTotCnt = 0;
      			
      			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
      			if(GenericValidator.isBlankOrNull(empParam.getPageNum())) empParam.setPageNum("1");
      			if(GenericValidator.isBlankOrNull(empParam.getSearchKey()))  empParam.setSearchKey("all");
      			if(GenericValidator.isBlankOrNull(empParam.getSearchVal())) empParam.setSearchVal("");
      			
      			model.addAttribute("searchKey",empParam.getSearchKey());
      			model.addAttribute("searchVal",empParam.getSearchVal());
      			model.addAttribute("empDept",empParam.getEmpDept());
      			
      			int current_page = 1;   // 현재페이지 번호
      			if(!GenericValidator.isBlankOrNull(empParam.getPageNum())){
      				current_page = Integer.parseInt(empParam.getPageNum());
      		    } 
      			
      			findEmpTotCnt = adminEmpMngService.findEmpTotCnt(empParam);
      			
      			if(findEmpTotCnt > 0)
      				total_page = PageUtil.getPageCount(numPerPage,  findEmpTotCnt) ;

      			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
      	        if(total_page < current_page && total_page != 0){
      	        	current_page = total_page;	
      	        }

      	        // 리스트에 출력할 데이터를 가져오기
      	        int end   = current_page * numPerPage;
      	        int start = end - (numPerPage - 1);
      	        empParam.setStart(start);
      	        empParam.setEnd(end);
      	        
      	        if(total_page > current_page) {
	  	        	//최종페이지 기본 수 만큼 set
	  	        	empParam.setShowPage(numPerPage);
	  	        }else {
	  	        	if(current_page == 1) {
	  	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	  	        		empParam.setShowPage(findEmpTotCnt);
	  	        	} else {
	  	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	  	        		empParam.setShowPage(findEmpTotCnt - ((current_page-1) * numPerPage));	
	  	        	}
	  	        }
	  	        empParam.setNumperPage(numPerPage);
	  	        empParam.setCurrentPage(current_page*numPerPage);
      	        
      			ArrayList<Emp> listEmpMng = adminEmpMngService.listEmpMng(empParam);
      			ArrayList<Emp> listDept = adminEmpMngService.listDept();
      			 // 목록번호를 화면에 출력하기 위한 로직
      	        listNoSet( empParam,listEmpMng, start, findEmpTotCnt);
      	        model.addAttribute("listEmpMng",listEmpMng);
      	        model.addAttribute("listDept",listDept);
      	        if(listEmpMng != null && listEmpMng.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
      		} catch (Exception e) {
      			e.printStackTrace();
      		}
              return "front/board/listEmpPop";
          }
          
          private void listNoSet(Emp empParam,ArrayList<Emp> list, int start, int totCnt){
  			int listNum, n = 0;
  	        ListIterator<Emp> it = list.listIterator();
  	        while(it.hasNext()) {
  	        	empParam = (Emp)it.next();
  	       	 	listNum = totCnt - (start + n) + 1;
  	       	 	empParam.setListNo(listNum);
  				n++;
  			}
      }
          

          
          private void listSetSlct(Common commonParam, String codeGbnCd, Model model, String setAttrNm) throws Exception{
          	// select box 리스트
      		commonParam = new Common();
      		commonParam.setCodeGbnCd(codeGbnCd);
      		
      		model.addAttribute(setAttrNm,aminMgrMngService.listFacil(commonParam));
          }
          
          
          @RequestMapping("/front/gumin/facilDown")
          public void guminFacilDown(HttpServletRequest request, HttpServletResponse response) {
          	try {
          		String filePath = "/resources/sample/";
          		String rltFilNm = "구민회관대관신청서.hwp";
          		String fileNm = "구민회관대관신청서.hwp";
          		FileUtil.filDown(request, response, filePath, rltFilNm, fileNm);
      		} catch (Exception e) {
      			e.printStackTrace();
      		}
          }
          
          @RequestMapping("/front/olympic/facilDown")
          public void olympicFacilDown(HttpServletRequest request, HttpServletResponse response) {
          	try {
          		String filePath = "/resources/sample/";
          		String rltFilNm = "생활관대관신청서.hwp";
          		String fileNm = "생활관대관신청서.hwp";
          		FileUtil.filDown(request, response, filePath, rltFilNm, fileNm);
      		} catch (Exception e) {
      			e.printStackTrace();
      		}
          }          
          
    	

}
