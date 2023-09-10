package com.jnet.front.login.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import xecure.servlet.XecureServlet;
import xecure.servlet.XecureServletConfigException;
import xecure.servlet.XecureServletException;
import Kisinfo.Check.IPINClient;
import NiceID.Check.CPClient;

import com.jnet.admin.mgrMng.service.AdminMgrMngService;
import com.jnet.domain.Common;
import com.jnet.domain.Log;
import com.jnet.domain.Member;
import com.jnet.front.login.service.FrontLoginService;
import com.jnet.util.CheckUtil;
import com.jnet.util.CommonUtil;
import com.jnet.util.IPINUtil;
import com.jnet.util.ParsingUtil;


@Controller
public class FrontLoginController {

	
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
	
	@Autowired
	private FrontLoginService frontLoginService;
	
	@Autowired
	private AdminMgrMngService aminMgrMngService;
    /**
     * 사용자 로그인
     * @return String String
     */
    @RequestMapping("/front/formLogin")
    public String frontLogin(Model model,HttpServletRequest request) {
        String returnUrl=request.getParameter("returnUrl")==null?"":(String)request.getParameter("returnUrl");
        String style="none";
        if(!GenericValidator.isBlankOrNull(returnUrl)){
        	request.getSession().setAttribute("returnUrl", returnUrl);
        }
        try{
	    	String retUrl1="certyIpin";
	    	String retUrl2="certyCheck";
	    	
		    if(!"".equals(CommonUtil.checkNull(returnUrl))) {
		    	style="block";
		    	Map<String, Object> ipinInfo = IPINUtil.setIpin(request,retUrl1);
		    	Map<String, Object> checkInfo = CheckUtil.setCheck(request,retUrl2,"","");
		    	
		    	model.addAttribute("ipinInfo",ipinInfo);
		    	model.addAttribute("checkInfo",checkInfo);
		    	model.addAttribute("returnUrl",request.getParameter("returnUrl"));
	    	}
		    model.addAttribute("style", style);
        }
        catch (Exception e) {
        	e.printStackTrace();
		}

        return "front/member/login";
    }
    
    /**
     * 사용자 회원가입
     * @return String String
     */
    @RequestMapping("/front/sign")
    public String frontSign() {
        return "front/member/join_memtype";
    }
    
    
    /**
     * 사용자 이용약관
     * @return String String
     */
    @RequestMapping("/front/agree/{adult}")
    public String joinAgree(Model model,HttpServletRequest request,@PathVariable("adult") String adult) {
    	model.addAttribute("adult",adult);
        return "front/member/join_agree";
    }
    
    
    /**
     * 사용자 이용약관
     * @return String String
     */
    @RequestMapping("/front/agree2/{adult}")
    public String joinAgree2(Model model,HttpServletRequest request,@PathVariable("adult") String adult) {
    	model.addAttribute("adult",adult);
    	return "front/member/join_agree2";
    }
    
    
    /**
     * 사용자 본인인증
     * @return String String
     */
    @RequestMapping("/front/oldCerty")
    public String joinCerty(Model model,HttpServletRequest request,Member member) {
    	String sDupInfo=request.getParameter("sDupInfo");
    	
		try{
			Member memberParm =(Member)request.getSession().getAttribute("userInfo");
			memberParm.setUserDi(sDupInfo);
			System.out.println("sDupInfo ---- "+ memberParm.getUserDi());
			System.out.println("userId ---- "+ memberParm.getUserId());
			frontLoginService.updateDi(memberParm);
		}catch (Exception e) {
			e.getStackTrace();
		}
    	return "front/member/certy_complete";
    }
    
    /**
     * 사용자 본인인증
     * @return String String
     */
    @RequestMapping("/front/certy/{type}")
    public String joinCerty(Model model,HttpServletRequest request,@PathVariable("type") String type,Member member) {
    	String retUrl1="findIpinInfoByJoinus/";
    	String retUrl2="findCheckInfoByJoinus/";
    	/*if("child".equals(member.getAdult())){
    		retUrl1="findIpinInfoByJoinusChild/";
    		retUrl2="findIpinInfoByJoinusChild2/";
    	}*/
    	Map<String, Object> ipinInfo = IPINUtil.setIpin(request,retUrl1+type);
    	Map<String, Object> checkInfo = CheckUtil.setCheck(request,retUrl2+type,member.getAdult(),"");
    	model.addAttribute("ipinInfo",ipinInfo);
    	model.addAttribute("checkInfo",checkInfo);
    	model.addAttribute("adult",member.getAdult());
    	if("old".equals(type)){
    		return "front/member/old_certy";
    	}
    	return "front/member/join_certy";
    }
    
    /**
     * 사용자 본인인증
     * @return String String
     */
    @SuppressWarnings("rawtypes")
	@RequestMapping("/front/certy2")
    public String joinCerty2(Model model,HttpServletRequest request) {
    	
   	    String sResponseData = requestReplace(request.getParameter("enc_data"), "encodeData");
   	    
   		IPINClient pClient = new IPINClient();//1

   		int iRtn = pClient.fnResponse(IPIN_SITECODE, IPIN_SITEPWD, sResponseData);
   		
   		
  	   CPClient niceCheck = new  CPClient();//0
	    int iRtn1 = niceCheck.fnDecode(CHECK_SITECODE, CHECK_SITEPWD, sResponseData);
	    
	    String sName				= "";
	    String sBirthday				= "";
	    if(iRtn==1){
	    	sName				= pClient.getName();			// 이름
	    	sBirthday				= pClient.getBirthDate();
	    }else if(iRtn1==0){
	    	String sPlainData = niceCheck.getPlainData();
	    	HashMap mapresult = niceCheck.fnParse(sPlainData);
	    	sName				= (String)mapresult.get("NAME");
	    	sBirthday				= (String)mapresult.get("BIRTHDATE");
	    }
	    model.addAttribute("sName", sName);
	    model.addAttribute("sBirthday", sBirthday);
	    model.addAttribute("parm", request.getParameter("parm"));
	    model.addAttribute("adult", request.getParameter("adult"));
	    model.addAttribute("sResponseData", sResponseData);
    	return "front/member/join_certy2";
    }
    
    /**
     * 사용자 본인인증
     * @return String String
     */
    @RequestMapping("/front/joinInput")
    public String joinInput() {
    	return "front/member/join_input";
    }
    
    
    /**
   	 * 회원가입2(회원정보입력)
   	 * @return
   	 */
       @RequestMapping(value="/findIpinInfoByJoinus/{type}")
       public String findIpinInfoByJoinus(Model model,HttpServletRequest request,@PathVariable("type") String type) {
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
   		request.getSession().setAttribute("di", sDupInfo);
   		if(!GenericValidator.isBlankOrNull(sResponseData)) {
   			try {
   				Map<String, String> hmap = new HashMap<String, String>();
   				hmap.put("userDi", sDupInfo);
   				
   				//중복조회
   				int memberCnt = frontLoginService.findMemberDuplicate(hmap);
   				if("child".equals(sReservedParam1) )memberCnt=0;
   				if("old".equals(type) )memberCnt=0;
   				model.addAttribute("sResponseData",sResponseData);
   				model.addAttribute("iRtn",iRtn);
   				model.addAttribute("memberCnt",memberCnt);
   				model.addAttribute("sAgeCode",sAgeCode);
   				model.addAttribute("adult",sReservedParam1);
   				model.addAttribute("sDupInfo",sDupInfo);
   				model.addAttribute("type",type);
   			} catch (Exception e) {
   				e.getStackTrace();
   				 
   	 			ByteArrayOutputStream out = new ByteArrayOutputStream();
   	 			PrintStream pinrtStream = new PrintStream(out);
   	 			e.printStackTrace(pinrtStream);
   	 			String stackTraceString = out.toString(); // 찍은 값을 가져오고.
   	 			  
   	 			//Map<String, String> hmap = new HashMap<String, String>();
   	 			//hmap.put("errCd", e.toString().replaceAll("---", "<br/>"));
   	 			//hmap.put("errMsg", stackTraceString.replaceAll("---", "<br/>"));
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
   		model.addAttribute("type",type);
   		return "front/member/findIpinInfoByJoinus";
       }
       
      
       /**
   	 * 회원가입2(회원정보입력)
   	 * @return
   	 */
       @RequestMapping(value="/formMemberJoinInput",method=RequestMethod.POST)
       public String formMemberJoinInput(Model model,HttpServletRequest request) {
       	//ModelAndView mav = new ModelAndView("front/member/join_input");
       	
   			
       	/********************************************************************************************************************************************
   			NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
   			
   			서비스명 : 가상주민번호서비스 (IPIN) 서비스
   			페이지명 : 가상주민번호서비스 (IPIN) 결과 페이지
   		*********************************************************************************************************************************************/

   		// 사용자 정보 및 CP 요청번호를 암호화한 데이타입니다.
   	 String sResponseData = requestReplace(request.getParameter("enc_data"), "encodeData");
   	    
   	    // CP 요청번호 : ipin_main.jsp 에서 세션 처리한 데이타
   	    //String sCPRequest = (String)request.getSession().getAttribute("CPREQUEST");
   	    
   	    // 객체 생성
   		IPINClient pClient = new IPINClient();
   	
   	
   		/*
   		┌ 복호화 함수 설명  ──────────────────────────────────────────────────────────
   			Method 결과값(iRtn)에 따라, 프로세스 진행여부를 파악합니다.
   			
   			fnResponse 함수는 결과 데이타를 복호화 하는 함수이며,
   			'sCPRequest'값을 추가로 보내시면 CP요청번호 일치여부도 확인하는 함수입니다. (세션에 넣은 sCPRequest 데이타로 검증)
   			
   			따라서 귀사에서 원하는 함수로 이용하시기 바랍니다.
   		└────────────────────────────────────────────────────────────────────
   		*/
   		int iRtn = pClient.fnResponse(IPIN_SITECODE, IPIN_SITEPWD, sResponseData);
   		String sName				= pClient.getName();			// 이름
   		String sBirthday				= pClient.getBirthDate();
   		String sGenderCode			= pClient.getGenderCode();
   		String sDupInfo				= pClient.getDupInfo();			// 중복가입 확인값 (DI - 64 byte 고유값)
   		String vNumber				= pClient.getVNumber();//가상주민번호
   		// Method 결과값에 따른 처리사항
   		if (iRtn == 1)
   		{
   			/*
   				다음과 같이 사용자 정보를 추출할 수 있습니다.
   				사용자에게 보여주는 정보는, '이름' 데이타만 노출 가능합니다.
   			
   				사용자 정보를 다른 페이지에서 이용하실 경우에는
   				보안을 위하여 암호화 데이타(sResponseData)를 통신하여 복호화 후 이용하실것을 권장합니다. (현재 페이지와 같은 처리방식)
   				
   				만약, 복호화된 정보를 통신해야 하는 경우엔 데이타가 유출되지 않도록 주의해 주세요. (세션처리 권장)
   				form 태그의 hidden 처리는 데이타 유출 위험이 높으므로 권장하지 않습니다.
   			*/
   			
   			// 사용자 인증정보에 대한 변수
   			model.addAttribute("sName",sName);
   			model.addAttribute("sGenderCode","1".equals(sGenderCode)?"1":"2");
   			model.addAttribute("sDupInfo",sDupInfo);
   			model.addAttribute("sBirthday",sBirthday);
   			model.addAttribute("vNumber",vNumber);
   			model.addAttribute("userNo",request.getParameter("userNo"));
   			
   			model.addAttribute("adult",request.getParameter("adult"));
   			model.addAttribute("sYY",sBirthday.substring(0, 4));
   			model.addAttribute("sMM",sBirthday.substring(4, 6));
   			model.addAttribute("sDD",sBirthday.substring(6, 8));
   			
   			//mav.addObject("di",sDupInfo);
   			try {
   			/*	CommonCode commonCode = null;
   		 		commonCode = new CommonCode();
   				commonCode.setGbnCd("em");
   				ArrayList<CommonCode> listEmail = commuService.listCommonCode(commonCode);
   				commonCode = new CommonCode();
   				commonCode.setGbnCd("mb");
   				ArrayList<CommonCode> listMobile = commuService.listCommonCode(commonCode);
   				
   				mav.addObject("listEmail",listEmail);
   				mav.addObject("listMobile",listMobile);*/
   				Common commonParam = null;
   	    		listSetSlct(commonParam, "mail", null, model, "mailList");
   	    		listSetSlct(commonParam, "phonearea", "00", model, "phoneList");
   	    		listSetSlct(commonParam, "phonearea", "01", model, "mobileList");
   			} catch (Exception e) {
   				StackTraceElement[] elem = e.getStackTrace();
   				  for(int i=0; i<elem.length; i++) {
   				  }
   				ByteArrayOutputStream out = new ByteArrayOutputStream();
   	 			PrintStream pinrtStream = new PrintStream(out);
   	 			e.printStackTrace(pinrtStream);
   	 			String stackTraceString = out.toString(); // 찍은 값을 가져오고.

   	 			Map<String, String> hmap = new HashMap<String, String>();
   	 			hmap.put("errCd", e.toString().replaceAll("---", "<br/>"));
   	 			hmap.put("errMsg", stackTraceString.replaceAll("---", "<br/>"));
   	 			//return new ModelAndView("exceptionPage", "errCode", hmap);
   	 			return "exceptionPage";
   			}
   		}
           return "front/member/join_input";
       }
       
       /**
      	 * 회원가입3(완료)
      	 * @return
      	 */
          @RequestMapping(value="/formMemberJoinComplete",method=RequestMethod.POST)
          public ModelAndView formMemberJoinComplete(HttpServletRequest request) {
          	ModelAndView mav = new ModelAndView("front/member/joinus_3");
       	
          	
          	//if(acc.getAccMailYn() == null) {
          	//	acc.setAccMailYn("N");
          	//}
          	
          	if(request.getSession().getAttribute("di") != null) {
          	//	acc.setAccDi((String)request.getSession().getAttribute("di"));
          	} else {
          		mav = new ModelAndView("exceptionScriptPage","scriptCd","고유번호가 넘어오지 않았습니다.\\n관리자에게 확인부탁드리겠습니다.");
          	}
          	
        //  	acc.setAccAuth("2");
        //  	acc.setRgstrId(acc.getAccId());
        //  	acc.setRgstrIp(request.getRemoteAddr());
          	
          	try {
          		//acc.setAccPwd(ParsingUtil.SHA1(acc.getAccPwd()));
          		
          		//memberService.saveAcc(acc);	
   		} catch (Exception e) {
   			StackTraceElement[] elem = e.getStackTrace();
   			  for(int i=0; i<elem.length; i++) {
   			  }
   			ByteArrayOutputStream out = new ByteArrayOutputStream();
    			PrintStream pinrtStream = new PrintStream(out);
    			e.printStackTrace(pinrtStream);
    			String stackTraceString = out.toString(); // 찍은 값을 가져오고.

    			Map<String, String> hmap = new HashMap<String, String>();
    			hmap.put("errCd", e.toString().replaceAll("---", "<br/>"));
    			hmap.put("errMsg", stackTraceString.replaceAll("---", "<br/>"));
    			return new ModelAndView("exceptionPage", "errCode", hmap);
   		}
           return mav;
          }
          
          
          /**
         	 * 회원가입2(회원정보입력)
         	 * @return
         	 */
             @SuppressWarnings({ "rawtypes", "unused" })
			@RequestMapping(value="/findCheckInfoByJoinus/{type}")
             public String findCheckInfoByJoinus(Model model,HttpServletRequest request,@PathVariable("type") String type) {
          	   String retStr="";
//             	ModelAndView mav = new ModelAndView("front/member/findCheckInfoByJoinus"); //new ModelAndView("front/member/joinus_2");
             	/********************************************************************************************************************************************
         			NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
         			
         			서비스명 : 가상주민번호서비스 (IPIN) 서비스
         			페이지명 : 가상주민번호서비스 (IPIN) 사용자 인증 정보 처리 페이지
         		
         		     수신받은 데이터(인증결과)를 메인화면으로 되돌려주고, close를 하는 역활을 합니다.
         		 *********************************************************************************************************************************************/
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
         	  String sReservedParam1  = (String)mapresult.get("RESERVED1");
         		
         	    String sDupInfo =(String)mapresult.get("IPIN_DI");
         		Calendar date = Calendar.getInstance();
         		if(!GenericValidator.isBlankOrNull(sResponseData)) {
         			try {
         				if( iRtn == 0 )
         			    {
         			    	sMessage = "본인인증 성공하였습니다.";
         			        sCipherTime = niceCheck.getCipherDateTime();
         			        
         			        // 데이타를 추출합니다.
         			        Map<String, String> hmap = new HashMap<String, String>();
         	   				hmap.put("userDi",sDupInfo);
         	   				
         			        /*out.println("[실명확인결과 : " + (String)mapresult.get("NC_RESULT")+ "]<br>");
         			        out.println("[이름 : " + (String)mapresult.get("NAME")+ "]<br>");
         			        out.println("[성별 : " + (String)mapresult.get("GENDER")+ "]<br>");
         			        out.println("[생년월일 : " + (String)mapresult.get("BIRTHDATE")+ "]<br>");
         			        
         			        out.println("[안심KEY :" + (String)mapresult.get("SAFEID")+ "]<br>");
         			        out.println("[VNO_NUM : " + (String)mapresult.get("VNO_NUM")+ "]<br>");
         			        out.println("[IPIN_DI : " + (String)mapresult.get("IPIN_DI")+ "]<br>");
         			        
         			         */
         	   				String ss =(String)mapresult.get("BIRTHDATE");
         	   				ss=ss.substring(0, 4);
         	   				int age = (date.get(Calendar.YEAR)) - Integer.parseInt(ss) + 1;
         			        String session_sRequestNumber = (String)request.getSession().getAttribute("REQ_SEQ");
         			       sRequestNO=(String)mapresult.get("REQ_SEQ");
         			        if(!sRequestNO.equals(session_sRequestNumber))
         			        {
         			            sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
         			            System.out.println("sMessage --------------------> " +sMessage);
         			            sRequestNO = "";
         			            iRtn=1;
         			        }
         			        //중복조회
         			        
         	   				int memberCnt = frontLoginService.findMemberDuplicate(hmap);
         	   				if("child".equals(sReservedParam1))memberCnt=0;
         	   			    if("old".equals(type) )memberCnt=0;
         			        model.addAttribute("sResponseData",sResponseData);
         			        model.addAttribute("iRtn",iRtn);
         			        model.addAttribute("memberCnt",memberCnt);
         			        model.addAttribute("sAge",age);
         			        model.addAttribute("sDupInfo",sDupInfo);
         			        model.addAttribute("adult",sReservedParam1);
         			        model.addAttribute("type",type);
         			        
         			    }
         			} catch (Exception e) {
         				e.getStackTrace();
         				 
         	 			ByteArrayOutputStream out = new ByteArrayOutputStream();
         	 			PrintStream pinrtStream = new PrintStream(out);
         	 			e.printStackTrace(pinrtStream);
         	 			String stackTraceString = out.toString(); // 찍은 값을 가져오고.
         	 			  
         	 			//Map<String, String> hmap = new HashMap<String, String>();
         	 			//hmap.put("errCd", e.toString().replaceAll("---", "<br/>"));
         	 			//hmap.put("errMsg", stackTraceString.replaceAll("---", "<br/>"));
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
         		return "front/member/findCheckInfoByJoinus";
             }
             
             /**
         	 * 회원가입2(회원정보입력)
         	 * @return
         	 */
             @SuppressWarnings("rawtypes")
			@RequestMapping(value="/formMemberJoinInput2",method=RequestMethod.POST)
             public String formMemberJoinInput2(Model model,HttpServletRequest request) {
             	//ModelAndView mav = new ModelAndView("front/member/join_input");
             	
         			
             	/********************************************************************************************************************************************
         			NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
         			
         			서비스명 : 가상주민번호서비스 (IPIN) 서비스
         			페이지명 : 가상주민번호서비스 (IPIN) 결과 페이지
         		*********************************************************************************************************************************************/
         		String userNo =request.getParameter("userNo");
         		// 사용자 정보 및 CP 요청번호를 암호화한 데이타입니다.
         	   String sResponseData = requestReplace(request.getParameter("enc_data"), "encodeData");
         	    
         	    // CP 요청번호 : ipin_main.jsp 에서 세션 처리한 데이타
         	    //String sCPRequest = (String)request.getSession().getAttribute("CPREQUEST");
         	    
         	    // 객체 생성
         	   CPClient niceCheck = new  CPClient();
         		
         	
         	
         		/*
         		┌ 복호화 함수 설명  ──────────────────────────────────────────────────────────
         			Method 결과값(iRtn)에 따라, 프로세스 진행여부를 파악합니다.
         			
         			fnResponse 함수는 결과 데이타를 복호화 하는 함수이며,
         			'sCPRequest'값을 추가로 보내시면 CP요청번호 일치여부도 확인하는 함수입니다. (세션에 넣은 sCPRequest 데이타로 검증)
         			
         			따라서 귀사에서 원하는 함수로 이용하시기 바랍니다.
         		└────────────────────────────────────────────────────────────────────
         		*/
         		int iRtn = niceCheck.fnDecode(CHECK_SITECODE, CHECK_SITEPWD, sResponseData);
         		String sPlainData =niceCheck.getPlainData();
          	    HashMap mapresult = niceCheck.fnParse(sPlainData);
                /*out.println("[이름 : " + (String)mapresult.get("NAME")+ "]<br>");
                out.println("[성별 : " + (String)mapresult.get("GENDER")+ "]<br>");
                out.println("[생년월일 : " + (String)mapresult.get("BIRTHDATE")+ "]<br>");*/
         		String sName				= (String)mapresult.get("NAME");
         		String sBirthday				= (String)mapresult.get("BIRTHDATE");			// 이름
         		String vNumber				= (String)mapresult.get("SAFEID");			// 이름
         		String sDupInfo =(String)mapresult.get("IPIN_DI");
           		String sGenderCode			= (String)mapresult.get("GENDER");
         		// Method 결과값에 따른 처리사항
         		if (iRtn == 0)
         		{
         			try {
         				model.addAttribute("sName",sName);
         				model.addAttribute("sDupInfo",sDupInfo);
         				if("M".equals(sGenderCode) || "A".equals(sGenderCode)){
         					sGenderCode="1";
         				}else if("F".equals(sGenderCode) || "B".equals(sGenderCode)){
         					sGenderCode="2";
         				}
         				model.addAttribute("sGenderCode",sGenderCode);
         				model.addAttribute("sBirthday",sBirthday);
         				model.addAttribute("vNumber",vNumber);
         				model.addAttribute("userNo",userNo );
         				model.addAttribute("adult",request.getParameter("adult"));
         				model.addAttribute("sYY",sBirthday.substring(0, 4));
         				model.addAttribute("sMM",sBirthday.substring(4, 6));
         				model.addAttribute("sDD",sBirthday.substring(6, 8));
         				if(!GenericValidator.isBlankOrNull(userNo)){
                    		
         				}
           				Common commonParam = null;
           	    		listSetSlct(commonParam, "mail", null, model, "mailList");
           	    		listSetSlct(commonParam, "phonearea", "00", model, "phoneList");
           	    		listSetSlct(commonParam, "phonearea", "01", model, "mobileList");
         			} catch (Exception e) {
         				StackTraceElement[] elem = e.getStackTrace();
         				  for(int i=0; i<elem.length; i++) {
         				  }
         				ByteArrayOutputStream out = new ByteArrayOutputStream();
         	 			PrintStream pinrtStream = new PrintStream(out);
         	 			e.printStackTrace(pinrtStream);
         	 			String stackTraceString = out.toString(); // 찍은 값을 가져오고.

//         	 			Map<String, String> hmap = new HashMap<String, String>();
         	 			model.addAttribute("errCd", e.toString().replaceAll("---", "<br/>"));
         	 			model.addAttribute("errMsg", stackTraceString.replaceAll("---", "<br/>"));
         	 			//return new ModelAndView("exceptionPage", "errCode", hmap);
         	 			return "exceptionPage";
         			}
         		}
                 return "front/member/join_input";
             }
             
             /**
            	 * 회원가입3(완료)
            	 * @return
            	 */
                @RequestMapping(value="/formMemberJoinComplete2",method=RequestMethod.POST)
                public ModelAndView formMemberJoinComplete2(HttpServletRequest request) {
                	ModelAndView mav = new ModelAndView("front/member/joinus_3");
             	
                	
                	//if(acc.getAccMailYn() == null) {
                	//	acc.setAccMailYn("N");
                	//}
                	
                	if(request.getSession().getAttribute("di") != null) {
                	//	acc.setAccDi((String)request.getSession().getAttribute("di"));
                	} else {
                		mav = new ModelAndView("exceptionScriptPage","scriptCd","고유번호가 넘어오지 않았습니다.\\n관리자에게 확인부탁드리겠습니다.");
                	}
                	
              //  	acc.setAccAuth("2");
              //  	acc.setRgstrId(acc.getAccId());
              //  	acc.setRgstrIp(request.getRemoteAddr());
                	
                	try {
                		//acc.setAccPwd(ParsingUtil.SHA1(acc.getAccPwd()));
                		
                		//memberService.saveAcc(acc);	
         		} catch (Exception e) {
         			StackTraceElement[] elem = e.getStackTrace();
         			  for(int i=0; i<elem.length; i++) {
         			  }
         			ByteArrayOutputStream out = new ByteArrayOutputStream();
          			PrintStream pinrtStream = new PrintStream(out);
          			e.printStackTrace(pinrtStream);
          			String stackTraceString = out.toString(); // 찍은 값을 가져오고.

          			Map<String, String> hmap = new HashMap<String, String>();
          			hmap.put("errCd", e.toString().replaceAll("---", "<br/>"));
          			hmap.put("errMsg", stackTraceString.replaceAll("---", "<br/>"));
          			return new ModelAndView("exceptionPage", "errCode", hmap);
         		}
                 return mav;
                }
                
                
                /**
                 * 회원가입
                 * 
                 * @param model model
                 * @param Member member
                 * @return String
                 */
            	@RequestMapping(value="/front/saveMember",method=RequestMethod.POST)
                public String saveMember(Model model,HttpServletRequest request, Member member) {
            		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            		String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            		String returnStr="";
                	try {
                		member.setModiYmd(inDate);
                		member.setModiHms(inTime);
                		member.setModiIp(request.getRemoteAddr());
                		Member memberParm =(Member)request.getSession().getAttribute("userInfo");
                		if(memberParm !=null){
                			member.setUserId(memberParm.getUserId());
                			member.setUserNo(memberParm.getUserNm());
                		}else{
                			member.setSignYmd(inDate);
                			member.setSignHms(inTime);
                		}
                		frontLoginService.saveMember(member,offKey());
                		if(!GenericValidator.isBlankOrNull(member.getUserNo())){
                			returnStr="redirect:/front/mypage/mypageModify?flag=Y";
                		}else{
                			returnStr="front/member/join_complete";                			
                		}
            		} catch (Exception e) {
            			e.printStackTrace();
            		}
                	return returnStr;
                }
            	
            	public String offKey(){
            		String key="";
            		String userNo="";
            		
            		Calendar cal =  Calendar.getInstance();
            		try{
            			key=frontLoginService.offKey();
            			if("0".equals(key)){
            				key="000001";		
            				userNo=key;		
            			}else{
            				key= "000000"+key;
            				key= key.substring(key.length()-6,key.length());
            				userNo=key;
            			}
            			String isYear=Integer.toString(cal.get(Calendar.YEAR));
            			userNo=isYear.substring(2, 4)+userNo;
            			
            		}catch (Exception e) {
            			e.printStackTrace();
					}
            		return userNo;
            	}
                
                /**
                 * 사용자 로그인정보 조회
                 * @param request request
                 * @param response response
                 * @param member member
                 */
                @RequestMapping(value="/front/findMemberLoginInfo",method=RequestMethod.POST )
                public void findAdminLoginInfo(HttpServletRequest request, HttpServletResponse response, Member member) {
                	JSONObject jsonObject = new JSONObject();

                	try {
            	        if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
            	        	System.out.println(" window ---------------> " );
            	        } else {
            	        	System.out.println(" linux ---------------> " );
            	        	XecureServlet xservlet=null;
            	        	xservlet = new XecureServlet( request, response );
            	        	String userId = xservlet.request.getParameter("userId");
            	        	String userPw = xservlet.request.getParameter("userPw");
            	        	System.out.println(" text_field1 ---------------> " + userId);
            	        	System.out.println(" text_field2 ---------------> " + userPw);
            	        	member.setUserId(userId);
            	        	member.setUserPw(userPw);
            	        }
                		Member memberResult = frontLoginService.findMemberLoginInfo(member);
            			if(memberResult != null) {
            				System.out.println("로그인 성공!! ");
            				String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
            				String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            				System.out.println(memberResult.getLoginYmd() +":"+inDate);
            				if(!inDate.equals(memberResult.getLoginYmd())){
            					System.out.println(memberResult.getLoginYmd() +":"+inDate);
            					member.setVisitCnt(0);
            				}
            				member.setLoginYmd(inDate);
            				member.setLoginHms(inTime);
            				member.setLoginIp(request.getRemoteAddr());
            				frontLoginService.updateVisit(member);
            				String returnUrl= request.getSession().getAttribute("returnUrl")==null?"":(String)request.getSession().getAttribute("returnUrl");
            				jsonObject.put("flag", "Y");
            				jsonObject.put("returnUrl", returnUrl);
            		    	request.getSession().setAttribute("userInfo", memberResult);
            		    	System.out.println("세션 저장 OK !! ");
            			} else {
            				jsonObject.put("flag", "N");
            			}
            		} catch (SQLException e) {
            			jsonObject.put("flag", "N");
            			e.printStackTrace();
            		}
	               	catch ( XecureServletConfigException e ) {
	             		/* 설정 오류 */
	               		System.out.print( e.toString() );
	               		System.out.println("설정오류!!!!!!!!!!!!");
	               		System.out.flush();
	             		return;
	             	}catch ( XecureServletException e ) {
	             		/* 암호 세션 없음 */
	             		System.out.print( e.toString() );
	             		System.out.println("암호세션없음 !!!!!!!!!!!!");
	             		System.out.flush();
	             		return;
	             	}
                	finally{
            			request.getSession().removeAttribute("returnUrl");
            			try {
            				System.out.println("마무리!!!!!!!!!!!!");
							ParsingUtil.getjsonObj(response, jsonObject);
						} catch (IOException e) {
							e.printStackTrace();
						}	
            		}
                }
                
                @RequestMapping(value="/front/findMemberIdDup" , method=RequestMethod.POST)
          		public void findMemberIdDup(HttpServletRequest request, HttpServletResponse response, String userId) throws Exception {
          			int duplicateCnt = 0;
          			JSONObject jsonObj = new JSONObject();
          			try {
           				Map<String, String> hmap = new HashMap<String, String>();
           				hmap.put("userId", userId);
           				
        				duplicateCnt = frontLoginService.findMemberIdDup(hmap);
        				jsonObj.put("duplicateCnt", duplicateCnt);
          				ParsingUtil.getjsonObj(response, jsonObj);
          				
          			} catch (Exception e) {
          				e.getStackTrace();
          			}
          		}
                
                @RequestMapping(value="/front/findOffMember" , method=RequestMethod.POST)
                public void findOffMember(HttpServletRequest request, HttpServletResponse response, String userNm,String birthday) throws Exception {
                	String userNo="";
                	JSONObject jsonObj = new JSONObject();
                	try {
                		Map<String, String> hmap = new HashMap<String, String>();
                		hmap.put("userNm", userNm);
                		hmap.put("birthday", birthday);
                		Member member=frontLoginService.findOffMember(hmap);
                		userNo = member.getUserNo();
                		
                		jsonObj.put("userNo", userNo);
                		
                		ParsingUtil.getjsonObj(response, jsonObj);
                		
                	} catch (Exception e) {
                		e.getStackTrace();
                	}
                }
                
                public Member findOffMember(String userNo)throws Exception{
                	Member member =new Member();
                	try{
                		Map<String, String> hmap = new HashMap<String, String>();
                		hmap.put("userNo", userNo);
                		member=frontLoginService.findOffMember(hmap);
                	}catch (Exception e) {
                		e.getStackTrace();
					}
                	return member;
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
                
    @RequestMapping("/etc/if_agree")
    public String ifAgree() {
        return "front/etc/if_agree";
    }
    @RequestMapping("/etc/if_private")
    public String ifPrivate() {
    	return "front/etc/if_private";
    }
    
    /**
  	 * 로그아웃
  	 * @return
  	 */
      @RequestMapping("/front/logout")
      public String logout(HttpServletRequest request) {
       request.getSession().invalidate();
       if(request.getSession() !=null) {
    	   request.getSession().removeAttribute("userInfo");
    	   request.getSession().removeAttribute("returnUrl");
       }	   

    	   
       return "redirect:/main";
      }
  
    @RequestMapping("/front/sessionCheck")
    public String sessionCheck(HttpServletRequest request) {
     System.out.println("sessionCheck");
     return "front/member/check";
    }
    
   
      
      
	@RequestMapping(value="/front/findCertyPopup",method=RequestMethod.POST )
	public void findCertyPopup(HttpServletRequest request, HttpServletResponse response,Member member) {
		
		JSONObject jsonObject = new JSONObject();
    	try {
    		String retUrl2="findIdPwCertyCheck";
    		System.out.println("member.getUserNm() ==========" + member.getUserNm() );
          	System.out.println("member.getUserId() ==========" + member.getUserId() );
    		Map<String, Object> checkInfo = CheckUtil.setCheck(request,retUrl2,member.getUserId(),"");
    		
    		System.out.println("checkInfo ==========  " + (String)checkInfo.get("encData") );

    		jsonObject.put("checkInfo", (String)checkInfo.get("encData"));
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			
			try {
				ParsingUtil.getjsonObj(response, jsonObject);
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
	}
    	
    	
      
  	
  	@SuppressWarnings("unused")
	@RequestMapping("/front/findIdCerty")
  	public String findIdCerty(Model model,HttpServletRequest request,Member member) {
      	String retUrl1="findIdPwCertyIpin";
      	String retUrl2="findIdPwCertyCheck";

      	Map<String, Object> ipinInfo = IPINUtil.setIpin(request,retUrl1);
      	//Map<String, Object> checkInfo = CheckUtil.setCheck(request,retUrl2,request.getParameter("RESERVED1"),request.getParameter("RESERVED2"));
      	model.addAttribute("ipinInfo",ipinInfo);
      	//model.addAttribute("checkInfo",checkInfo);
      	model.addAttribute("userId",member.getUserId());
      	model.addAttribute("userDi",member.getUserDi());
      	model.addAttribute("returnUrl","/front/findIdCerty");

  		return "front/member/find_id";
  	}
  	
  	
  	@RequestMapping("/front/findPwCerty")
  	public String findPwCerty(Model model,HttpServletRequest request,Member member) {
  		String retUrl1="findIdPwCertyIpin";
  		//String retUrl2="findIdPwCertyCheck";
  		Map<String, Object> ipinInfo = IPINUtil.setIpin(request,retUrl1);
  		//Map<String, Object> checkInfo = CheckUtil.setCheck(request,retUrl2,request.getParameter("RESERVED1"),request.getParameter("RESERVED2"));
  		model.addAttribute("ipinInfo",ipinInfo);
  		//model.addAttribute("checkInfo",checkInfo);
  		model.addAttribute("userId",member.getUserId());
  		model.addAttribute("userDi",member.getUserDi());
  		model.addAttribute("returnUrl","/front/findPwCerty");
  		
  		return "front/member/find_pw";
  	}
  	
  	
	@RequestMapping("/front/findId")
  	public String findId(Model model,HttpServletRequest request,Member member) {
  		return "front/member/find_id_select";
  	}
  	
	@RequestMapping("/front/findPw")
  	public String findPw(Model model,HttpServletRequest request,Member member) {

  		return "front/member/find_pw_select";
  	}
  	
  	@RequestMapping("/front/findOldId")
  	public String findOldId(Model model,HttpServletRequest request,Member member) {
  		try{
  			Common commonParam = null;
  			
  			listSetSlct(commonParam, "mail", null, model, "mailList");
  		}catch (Exception e) {
  			e.printStackTrace();
		}
  		return "front/member/old_find_id";
  	}
  	@RequestMapping("/front/findOldPw")
  	public String findOldPw(Model model,HttpServletRequest request,Member member) {
  		try{
  			Common commonParam = null;
  			listSetSlct(commonParam, "mail", null, model, "mailList");
  		}catch (Exception e) {
  			e.printStackTrace();
		}
  		return "front/member/old_find_pw";
  	}
  	/**
     	 * 
     	 * @return
     	 */
         @SuppressWarnings("unused")
		@RequestMapping(value="/findIdPwCertyIpin")
         public String certyIpin(Model model,HttpServletRequest request) {
      	   String retStr="";
         	/********************************************************************************************************************************************
     			NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
     			
     			서비스명 : 가상주민번호서비스 (IPIN) 서비스
     			페이지명 : 가상주민번호서비스 (IPIN) 사용자 인증 정보 처리 페이지
     		
     		     수신받은 데이터(인증결과)를 메인화면으로 되돌려주고, close를 하는 역활을 합니다.
     		 *********************************************************************************************************************************************/
     		// 사용자 정보 및 CP 요청번호를 암호화한 데이타입니다. (ipin_main.jsp 페이지에서 암호화된 데이타와는 다릅니다.)
      	   try{
      		   
      	
     		String sResponseData = requestReplace(request.getParameter("enc_data"), "encodeData");
     		//request.setCharacterEncoding("EUC-KR");
     		String sReservedParam1  = requestReplace(request.getParameter("param_r1"), "");
     		//java.net.URLEncoder.encode((String)request.getAttribute("param_r1"),"UTF-8");
     		//System.out.println("11111111111 " ); 
     		//System.out.println("000000000 "+ sReservedParam1); 
     		//System.out.println("11111111111 " + java.net.URLEncoder.encode((String)request.getParameter("param_r1"),"UTF-8"));
     		//System.out.println("22222222222222 " + java.net.URLEncoder.encode((String)request.getParameter("param_r1"),"EUC-KR"));
     		//System.out.println("22222222222222 ");
     		// ipin_main.jsp 페이지에서 설정한 데이타가 있다면, 아래와 같이 확인가능합니다.
     	    IPINClient pClient = new IPINClient();
     	    int iRtn = pClient.fnResponse(IPIN_SITECODE, IPIN_SITEPWD, sResponseData);
     		String sDupInfo				= pClient.getDupInfo();			// 중복가입 확인값 (DI - 64 byte 고유값)
     		String sAgeCode = pClient.getAgeCode();
     		String sName = pClient.getName();
     		String birthday = pClient.getBirthDate();
     		String sGenderCode = pClient.getGenderCode();
     		request.getSession().setAttribute("di", sDupInfo);
     		Member member = new Member();
     		if(!GenericValidator.isBlankOrNull(sResponseData)) {
     			try {
     				model.addAttribute("sDi", sDupInfo);
     				model.addAttribute("iRtn",iRtn);
     				model.addAttribute("sBirth",birthday);
     				model.addAttribute("sName",sName);
     				model.addAttribute("sGenderCode","1".equals(sGenderCode)?"1":"0");
     				if(iRtn==1){
     					System.out.println("sReservedParam1 " + sReservedParam1);
     					member.setUserNm(sName);
	     				member.setUserId(sReservedParam1);
	     				member.setUserDi(sDupInfo);
	     				Member outMember = new Member();
	     				outMember=frontLoginService.findMemberIdPw(member);
	     				if(outMember != null ){
	     					
	     				model.addAttribute("userId",outMember.getUserId());
	     				model.addAttribute("userDi",outMember.getUserDi());
	     				}else{
	     					model.addAttribute("userId","N");	
	     				}
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
      	   }catch (Exception e) {
      		   e.printStackTrace();
   		}
     	    //return mav;
     		return "front/member/findIpinInfoById";
         }
         
         
         /**
        	 * 
        	 * @return
        	 */
            @SuppressWarnings({ "rawtypes", "unused" })
			@RequestMapping(value="/findIdPwCertyCheck")
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
        	    String sReservedParam1  = (String)mapresult.get("RESERVED1");
        	    System.out.println("sReservedParam1 " + sReservedParam1);
        	    System.out.println("iRtn " + iRtn);
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
    	   					Member member = new Member();
         					member.setUserNm((String)mapresult.get("NAME"));
    	     				member.setUserId(sReservedParam1);
    	     				member.setUserDi(sDupInfo);
    	     				Member outMember = new Member();
    	     				outMember=frontLoginService.findMemberIdPw(member);
    	     				if(outMember != null ){
			     				model.addAttribute("userId",outMember.getUserId());
			     				model.addAttribute("userDi",outMember.getUserDi());
		     				}else{
		     					model.addAttribute("userId","N");	
		     				}
        			        
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
        		return "front/member/findCheckInfoById";
            }
            
            
            /**
             * 비밀번호변경
             * @return String String
             */
            @RequestMapping(value="/front/updatePassword",method=RequestMethod.POST )
            public void updatePassword(HttpServletRequest request, HttpServletResponse response, Member member)  {
            	JSONObject jsonObject = new JSONObject();
            	try {
            		
       				if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
        	        	System.out.println(" window ---------------> " );
        	        } else {
        	        	System.out.println(" linux ---------------> " );
        	        	XecureServlet xservlet=null;
        	        	xservlet = new XecureServlet( request, response );
        	        	String xUserId = xservlet.request.getParameter("userId");
        	        	String xUserNm = xservlet.request.getParameter("userNm");
        	        	String xEmail = xservlet.request.getParameter("email");
        	        	member.setUserNm(xUserNm);
        	        	member.setEmail(xEmail);
        	        	member.setUserId(xUserId);
        	        }
            		frontLoginService.updatePassword(member);
        		} catch (SQLException e) {
        			
        			e.printStackTrace();
        		}catch ( XecureServletConfigException e ) {
             		/* 설정 오류 */
               		System.out.print( e.toString() );
               		System.out.flush();
             		return;
             	}catch ( XecureServletException e ) {
             		/* 암호 세션 없음 */
             		System.out.print( e.toString() );
             		System.out.flush();
             		return;
             	} finally{
        			try {
						ParsingUtil.getjsonObj(response, jsonObject);
					} catch (IOException e) {
						e.printStackTrace();
					}	
        		}
            }
            
            
            /**
             * 비밀번호변경
             * @return String String
             */
            @RequestMapping(value="/front/saveLog",method=RequestMethod.POST )
            public void saveLog(HttpServletRequest request, HttpServletResponse response, Log logParam) {
            	try {
            		String inDate   = new SimpleDateFormat("yyyyMMdd").format(new Date());
                    String inTime   = new SimpleDateFormat("HHmmss").format(new Date());
            		logParam.setLogYmd(inDate);
                    logParam.setLogHms(inTime);
                    logParam.setLogIp(request.getRemoteAddr());
                    
            		if(request.getSession().getAttribute("userInfo") != null) {
            			Member userInfo = (Member)request.getSession().getAttribute("userInfo");
            			//비회원 실명인증
            			if(GenericValidator.isBlankOrNull(userInfo.getUserId())) {
            				logParam.setLogId("비회원_"+userInfo.getUserNm());
            			//회원로그인
            			} else {
            				logParam.setLogId(userInfo.getUserId());
            			}
            		} else {
            			logParam.setLogId("비회원");
            		}
            		frontLoginService.saveLog(logParam);
        		} catch (SQLException e) {
        			e.printStackTrace();
        		} 
            }
            
            
            
            private void listSetSlct(Common commonParam, String codeGbnCd,String codeId, Model model, String setAttrNm) throws Exception{
            	// select box 리스트
        		commonParam = new Common();
        		commonParam.setCodeGbnCd(codeGbnCd);
        		commonParam.setCodeId(codeId);
        		model.addAttribute(setAttrNm,aminMgrMngService.listFacil(commonParam));
            }
            
            @RequestMapping(value="/front/findAjaxIdPw" , method=RequestMethod.POST)
      		public void findAjaxIdPw(HttpServletRequest request, HttpServletResponse response, String userId,String userNm,String email) throws Exception {
      			JSONObject jsonObj = new JSONObject();
      			try {
       				Member mem = new Member();
       				if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
        	        	System.out.println(" window ---------------> " );
        	        	mem.setUserNm(userNm);
        	        	mem.setEmail(email);
        	        	mem.setUserId(userId);
        	        } else {
        	        	System.out.println(" linux ---------------> " );
        	        	XecureServlet xservlet=null;
        	        	xservlet = new XecureServlet( request, response );
        	        	String xUserId = xservlet.request.getParameter("userId");
        	        	String xUserNm = xservlet.request.getParameter("userNm");
        	        	String xEmail = xservlet.request.getParameter("email");
        	        	mem.setUserNm(xUserNm);
        	        	mem.setEmail(xEmail);
        	        	mem.setUserId(xUserId);
        	        }
    				 
       				ArrayList<Member> mList =  frontLoginService.findOldMember(mem);
    				if(mList != null && mList.size() > 0){
    					if(mList.size()==1){
    						jsonObj.put("flag", "C");//data한건
    						jsonObj.put("userId", mList.get(0).getUserId());//data한건
    					}else{
    						jsonObj.put("flag", "D");//data여러건	
    					}
    				}else{
    					jsonObj.put("flag", "E");//data없음	
    				}
    				
      				ParsingUtil.getjsonObj(response, jsonObj);
      				
      			} catch (Exception e) {
      				e.getStackTrace();
      			}
      		}
            
          
}

