<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>
<%
	XecureServlet xservlet=null;
	XecureConfig xecConfig = null;
	
	try {
		xservlet = new XecureServlet ( request, response );
		xecConfig = new XecureConfig ();
	}
	catch ( XecureServletConfigException e ) {
		/* 설정 오류 */
		out.print( e.toString() );
		out.flush();
		return;
	} catch ( XecureServletException e ) {
		/* 암호 세션 없음 */
		out.print( e.toString() );
		out.flush();
		return;
	}
	
	SignVerifier verifier = new SignVerifier (xecConfig, xservlet.request.getParameter("signed_msg") );
	
	String sm = xservlet.request.getParameter("signed_msg");
	StringBuffer sign_msg = new StringBuffer();
	
	for (int i = 0; i < sm.length(); i+=80 ) {
		if ( i + 80 < sm.length()){
			sign_msg.append(sm.substring( i, i+80 ));
			sign_msg.append("\n");
		}
		else
			sign_msg.append(sm.substring( i, sm.length()));
	}
	
	int	 nVerifierResult = verifier.getLastError();
	String sign_result="";
	if ( nVerifierResult != 0 ) {
		sign_result = "서명문에 문제가 있습니다.\n오류 번호 : " + verifier.getLastError();	
	}
	else {
		sign_result = "서명 확인 성공";
	}

	StringBuffer xmlResult = new StringBuffer("<?xml version='1.0' encoding='euc-kr'?>");
	xmlResult.append("<results>");
	xmlResult.append("<result><title>");
	xmlResult.append("서명 검증 결과");
	xmlResult.append("</title><content>");
	xmlResult.append(xservlet.csEncrypt(sign_result));
	xmlResult.append("</content></result><result><title>");
	xmlResult.append("요청된 서명 메시지 원문");
	xmlResult.append("</title><content>");
	xmlResult.append(xservlet.csEncrypt(xservlet.request.getParameter("plain")));
	xmlResult.append("</content></result><result><title>");
	xmlResult.append("요청된 서명문");
	xmlResult.append("</title><content>");
	xmlResult.append(xservlet.csEncrypt(sm));
	xmlResult.append("</content></result><result><title>");
	xmlResult.append("검증된 서명 메시지 원문");
	xmlResult.append("</title><content>");
	xmlResult.append(xservlet.csEncrypt(verifier.getVerifiedMsg_Text()));
	xmlResult.append("</content></result><result><title>");
	xmlResult.append("서명자 인증서 DN");
	xmlResult.append("</title><content>");
	xmlResult.append(xservlet.csEncrypt(verifier.getSignerCertificate().getSubject()));
	xmlResult.append("</content></result>");
	xmlResult.append("</results>");

	response.setContentType("text/xml");
	response.getWriter().write(xmlResult.toString());
%>