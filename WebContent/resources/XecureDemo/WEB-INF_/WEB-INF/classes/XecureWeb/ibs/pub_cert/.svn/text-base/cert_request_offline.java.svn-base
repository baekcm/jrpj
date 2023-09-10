package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class cert_request_offline extends HttpServlet
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
		out.println("<script language='javascript'>");
		out.println("function cert_request( form )");
		out.println("{");
		out.println("	nRet = RequestCertificate( form.ref_code.value, form.auth_code.value );");
		out.println("	if ( nRet == 0 )");
		out.println("		confirm('금융 결제원 공인인증기관으로 부터 인증서를 발급 받았습니다.');");
		out.println("}");
		out.println("</script>");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>");
		out.println("  <p><font size='6'><font color='#6699CC'><b>사용자 인증서 발급</b></font></font></p>");
		out.println("  <p>&nbsp;</p>");
		out.println("<br>참조 코드와 인가 코드를 입력한후  '확인' 버튼을 누르시면 금융결제원 공인인증기관으로 부터 인증서를 발급받을 수 있습니다.</p>");
		out.println("    <p><font color='#000000' size='5'> </font> </p>");
		out.println("<form name='auth' onSubmit='cert_request(this); return false;'>");
		out.println("참조 코드:<input type=text name='ref_code' size=15 ><br>");
		out.println("인가 코드:<input type=text name='auth_code' size=40 ><br>");
		out.println("<input type=image src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'>");
		out.println("</form>");
		out.println(" <p>&nbsp;</p>");
		out.println("    <p><a href='XecureWeb.ibs.pub_cert.cert_main' ><font color='#000000' size='5'>인증서 관리</font></a> </p>");
		out.println("  </center>");
		out.println("</body>");
		out.println("</html>");
	}
}
