package com.jnet.admin.logMng.controller;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jnet.admin.logMng.service.AdminLogMngService;
import com.jnet.admin.login.service.AdminLoginService;
import com.jnet.domain.Common;
import com.jnet.domain.Menu;
import com.jnet.util.PageUtil;

@Controller
public class AdminLogMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminLogMngService adminLogMngService;
	
	@Autowired
	private AdminLoginService adminLoginService;
	/**
	 * 회원관리 목록 조회
	 * 
	 * @param model model
	 * @param memberParam memberParam
	 * @return String String
	 */
    @RequestMapping("/admin/listLogMng")
    public String listLogMng(Model model, Common commonParam, HttpServletRequest request) {
    	logger.info("AdminLogMngController - listMemMng");
    	PageUtil PageUtil = new PageUtil();
		try {
			commonMenu(model,commonParam);
	
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findLogTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(commonParam.getPageNum())) commonParam.setPageNum("1");
			if(GenericValidator.isBlankOrNull(commonParam.getSearchKey()))  commonParam.setSearchKey("all");
			if(GenericValidator.isBlankOrNull(commonParam.getSearchVal())) commonParam.setSearchVal("");
			
			model.addAttribute("searchKey",commonParam.getSearchKey());
			model.addAttribute("searchVal",commonParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(commonParam.getPageNum())) current_page = Integer.parseInt(commonParam.getPageNum());
			
			findLogTotCnt = adminLogMngService.findLogTotCnt(commonParam);
			
			if(findLogTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findLogTotCnt) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	

	        // 리스트에 출력할 데이터를 가져오기
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        commonParam.setStart(start);
	        commonParam.setEnd(end);
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	commonParam.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		commonParam.setShowPage(findLogTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		commonParam.setShowPage(findLogTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        /*commonParam.setNumperPage(numPerPage);*/
	        commonParam.setCurrentPage(numPerPage*current_page);
	        
	        ArrayList<Common> listLogMng = adminLogMngService.listLogMng(commonParam);
			
			 // 목록번호를 화면에 출력하기 위한 로직
	        /*listNoSet(commonParam, listMemMng, start, findLogTotCnt);*/
	        model.addAttribute("listLogMng",listLogMng);
	        if(listLogMng != null && listLogMng.size() > 0) model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));	
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/logMng/listLogMng";
    }
    
    @RequestMapping("/admin/formChartSite")
    public String formChartSite(Model model, Common commonParam, HttpServletRequest request) {
    	try {
    		logger.info("AdminLogMngController - formChartSite");
			commonMenu( model,  commonParam);
			model.addAttribute("year",new SimpleDateFormat("yyyy").format(new Date()));
			model.addAttribute("month",new SimpleDateFormat("MM").format(new Date()));
			
			Calendar cal = Calendar.getInstance(); 
    		Date trialTime = new Date(); 
    		cal.setTime(trialTime); 
    		model.addAttribute("week",cal.get(Calendar.DAY_OF_WEEK_IN_MONTH));
    		model.addAttribute("flag","site");
		} catch (SQLException e) {
			printStackTrace(e);
		}
    	return "admin/logMng/formChart";
    }
    
    @RequestMapping("/admin/formChartMember")
    public String formChartMember(Model model, Common commonParam, HttpServletRequest request) {
    	try {
    		logger.info("AdminLogMngController - formChartMember");
			commonMenu( model,  commonParam);
			model.addAttribute("year",new SimpleDateFormat("yyyy").format(new Date()));
			model.addAttribute("month",new SimpleDateFormat("MM").format(new Date()));
			
			Calendar cal = Calendar.getInstance(); 
    		Date trialTime = new Date(); 
    		cal.setTime(trialTime); 
    		model.addAttribute("week",cal.get(Calendar.DAY_OF_WEEK_IN_MONTH));
    		model.addAttribute("flag","member");
		} catch (SQLException e) {
			printStackTrace(e);
		}
    	return "admin/logMng/formChart";
    }
    
    //메뉴 공통 메서드
    private void commonMenu(Model model, Common commonParam) throws SQLException{
		/////////////////////LNB 메뉴///////////////////
    		Menu menu = new Menu();
    		menu.setPageGbnCd("ADMIN");
    		menu.setMenuLvl(2);
    		menu.setGseq(commonParam.getGseq());
    		ArrayList<Menu> lnbResult = adminLoginService.listMenu(menu);
    		model.addAttribute("gseq",commonParam.getGseq());
    		model.addAttribute("lseq",commonParam.getLseq());
    		model.addAttribute("lnb",lnbResult);	
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