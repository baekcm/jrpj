package XecureWeb.ibs;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class nl_reg_cert extends XecureHttpServlet 
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

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("  <p><font size='6'><font color='#6699CC'><b>인터넷뱅킹 타행등록</b></font></font></p>");

		Certificate user_cert = ((XecureHttpServletRequest)request).getXecureUserCert();
		int     cert_location = ((XecureHttpServletRequest)request).getXecureSession().getCertLocation();
		String user_id = ((XecureHttpServletRequest)request).getXecureSession().getUserId();
		String  location_str;

		if ( cert_location == 0 ) location_str = new String("하드디스크 KeyDB");
		else if ( cert_location == 1 ) location_str = new String("플로피디스크");
		else if ( cert_location == 2 ) location_str = new String("IC 카드");
		else location_str = null;

		if ( user_cert.isSFCAcert() ) {
			out.println("사설인증기관 " + user_cert.getIssuer() + " 에서 발급한 인증서로 로그인 하셨습니다.<br><br>" );
			out.println("'<b>" + user_cert.getSubject("cn") + "</b>'님 환영합니다.");
			if ( location_str != null )
				out.println("<br>사용자 인증서는 <b>" + location_str + "</b>에서 가져왔습니다.<br>");
			out.println( "<table border=1>");
			out.println( "<tr><td>인증서 DN</td><td>" + user_cert.getSubject() + "</td></tr>" );
			out.println( "<tr><td>인증서 CN</td><td>" + user_cert.getSubject("cn") + "</td></tr>" );
			out.println( "<tr><td>ID</td><td>" + user_cert.getSubject("id") + "</td></tr>" );
			out.println( "</table>");
		}
		else {
			out.println("공인인증기관 " + user_cert.getIssuer() + " 에서 발급한 인증서로 로그인 하셨습니다.<br><br>" );
			YessignCN ycn = new YessignCN ( user_cert.getSubject("cn") );
			out.println("'<b>" + ycn.getKName() + "</b>'님 환영합니다.<br><br>");
			if ( location_str != null )
				out.println("<br>사용자 인증서는 <b>" + location_str + "</b>에서 가져왔습니다.<br>");

			out.println( "<table border=1>");
			out.println( "<tr><td>인증서 DN</td><td>" + user_cert.getSubject() + "</td></tr>" );
			out.println( "<tr><td>인증서 CN</td><td>" + user_cert.getSubject("cn") + "</td></tr>" );
			out.println( "<tr><td>영문이름</td><td>" + ycn.getEName() + "</td></tr>" );
			out.println( "<tr><td>인증서 등록기관 코드</td><td>" + ycn.getOrgCode() + "</td></tr>" );
			out.println( "<tr><td>ID</td><td>" + ycn.getId() + "</td></tr>" );
			out.println( "<tr><td>XID</td><td>" + user_id + "</td></tr>" );
			out.println( "</table>");
		}

		out.println("  <form name='form1' method='post' action='XecureWeb.ibs.pub_cert.nl_reg_cert_op' onSubmit='return XecureSubmit(this);'>");
		out.println("    <p><font color='#000000' size='5'>본 은행에서 사용할 ID를 입력하십시오. </font></p>");
		out.println("<table>");
		out.println("<tr>");
		out.println("	<td>사용자 ID</td>");
		out.println("	<td><input type='text' name='user_id' size='20' maxlength='20'></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("	<td>비밀번호</td>");
		out.println("	<td><input type='password' name='pwd' size='20' maxlength='20'></td>");
		out.println("</tr>");
		out.println("	<input type='hidden' name='serial' value=" + user_cert.getSerial()+ "></td>");
		out.println("</table>");
		out.println("<p>	<input type='image' src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>");
		out.println("  </form>");
		out.println("  </center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
