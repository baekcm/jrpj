package com.jnet.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import Kisinfo.Check.IPINClient;

public class IPINUtil {

	public static Map<String , Object> setIpin(HttpServletRequest request, String url){
		/********************************************************************************************************************************************
			NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
			
			서비스명 : 가상주민번호서비스 (IPIN) 서비스
			페이지명 : 가상주민번호서비스 (IPIN) 호출 페이지
		*********************************************************************************************************************************************/
	String sSiteCode				= CommonUtil.getProperties("ipin.site.code");			// IPIN 서비스 사이트 코드		(NICE신용평가정보에서 발급한 사이트코드)
	String sSitePw					= CommonUtil.getProperties("ipin.site.password");			// IPIN 서비스 사이트 패스워드	(NICE신용평가정보에서 발급한 사이트패스워드)
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

	String sReturnURL = CommonUtil.getProperties("ipin.return.url") + url;
	
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
	IPINClient pClient = new IPINClient();
	// 앞서 설명드린 바와같이, CP 요청번호는 배포된 모듈을 통해 아래와 같이 생성할 수 있습니다.
	sCPRequest = pClient.getRequestNO(sSiteCode);
	// CP 요청번호를 세션에 저장합니다.
	// 현재 예제로 저장한 세션은 ipin_result.jsp 페이지에서 데이타 위변조 방지를 위해 확인하기 위함입니다.
	// 필수사항은 아니며, 보안을 위한 권고사항입니다.
	request.getSession().setAttribute("CPREQUEST" , sCPRequest);
	// Method 결과값(iRtn)에 따라, 프로세스 진행여부를 파악합니다.
	int iRtn = pClient.fnRequest(sSiteCode, sSitePw, sCPRequest, sReturnURL);
	String sRtnMsg					= "";			// 처리결과 메세지
	String sEncData					= "";			// 암호화 된 데이타
	
	Map<String , Object> resultMap = new HashMap<String, Object>();
	
	// Method 결과값에 따른 처리사항
	if (iRtn == 0) {
		// fnRequest 함수 처리시 업체정보를 암호화한 데이터를 추출합니다.
		// 추출된 암호화된 데이타는 당사 팝업 요청시, 함께 보내주셔야 합니다.
		sEncData = pClient.getCipherData();		//암호화 된 데이타
		sRtnMsg = "정상 처리되었습니다.";
		resultMap.put("encData", sEncData);
		resultMap.put("resultMsg", sRtnMsg);
		resultMap.put("resultCode", iRtn);
	} else if (iRtn == -1 || iRtn == -2) {
		sRtnMsg =	"배포해 드린 서비스 모듈 중, 귀사 서버환경에 맞는 모듈을 이용해 주시기 바랍니다.<BR>" +
					"귀사 서버환경에 맞는 모듈이 없다면 ..<BR><B>iRtn 값, 서버 환경정보를 정확히 확인하여 메일로 요청해 주시기 바랍니다.</B>";
		resultMap.put("encData", null);
		resultMap.put("resultMsg", sRtnMsg);
		resultMap.put("resultCode", iRtn);
	} else if (iRtn == -9) {
		sRtnMsg = "입력값 오류 : fnRequest 함수 처리시, 필요한 4개의 파라미터값의 정보를 정확하게 입력해 주시기 바랍니다.";
		resultMap.put("encData", null);
		resultMap.put("resultMsg", sRtnMsg);
		resultMap.put("resultCode", iRtn);
	} else {
		sRtnMsg = "iRtn 값 확인 후, NICE신용평가정보 개발 담당자에게 문의해 주세요.";
		resultMap.put("encData", null);
		resultMap.put("resultMsg", sRtnMsg);
		resultMap.put("resultCode", iRtn);
	}
	return resultMap;
	}
}
