package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class cert_man_op extends XecureHttpServlet
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
		out.println("<title>Untitled Document</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("<p><font size='6'><font color='#6699CC'><b>사용자 인증서 상태 변경</b></font></font></p>");

		String service = request.getParameter("service");
		String serial = request.getParameter("serial");
		String policy_type = request.getParameter("policy_type");
		String status;
		int	ra_result;

		PublicRA sfra = new PublicRA ( getXecureConfig() );

		if ( service.equals("30") ) status = "폐지";
		else if ( service.equals("40")) status = "효력정지";
		else if ( service.equals("41")) status = "효력회복";
		else status = "알수없음";

		ra_result = sfra.modifyCertStatus ( "internet", policy_type, serial, service );

		if ( ra_result != 0 ) {
			out.println("		<p><font color='#000000' size='5'>상태 변경 오류</font></p>");
			out.println("		error code : " + sfra.getLastError() + " <br>");
			out.println("		error msg : " + sfra.getLastErrorMsg() + " <br>");
		}
		else {
			out.println("		<p><font color='#000000' size='5'>상태 변경 성공</font></p>");
			out.println("		인증서 일련번호 ' " + serial + "' 인 인증서의 상태가 '" + status + "' 되었습니다.<br> ");
		}
	 
		out.println("</center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
