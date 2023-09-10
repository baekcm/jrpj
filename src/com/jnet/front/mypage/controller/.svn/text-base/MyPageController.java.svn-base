package com.jnet.front.mypage.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xecure.servlet.XecureServlet;

import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.admin.payMng.service.AdminPayMngService;
import com.jnet.admin.pgmMng.service.AdminPgmMngService;
import com.jnet.domain.Admin;
import com.jnet.domain.Common;
import com.jnet.domain.CsMember;
import com.jnet.domain.Locker;
import com.jnet.domain.Member;
import com.jnet.domain.Minwon;
import com.jnet.domain.OutPgm;
import com.jnet.domain.Payment;
import com.jnet.domain.Pgm;
import com.jnet.front.login.service.FrontLoginService;
import com.jnet.front.mypage.service.MyPageService;
import com.jnet.util.CommonUtil;
import com.jnet.util.DateUtil;
import com.jnet.util.PageUtil;
import com.jnet.util.ParsingUtil;
import com.jnet.util.PaymentUtil;
import com.kcp.C_PP_CLI;


@Controller
public class MyPageController {
	
	@Autowired
	private AdminPgmMngService adminPgmMngService;
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private FrontLoginService frontLoginService;
	
	@Autowired
	private AdminMgrMngService aminMgrMngService;
	
	@Autowired
	private AdminPayMngService adminPayMngService;
	
//	private Logger logger = Logger.getLogger(this.getClass());
	
	@RequestMapping("/front/mypage/minwonList")
    public String listMinwonListForMypage(Model model, HttpServletRequest request, Minwon minwonParam) {
		try{
		ArrayList<Common> listUpId = null;
		Common commonParam = null;
		commonParam = new Common();
		commonParam.setCodeGbnCd("up_id");
		listUpId = aminMgrMngService.listFacil(commonParam);
		model.addAttribute("listUpId", listUpId);
		}catch (Exception e) {
			// TODO: handle exception
		}
        return "front/mypage/mypage_minwon_list";
    }
	
	@RequestMapping("/front/mypage/sugestList")
    public String listsugestListForMypage(Model model, HttpServletRequest request, Minwon minwonParam) {
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
        return "front/mypage/mypage_sugest_list";
    }

	
	@RequestMapping("/front/mypage/paymentList")
    public String listPaymentListForMypage(Model model, HttpServletRequest request, OutPgm outPgmParam) {
		System.out.println("listPaymentListForMypage");
		PageUtil PageUtil = new PageUtil();
		try {
			
			Pgm pgmParam  = new Pgm();
			pgmParam.setCodeGbnCd("up_id");
			ArrayList<Pgm> listAcceptDate = adminPgmMngService.listAcceptDate(pgmParam);
			if(listAcceptDate != null && listAcceptDate.size() > 0) {
				  Calendar cal = Calendar.getInstance(); 
				  cal.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),1);
				  int year = cal.get ( Calendar.YEAR ); 
				  int month = cal.get ( Calendar.MONTH )+1; 
				  int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); 
				  
				for(Pgm pgm : listAcceptDate) {
					pgm.setThisMaxDate(cal.getActualMaximum ( Calendar.DATE ));
					if(!GenericValidator.isBlankOrNull(pgm.getAcceptStYmd())){
						//말일이 null일경우
						if(GenericValidator.isBlankOrNull(pgm.getAcceptEdYmd())) {
							//항상 말일에 체크일경우
							if(!GenericValidator.isBlankOrNull(pgm.getLastDayChkYn()) && pgm.getLastDayChkYn().equals("Y")){
								String strMonth = String.valueOf(month);
								String strStDay = pgm.getAcceptStYmd();
								String strEdDay = String.valueOf(endDay);
								
								if(strMonth.length() < 2) {
									strMonth = "0" + strMonth;
								}
								if(strStDay.length() < 2){
									strStDay = "0" + strStDay;
								}
								if(strEdDay.length() < 2){
									strEdDay = "0" + strEdDay;
								}
								
								String st = year + strMonth + strStDay;
								String ed = year + strMonth + strEdDay;
								pgm.setAcceptStYmd(st);
								pgm.setAcceptEdYmd(ed);
							}
						}else{
							
							String strMonth = String.valueOf(month);
							String strStDay = pgm.getAcceptStYmd();
							String strEdDay = pgm.getAcceptEdYmd();
							
							if(strMonth.length() < 2) {
								strMonth = "0" + strMonth;
							}
							if(strStDay.length() < 2){
								strStDay = "0" + strStDay;
							}
							if(strEdDay.length() < 2){
								strEdDay = "0" + strEdDay;
							}
							
							String st = year + strMonth + strStDay ;
							String ed = year + strMonth + strEdDay ;
							pgm.setAcceptStYmd(st);
							pgm.setAcceptEdYmd(ed);
						}
					}
				}
				model.addAttribute("listAcceptDate",listAcceptDate);
				model.addAttribute("endDateTime", DateUtil.getEndDate()+"200000");
			}
			
			String cancelMsg = "";
			if(request.getSession().getAttribute("cancelMsg") != null){
				cancelMsg = (String) request.getSession().getAttribute("cancelMsg");
				request.getSession().removeAttribute("cancelMsg");
			}
			model.addAttribute("cancelMsg",cancelMsg);
			Common commonParam = null;
   		    commonParam = new Common();
	 	    commonParam.setCodeGbnCd("up_id");
	 	    ArrayList<Common> listUpId = aminMgrMngService.listFacil(commonParam);
 	 		model.addAttribute("upList",listUpId);
 	 		
			Member sMember = (Member)request.getSession().getAttribute("userInfo");
			outPgmParam.setMemNo(sMember.getUserNo());
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findPayTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) outPgmParam.setPageNum("1");
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) current_page = Integer.parseInt(outPgmParam.getPageNum());
			
			StopWatch stopWatch = new StopWatch();
			stopWatch.start();
			
			findPayTotCnt = adminPayMngService.findPayTotCntForFront(outPgmParam);
			
			stopWatch.stop();
			System.out.println("걸린시간 find: " + stopWatch.getTotalTimeMillis());
			
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
	        
	        outPgmParam.setNumperPage(numPerPage);
	        outPgmParam.setCurrentPage(current_page * numPerPage);
	        
	        StopWatch stopWatch2 = new StopWatch();
	        stopWatch2.start();
	        
			ArrayList<OutPgm> listPayMng = adminPayMngService.listPayMngForFront(outPgmParam);
			
			stopWatch2.stop();
			System.out.println("걸린시간 list : " + stopWatch2.getTotalTimeMillis());
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
			if( !"".equals(CommonUtil.checkNull(request.getParameter("ret_msg")))) {
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> : " + CommonUtil.checkNull(request.getParameter("ret_msg")));				
				model.addAttribute("ret_msg", "onload=\"javascript:alert('" + CommonUtil.checkNull(request.getParameter("ret_msg")) + "');\"");
			}
			if(listPayMng != null && listPayMng.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        return "front/mypage/mypage_payment_list";
    }
	

	
	
/*	@RequestMapping("/front/mypage/programList")
    public String listProgramListForMypage(Model model, HttpServletRequest request) {
		System.out.println("listProgramListForMypage");
        return "front/mypage/mypage_program_list";
    }*/
	
	@RequestMapping("/front/mypage/programList")
    public String listProgramListForMypage(Model model, HttpServletRequest request, OutPgm outPgmParam) {
		System.out.println("listPaymentListForMypage");
		PageUtil PageUtil = new PageUtil();
		try {
			
			Common commonParam = null;
   		    commonParam = new Common();
	 	    commonParam.setCodeGbnCd("up_id");
	 	    ArrayList<Common> listUpId = aminMgrMngService.listFacil(commonParam);
 	 		model.addAttribute("upList",listUpId);
 	 		
			Member sMember = (Member)request.getSession().getAttribute("userInfo");
			outPgmParam.setMemNo(sMember.getUserNo());
			int numPerPage   = 10;  // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int findPayTotCnt = 0;
			
			//초기 페이지 로딩될때 NULL값일 경우 1페이지로 고정시켜준다.
			if(GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) outPgmParam.setPageNum("1");
			
			int current_page = 1;   // 현재페이지 번호
			if(!GenericValidator.isBlankOrNull(outPgmParam.getPageNum())) current_page = Integer.parseInt(outPgmParam.getPageNum());
			
			StopWatch stopWatch = new StopWatch();
			stopWatch.start();
			
			findPayTotCnt = myPageService.findMyPgmTotCnt(outPgmParam);
			
			stopWatch.stop();
			System.out.println("걸린시간 find: " + stopWatch.getTotalTimeMillis());
			
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
	        
			ArrayList<OutPgm> listPgm = myPageService.listMyProgram(outPgmParam);
			
			stopWatch2.stop();
			System.out.println("걸린시간 list : " + stopWatch2.getTotalTimeMillis());
			if(listPgm != null && listPgm.size() > 0) {
	    		int listNum, n = 0;
		        ListIterator<OutPgm> it = listPgm.listIterator();
		        while(it.hasNext()) {
		        	outPgmParam = (OutPgm)it.next();
		       	 	listNum = findPayTotCnt - (start + n) + 1;
		       	 	outPgmParam.setListNo(listNum);
					n++;
				}
			}
			
			model.addAttribute("listPgm",listPgm);
			if(listPgm != null && listPgm.size() > 0)  model.addAttribute("pageIndexList",PageUtil.pageIndexList(current_page,total_page));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "front/mypage/mypage_program_list";
    }
	
	@RequestMapping("/front/mypage/lockerList")
    public String listLockerListForMypage(Model model, HttpServletRequest request,Locker locker) {
		String retStr = "";
		PageUtil PageUtil = new PageUtil();
		Member sMember = (Member)request.getSession().getAttribute("userInfo");
		if(sMember !=null) {
			CsMember csMember = new CsMember();
			csMember.setMem_no(sMember.getUserNo());
			request.getSession().setAttribute("csUserInfo", (CsMember)myPageService.getCsMember(csMember)); 
			CsMember sCsMember = (CsMember)request.getSession().getAttribute("csUserInfo");
			locker.setUpId(sCsMember.getUp_id());
			locker.setUserNo(sCsMember.getMem_no());
			int numPerPage  = 10; // 한 화면에 보여주는 게시물 수
			int total_page 	= 0;
			int total_count = 0;
			//int findPayTotCnt = 0;
			int current_page = 1;   // 현재페이지 번호
			
			if(!GenericValidator.isBlankOrNull(locker.getPageNum())) 
				current_page = Integer.parseInt(locker.getPageNum());
			
			total_count = myPageService.getLockerTotCnt(locker);
			
			if(total_count > 0) total_page = PageUtil.getPageCount(numPerPage,  total_count) ;

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page && total_page != 0) current_page = total_page;	
	        // 리스트에 출력할 데이터를 가져오기 
	        int end   = current_page * numPerPage;
	        int start = end - (numPerPage - 1);
	        
	        locker.setStart(start);
	        locker.setEnd(end);
	        
	        
	        if(total_page > current_page) {
	        	//최종페이지 기본 수 만큼 set
	        	locker.setShowPage(numPerPage);
	        }else {
	        	if(current_page == 1) {
	        		//첫페이지일 경우 총 수만큼 보여준다 (10개가 안되기 때문에)
	        		locker.setShowPage(total_count);
	        	} else {
	        		//마지막 페이지 총페이지 개수에서 데이터 총수를 뺀다
	        		locker.setShowPage(total_count - ((current_page-1) * numPerPage));	
	        	}
	        }
	        
	        locker.setNumperPage(numPerPage);
	        locker.setCurrentPage(current_page * numPerPage);
			List<Locker> listLocker = myPageService.getLockerList(locker);
			
			model.addAttribute("listLocker", listLocker);
	        listNoSet(locker, listLocker, start, total_count);
	        
	        if(listLocker != null && listLocker.size() > 0)
	        	model.addAttribute("pageIndexList", PageUtil.pageIndexList(current_page, total_page));
			retStr = "front/mypage/mypage_locker_list";
		}
		
        return retStr;
    }
	
	/** 장바구니관련 start **/
	@RequestMapping("/front/mypage/basketList")
    public String listBasket(Model model, HttpServletRequest request) {
		String retStr = "";
		Member sMember = (Member)request.getSession().getAttribute("userInfo");
		try{
			// //여러사업장 장바구니 가져오기
			String upId = request.getParameter("upId") !=null ? request.getParameter("upId") : "11"; 	
			if(sMember !=null) {
				CsMember csMember = new CsMember();
				Map<String, Object> mapParam = new HashMap<String, Object>();
				csMember.setMem_no(sMember.getUserNo());
	
				//장바구니 프로세스 적용 시 CS프로그램에 등록된 정보를 세션에 담는다.
				request.getSession().setAttribute("csUserInfo", (CsMember)myPageService.getCsMember(csMember)); 
				CsMember sCsMember = (CsMember)request.getSession().getAttribute("csUserInfo");
	
				//mapParam.put("upId", sCsMember.getUp_id());
				mapParam.put("upId", upId); //여러사업장 장바구니 가져오기
				mapParam.put("memNo", sCsMember.getMem_no());
				//mapParam.put("yymm", DateUtil.getCurrentDate().substring(0, 6));
				mapParam.put("yymm", DateUtil.getStrNextMonth("yyyyMM"));
				//할인코드가져올파라미터
				int age = Integer.parseInt(DateUtil.getStrCurrentYear()) - Integer.parseInt(sCsMember.getBirth().substring(0,4)) + 1;
				mapParam.put("age", age);
				mapParam.put("gender", sCsMember.getSex());
				mapParam.put("dcCd", CommonUtil.checkNull(sCsMember.getDc_cd(), "00001"));
				
				List<Payment> listBasket = myPageService.getBasketList(mapParam);
				model.addAttribute("listBasket", listBasket);
				CommonUtil.styleBackGroundByUpId(model, upId);
				
				ArrayList<Common> listUpId = null;
				Common commonParam = null;
				commonParam = new Common();
				commonParam.setCodeGbnCd("up_id");
				listUpId = aminMgrMngService.listFacil(commonParam);
				model.addAttribute("listUpId", listUpId);
				retStr = "front/mypage/mypage_basket_list";
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return retStr;
    }
	
	@RequestMapping("/front/mypage/addBasket")
    public String addBasket(Model model, HttpServletRequest request, OutPgm outPgmParam) {
		String retStr = "", res = "", basMsg = "";;
		Member sMember = (Member)request.getSession().getAttribute("userInfo");
		try{
			if(sMember !=null) {
				CsMember csMember = new CsMember();
				Map<String, Object> mapParam = new HashMap<String, Object>();
				csMember.setMem_no(sMember.getUserNo());
				//장바구니 프로세스 적용 시 CS프로그램에 등록된 정보를 세션에 담는다.
				request.getSession().setAttribute("csUserInfo", (CsMember)myPageService.getCsMember(csMember)); 
				CsMember sCsMember = (CsMember)request.getSession().getAttribute("csUserInfo");
				mapParam.put("upId", outPgmParam.getUpId()); //여러사업장 결제 가능하게 하기위한 부분
				//mapParam.put("upId", sCsMember.getUp_id());
				mapParam.put("memNo", sCsMember.getMem_no());
				mapParam.put("pgmCd", outPgmParam.getPgmCd());
				mapParam.put("yymm", outPgmParam.getYymm());
				mapParam.put("targetCd", outPgmParam.getTargetCd());
				mapParam.put("saleComCd", outPgmParam.getSaleComCd());
				mapParam.put("delNo", "0");
				mapParam.put("gbn", "1");
				//할인코드가져올파라미터
				int age = Integer.parseInt(DateUtil.getStrCurrentYear()) - Integer.parseInt(sCsMember.getBirth().substring(0,4)) + 1;
				mapParam.put("age", age);
				mapParam.put("gender", sCsMember.getSex());
				mapParam.put("dcCd", CommonUtil.checkNull(sCsMember.getDc_cd(), "00001"));
				
				res = myPageService.saveBasket(mapParam);
				basMsg = "";
				if(res !=null) {
					res = CommonUtil.checkNull(res);
					if("1".equals(res)) {
						basMsg = "이미 등록한 강좌입니다.";
					} else if("2".equals(res)) {
						basMsg = "이미 장바구니에 담으셨습니다.";
					}
				} else {
					basMsg = "작업중 오류가 발생하였습니다";
				}
				//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> res : [" + res + "]");
				
				List<Payment> listBasket = myPageService.getBasketList(mapParam);
				//List<HashMap<String, Object>> dcInfo = myPageService.getDcCodeList(mapParam);
				model.addAttribute("listBasket", listBasket);
				CommonUtil.styleBackGroundByUpId(model, outPgmParam.getUpId());
				
				ArrayList<Common> listUpId = null;
				Common commonParam = null;
				commonParam = new Common();
				commonParam.setCodeGbnCd("up_id");
				listUpId = aminMgrMngService.listFacil(commonParam);
				model.addAttribute("listUpId", listUpId);
				model.addAttribute("basMsg", basMsg);
				model.addAttribute("basRes", res);
				//model.addAttribute("dcInfo", dcInfo);
				
				
				retStr = "front/mypage/mypage_basket_list";
			}
		}catch (Exception e) {
			basMsg = "작업중 오류가 발생하였습니다";
			model.addAttribute("basMsg", basMsg);
			model.addAttribute("basRes", res);
			// TODO: handle exception
		}
        return retStr;
    }
	
	@RequestMapping("/front/mypage/removeBasket")
    public String removeBasket(Model model, HttpServletRequest request, Member memberParam, OutPgm outPgmParam) {
		Member sMember = (Member)request.getSession().getAttribute("userInfo");
		if(sMember !=null) {
			CsMember csMember = new CsMember();
			csMember.setMem_no(sMember.getUserNo());
			Map<String, Object> mapParam = new HashMap<String, Object>();
			//장바구니 프로세스 적용 시 CS프로그램에 등록된 정보를 세션에 담는다.
			request.getSession().setAttribute("csUserInfo", (CsMember)myPageService.getCsMember(csMember)); 
			CsMember sCsMember = (CsMember)request.getSession().getAttribute("csUserInfo");
			mapParam.put("upId", outPgmParam.getUpId()); //여러사업장적용
			//mapParam.put("upId", sCsMember.getUp_id());
			mapParam.put("memNo", sMember.getUserNo());
			mapParam.put("seqNo", request.getParameter("seqNo"));
			mapParam.put("pgmCd", outPgmParam.getPgmCd());
			mapParam.put("yymm", outPgmParam.getYymm());
			mapParam.put("targetCd", outPgmParam.getTargetCd());
			mapParam.put("saleComCd", outPgmParam.getSaleComCd());
			//할인코드가져올파라미터
			int age = Integer.parseInt(DateUtil.getStrCurrentYear()) - Integer.parseInt(sCsMember.getBirth().substring(0,4)) + 1;
			mapParam.put("age", age);
			mapParam.put("gender", sCsMember.getSex());
			mapParam.put("dcCd", CommonUtil.checkNull(sCsMember.getDc_cd(), "00001"));
			
			myPageService.removeBasket(mapParam);
			
			List<Payment> listBasket = myPageService.getBasketList(mapParam);
			model.addAttribute("listBasket", listBasket);
			CommonUtil.styleBackGroundByUpId(model, outPgmParam.getUpId());
			
			try {
				ArrayList<Common> listUpId = null;
				Common commonParam = null;
				commonParam = new Common();
				commonParam.setCodeGbnCd("up_id");
				listUpId = aminMgrMngService.listFacil(commonParam);
				model.addAttribute("listUpId", listUpId);
			} catch(Exception e) {
				
			}
		}	

        return "front/mypage/mypage_basket_list";
    }
	
	/** 장바구니관련 end **/
	
	/** 결제관련 start **/
	@RequestMapping("/front/mypage/payment/orderForm")
    public String orderForm(Model model, HttpServletRequest request, Payment payParam) {
		Member sMember = (Member)request.getSession().getAttribute("userInfo");
		if(sMember !=null) {
			Payment orderInfo = new Payment();
			long currentTime = System.currentTimeMillis();
			orderInfo.setOrderNo("JRPGM" + payParam.getOrderPgmCd() + currentTime);
			orderInfo.setOrderPgmNm(payParam.getOrderPgmNm());
			orderInfo.setOrderAmount(payParam.getOrderAmount());
			orderInfo.setOrderer(sMember.getUserNm());
			orderInfo.setOrdererEmail(sMember.getEmail());
			orderInfo.setOrdererTel(sMember.getTel());
			orderInfo.setOrdererHp(sMember.getPhone());
			orderInfo.setUp_id(payParam.getUpId());
			orderInfo.setOrderBasketCnt(payParam.getOrderBasketCnt());
			
			String upId = CommonUtil.checkNull(payParam.getUpId(), payParam.getUp_id());
			PaymentUtil payment = setFacilByUpid(upId);
			
			model.addAttribute("payment", payment);
			model.addAttribute("orderInfo", orderInfo);
			
		}
		//return "front/mypage/payment/chk_plugin";
		return "front/mypage/payment/order";
    }
	
	@SuppressWarnings("unused")
	@RequestMapping("/front/mypage/payment/orderProc")
    public String payment(Model model, HttpServletRequest request, Payment payParam) throws UnsupportedEncodingException {
		String returnUrl = "";
		if(request.getParameter("req_tx").equals("mod")) {
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>환불요청");
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>환불요청 : mem_no : " + payParam.getMem_no());
		}
		System.out.println("mypageController --- orderProc");
		Member sMember = (Member)request.getSession().getAttribute("userInfo");
		Admin sAdmin = (Admin)request.getSession().getAttribute("adminInfo");
		if(!(sMember ==null && sAdmin ==null)) {
			CsMember csMember = new CsMember();
			CsMember sCsMember = new CsMember();
			if(sMember !=null) {
				csMember.setMem_no(sMember.getUserNo());
			} else {
				csMember.setMem_no(payParam.getMem_no());
			}
			request.getSession().setAttribute("csUserInfo", (CsMember)myPageService.getCsMember(csMember)); 
			sCsMember = (CsMember)request.getSession().getAttribute("csUserInfo");
	        /* ============================================================================== */
	        /* =   PAGE : 지불 요청 및 결과 처리 PAGE                                       = */
	        /* = -------------------------------------------------------------------------- = */
	        /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
	        /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do			        = */
	        /* = -------------------------------------------------------------------------- = */
	        /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
	        /* ============================================================================== */
	    	
	    	/* ============================================================================== */
	        /* =   환경 설정 파일 Include                                                   = */
	        /* =   ※ 필수                                                                  = */
	        /* =   테스트 및 실결제 연동시 site_conf_inc.jsp파일을 수정하시기 바랍니다.     = */
	        /* = -------------------------------------------------------------------------- = */
	        /* ============================================================================== */
	        /* =   02. 지불 요청 정보 설정                                                  = */
	        /* = -------------------------------------------------------------------------- = */
	        String req_tx         = CommonUtil.checkNull( request.getParameter( "req_tx"         ) ); // 요청 종류
	        String tran_cd        = CommonUtil.checkNull( request.getParameter( "tran_cd"        ) ); // 처리 종류
	        /* = -------------------------------------------------------------------------- = */
	        String cust_ip        = CommonUtil.getRemoteAddr(request); 							   // 요청 IP
	        String ordr_idxx      = CommonUtil.checkNull( request.getParameter( "ordr_idxx"      ) ); // 쇼핑몰 주문번호
	        String good_name      = CommonUtil.checkNull( request.getParameter( "good_name"      ) ); // 상품명
	        String good_mny       = CommonUtil.checkNull( request.getParameter( "good_mny"       ) ); // 결제 총금액
	        /* = -------------------------------------------------------------------------- = */
	        String res_cd         = "";                                                     // 응답코드
	        String res_msg        = "";                                                     // 응답 메세지
	        String tno            = CommonUtil.checkNull( request.getParameter( "tno"            ) ); // KCP 거래 고유 번호
	        /* = -------------------------------------------------------------------------- = */
	        String buyr_name      = CommonUtil.checkNull( request.getParameter( "buyr_name"      ) ); // 주문자명
	        String buyr_tel1      = CommonUtil.checkNull( request.getParameter( "buyr_tel1"      ) ); // 주문자 전화번호
	        String buyr_tel2      = CommonUtil.checkNull( request.getParameter( "buyr_tel2"      ) ); // 주문자 핸드폰 번호
	        String buyr_mail      = CommonUtil.checkNull( request.getParameter( "buyr_mail"      ) ); // 주문자 E-mail 주소
	        /* = -------------------------------------------------------------------------- = */
	    	String mod_type	      = CommonUtil.checkNull( request.getParameter( "mod_type"	   ) ); // 변경TYPE(승인취소시 필요)
	        String mod_desc       = CommonUtil.checkNull( request.getParameter( "mod_desc"	   ) ); // 변경사유
	        String panc_mod_mny   = "";														// 부분취소 금액
	        String panc_rem_mny   = "";														// 부분취소 가능 금액
	        String mod_tax_mny    = CommonUtil.checkNull( request.getParameter( "mod_tax_mny"    ) ); // 공급가 부분 취소 요청 금액
	        String mod_vat_mny    = CommonUtil.checkNull( request.getParameter( "mod_vat_mny"    ) ); // 부과세 부분 취소 요청 금액
	        String mod_free_mny   = CommonUtil.checkNull( request.getParameter( "mod_free_mny"   ) ); // 비과세 부분 취소 요청 금액
	    	/* = -------------------------------------------------------------------------- = */
	        String use_pay_method = CommonUtil.checkNull( request.getParameter( "use_pay_method" ) ); // 결제 방법
	        //String bSucc          = "";                                                     // 업체 DB 처리 성공 여부
	        boolean paySucc = true;
	        /* = -------------------------------------------------------------------------- = */
	        String app_time       = "";                                                     // 승인시간 (모든 결제 수단 공통)
	    	String amount		  = "";														// KCP 실제 거래금액         
	    	String total_amount   = "0";													// 복합결제시 총 거래금액
	    	String coupon_mny	  = "";														// 쿠폰금액
	    	/* = -------------------------------------------------------------------------- = */
	    	String card_cd        = "";                                                     // 신용카드 코드
	        String card_name      = "";                                                     // 신용카드 명
	        String card_no        = "";                                                     // 신용카드 번호
	        String van_cd         = "";                                                     // 밴사코드
	        String app_no         = "";                                                     // 신용카드 승인번호
	        String noinf          = "";                                                     // 신용카드 무이자 여부
	        String quota          = "";                                                     // 신용카드 할부개월
	    	String partcanc_yn    = "";														// 부분취소 가능유무   
	    	String card_bin_type_01 = "";													// 카드구분1
	    	String card_bin_type_02 = "";													// 카드구분2
	    	String card_mny		  = "";														// 카드결제금액
	        /* = -------------------------------------------------------------------------- = */
	    	String bank_name      = "";                                                     // 은행명
	        String bank_code      = "";                                                     // 은행코드
	    	String bk_mny		  = "";														// 계좌이체결제금액
	        /* = -------------------------------------------------------------------------- = */
	        String bankname       = "";                                                     // 입금 은행명
	        String depositor      = "";                                                     // 입금 계좌 예금주 성명
	        String account        = "";                                                     // 입금 계좌 번호
	    	String va_date		  = "";														// 가상계좌 입금마감시간
	        /* = -------------------------------------------------------------------------- = */
	        String pnt_issue      = "";                                                     // 결제 포인트사 코드
	    	String pnt_amount     = "";                                                     // 적립금액 or 사용금액
	    	String pnt_app_time   = "";                                                     // 승인시간
	    	String pnt_app_no     = "";                                                     // 승인번호
	        String add_pnt        = "";                                                     // 발생 포인트
	    	String use_pnt        = "";                                                     // 사용가능 포인트
	    	String rsv_pnt        = "";                                                     // 총 누적 포인트
	    	/* = -------------------------------------------------------------------------- = */
	    	String commid         = "";														// 통신사코드
	    	String mobile_no      = "";														// 휴대폰번호
	    	/* = -------------------------------------------------------------------------- = */
	    	String shop_user_id	  = CommonUtil.checkNull( request.getParameter( "shop_user_id"   ) ); // 가맹점 고객 아이디
	    	String tk_van_code	  = "";														// 발급사코드
	    	String tk_app_no	  = "";														// 승인번호
	    	/* = -------------------------------------------------------------------------- = */
	        String cash_yn        = CommonUtil.checkNull( request.getParameter( "cash_yn"        ) ); // 현금 영수증 등록 여부
	        String cash_authno    = "";                                                     // 현금 영수증 승인 번호
	        String cash_tr_code   = CommonUtil.checkNull( request.getParameter( "cash_tr_code"   ) ); // 현금 영수증 발행 구분
	        String cash_id_info   = CommonUtil.checkNull( request.getParameter( "cash_id_info"   ) ); // 현금 영수증 등록 번호
	        
	        /* ============================================================================== */
	    	/* =   02. 지불 요청 정보 설정 END
	    	/* ============================================================================== */
	
	
	        /* ============================================================================== */
	        /* =   03. 인스턴스 생성 및 초기화(변경 불가)                                   = */
	        /* = -------------------------------------------------------------------------- = */
	        /* =       결제에 필요한 인스턴스를 생성하고 초기화 합니다.                     = */
	        /* = -------------------------------------------------------------------------- = */
	        C_PP_CLI c_PayPlus = new C_PP_CLI();
	        
	        PaymentUtil payment = setFacilByUpid(payParam.getUpId());
	        //파일 기본경로
    		String dftFilePath = request.getServletContext().getRealPath("/");
    		String dtpFilePath = "resources" + File.separator + "paybin" ;
    		String confKey = File.separator+"bin" + File.separator + "pub.key";
	        if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
	        	//c_PayPlus.mf_init( dftFilePath + dtpFilePath, PaymentUtil.g_conf_gw_url, PaymentUtil.g_conf_gw_port, dftFilePath + dtpFilePath + confKey, dftFilePath + dtpFilePath + File.separator + "log", PaymentUtil.g_conf_tx_mode );
	        } else {
	        	c_PayPlus.mf_init( dftFilePath + dtpFilePath, PaymentUtil.g_conf_gw_url, PaymentUtil.g_conf_gw_port, PaymentUtil.g_conf_tx_mode );
	        }
	        c_PayPlus.mf_init_set();
	
	    	/*
	    	윈도우버전과 유닉스 버전은 샘플이 다르기 때문에 반드시 OS별 샘플을 구분하여 다운로드하시기 바랍니다. 
	    	Windows 의 경우 : pp_cli_exe.exe 파일 이용 
	    	UNIX 계열의 경우 : pp_cli 파일 이용 
	
	    	pp_ax_hub 페이지에서 mf_init 하는 인자값 개수 상이 
	    	// Unix / Linux Platform 
	    	c_PayPlus.mf_init( g_conf_home_dir, g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode ); 
	    	// Windows Platform 
	    	c_PayPlus.mf_init( g_conf_home_dir, g_conf_gw_url, g_conf_gw_port, g_conf_key_dir, g_conf_log_dir, g_conf_tx_mode );
	    	*/
	
	        /* ============================================================================== */
	    	/* =   03. 인스턴스 생성 및 초기화 END                                          = */
	        /* ============================================================================== */
	
	
	        /* ============================================================================== */
	        /* =   04. 처리 요청 정보 설정			                                        = */
	        /* = -------------------------------------------------------------------------- = */
	        /* = -------------------------------------------------------------------------- = */
	        /* =   04-1. 승인 요청 정보 설정                                                = */
	        /* = -------------------------------------------------------------------------- = */
	        if ( req_tx.equals( "pay" ) )
	        {
	                c_PayPlus.mf_set_enc_data( CommonUtil.checkNull( request.getParameter( "enc_data" ) ),
	                		CommonUtil.checkNull( request.getParameter( "enc_info" ) ) );
	    			
	    			//1004원은 실제로 업체에서 결제하셔야 될 원 금액을 넣어주셔야 합니다. 결제금액 유효성 검증
	    			if(good_mny.trim().length() > 0)
	    			{
	    			    int ordr_data_set_no;
	
	    			    ordr_data_set_no = c_PayPlus.mf_add_set( "ordr_data" );
	    			    
	                    c_PayPlus.mf_set_us( ordr_data_set_no, "ordr_mony", payParam.getOrderAmount() );
	                }
	        }
	
	        /* = -------------------------------------------------------------------------- = */
	        /* =   04-2. 취소/매입 요청                                                     = */
	        /* = -------------------------------------------------------------------------- = */
	        else if ( req_tx.equals( "mod" ) ) {
	                int    mod_data_set_no;
	
	                tran_cd = "00200000";
	                mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );
	
	                c_PayPlus.mf_set_us( mod_data_set_no, "tno",        request.getParameter( "tno"      ) ); // KCP 원거래 거래번호
	                c_PayPlus.mf_set_us( mod_data_set_no, "mod_type",   mod_type                           ); // 원거래 변경 요청 종류
	                c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",     cust_ip                            ); // 변경 요청자 IP
	                c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc",   request.getParameter( "mod_desc" ) ); // 변경 사유
	            }
	    	/* = -------------------------------------------------------------------------- = */
	        /* =   04. 처리 요청 정보 설정 END                                              = */
	        /* = ========================================================================== = */
	
	
	        /* = ========================================================================== = */
	        /* =   05. 실행                                                                 = */
	        /* = -------------------------------------------------------------------------- = */
	        if ( tran_cd.length() > 0 )
	        {
	            //c_PayPlus.mf_do_tx( PaymentUtil.g_conf_site_cd, PaymentUtil.g_conf_site_key, tran_cd, "", ordr_idxx, PaymentUtil.g_conf_log_level, "0" );
	        	c_PayPlus.mf_do_tx( payment.getG_conf_site_cd(), payment.getG_conf_site_key(), tran_cd, "", ordr_idxx, PaymentUtil.g_conf_log_level, "0" );
	    		
	    		
	    	    res_cd  = c_PayPlus.m_res_cd;  // 결과 코드
	    		res_msg = c_PayPlus.m_res_msg; // 결과 메시지
System.out.println("res_cd : " + res_cd);	    		
	    	}
	        else
	        {
	            c_PayPlus.m_res_cd  = "9562";
	            c_PayPlus.m_res_msg = "연동 오류|Payplus Plugin이 설치되지 않았거나 tran_cd값이 설정되지 않았습니다.";
	        }
	
	    	/* = -------------------------------------------------------------------------- = */
	        /* =   05. 실행 END                                                             = */
	        /* ============================================================================== */
	
	
	        /* ============================================================================== */
	        /* =   06. 승인 결과 값 추출                                                    = */
	        /* = -------------------------------------------------------------------------- = */
	        if ( req_tx.equals( "pay" ) )
	        {
	            if ( res_cd.equals( "0000" ) )
	            {
	                tno		  = c_PayPlus.mf_get_res( "tno"		  ); // KCP 거래 고유 번호
	                amount	  = c_PayPlus.mf_get_res( "amount"    ); // KCP 실제 거래 금액
	    			pnt_issue = c_PayPlus.mf_get_res( "pnt_issue" ); // 결제 포인트사 코드
	                coupon_mny = c_PayPlus.mf_get_res( "coupon_mny"	); // 쿠폰금액
	
	        /* = -------------------------------------------------------------------------- = */
	        /* =   06-1. 신용카드 승인 결과 처리                                            = */
	        /* = -------------------------------------------------------------------------- = */
	                if ( use_pay_method.equals( "100000000000" ) )
	                {
	                    card_cd   = c_PayPlus.mf_get_res( "card_cd"   ); // 카드사 코드
	                    card_name = c_PayPlus.mf_get_res( "card_name" ); // 카드사 명
	                    card_no   = c_PayPlus.mf_get_res( "card_no" );      //카드번호
	                    app_time  = c_PayPlus.mf_get_res( "app_time"  ); // 승인시간
	                    app_no    = c_PayPlus.mf_get_res( "app_no"    ); // 승인번호
	                    noinf     = c_PayPlus.mf_get_res( "noinf"     ); // 무이자 여부
	                    quota     = c_PayPlus.mf_get_res( "quota"     ); // 할부 개월 수
	    				partcanc_yn = c_PayPlus.mf_get_res( "partcanc_yn"     ); // 부분취소 가능유무
	    				card_bin_type_01 = c_PayPlus.mf_get_res( "card_bin_type_01" ); // 카드구분1
	    				card_bin_type_02 = c_PayPlus.mf_get_res( "card_bin_type_02" ); // 카드구분2
	    				card_mny = c_PayPlus.mf_get_res( "card_mny" ); // 카드결제금액
	                }
	    		}
	    	}
	    	/* = -------------------------------------------------------------------------- = */
	        /* =   06. 승인 결과 처리 END                                                   = */
	        /* ============================================================================== */
	
	        
	        /* = ========================================================================== = */
	        /* =   07. 승인 및 실패 결과 DB 처리                                            = */
	        /* = -------------------------------------------------------------------------- = */
	        /* =      결과를 업체 자체적으로 DB 처리 작업하시는 부분입니다.                 = */
	        /* = -------------------------------------------------------------------------- = */
	
	    	if ( req_tx.equals( "pay" ) )
	        {
	
	        /* = -------------------------------------------------------------------------- = */
	        /* =   07-1. 승인 결과 DB 처리(res_cd == "0000")                                = */
	        /* = -------------------------------------------------------------------------- = */
	        /* =        각 결제수단을 구분하시어 DB 처리를 하시기 바랍니다.                 = */
	        /* = -------------------------------------------------------------------------- = */
	    		
	    		
	            if ( res_cd.equals( "0000" ) ) //결제성공 후 DB처리부분
	            { //결제성공 시 
	            	
	                // 07-1-1. 신용카드
	        		if("100000000000".equals(use_pay_method)) {
	        			Map<String, Object> mapParam = new HashMap<String, Object>();
	        			mapParam.put("sCsMember", sCsMember);
        			
	        			//CARD_SALE정보
						mapParam.put("card_no", CommonUtil.checkNull(card_no));
						mapParam.put("card_name", CommonUtil.checkNull(card_name));
						mapParam.put("app_time", CommonUtil.checkNull(app_time));
						mapParam.put("app_no", CommonUtil.checkNull(app_no));
						mapParam.put("res_cd", CommonUtil.checkNull(res_cd));
						mapParam.put("tno", CommonUtil.checkNull(tno));
						mapParam.put("good_mny", CommonUtil.checkNull(good_mny));
						
						try {
							paySucc = myPageService.procPayment(mapParam, payParam);
						} catch(Exception e) {
							e.printStackTrace();
							paySucc = false;
						}
	    			}
	        		
	        		if ( !paySucc ) 
		            { //DB처리 실패 시 자동 승인 취소
	System.out.println("DB처리 실패 시 자동승인취소 모듈");	            	
		                int mod_data_set_no;
		
		                c_PayPlus.mf_init_set();
		
		                tran_cd = "00200000";
		
		                mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );
		
		                c_PayPlus.mf_set_us( mod_data_set_no, "tno",      tno      ); // KCP 원거래 거래번호
		                c_PayPlus.mf_set_us( mod_data_set_no, "mod_type", "STSC"   ); // 원거래 변경 요청 종류
		                c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",   cust_ip  ); // 변경 요청자 IP
		                c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc", "card member store result error - card member store cancel request"  ); // 변경 사유
		
						//c_PayPlus.mf_do_tx( PaymentUtil.g_conf_site_cd, PaymentUtil.g_conf_site_key, tran_cd, "", ordr_idxx, PaymentUtil.g_conf_log_level, "0" );
		                c_PayPlus.mf_do_tx( payment.getG_conf_site_cd(), payment.getG_conf_site_key(), tran_cd, "", ordr_idxx, PaymentUtil.g_conf_log_level, "0" );
		
		                res_cd  = c_PayPlus.m_res_cd;								  // 결과 코드
		                res_msg = c_PayPlus.m_res_msg;								  // 결과 메시지
		            }
	    		}
	
	            /* = -------------------------------------------------------------------------- = */
	            /* =   07-2. 승인 실패 DB 처리(res_cd != "0000")                                = */
	            /* = -------------------------------------------------------------------------- = */
	    		if( !"0000".equals ( res_cd ) )
	    		{
	    			paySucc = false;
	    		}
	    	} else if("mod".equals(req_tx)) { //결제취소 시 모듈
	    		if("0000".equals(res_cd)) {
	    			try {
	    				payParam.setUp_id(request.getParameter("upId"));
	    				payParam.setMem_no(request.getParameter("mem_no"));
	    				payParam.setRecp_no(request.getParameter("recpNo"));
	    				payParam.setTno(request.getParameter("tno"));
	    				paySucc = adminPayMngService.saveRefundPop(payParam);
	    			} catch(Exception e) {
	    				paySucc = false;
	    			}
	    		}
	    		
	    	}
	    	// End of [res_cd = "0000"]
	        /* = -------------------------------------------------------------------------- = */
	        /* =   08. 승인 결과 DB 처리 END                                                = */
	        /* = ========================================================================== = */
	
	
	    	/* ============================================================================== */
	        /* =   09. 폼 구성 및 결과페이지 호출                                           = */
	        /* -----------------------------------------------------------------------------= */
	    	//model.addAttribute("site_cd", PaymentUtil.g_conf_site_cd);
	    	model.addAttribute("site_cd", payment.getG_conf_site_cd());
	    	model.addAttribute("req_tx", req_tx);
	    	model.addAttribute("use_pay_method", use_pay_method);
	    	model.addAttribute("bSucc", paySucc+"");
	    	model.addAttribute("panc_mod_mny", panc_mod_mny);
	    	model.addAttribute("panc_rem_mny", panc_rem_mny);
	    	model.addAttribute("mod_type", mod_type);
	    	model.addAttribute("amount", amount);
	    	model.addAttribute("res_cd", res_cd);
	    	model.addAttribute("res_msg", res_msg);
	    	model.addAttribute("ordr_idxx", ordr_idxx);
	    	model.addAttribute("tno", tno);
	    	model.addAttribute("good_mny", good_mny);
	    	model.addAttribute("good_name", good_name);
	    	model.addAttribute("buyr_name", buyr_name);
	    	model.addAttribute("buyr_tel1", buyr_tel1);
	    	model.addAttribute("buyr_tel2", buyr_tel2);
	    	model.addAttribute("buyr_mail", buyr_mail);
	    	model.addAttribute("app_time", app_time);
	    	//신용카드정보
	    	model.addAttribute("card_cd", card_cd);
	    	model.addAttribute("card_name", card_name);
	    	model.addAttribute("app_no", app_no);
	    	model.addAttribute("noinf", noinf);
	    	model.addAttribute("quota", quota);
	    	model.addAttribute("partcanc_yn", partcanc_yn);
	    	model.addAttribute("card_bin_type_01", card_bin_type_01);
	    	model.addAttribute("card_bin_type_02", card_bin_type_02);
	    	//계좌이체정보
	    	model.addAttribute("bank_name", bank_name);
	    	model.addAttribute("bank_code", bank_code);
	    	//가상계좌벙보
	    	model.addAttribute("bankname", bankname);
	    	model.addAttribute("depositor", depositor);
	    	model.addAttribute("account", account);
	    	model.addAttribute("va_date", va_date);
	    	//포인트정보
	    	model.addAttribute("pnt_issue", pnt_issue);
	    	model.addAttribute("pnt_app_time", pnt_app_time);
	    	model.addAttribute("pnt_app_no", pnt_app_no);
	    	model.addAttribute("pnt_amount", pnt_amount);
	    	model.addAttribute("add_pnt", add_pnt);
	    	model.addAttribute("use_pnt", use_pnt);
	    	model.addAttribute("rsv_pnt", rsv_pnt);
	    	//휴대폰정보
	    	model.addAttribute("commid", commid);
	    	model.addAttribute("mobile_no", mobile_no);
	    	//상품권정보
	    	model.addAttribute("tk_van_code", tk_van_code);
	    	model.addAttribute("tk_app_no", tk_app_no);
	    	//현금영수증정보
	    	model.addAttribute("cash_yn", cash_yn);
	    	model.addAttribute("cash_authno", cash_authno);
	    	model.addAttribute("cash_tr_code", cash_tr_code);
	    	model.addAttribute("cash_id_info", cash_id_info);
	    	
			if("pay".equals(req_tx)) {
				returnUrl = "front/mypage/payment/pp_ax_hub";
			} else if("mod".equals(req_tx)) {
				System.out.println(request.getParameter("gseq"));
				System.out.println(request.getParameter("lseq"));
				System.out.println(request.getParameter("dateGbnCd"));
				model.addAttribute("flag","Y");
				model.addAttribute("gseq",request.getParameter("gseq"));
				model.addAttribute("lseq",request.getParameter("lseq"));
				model.addAttribute("dateGbnCd",request.getParameter("dateGbnCd"));
				returnUrl = "admin/pgmMng/removeRefundPopClose";
			}
		}
		
        return returnUrl;
    }
	
	@RequestMapping("/front/mypage/payment/paymentProc")
    public String paymentProc(Model model, HttpServletRequest request) {
		System.out.println("paymentProc=============");
        return "front/mypage/payment/proc_win";
    }
	
	//pamentResult
	@RequestMapping("/front/mypage/payment/paymentResult")
    public String paymentResult(Model model, HttpServletRequest request) {
		System.out.println("paymentResult==============");
        return "front/mypage/payment/result";
    }
	
	//paymentCancel
	@RequestMapping("/front/mypage/payment/paymentCancel")
    public String paymentCancel(Model model, HttpServletRequest request, Payment payParam) {
		Member sMember = (Member)request.getSession().getAttribute("userInfo");
		payParam.setMem_no(sMember.getUserNo());
		String gubun = CommonUtil.checkNull(payParam.getGbn());
		String cancelYn = CommonUtil.checkNull(payParam.getCancelYn());
		String ret_msg = "", state = "";;
		if("delete".equals(gubun)) {
			myPageService.saveRefund(payParam);
			if("Y".equals(cancelYn)) {
				ret_msg = "관리자에게 취소 요청 되었습니다. 결제 취소는 당일 근무시간 내 처리되오니 차후 확인 바랍니다.";
			} else {
				ret_msg = "관리자에게 환불 요청 되었습니다. 환불 여부는 차후 확인 바랍니다.";
			}
		}else if("cancel".equals(gubun)) {
			state = CommonUtil.checkNull(myPageService.findRefundCancel(payParam));
			if("".equals(state)) ret_msg = "취소 처리할 데이터가 없습니다.";
			if("2".equals(state)) {
				ret_msg = "이미 결제 취소 되었습니다. 관리자에게 문의 바랍니다.";
			} else {
				myPageService.removeRefundCancel(payParam);
				ret_msg = "결제 취소 요청이 삭제되었습니다. 당일 거래하신 내역은 정상 처리됩니다.";
			}
		}
		if(!GenericValidator.isBlankOrNull(ret_msg)) {
			request.getSession().setAttribute("cancelMsg", ret_msg);
		}
		
        return "redirect:/front/mypage/paymentList";
    }
	/** 결제관련 end **/
	
	
	//회원정보수정
	@RequestMapping("/front/mypage/mypageModify")
    public String mypageModify(Model model, HttpServletRequest request, Member member) {
		Member memberResult = null;
		try{
			Member memberParm =(Member)request.getSession().getAttribute("userInfo");
			memberResult = frontLoginService.findMemberInfo(memberParm);
			System.out.println("memberResult : " + memberResult);
			if(!GenericValidator.isBlankOrNull(memberResult.getZipcode())){
				memberResult.setZipcode1(memberResult.getZipcode().substring(0,3));
				memberResult.setZipcode2(memberResult.getZipcode().substring(3,6));
			}
			if(!GenericValidator.isBlankOrNull(memberResult.getCompZip())){
				memberResult.setCompZip1(memberResult.getCompZip().substring(0,3));
				memberResult.setCompZip2(memberResult.getCompZip().substring(3,6));
			}
			if(!GenericValidator.isBlankOrNull(memberResult.getPhone())){
				memberResult.setPhone1(memberResult.getPhone().split("-")[0]);
				memberResult.setPhone2(memberResult.getPhone().split("-")[1]);
				memberResult.setPhone3(memberResult.getPhone().split("-")[2]);
			}
			if(!GenericValidator.isBlankOrNull(memberResult.getTel())){
				memberResult.setTel1(memberResult.getTel().split("-")[0]);
				memberResult.setTel2(memberResult.getTel().split("-")[1]);
				memberResult.setTel3(memberResult.getTel().split("-")[2]);
			}
			
			if(! GenericValidator.isBlankOrNull(request.getParameter("flag")) ){
				model.addAttribute("flag", request.getParameter("flag"));
			}
			System.out.println("memberResult1 : " + memberResult);
			/*
			model.addAttribute("member", memberResult);
			Common commonParam = null;
   	    	listSetSlct(commonParam, "mail", null, model, "mailList");
   	    	listSetSlct(commonParam, "phonearea", "00", model, "phoneList");
   	    	listSetSlct(commonParam, "phonearea", "01", model, "mobileList");
   	    	*/
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Common commonParam = null;
		try {
	   		listSetSlct(commonParam, "mail", null, model, "mailList");
	   		listSetSlct(commonParam, "phonearea", "00", model, "phoneList");
	   		listSetSlct(commonParam, "phonearea", "01", model, "mobileList");
		} catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("member", memberResult);
		
        return "front/mypage/member_modify";
    }
	
	//회원탈퇴 페이지
	@RequestMapping("/front/mypage/memberOut")
	public String memberOut(Model model, HttpServletRequest request, Member member) {
		try{
		}catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		return "front/mypage/member_out";
	}
	
	
	//회원탈퇴 페이지
	@RequestMapping(value="/front/mypage/updateOut",method=RequestMethod.POST )
	public void updateOut(HttpServletRequest request, HttpServletResponse response, String userPw, String outDesc) throws Exception {
    	JSONObject jsonObj = new JSONObject();
    	try {
    		Member memberParm =(Member)request.getSession().getAttribute("userInfo");
    		memberParm.setUserPw(userPw);
    		Member member=frontLoginService.findMemberLoginInfo(memberParm);
    		if(member != null ){
    			Member inParm =new Member();
    			inParm.setUserId(memberParm.getUserId());
    			inParm.setOutDesc(outDesc);
    			inParm.setUserOut("Y");
    			String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
    			String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
    			inParm.setModiYmd(inDate);
    			inParm.setModiHms(inTime);
    			inParm.setModiIp(request.getRemoteAddr());
	            inParm.setOutDesc(CommonUtil.tagOff(inParm.getOutDesc()));
    			frontLoginService.updateOut(inParm);
    			request.getSession().removeAttribute("userInfo");
    			jsonObj.put("flag", "Y");
    		}else{
    			jsonObj.put("flag", "N");
    		}
    		ParsingUtil.getjsonObj(response, jsonObj);
    		
    	} catch (Exception e) {
    		e.getStackTrace();
    	}
	}
	
	//비밀번호변경 페이지
	@RequestMapping("/front/mypage/pwChange")
	public String pwChange(Model model, HttpServletRequest request, Member member) {
		try{
		}catch (Exception e) {
			e.getStackTrace();
		}
		return "front/mypage/pw_change";
	}
	
	//비밀번호변경
	@RequestMapping(value="/front/mypage/updatePwChange",method=RequestMethod.POST )
	public void updatePwChange(HttpServletRequest request, HttpServletResponse response, String userPw, String userPw1, String userPw2) throws Exception {
    	JSONObject jsonObj = new JSONObject();
    	try {
    		Member memberParm =(Member)request.getSession().getAttribute("userInfo");
	        if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
	        	System.out.println(" window ---------------> " );
	        	memberParm.setUserPw(userPw);
	        } else {
	        	System.out.println(" linux ---------------> " );
	        	XecureServlet xservlet=null;
	        	xservlet = new XecureServlet( request, response );
	        	String xcureUserPw = xservlet.request.getParameter("userPw");
	        	System.out.println(" xcureUserPw ---------------> " + xcureUserPw);
	        	memberParm.setUserPw(xcureUserPw);
	        }
    		Member member=frontLoginService.findMemberLoginInfo(memberParm);
    		if(member != null ){
    			Member inParm =new Member();
    			inParm.setUserId(memberParm.getUserId());
    			inParm.setUserPw(userPw1);
    			String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
    			String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
    			inParm.setModiYmd(inDate);
    			inParm.setModiHms(inTime);
    			inParm.setModiIp(request.getRemoteAddr());
    			frontLoginService.updatePassword(inParm);
    			jsonObj.put("flag", "Y");
    			
    		}else{
    			jsonObj.put("flag", "N");
    		}
    		ParsingUtil.getjsonObj(response, jsonObj);
    		
    	} catch (Exception e) {
    		e.getStackTrace();
    	}
	}
	
    private void listNoSet(Locker locker,List<Locker> list, int start, int totCnt){
    	
		int listNum, n = 0;
        ListIterator<Locker> it = list.listIterator();
        
        while(it.hasNext()) {
        	locker = (Locker)it.next();
       	 	listNum = totCnt - (start + n) + 1;
       	 	locker.setListNo(listNum);
			n++;
		}
        
    }
    
    private void listSetSlct(Common commonParam, String codeGbnCd,String codeId, Model model, String setAttrNm) throws Exception{
    	// select box 리스트
		commonParam = new Common();
		commonParam.setCodeGbnCd(codeGbnCd);
		commonParam.setCodeId(codeId);
		model.addAttribute(setAttrNm,aminMgrMngService.listFacil(commonParam));
    }
    
    private static PaymentUtil setFacilByUpid(String upId) {
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> upId : " + upId);    	
    	PaymentUtil payment = new PaymentUtil();
    	if("11".equals(upId)) { //올림픽기념국민생활관
        	payment.setG_conf_site_cd(PaymentUtil.g_conf_site_cd_olympic);
        	payment.setG_conf_site_key(PaymentUtil.g_conf_site_key_olympic);
        	payment.setG_conf_site_name(PaymentUtil.g_conf_site_name_olympic);
        } else if("21".equals(upId)) { //종로구민회관
        	payment.setG_conf_site_cd(PaymentUtil.g_conf_site_cd_gumin);
        	payment.setG_conf_site_key(PaymentUtil.g_conf_site_key_gumin);
        	payment.setG_conf_site_name(PaymentUtil.g_conf_site_name_gumin);
        }else if("41".equals(upId)) { //종로문화체육센터
        	payment.setG_conf_site_cd(PaymentUtil.g_conf_site_cd_culture);
        	payment.setG_conf_site_key(PaymentUtil.g_conf_site_key_culture);
        	payment.setG_conf_site_name(PaymentUtil.g_conf_site_name_culture);
        }
    	
    	return payment;
    }

}

