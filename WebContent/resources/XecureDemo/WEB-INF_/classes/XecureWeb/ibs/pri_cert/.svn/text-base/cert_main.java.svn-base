package XecureWeb.ibs.pri_cert;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class cert_main extends XecureHttpServlet 
{ 
    	public void doGet ( HttpServletRequest request, HttpServletResponse response) 
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
		out.println("<title>인증서 관리</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("  <p><font size='6'><b><font color='#6699CC'>SoftForum 인증기관  인증서 관리</font></b></font></p>");
		out.println("  <p>&nbsp;</p>");
		out.println("  <p><a href='XecureWeb.ibs.pri_cert.cacert_install' onClick='return XecureLink(this);'>인증기관 인증서 설치</a></p>");
		out.println("  <p><a href='XecureWeb.ibs.pri_cert.cert_request' onClick='return XecureLink(this);'><img src='/XecureDemo/image/button_new.jpg' width='180' height='47' border='0'></a></p>");
		out.println("  <p><a href='XecureWeb.ibs.pri_cert.cert_renew' onClick='return XecureLink(this);'>인증서 갱신</a></p>");
		out.println("  <p><a href='XecureWeb.ibs.pri_cert.cert_replace' onClick='return XecureLink(this);'>인증서 교체</a></p>");
		out.println("  <p><a href='XecureWeb.ibs.pri_cert.cert_update' onClick='return XecureLink(this);'>인증서 변경</a></p>");
		out.println("  <p><a href='XecureWeb.ibs.pri_cert.cert_get' onClick='return XecureLink(this);'>인증서 조회</a></p>");
		out.println("  <p><a href='XecureWeb.ibs.pri_cert.cert_revoke' onClick='return XecureLink(this);'><img src='/XecureDemo/image/button_del.jpg' width='180' height='47' border='0'></a></p>");
		out.println("  <p>&nbsp; </p>");
		out.println("  <p>&nbsp;</p>");

		out.println("</center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
