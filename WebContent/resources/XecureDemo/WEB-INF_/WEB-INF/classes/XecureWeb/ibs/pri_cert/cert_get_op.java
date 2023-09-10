package XecureWeb.ibs.pri_cert;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class cert_get_op extends XecureHttpServlet 
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

		String user_id = request.getParameter("user_id");
		Certificate user_cert;

		PrivateRA sfra = new PrivateRA ( ((XecureHttpServletRequest)request).getXecureSession().getXecureConfig() );

		user_cert = sfra.getCertificate ( user_id ); 

		out.println("<html>");
		out.println("<head>");
		out.println("<title>인증서 조회 결과</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>");

		if ( user_cert != null ) {
		 
			out.println("  <p><font size='6'><font color='#6699CC'><b>사용자 인증서 조회 결과</b></font></font></p>");
			out.println("  <p>&nbsp;</p>");
			out.println("    <p>사용자 ID : " + user_id + "</p>");
			out.println("    <p>" + request.getParameter("user_name") + "'님의 사용자 인증서가 소프트포럼 인증기관으로 부터 조회 되었습니다. </p><br>");
			out.println("    <p>" + user_cert.getSubject() + "</p><br>");
			out.println("    <p>" + user_cert.getIssuer() + "</p><br>");
		}
		else {
			out.println("<p>		사용자 인증서 조회 실패했습니다.</p>");
			out.println("에러 코드 : " + sfra.getLastError() + "<br>");
			out.println("에러 메시지 : " + sfra.getLastErrorMsg() + "<br>");
			out.println( user_id + "<br>");
		}
		 
		out.println(" <p>&nbsp;</p>");
		out.println("    <p><a href='XecureWeb.ibs.pri_cert.cert_main' onClick='return XecureLink(this);' ><font color='#000000' size='5'>인증서 관리</font></a> </p>");
		out.println("  </center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
