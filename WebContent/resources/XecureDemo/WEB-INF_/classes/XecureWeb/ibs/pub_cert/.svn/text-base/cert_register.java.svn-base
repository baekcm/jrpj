package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class cert_register extends XecureHttpServlet
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
		out.println("<p><font size='6'><font color='#6699CC'><b>사용자 등록</b></font></font></p>");
		out.println("<p><font color='#000000' size='5'>!!!!!!!!!!!!!!!!!!!!!!!  주의 !!!!!!!!!!!!!!!!!!!!!!!.</font></p>");
		out.println("<p><font color='#000000' size='5'>이 페이지는 금융결제원 인증기관에 사용자를 등록하는 작업을 수행합니다. 반드시, 운영시스템에서는 이 페이지를 웹상에서 제거하고, 절대 운영시스템에서 수행하지 마십시요.</font></p>");
		out.println("<p><font color='#000000' size='5'>사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>");
		out.println("<form name='form1' method=post action='XecureWeb.ibs.pub_cert.cert_request' onSubmit='return XecureSubmit(this);'>");
		out.println("<table>");
		out.println("<tr><td>계좌번호</td><td><input type=text name='account' size='20'></td></tr>");
		out.println("<tr><td>계좌비밀번호</td><td><input type=text name='ac_pwd' size='20'></td></tr>");
		out.println("<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name='pcard' size='20'></td></tr>");

		out.println("<tr><td>개인/법인/단체 구분</td><td>");
		out.println("        <input type=radio name='user_type' value='1' checked>개인");
		out.println("        <input type=radio name='user_type' value='2'>법인");
		out.println("        <input type=radio name='user_type' value='3'>단체");
		out.println("</td></tr>");
		out.println("<tr><td>법인/단체명 ( 법인/단체일 경우 필수, 영문 필수 )</td><td><input type=text name='company_name' size='40'></td></tr>");
		out.println("<tr><td>개인명 / 법인단체 세부명 ( 필수 )</td><td><input type=text name='user_name' size='40'></td></tr>");
		out.println("<tr><td>영문 개인명 / 영문 법인단체 세부명 ( 옵션 ) </td><td><input type=text name='euser_name' size='40'></td></tr>");
		out.println("<tr><td>개인 (법인단체) ID ( 필수 )</td><td><input type=text name='user_id' size='20'></td></tr>");
		out.println("<tr><td>주민등록번호 ( 사업자 등록번호 ) ( 필수 ) </td><td><input type=text name='ssn' size='20'></td></tr>");
		out.println("<tr><td>전자우편 ( 옵션 )</td><td><input type=text name='email' size='20'></td></tr>");
		out.println("<tr><td>핸드폰 ( 옵션 )</td><td><input type=text name='cell_phone' size='20'></td></tr>");
		out.println("<tr><td>Fax ( 옵션 )</td><td><input type=text name='fax' size='20'></td></tr>");
		out.println("<tr><td>자택 우편번호 ( 개인 필수 )</td><td><input type=text name='zipcode' size='20'></td></tr>");
		out.println("<tr><td>자택 주소 ( 개인 필수 )</td><td><input type=text name='address' size='40'></td></tr>");
		out.println("<tr><td>자택 전화 ( 개인 필수 )</td><td><input type=text name='phone' size='20'></td></tr>");
		out.println("<tr><td>회사 우편번호 ( 법인 필수 )</td><td><input type=text name='czipcode' size='20'></td></tr>");
		out.println("<tr><td>회사 주소 ( 법인 필수 )</td><td><input type=text name='caddress' size='40'></td></tr>");
		out.println("<tr><td>회사 전화 ( 법인 필수 )</td><td><input type=text name='cphone' size='20'></td></tr>");

		out.println("</table>");
		out.println("<p><input type='image' src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>");
		out.println("</form>");
		out.println("</center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
