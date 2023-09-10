package com.jnet.front.program.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jnet.admin.pgmMng.service.AdminPgmMngService;
import com.jnet.domain.CsMember;
import com.jnet.domain.Member;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Pgm;
import com.jnet.domain.PgmImg;
import com.jnet.domain.TeacherImg;
import com.jnet.front.mypage.service.MyPageService;
import com.jnet.front.program.service.ProgramService;
import com.jnet.util.CommonUtil;
import com.jnet.util.DateUtil;
import com.jnet.util.PageUtil;

@Controller
public class ProgramController {

	
	@Autowired
	private ProgramService programService;
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private AdminPgmMngService adminPgmMngService;
	
	@RequestMapping("/front/program/{upId}/{saleId}")
    public String menu(Model model,@PathVariable("upId") String upId,@PathVariable("saleId") String saleId, Pgm pgmParam) {
		String returnStr="front/program/programList";
		PageUtil PageUtil = new PageUtil();
    	try {
    		int current_page = 1;   // 현재페이지 번호
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findPgmMngCnt = 0;
			
			pgmParam.setUpId(upId);
    		pgmParam.setSaleId(saleId);
			
    		OutPgm outPgmParam =new OutPgm();
    		outPgmParam.setUpId(upId);
    		outPgmParam.setSaleId(saleId);
    		
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
	        
	        pgmParam.setNumperPage(numPerPage);
			pgmParam.setCurrentPage(current_page*numPerPage);
			
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
	        model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
	        model.addAttribute("listProgram",listProgram);
			model.addAttribute("basList", adminPgmMngService.listBasIdBySaleId(outPgmParam));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
        return returnStr;
    }
	
    /**
     * 프로그램 수정폼
     * 
     * @param model model
     * @param bbsParam bbsParam
     * @return String
     */
	@RequestMapping(value="/front/formViewPgm/{upId}/{saleId}",method=RequestMethod.POST)
    public String formViewPgm(Model model, Pgm	pgmParam,@PathVariable("upId") String upId,@PathVariable("saleId") String saleId, HttpServletRequest request) {
    	try {
    		String scriptStr = "";
    		pgmParam.setStart(1);
    		pgmParam.setEnd(10);
    		pgmParam.setUpId(upId);
    		pgmParam.setSaleId(saleId);
    		
    		//model.addAttribute("yymm", pgmParam.getYymm());
    		model.addAttribute("yymm", DateUtil.getStrNextMonth("yyyyMM"));
    		model.addAttribute("upId",upId);
    		model.addAttribute("saleId",saleId);
    		
    		ArrayList<Pgm> outPgmResult = adminPgmMngService.findOutPgmMng(pgmParam);
    		PgmImg pgmResult = adminPgmMngService.findPgmMng(pgmParam);
    		ArrayList<TeacherImg> teacherResult = adminPgmMngService.listTeacherInfoByPgmSeq(pgmResult);
    		//장바구니버튼처리
    		Member sMember = (Member)request.getSession().getAttribute("userInfo");
    		if(sMember !=null) {
    			CsMember csMember = new CsMember();
    			CsMember sCsMember = new CsMember();
   				csMember.setMem_no(sMember.getUserNo());
    			request.getSession().setAttribute("csUserInfo", (CsMember)myPageService.getCsMember(csMember)); 
    			sCsMember = (CsMember)request.getSession().getAttribute("csUserInfo");
    			//if(!sMember.getLocation().equals(pgmParam.getUpId())) { //수강장소와 해당 프로그램의 upid비교
    			//	String locationDesc = CommonUtil.getLocationDesc(sMember.getLocation());
    			//	scriptStr = "alert('회원님의 수강장소(사업장)는 " + locationDesc + "입니다.\\n해당 사업장은 신청하실 수 없습니다.')";
    			//} else {
	    		Map<String, Object> mapParam = new HashMap<String, Object>();
	    		mapParam.put("upId", pgmParam.getUpId()); //여러사업장 선택 가능하게 하기위한 처리
	    		//mapParam.put("upId", sMember.getLocation());
	    		mapParam.put("today", DateUtil.getCurrentDate());
	    		mapParam.put("lastDay", DateUtil.getEndDate());
	    		int numUseBasket = adminPgmMngService.findAcceptDateByUpId(mapParam);
	    		String targetCode = "";
	    		String sex = sMember.getSex();
	    		String birthday = CommonUtil.checkNull(sMember.getBirthday(), sCsMember.getBirth());
	    		int korean_age = 0;
	    		int age = 0; //공통나이
	    		if(birthday.length() >= 8) {
	    			korean_age = DateUtil.getCurrentYear() - Integer.parseInt(birthday.substring(0, 4)) + 1; //한국나이
	    			if(Integer.parseInt(birthday.substring(4, 6)) > DateUtil.getCurrentMonth()) {
	    				age = korean_age - 2;
	    			} else {
	    				age = korean_age - 1;
	    			}
	    		} else {
	    			scriptStr = "alert('생년월일 정보가 존재하지 않습니다.\\n 관리자에게 문의해 주십시오.');";
	    		}
	    		int compareVal = (DateUtil.getEndDate()+"200000").compareTo(DateUtil.getCurrentDateTime());
	    		String startDateTime = DateUtil.getCurrentYear() + (DateUtil.getCurrentMonth() < 10 ? "0" + DateUtil.getCurrentMonth() + "20100000" : DateUtil.getCurrentMonth() + "20100000");
	    		int startCompareVal = startDateTime.compareTo(DateUtil.getCurrentDateTime());
	    		int onlineCnt = 0 ,offlineCnt = 0;
	    		if(numUseBasket > 0 && compareVal > 0 && startCompareVal <= 0) {
	    			if(!GenericValidator.isBlankOrNull(pgmParam.getOnlineAcceptCnt())){
    					onlineCnt = Integer.parseInt(pgmParam.getOnlineAcceptCnt());
    			    }
    				if(!GenericValidator.isBlankOrNull(pgmParam.getOfflineAcceptCnt())){
    					offlineCnt = Integer.parseInt(pgmParam.getOfflineAcceptCnt());
    			    }
	    			for(int i = 0; i < outPgmResult.size(); i ++) {
	    				targetCode = outPgmResult.get(i).getTargetCd();
	    				if(!"".equals(scriptStr)) break;
	    				if(onlineCnt <= 0 && offlineCnt <= 0) {
	    					scriptStr = "alert('마감되었습니다.');";
	    				} else if(onlineCnt <= 0) {
	    					scriptStr = "alert('온라인 신청은 마감되었습니다 \\n 현장 방문 접수 바랍니다.');";
	    				} else if(age <= 18 && "01".equals(targetCode)) {
	    					scriptStr = "alert('성인만 접수 가능합니다.');";
	    				} else if((age > 18 || age < 12) && "02".equals(targetCode)) {
	    					scriptStr = "alert('청소년만 접수 가능합니다.');";
	    				} else if((korean_age < 8 || korean_age > 13) && "03".equals(targetCode)) {
	    					scriptStr = "alert('초등생(1~6학년)만 접수 가능합니다.');";
	    				} else if((korean_age < 1 || korean_age > 10) && "04".equals(targetCode)) {
	    					scriptStr = "alert('유아/어린이(0세~9세)만 접수 가능합니다.');";
	    				} else if(("1".equals(sex) || "3".equals(sex)) && "05".equals(targetCode)) {
	    					scriptStr = "alert('성인여성만 접수 가능합니다.');";
	    				} else if(("1".equals(sex) || "3".equals(sex)) && (age > 18 || age < 13) && "06".equals(targetCode)) {
	    					scriptStr = "alert('청소년(여성)만 접수 가능합니다.');";
	    				} else {
	    					//scriptStr = "addBasket();";
	    					//if("one08".equals(CommonUtil.checkNull(sMember.getUserId()))) {
	    						scriptStr = "addBasket();";
	    					//} else {
	    					//	scriptStr = "alert('사이트 개편에 따른 결제 테스트 중입니다. \\n불편하시더라도 기다려 주십시오. \\n사이트 이용가능시간 [2014-01-21 : 23시 이후]');";
	    					//}
	    				}
	    				
	    				
	    			}
	    		} else {
	    			//scriptStr = "alert('수강신청기간이 아닙니다. (수강신청:매 월 20일 10:00 ~ 말일 22:00)');";
	    			scriptStr = "alert('온라인 접수기간이 아닙니다 \\n 방문접수만 가능합니다. \\n\\n[접수기간:매 월 20일 10:00 ~ 말일 20:00]');";
	    		}
    			//}
    		} else {
    			scriptStr = "alert('로그인 후 신청 가능합니다.'); location.href='/front/formLogin';";
    		}
    		model.addAttribute("outpgm",outPgmResult);
    		model.addAttribute("pgm",pgmResult);
    		model.addAttribute("teacher",teacherResult);
    		model.addAttribute("scriptStr", scriptStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "front/program/programView";
    }

}
