package XecureWeb.ibs;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class transfer_tr extends XecureHttpServlet 
{ 
    	public void doPost ( HttpServletRequest request, HttpServletResponse response) 
       		 throws ServletException, IOException
        {
            	PrintWriter out;

		// set content type and other response header fields first
            	response.setContentType("text/html; charset=euc-kr");

            	// then write the data of the response
            	out = response.getWriter();
			
		out.println("<OBJECT ID='XecureWeb' CLASSID='CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404' >");
                out.println("<COMMENT>");
                out.println("<EMBED type='application/x-SoftForum-XecSSL40' hidden=true name='XecureWeb'>");
                out.println("<NOEMBED>");
                out.println("</COMMENT>");
                out.println("No XecureWeb 4.0 PlugIn");
                out.println("</NOEMBED>");
                out.println("</EMBED>");
                out.println("</OBJECT>");

		out.println("<form name='xecure' ><input type=hidden name='p'></form>");
		out.println("<script language='javascript' src='/XecureObject/xecureweb.js'></script>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Untitled Document</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>");
		out.println("  <p><font size='6'><font color='#6699CC'><b>인터넷뱅킹 계좌이체 결과</b></font></font></p>");
		out.println("  <p>&nbsp;</p>");

		xecure.crypto.SignVerifier verifier;
		verifier = new xecure.crypto.SignVerifier ( ((XecureHttpServletRequest)request).getXecureSession().getXecureConfig(), request.getParameter("signed_msg") );

		if ( verifier.getLastError() == 0 ) {

			out.println("<p><font color='#000000' size='5'>'" + new String(((XecureHttpServletRequest)request).getXecureUserCert().getSubject("cn")) + "'님의 거래에 대한 서명이 확인 되어 이체가 수행되었습니다.</font></p><br><br>");
		}
		else {

			out.println("<center>");
			out.println("		<p><font color='#000000' size='5'>'" + new String(((XecureHttpServletRequest)request).getXecureUserCert().getSubject("cn")) + "'님의 거래에 대한 서명문을 확인하는 과정에서 다음과 같은 오류로 이체가 취소되었습니다. </font><font color='#000000' size='5'></font></p><br><br>");
			out.println("		<p><font color='#000000' size='3'>Error Code : " + verifier.getLastError() + "</font></p><br><br>");
			out.println("		<p><font color='#000000' size='3'>Error Msg : " + verifier.getLastErrorMsg() + "</font></p><br><br>");
		}

		out.println("<p><font color='#000000' size='5'>다음은 '" + new String(((XecureHttpServletRequest)request).getXecureUserCert().getSubject("cn")) + "' 님께서 저희은행과 거래한 것을 증명하는 서명문서입니다. </font></p>  ");
		out.println("</center>");
		out.println("<pre>");

		String sm = request.getParameter("signed_msg");
		int i;
		for ( i = 0; i < sm.length(); i+=80 ) {
			out.print( "\t\t");
			if ( i + 80 < sm.length() ) 
				out.println ( sm.substring( i, i+80 ) );
			else
				out.println ( sm.substring( i, sm.length() ));
		} 
		out.println("</pre>");

		out.println("<p>서명원문</p>");
		out.println("<pre>");
		out.println(verifier.getVerifiedMsg_Text());
		out.println("</pre>");
		out.println("	<p>서명자 인증서</p>");
		out.println("<br>");
		out.println("<pre>");

		if ( verifier.getSignerCertificate() != null )
			out.println( verifier.getSignerCertificate().getCertPem());

		out.println("</pre>");
		out.println("<center>");
		out.println("  <p>&nbsp;</p>");
		out.println("  <p><a href='XecureWeb.ibs.login' onClick='return XecureLink(this);'><img src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></a></p>");
		out.println("  </center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
