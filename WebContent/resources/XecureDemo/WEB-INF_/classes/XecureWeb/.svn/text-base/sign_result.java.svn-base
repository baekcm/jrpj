package XecureWeb;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import xecure.servlet.*;
import xecure.crypto.*;

public class sign_result extends XecureHttpServlet
{
    	public void doPost ( HttpServletRequest request, HttpServletResponse response) 
	 throws ServletException, IOException
	{
		doGet( request, response ) ;
	}
	 
    	public void doGet ( HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException
        {
            	PrintWriter out;

		// set content type and other response header fields first
            	response.setContentType("text/html; charset=euc-kr");

            	// then write the data of the response
            	out = response.getWriter();

		out.println( sXecureClientObject );

		SignVerifier	verifier = new SignVerifier ( this.getXecureConfig(), request.getParameter("signed_msg") );

		out.println("<html>");
		out.println("<head><title>서명 검증 결과</title>");
		out.println("</head>");
		out.println("<body>");

		out.println("<p align='center'><big><strong>웹브라우져로부터 입력받은 결과입니다.</strong></big></p>");
		out.println("<p>　</p>");

		out.println("<!---BEGIN_ENC--->");
		out.println("<table border='1' width='100%'>");
		out.println("<tr>");
		out.println("<td width='17%'><strong>Decrypted Request 'plain' :</strong></td>");
		out.println("<td width='83%'><strong>");
		out.println("<pre>");
		out.println(request.getParameter("plain"));
		out.println("</pre>");
		out.println("</strong></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td width='17%'><strong>Decrypted Request 'signed_msg' :</strong></td>");
		out.println("<td width='83%'><strong>");
		out.println("<pre>");

		String sm = request.getParameter("signed_msg"); 
		int i;
		for ( i = 0; i < sm.length(); i+=80 ) {
			if ( i + 80 < sm.length() ) 
				out.println ( sm.substring( i, i+80 ) );
			else
				out.println ( sm.substring( i, sm.length() ));
		}
		out.println("</pre>");
		out.println("</strong></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td width='17%'><strong>서명 검증 결과</strong></td>");
		out.println("<td width='83%'><strong>");

		if ( verifier.getLastError() != 0 ) {
			out.println("서명문에 문제가 있습니다.<br>");
			out.println("오류 번호 : " + verifier.getLastError() + "<br>");
		}
		else {
			out.println("서명 확인 성공<br>");
		}
		out.println("</strong></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td width='17%'><strong>서명 메시지 원본</strong></td>");
		out.println("<td width='83%'><strong>");
		out.println("<pre>");
		out.println(verifier.getVerifiedMsg_Text());
		out.println("</pre>");
		out.println("</strong></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td width='17%'><strong>서명자 인증서</strong></td>");
		out.println("<td width='83%'><strong>");
		out.println("<pre>");
		out.println(verifier.getSignerCertificate().getCertPem());
		out.println("</pre>");
		out.println("</strong></td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<!---END_ENC--->");

		out.println("<p>");
		out.println("<p align='center'><a href='javascript:history.back();'>초기 화면</a></p>");
		
		out.println("</body></html>");
	}
}
