package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class cert_revoke extends XecureHttpServlet
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

		out.println("<script language='javascript'>");
		out.println("function cert_revoke(form)");
		out.println("{");
		out.println("	nRet = -1;");
		out.println("   var jobcode, reason;");
		out.println("   if ( form.jobcode[0].checked ) jobcode = 256; else jobcode = 17; ");
		out.println("	if ( form.reason[0].checked ) reason=1; else reason=2; ");
		out.println("	nRet = RevokeCertificate ( jobcode, reason );");
		out.println("   if ( jobcode == 17 ) {");
		out.println("	    if ( nRet == 0 ) ");
		out.println("		confirm('사용자 인증서가 폐기 되었습니다.'); ");
		out.println("	    else");
		out.println("		confirm('사용자님의 인증서 폐기 오류'); ");
		out.println("   }");
		out.println("   else if ( jobcode == 256 ) {");
		out.println("	    if ( nRet == 0 ) ");
		out.println("		confirm('사용자 인증서가 효력정지 되었습니다. 다시 사용하기 위해서는 인증서를 신청한 은행의 공인인증서 관리기능을 이용하십시요.'); ");
		out.println("	    else");
		out.println("		confirm('사용자님의 인증서 효력정지 오류'); ");
		out.println("   }");
		out.println("	return false;");
		out.println("}");
		out.println("</script>");

		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("  <p><font size='6'><font color='#6699CC'><b>인증서 폐기 / 효력정지</b></font></font></p>");

		out.println("<form name='form1' onSubmit='cert_revoke(this); return false;'>");
		out.println("<table border=1>");
		out.println("<tr><td colspan=2><b>인증서 효력정지</b><input type=radio name='jobcode' checked value=4 ></td></tr>");
		out.println("<tr><td colspan=2><b>인증서 폐기</b><input type=radio name='jobcode' value=3 ></td></tr>");
		out.println("<tr><td>사유</td>");
		out.println("<td><input type=radio name='reason' checked value=1> 사용자 키의 손상및 분실<br>");
		out.println("<input type=radio name='reason' value=3> 사용자 키의 파기 <br>");
		out.println("<input type=radio name='reason' value=5> 업무 중단으로 인한 효력 정지<br>");
		out.println("<input type=radio name='reason' value=6> 인증서 기능 정지를 위한 효력 정지</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<br> ");
		out.println("   <input type=image src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'>");
		out.println("</form>");
		out.println("  <p>&nbsp;</p>");
		out.println("    <p><a href='XecureWeb.ibs.pub_cert.cert_main' onClick='return XecureLink(this);' ><font color='#000000' size='5'>인증서 관리</font></a> </p>");
		out.println("  </center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
