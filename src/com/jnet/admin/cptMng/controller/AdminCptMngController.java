package com.jnet.admin.cptMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.cptMng.service.AdminCptMngService;
import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Admin;
import com.jnet.domain.BbsFileReply;
import com.jnet.domain.Common;
import com.jnet.domain.Member;
import com.jnet.domain.Menu;
import com.jnet.domain.Minwon;
import com.jnet.util.PageUtil;
import com.jnet.util.SendMailUtil;

@Controller
public class AdminCptMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminCptMngService adminCptMngService;
	@Autowired
	private AdminLoginService adminLoginService;
	
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	
	/**
	 * 민원관리 목록 조회
	 * @param model model
	 * @param request request
	 * @param bbsParam bbsParam
	 * @return String String
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/admin/listCptMng")
    public String listBbsMng(Model model, HttpServletRequest request, Minwon minwonParam) {
		logger.info("AdminCptMngController - listCptMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			
			model.addAttribute("statusCd",minwonParam.getStatusCd());
			model.addAttribute("qStCreateYmd",minwonParam.getqStCreateYmd());
	        model.addAttribute("qEdCreateYmd",minwonParam.getqEdCreateYmd());
	        model.addAttribute("upId",minwonParam.getUpId());
	        model.addAttribute("areaId",minwonParam.getAreaId());
	        model.addAttribute("satisId",minwonParam.getSatisId());
	        model.addAttribute("happyId",minwonParam.getHappyId());
	        model.addAttribute("qAge",minwonParam.getqAge());
	        model.addAttribute("qSex",minwonParam.getqSex());
	        model.addAttribute("dateCnt",minwonParam.getDateCnt());
			commonMenu(model, minwonParam);
			
			Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
			ArrayList<Menu> authResult =(ArrayList<Menu>) request.getSession().getAttribute("authInfo");
			ArrayList<String> authList = new ArrayList<String>();
			if(adminResult.getAdmAuthCode().equals("O")) {
				if(authResult != null && authResult.size() > 0) {
					for(int i=0; i<authResult.size(); i++) {
						if(authResult.get(i).getPgmGbnCd().equals("CPT")) {
							authList.add(authResult.get(i).getSlctFacilId());
						}
					}
				}
			}
			minwonParam.setMinwonInfo(adminResult.getAdmAuthCode());
			minwonParam.setMinwonListAuth(authList);
			
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findCptTotCnt = 0;
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(minwonParam.getPageNum())) minwonParam.setPageNum("1");
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(minwonParam.getPageNum())) current_page = Integer.parseInt(minwonParam.getPageNum());
			findCptTotCnt = adminCptMngService.findCptTotCnt(minwonParam);
			if(findCptTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findCptTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0)	current_page = total_page;	
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
	        
	        /*minwonParam.setNumperPage(numPerPage);*/
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
	        model.addAttribute("listCptMng",listCptMng);
	        if(listCptMng != null && listCptMng.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
	        
	        Common commonParam = null;
	        
	        /**
    		 * 민원폼 select box 목록
    		 */
    		listSetSlct(commonParam, "minwon", model, "upList");
    		listSetSlct(commonParam, "AREA", model, "areaList");
    		listSetSlct(commonParam, "HPC", model, "hpcList");
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/cptMng/listCptMng";
    }
	
	 /**
     * 민원관리 수정폼
     * 
     * @param model model
     * @param bbsParam bbsParam
     * @return String String
     */
	@RequestMapping(value="/admin/formUpdateCptMng",method=RequestMethod.POST)
    public String formUpdateCptMng(Model model, Minwon minwonParam) {
    	try {
    		logger.info("AdminCptMngController - formUpdateCptMng");
    		commonMenu(model, minwonParam);
    		Minwon minwonResult = adminCptMngService.findCptMng(minwonParam);
    		minwonResult.setqContent(minwonResult.getqContent().replaceAll("\r\n","<br/>"));
    		model.addAttribute("minwon",minwonResult);
    		
    		Common commonParam = null;
    		
    		/**
    		 * 민원폼 select box 목록
    		 */
    		listSetSlct(commonParam, "minwon", model, "upList");
    		listSetSlct(commonParam, "AREA", model, "areaList");
    		listSetSlct(commonParam, "HPC", model, "hpcList");
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/cptMng/formUpdateCptMng";
    }
	
	
	/**
	 * 민원관리 수정
	 * @param model model
	 * @param minwonParam minwonParam
	 * @param request request
	 * @return String String
	 */
	@RequestMapping(value="/admin/updateCptMng",method=RequestMethod.POST)
    public String updateCptMng(Model model, Minwon minwonParam, HttpServletRequest request) {
    	try {
    		logger.info("AdminCptMngController - updateCptMng");
    		Admin adminResult = (Admin) request.getSession().getAttribute("adminInfo");
    		minwonParam.setAdmAuthCode(adminResult.getAdmAuthCode());
    		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            Admin admInfo = (Admin) request.getSession().getAttribute("adminInfo");
            
            minwonParam.setCreateYmd(inDate);
            minwonParam.setCreateHms(inTime);
            minwonParam.setaNm(admInfo.getAdmNm());
            minwonParam.setCreateIp(request.getRemoteAddr());
            minwonParam.setCreateId(admInfo.getAdmId());
            minwonParam.setModiYmd(inDate);
            minwonParam.setModiHms(inTime);
            minwonParam.setModiIp(request.getRemoteAddr());
            minwonParam.setModiId(admInfo.getAdmId());
            
            adminCptMngService.updateCptMng(minwonParam);
            
			if(!GenericValidator.isBlankOrNull(minwonParam.getResGbnCd()) && minwonParam.getResGbnCd().equals("3")){
				if(!GenericValidator.isBlankOrNull(minwonParam.getStatusCd()) && minwonParam.getStatusCd().equals("04")) {
					Member memberParam = new Member();
					String[] memEmail = new String[1];
					memEmail[0] = minwonParam.getEmail1()+"@"+minwonParam.getEmail2();
					memberParam.setMemEmailArr(memEmail);
					memberParam.setEmailTitle("처리민원 답변이 완료되었습니다.");
					memberParam.setEmailContent(minwonParam.getaContent());
					SendMailUtil.sendMail(memberParam);
					logger.info("처리민원 답변 메일 전송 완료");
				}
			}
    	}catch(Exception e) {
    		printStackTrace(e);
    	}
    	return "redirect:/admin/listCptMng?gseq="+minwonParam.getGseq()+"&lseq="+minwonParam.getLseq();
	}
	
	/**
	 * 민원통계
	 * @param model model
	 * @param minwonParam minwonParam
	 * @param request request
	 * @return String String
	 */
	@RequestMapping("/admin/listCptStats")
    public String listCptStats(Model model, Minwon minwonParam, HttpServletRequest request) {
    	try {
    		logger.info("AdminCptMngController - listCptStats");
    		commonMenu(model, minwonParam);
    		if(GenericValidator.isBlankOrNull(minwonParam.getFlag())) {
    			minwonParam.setFlag("year");
    		}
    		model.addAttribute("flag",minwonParam.getFlag());
    		model.addAttribute("qStCreateYmd",minwonParam.getqStCreateYmd());
    		model.addAttribute("qEdCreateYmd",minwonParam.getqEdCreateYmd());
    	}catch(Exception e) {
    		printStackTrace(e);
    	}
    	return "admin/cptMng/listCptStats";
	}
	
	/**
	 * 민원통계 ajax 목록조회
	 * @param model model
	 * @param minwonParam minwonParam
	 * @param request request
	 * @return String String
	 */
	@RequestMapping("/admin/listCptAjaxStats")
    public String listCptAjaxStats(Model model, Minwon minwonParam, HttpServletRequest request) {
    	try {
    		logger.info("AdminCptMngController - listCptAjaxStats");
    		model.addAttribute("flag",minwonParam.getFlag());
    		ArrayList<Minwon> listCptStatsTotCnt = adminCptMngService.listCptStatsTotCnt(minwonParam);
    		model.addAttribute("listCptStatsTotCnt",listCptStatsTotCnt);
    		ArrayList<Minwon> listCptStatsRight = adminCptMngService.listCptStatsRight(minwonParam);
    		model.addAttribute("listCptStatsRight",listCptStatsRight);
    	}catch(Exception e) {
    		printStackTrace(e);
    	}
    	return "admin/cptMng/listCptAjaxStats";
	}
	
	
	/**
	 * 만족도 통계 목록 조회
	 * @param model model
	 * @param request request
	 * @param bbsParam bbsParam
	 * @return String String
	 */
	@RequestMapping("/admin/listSatisFactionStats")
    public String listSatisFactionStats(Model model, HttpServletRequest request, Minwon minwonParam) {
		try {
			logger.info("AdminCptMngController - listSatisFactionStats");
			commonMenu(model, minwonParam);
			ArrayList<Menu> listSiteMap = adminCptMngService.listSiteMap();
			ArrayList<Menu> listSatisFactionStats =  adminCptMngService.listSatisFactionStats();
			model.addAttribute("listSiteMap",listSiteMap);
			model.addAttribute("listSatisFactionStats",listSatisFactionStats);
		} catch (Exception e) {
			printStackTrace(e);
		}
		return "admin/cptMng/listSatisFactionStats";
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
    
    private void listSetSlct(Common commonParam, String codeGbnCd, Model model, String setAttrNm) throws Exception{
    	// select box 리스트
		commonParam = new Common();
		commonParam.setCodeGbnCd(codeGbnCd);
		model.addAttribute(setAttrNm,aminMgrMngService.listFacil(commonParam));
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


