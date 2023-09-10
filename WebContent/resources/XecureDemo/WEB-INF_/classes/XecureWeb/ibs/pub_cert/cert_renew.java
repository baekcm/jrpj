package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class cert_renew extends XecureHttpServlet
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
		out.println("function cert_renew(form)");
		out.println("{");
		out.println("	nRet = RenewCertificate ( );");
		out.println("	if ( nRet == 0 ) ");
		out.println("		confirm('사용자님의 인증서가 금융결제원 인증기관에서 갱신 되었습니다.'); ");
		out.println("	else");
		out.println("		confirm('사용자님의 인증서가 갱신 오류'); ");
		out.println("	return false;");
		out.println("}");
		out.println("</script>");

		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("  <p><font size='6'><font color='#6699CC'><b>인증서 갱신</b></font></font></p>");

		out.println("<form name='form1' onSubmit='cert_renew(this); return false;'>	");
		out.println("확인을 누르면 인증서를 갱신합니다.");
		out.println("<br><br>");
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
