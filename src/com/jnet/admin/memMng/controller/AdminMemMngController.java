package com.jnet.admin.memMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ListIterator;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.admin.memMng.service.AdminMemMngService;
import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Common;
import com.jnet.domain.Member;
import com.jnet.domain.Menu;
import com.jnet.util.PageUtil;
import com.jnet.util.SendMailUtil;

@Controller
public class AdminMemMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminLoginService adminLoginService;
	
	@Autowired
	private AdminMemMngService adminMemMngService;
	
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	
	/**
	 * 회원관리 목록 조회
	 * 
	 * @param model model
	 * @param memberParam memberParam
	 * @return String String
	 */
    @RequestMapping("/admin/listMemMng")
    public String listMemMng(Model model, Member memberParam) {
    	logger.info("AdminMemMngController - listMemMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			commonMenu(model,memberParam);
	
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findMemTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(memberParam.getPageNum())) memberParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(memberParam.getSearchKey()))  memberParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(memberParam.getSearchVal())) memberParam.setSearchVal("");
			
			model.addAttribute("searchKey",memberParam.getSearchKey());
			model.addAttribute("searchVal",memberParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(memberParam.getPageNum())) current_page = Integer.parseInt(memberParam.getPageNum());
			
			findMemTotCnt = adminMemMngService.findMemTotCnt(memberParam);
			
			if(findMemTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findMemTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        memberParam.setStart(start);
	        memberParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	memberParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		memberParam.setShowPage(findMemTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		memberParam.setShowPage(findMemTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        /*memberParam.setNumperPage(numPerPage);*/
	        memberParam.setCurrentPage(current_page*numPerPage);
	        
	        ArrayList<Member> listMemMng = adminMemMngService.listMemMng(memberParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
	        listNoSet(memberParam, listMemMng, start, findMemTotCnt);
	        model.addAttribute("listMemMng",listMemMng);
	        if(listMemMng != null && listMemMng.size() > 0) model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/memMng/listMemMng";
    }
    
    @RequestMapping("/admin/listMemMailPop")
    public String listMemMailPop(Model model, Member memberParam) {
    	logger.info("AdminMemMngController - listMemMailPop");
    	PageUtil PageUtil = new PageUtil();
		try {
			int numPerPage   = 20;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findMemTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(memberParam.getPageNum())) memberParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(memberParam.getSearchKey()))  memberParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(memberParam.getSearchVal())) memberParam.setSearchVal("");
			
			model.addAttribute("searchKey",memberParam.getSearchKey());
			model.addAttribute("searchVal",memberParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(memberParam.getPageNum())) current_page = Integer.parseInt(memberParam.getPageNum());
			
			findMemTotCnt = adminMemMngService.findMemTotCnt(memberParam);
			
			if(findMemTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findMemTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        memberParam.setStart(start);
	        memberParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	memberParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		memberParam.setShowPage(findMemTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		memberParam.setShowPage(findMemTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        /*memberParam.setNumperPage(numPerPage);*/
	        memberParam.setCurrentPage(current_page*numPerPage);
	        
	        ArrayList<Member> listMember = adminMemMngService.listMember(memberParam);
	        model.addAttribute("listMember",listMember);
	        if(listMember != null && listMember.size() > 0) model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/memMng/listMemMailPop";
    }
    
    
   /**
    * 회원관리 상세 조회
    * 
    * @param model model
    * @param memberParam memberParam
    * @return String String
    */
    @RequestMapping(value="/admin/formUpdateMemMng",method=RequestMethod.POST)
    public String formUpdateMemMng(Model model, Member memberParam) {
    	logger.info("AdminMemMngController - formUpdateMemMng");
    	try {
    		commonMenu(model,memberParam);	
			//회원정보 조회
    		Member memberResult = adminMemMngService.findMemMng(memberParam);
    		model.addAttribute("member",memberResult);
    		//게시건수
    		int bbsCnt = adminMemMngService.findBbsCntByUserId(memberResult);
    		model.addAttribute("bbsCnt",bbsCnt);
    		//댓글수
    		int replyCnt = adminMemMngService.findReplyCntByUserId(memberResult);
    		model.addAttribute("replyCnt",replyCnt);
    		
    		//메일코드 목록 조회, 전화번호코드 목록 조회
    		Common commonParam = null;
    		listSetSlct(commonParam, "mail", null, model, "mailList");
    		listSetSlct(commonParam, "phonearea", "00", model, "phoneList");
    		listSetSlct(commonParam, "phonearea", "01", model, "mobileList");
		} catch (Exception e) {
			printStackTrace(e);
		}
    	 return "admin/memMng/formUpdateMemMng";
    }
    
    /**
     * 회원정보 수정
     * @param model model
     * @param memberParam memberParam
     * @return String String 
     */
    @RequestMapping(value="/admin/updateMemMng",method=RequestMethod.POST)
    public String updateMemMng(Model model, Member memberParam) {
    	try {
    		logger.info("AdminMemMngController - updateMemMng");
    		adminMemMngService.updateMemMngByAdmin(memberParam);
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "redirect:/admin/listMemMng?gseq="+memberParam.getGseq()+"&lseq="+memberParam.getLseq();
    }
    /**
     * 탈퇴회원 목록 조회
     * @return String String
     */
    @RequestMapping("/admin/listMemOutMng")
    public String listMemOutMng(Model model, Member memberParam) {
    	logger.info("AdminMemMngController - listMemOutMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			commonMenu(model,memberParam);
	
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findMemOutTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(memberParam.getPageNum())) memberParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(memberParam.getSearchKey())) memberParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(memberParam.getSearchVal())) memberParam.setSearchVal("");
			
			model.addAttribute("searchKey",memberParam.getSearchKey());
			model.addAttribute("searchVal",memberParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(memberParam.getPageNum())) current_page = Integer.parseInt(memberParam.getPageNum());
			
			findMemOutTotCnt = adminMemMngService.findMemOutTotCnt(memberParam);
			
			if(findMemOutTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findMemOutTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        memberParam.setStart(start);
	        memberParam.setEnd(end);
	        
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	memberParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		memberParam.setShowPage(findMemOutTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		memberParam.setShowPage(findMemOutTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        /*memberParam.setNumperPage(numPerPage);*/
	        memberParam.setCurrentPage(current_page*numPerPage);
	        
	        ArrayList<Member> listMemOutMng = adminMemMngService.listMemOutMng(memberParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
	        listNoSet(memberParam, listMemOutMng, start, findMemOutTotCnt);
	        model.addAttribute("listMemOutMng",listMemOutMng);
	        if(listMemOutMng != null && listMemOutMng.size() > 0)	model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/memMng/listMemOutMng";
    }
    
    /**
     * 회원메일발송 폼
     * @return String String
     */
    @RequestMapping("/admin/formCreateSendMail")
    public String formCreateSendMail(Model model, Member memberParam) {
    	logger.info("AdminMemMngController - formCreateSendMail");
    	try {
    		commonMenu(model,memberParam);	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/memMng/formCreateSendMail";
    }
    
    /**
     * 회원메일발송
     * @param model model
     * @param memberParam memberParam
     * @return String String
     */
    @RequestMapping("/admin/sendMemMail")
    public String sendMemMail(Model model, Member memberParam) {
    	logger.info("AdminMemMngController - sendMemMail");
    	try {
    		  commonMenu(model,memberParam);	
    		  SendMailUtil.sendMail(memberParam);
    		  logger.info("회원메일 발송 완료");
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/memMng/formCreateSendMail";
    }
    
    /**
     * 회원관리 - 회원통계
     * 
     * @param model model
     * @param memberParam memberParam
     * @return String String
     */
     @RequestMapping("/admin/formMemStat")
     public String formMemStat(Model model, Member memberParam) {
     	logger.info("AdminMemMngController - formMemStat");
     	try {
     		commonMenu(model,memberParam);
     		ArrayList<Common> listMemStatByAge = adminMemMngService.listMemStatByAge();
     		ArrayList<Common> listMemStatBySex = adminMemMngService.listMemStatBySex();
     		model.addAttribute("listMemStatByAge",listMemStatByAge);
     		model.addAttribute("listMemStatBySex",listMemStatBySex);
 		} catch (Exception e) {
 			printStackTrace(e);
 		}
     	 return "admin/memMng/formMemStat";
     }
    
     /**
      * 우편번호폼
      * @param model model
      * @param commonParam commonParam
      * @return String String
      */
    @RequestMapping(value="/formZipcode",method=RequestMethod.POST)
    public String formZipcode(Model model, Common commonParam) {
    	logger.info("AdminMemMngController - formZipcode");
    	model.addAttribute("zip1",commonParam.getZip1());
    	model.addAttribute("zip2",commonParam.getZip2());
    	model.addAttribute("addr",commonParam.getAddr());
    	return "formZipcode";
    }
    
    /**
     * 아이디변 우편번호 폼
     * @param model model
     * @param commonParam commonParam
     * @return String String
     */
    @RequestMapping("/formZipcodeByIdx")
    public String formZipcodeByIdx(Model model, Common commonParam) {
    	logger.info("AdminMemMngController - formZipcodeByIdx");
    	String url = "";
    	if(commonParam.getListNo() == 1	) {
    		url = "formDoro";
    	} else if(commonParam.getListNo() == 2	) {
    		url = "formJibun";
    	} else if(commonParam.getListNo() == 3	) {
    		url = "formSangho";
    	}
    	return url;
    }
    
    /**
     * 메뉴 공통 메서드
     * 
     * @param model model
     * @param memberParam memberParam
     * @throws SQLException SQLException
     */
    private void commonMenu(Model model, Member memberParam) throws SQLException{
		/////////////////////LNB 메뉴///////////////////
		Menu menu = new Menu();
		menu.setPageGbnCd("ADMIN");
		menu.setMenuLvl(2);
		menu.setGseq(memberParam.getGseq());
		ArrayList<Menu> lnbResult = adminLoginService.listMenu(menu);
		model.addAttribute("gseq",memberParam.getGseq());
		model.addAttribute("lseq",memberParam.getLseq());
		model.addAttribute("lnb",lnbResult);	
		///////////////////////////////////////////////
    }
    
    /**
     * 공통 목록 번호 set메서드
     * 
     * @param bbsParam bbsParam
     * @param list list
     * @param start start
     * @param totCnt totCnt
     */
    private void listNoSet(Member memberParam,ArrayList<Member> list, int start, int totCnt){
			int listNum, n = 0;
	        ListIterator<Member> it = list.listIterator();
	        while(it.hasNext()) {
	        	memberParam = (Member)it.next();
	       	 	listNum = totCnt - (start + n) + 1;
	       	 	memberParam.setListNo(listNum);
				n++;
			}
    }
    private void listSetSlct(Common commonParam, String codeGbnCd, String codeId, Model model, String setAttrNm) throws Exception{
    	// select box 리스트
		commonParam = new Common();
		commonParam.setCodeGbnCd(codeGbnCd);
		commonParam.setCodeId(codeId);
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