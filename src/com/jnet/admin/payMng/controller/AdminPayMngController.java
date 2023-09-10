package com.jnet.admin.payMng.controller;

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
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.admin.payMng.service.AdminPayMngService;
import com.jnet.domain.Common;
import com.jnet.domain.Menu;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;
import com.jnet.util.PageUtil;
import com.jnet.util.ParsingUtil;

@Controller
public class AdminPayMngController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminPayMngService adminPayMngService;
	
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	
	/**
	 * 결제리스트 목록 조회
	 */
	@RequestMapping("/admin/listPayMng")
    public String listPayMng(Model model, OutPgm outPgmParam, HttpServletRequest request) {
		logger.info("AdminPayMngController - listPayMng");
		PageUtil PageUtil = new PageUtil();
    	try {
    		commonMenu(model, outPgmParam);
    		
    		Common commonParam = null;
   		    commonParam = new Common();
	 	    commonParam.setCodeGbnCd("up_id");
	 	    ArrayList<Common> listUpId = aminMgrMngService.listFacil(commonParam);
 	 		model.addAttribute("upList",listUpId);
 	 		
 	 		
 	 		int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findPayTotCnt = 0;
			
    		if(GenericValidator.isBlankOrNull(outPgmParam.getUpId())){
    			outPgmParam.setUpId(listUpId.get(0).getCodeId());
    		}
    		
    		if(GenericValidator.isBlankOrNull(outPgmParam.getYymm())) {
				String inDate   = new SimpleDateFormat("yyyyMM").format(new Date());
	    		outPgmParam.setYymm(inDate);	
			}
    		
    		if(outPgmParam.getSearchKey() == null) {
    			outPgmParam.setSearchKey("");
    			outPgmParam.setSearchVal("");
    		}
    		
    		model.addAttribute("upId",outPgmParam.getUpId());
    		model.addAttribute("yymm",outPgmParam.getYymm());
    		model.addAttribute("searchKey",outPgmParam.getSearchKey());
    		model.addAttribute("searchVal",outPgmParam.getSearchVal());
 	 		
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) outPgmParam.setPageNum("1");
			
			model.addAttribute("searchKey",outPgmParam.getSearchKey());
			model.addAttribute("searchVal",outPgmParam.getSearchVal());
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) current_page = Integer.parseInt(outPgmParam.getPageNum());
			
			StopWatch stopWatch = new StopWatch();
			stopWatch.start();
			
			findPayTotCnt = adminPayMngService.findPayTotCnt(outPgmParam);
			
			stopWatch.stop();
			
			if(findPayTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findPayTotCnt) ;

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
	        		outPgmParam.setShowPage(findPayTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		outPgmParam.setShowPage(findPayTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        /*outPgmParam.setNumperPage(numPerPage);*/
	        outPgmParam.setCurrentPage(numPerPage*current_page);
	        
	        StopWatch stopWatch2 = new StopWatch();
	        stopWatch2.start();
    		ArrayList<OutPgm> listPayMng = adminPayMngService.listPayMng(outPgmParam);
    		stopWatch2.stop();
			if(listPayMng != null && listPayMng.size() > 0) {
	    		int listNum, n = 0;
		        ListIterator<OutPgm> it = listPayMng.listIterator();
		        while(it.hasNext()) {
		        	outPgmParam = (OutPgm)it.next();
		       	 	listNum = findPayTotCnt - (start + n) + 1;
		       	 	outPgmParam.setListNo(listNum);
					n++;
				}
			}
	        
    		model.addAttribute("listPayMng",listPayMng);
    		if(listPayMng != null && listPayMng.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
		} catch (Exception e) {
			printStackTrace(e);
		}
    	return "admin/pgmMng/listPayMng";
	}
	
	/**
     * 환불요청 목록 조회
     * @return String String
     */
	@RequestMapping("/admin/listRefundMng")
    public String listRefundMng(Model model, OutPgm outPgmParam, HttpServletRequest request) {
		logger.info("AdminPayMngController - listRefundMng");
		PageUtil PageUtil = new PageUtil();
    	try {
    		commonMenu(model, outPgmParam);
    		
    		Common commonParam = null;
   		    commonParam = new Common();
	 	    commonParam.setCodeGbnCd("up_id");
	 	    ArrayList<Common> listUpId = aminMgrMngService.listFacil(commonParam);
 	 		model.addAttribute("upList",listUpId);
 	 		
 	 		int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findRefundTotCnt = 0;
 	 		
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) outPgmParam.setPageNum("1");
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) current_page = Integer.parseInt(outPgmParam.getPageNum());
			
			if(GenericValidator.isBlankOrNull(outPgmParam.getDateGbnCd())) {
				outPgmParam.setDateGbnCd("C");
			}

			model.addAttribute("dateGbnCd",outPgmParam.getDateGbnCd());
			
			StopWatch stopWatch = new StopWatch();
			stopWatch.start();
			
			findRefundTotCnt = adminPayMngService.findRefundTotCnt(outPgmParam);
			
			stopWatch.stop();
			
			if(findRefundTotCnt > 0) total_page = PageUtil.getPageCount(numPerPage,  findRefundTotCnt) ;

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
	        		outPgmParam.setShowPage(findRefundTotCnt);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		outPgmParam.setShowPage(findRefundTotCnt - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        outPgmParam.setNumperPage(numPerPage);
	        outPgmParam.setCurrentPage(current_page);
	        
	        StopWatch stopWatch2 = new StopWatch();
	        stopWatch2.start();
    		ArrayList<OutPgm> listRefundMng = adminPayMngService.listRefundMng(outPgmParam);
    		stopWatch2.stop();
			if(listRefundMng != null && listRefundMng.size() > 0) {
				int listNum, n = 0;
		        ListIterator<OutPgm> it = listRefundMng.listIterator();
		        while(it.hasNext()) {
		        	outPgmParam = (OutPgm)it.next();
		       	 	listNum = findRefundTotCnt - (start + n) + 1;
		       	 	outPgmParam.setListNo(listNum);
					n++;
				}	
			}
	        
    		model.addAttribute("listRefundMng",listRefundMng);
    		if(listRefundMng != null && listRefundMng.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
		} catch (Exception e) {
			printStackTrace(e);
		}
        return "admin/pgmMng/listRefundMng";
    }
	
	@RequestMapping(value="/admin/formRefundPop",method=RequestMethod.POST)
    public String formRefundPop(Model model, OutPgm outPgmParam, HttpServletRequest request) {
		logger.info("AdminPayMngController - formRefundPop");
		model.addAttribute("outPgm",outPgmParam);
		return "front/mypage/payment/cancel";
	}
	
	
	@RequestMapping(value="/admin/saveRefundPop",method=RequestMethod.POST)
    public String saveRefundPop(Model model, Payment payParam, HttpServletRequest request) {
		logger.info("AdminPayMngController - saveRefundPop");
		logger.info("saveRefundPop >>"+ParsingUtil.getRequestParams(request));
		return "redirect:/front/mypage/payment/orderProc?" + ParsingUtil.getRequestParams(request);
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


