package XecureWeb.ibs.pub_cert;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class nl_reg_cert_op extends XecureHttpServlet 
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

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("  <p><font size='6'><font color='#6699CC'><b>인터넷뱅킹 타행등록</b></font></font></p>");

		String user_id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");
		String serial = request.getParameter("serial");
		XecureSession xsession = ((XecureHttpServletRequest)request).getXecureSession();
/*		String id = xsession.getUserId();*/

		int	ra_result;
		
		PublicRA sfra = new PublicRA ( xsession.getXecureConfig() );

		ra_result = sfra.registerNlNewUser ( user_id, serial, null, null, null);

		out.println("<html>");
		out.println("<head>");
		out.println("<title>Untitled Document</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>");

		if ( ra_result == 0 ) {
		 
			out.println("<p><font size='6'><font color='#6699CC'><b>사용자 등록 확인</b></font></font></p>");
			out.println("  <p>&nbsp;</p>");
			out.println("<table>");
			out.println("<tr><td>사용자ID</td><td>" + user_id + "</td></tr>");
			out.println("<tr><td>CODE</td><td>" + sfra.getResponseFromRegUser("CODE") + "</td></tr>");
			out.println("<tr><td>MESSAGE</td><td>" + sfra.getResponseFromRegUser("MESSAGE") + "</td></tr>");
			out.println("</table>");
			out.println("<br>");
			out.println( user_id + "'님의 사용자 정보가 본 은행에 등록 되었습니다. <br>");
		}
		else {

			out.println("<p>		사용자 등록에 실패했습니다.</p>");
			out.println("에러 코드 : " + sfra.getLastError() + "<br>");
			out.println("에러 메시지 : " + sfra.getLastErrorMsg() + "<br>");
		}
		 
		out.println(" <p>&nbsp;</p>");
		out.println("    <p><a href='XecureWeb.ibs.pub_cert.cert_main' onClick='return XecureLink(this);' ><font color='#000000' size='5'>인증서 관리</font></a> </p>");
		out.println("  </center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
