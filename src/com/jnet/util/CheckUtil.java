package com.jnet.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public class CheckUtil {

	@SuppressWarnings("unused")
	public static Map<String , Object> setCheck(HttpServletRequest request, String url,String parm1,String parm2){
		/********************************************************************************************************************************************
			NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
			
			서비스명 : 가상주민번호서비스 (IPIN) 서비스
			페이지명 : 가상주민번호서비스 (IPIN) 호출 페이지
		*********************************************************************************************************************************************/
		String sSiteCode				=  CommonUtil.getProperties("check.site.code");		// IPIN 서비스 사이트 코드		(NICE신용평가정보에서 발급한 사이트코드)
		String sSitePw					= CommonUtil.getProperties("check.site.password");			// IPIN 서비스 사이트 패스워드	(NICE신용평가정보에서 발급한 사이트패스워드)
		/*
		┌ sReturnURL 변수에 대한 설명  ─────────────────────────────────────────────────────
			NICE신용평가정보 팝업에서 인증받은 사용자 정보를 암호화하여 귀사로 리턴합니다.
			따라서 암호화된 결과 데이타를 리턴받으실 URL 정의해 주세요.
			
			* URL 은 http 부터 입력해 주셔야하며, 외부에서도 접속이 유효한 정보여야 합니다.
			* 당사에서 배포해드린 샘플페이지 중, ipin_process.jsp 페이지가 사용자 정보를 리턴받는 예제 페이지입니다.
			
			아래는 URL 예제이며, 귀사의 서비스 도메인과 서버에 업로드 된 샘플페이지 위치에 따라 경로를 설정하시기 바랍니다.
			예 - http://www.test.co.kr/ipin_process.jsp, https://www.test.co.kr/ipin_process.jsp, https://test.co.kr/ipin_process.jsp
		└────────────────────────────────────────────────────────────────────
		*/
		String sReturnURL		= CommonUtil.getProperties("check.return.url")+url;
	    String sSitePassword	= "";				// NICE신용평가정보부터 부여받은 사이트 패스워드
	    String sIPINSiteCode	= CommonUtil.getProperties("ipin.site.code");				// NICE신용평가정보로부터 부여받은 아이핀사이트 코드
		String sIPINPassword	= CommonUtil.getProperties("ipin.site.password");				// NICE신용평가정보로부터 부여받은 아이핀사이트 패스워드
	                                                    	
	   //String sRequestNO		= "";												// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 필요시 사용
	    String sClientImg		= "";												//서비스 화면 로고 선택: default 는 null 입니다.(full 경로 입력해 주세요.)
	    
	    String sReserved1		= parm1==null?"":parm1;
		String sReserved2		= parm2==null?"":parm2;
		String sReserved3		= "";
	    
		//real mode
	//	String sReturnURL				= "http://www.maeulcenter.or.kr/ml/"+url;
	    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
	    
		/*
		┌ sCPRequest 변수에 대한 설명  ─────────────────────────────────────────────────────
			[CP 요청번호]로 귀사에서 데이타를 임의로 정의하거나, 당사에서 배포된 모듈로 데이타를 생성할 수 있습니다.
			
			CP 요청번호는 인증 완료 후, 암호화된 결과 데이타에 함께 제공되며
			데이타 위변조 방지 및 특정 사용자가 요청한 것임을 확인하기 위한 목적으로 이용하실 수 있습니다.
			
			따라서 귀사의 프로세스에 응용하여 이용할 수 있는 데이타이기에, 필수값은 아닙니다.
		└────────────────────────────────────────────────────────────────────
		*/
		String sCPRequest				= "";
		// 객체 생성
		// 앞서 설명드린 바와같이, CP 요청번호는 배포된 모듈을 통해 아래와 같이 생성할 수 있습니다.
		
		sCPRequest = niceCheck.getRequestNO(sSiteCode);	//요청고유번호 / 비정상적인 접속 차단을 위해 필요
		// CP 요청번호를 세션에 저장합니다.
		// 현재 예제로 저장한 세션은 ipin_result.jsp 페이지에서 데이타 위변조 방지를 위해 확인하기 위함입니다.
		// 필수사항은 아니며, 보안을 위한 권고사항입니다.
		request.getSession().setAttribute("REQ_SEQ" , sCPRequest);
		// Method 결과값(iRtn)에 따라, 프로세스 진행여부를 파악합니다.
	    // 입력될 plain 데이타를 만든다.
	    String sPlainData = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
	                        "7:REQ_SEQ" + sCPRequest.getBytes().length + ":" + sCPRequest +
	                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg +
	                        "9:RESERVED1" + sReserved1.getBytes().length + ":" + sReserved1 +
	                        "9:RESERVED2" + sReserved2.getBytes().length + ":" + sReserved2 +
	                        "9:RESERVED3" + sReserved3.getBytes().length + ":" + sReserved3 +
	                        "13:IPIN_SITECODE" + sIPINSiteCode.getBytes().length + ":" + sIPINSiteCode +
	                        "17:IPIN_SITEPASSWORD" + sIPINPassword.getBytes().length + ":" + sIPINPassword ;
	    
	    String sEncData = "";
	    Map<String , Object> resultMap = new HashMap<String, Object>();
	    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePw, sPlainData);
		String sRtnMsg					= "";			// 처리결과 메세지
	    if( iReturn == 0 )
	    {
	        sEncData = niceCheck.getCipherData();
	        sRtnMsg = "정상 처리되었습니다.";
			resultMap.put("encData", sEncData);
			resultMap.put("resultMsg", sRtnMsg);
			resultMap.put("resultCode", iReturn);
	    }
	    else if( iReturn == -1)
	    {
	    	sRtnMsg = "암호화 시스템 에러입니다.";
			resultMap.put("encData", null);
			resultMap.put("resultMsg", sRtnMsg);
			resultMap.put("resultCode", iReturn);
	    }    
	    else if( iReturn == -2)
	    {
	    	sRtnMsg = "암호화 처리오류입니다.";
			resultMap.put("encData", null);
			resultMap.put("resultMsg", sRtnMsg);
			resultMap.put("resultCode", iReturn);
	    }    
	    else if( iReturn == -3)
	    {
	    	sRtnMsg = "암호화 데이터 오류입니다.";
			resultMap.put("encData", null);
			resultMap.put("resultMsg", sRtnMsg);
			resultMap.put("resultCode", iReturn);
	    }    
	    else if( iReturn == -9)
	    {
	    	sRtnMsg = "입력 데이터 오류입니다.";
			resultMap.put("encData", null);
			resultMap.put("resultMsg", sRtnMsg);
			resultMap.put("resultCode", iReturn);
	    }    
	    else
	    {
	    	sRtnMsg = "알수 없는 에러 입니다. iReturn : " + iReturn;
			resultMap.put("encData", null);
			resultMap.put("resultMsg", sRtnMsg);
			resultMap.put("resultCode", iReturn);
	    }
	    System.out.println ("sMessage [ : " + sRtnMsg + " ]");
	    System.out.println ("iReturn [ : " + iReturn + " ]");
	    return resultMap;
	}
}
