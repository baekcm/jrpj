package XecureWeb.ibs;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class login extends HttpServlet 
{ 
    	public void doGet ( HttpServletRequest request, HttpServletResponse response) 
       		 throws ServletException, IOException
        {
            	PrintWriter out;

		// set content type and other response header fields first
            	response.setContentType("text/html; charset=euc-kr");

            	// then write the data of the response
            	out = response.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("<script language=javascript src='/XecureObject/xecureweb.js'></script>");
		out.println("</head>");

		out.println("<OBJECT ID='XecureWeb' CLASSID='CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404' >");
                out.println("<COMMENT>");
                out.println("<EMBED type='application/x-SoftForum-XecSSL40' hidden=true name='XecureWeb'>");
                out.println("<NOEMBED>");
                out.println("</COMMENT>");
                out.println("No XecureWeb 4.0 PlugIn");
                out.println("</NOEMBED>");
                out.println("</EMBED>");
                out.println("</OBJECT>");


		out.println("<form name='xecure' >");
		out.println("<input type=hidden name='p'>");
		out.println("</form>");

		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");

		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("  <p>&nbsp;</p>");
		out.println("  <p><a href='XecureWeb.ibs.transfer_input' onClick='return XecureLogIn(this);' ><img src='/XecureDemo/image/button_login.jpg' width='180' height='47' border='0'></a> ");
		out.println("  <p><a href='XecureWeb.ibs.nl_reg_cert' onClick='return XecureLogIn(this);' >타행등록</a> ");
		out.println("  </p>");
		out.println("  <p>&nbsp; </p>");
		out.println("<p><a href='XecureWeb.ibs.pub_cert.cert_main' onClick='return XecureLink(this);'><img src='/XecureDemo/image/button_certi.jpg' width='180' height='47' border='0'></a></p>");
		out.println("<p><a href='XecureWeb.ibs.pri_cert.cert_main' onClick='return XecureLink(this);'>소프트포럼 인증기관 인증서 관리 </a></p>");

		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
	}
}
