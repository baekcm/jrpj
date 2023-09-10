package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class cert_man extends XecureHttpServlet
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
		out.println("<p><font size='6'><font color='#6699CC'><b>사용자 인증서 조회 / 상태 변경</b></font></font></p>");
		out.println("<p><font color='#000000' size='5'>사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>");
		out.println("<form name='form1' method=post action='XecureWeb.ibs.pub_cert.cert_view' onSubmit='return XecureSubmit(this);'>");
		out.println("<table>");
		out.println("<tr><td>계좌번호</td><td><input type=text name='account' size='20'></td></tr>");
		out.println("<tr><td>계좌비밀번호</td><td><input type=text name='ac_pwd' size='20'></td></tr>");
		out.println("<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name='pcard' size='20'></td></tr>");

		out.println("<tr><td>인증서 시리얼</td><td><input type=text name='serial' size='20'></td></tr>");
		out.println("<tr><td>개인 (법인단체) ID </td><td><input type=text name='user_id' size='20'></td></tr>");
		out.println("<tr><td colspan=2>또는</td></tr>");
		out.println("<tr><td>주민등록번호 ( 사업자 등록번호 ) </td><td><input type=text name='ssn' size='20'></td></tr>");

		out.println("<!-- 추가 -->");
		out.println("<tr><td>개인/법인/단체 구분</td><tr>");
		out.println("<td style='CURSOR: hand' onclick='javascript:clickshow(1)' width='149' bgcolor='F5F5F5' height='25'>");
		out.println("&nbsp;");
		out.println("<img src='./MenuImage/b_2.gif' name='bar1' width='9' height='9' border='0'>");
		out.println("<b><font face='굴림' size='2'>개인</font></b>");
		out.println("<td style='CURSOR: hand' onclick='javascript:clickshow(2)' width='149' bgcolor='F5F5F5' height='25'>");
		out.println("&nbsp;");
		out.println("<img src='./MenuImage/b_3.gif' name='bar2' width='9' height='9' border='0'>");
		out.println("<b><font face='굴림' size='2'>법인</font></b>");
		out.println("</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td width='249'>");
		out.println("<span id='block1' style='DISPLAY: block; MARGIN-LEFT: 0px; CURSOR: hand'>");
		out.println("	<input type=radio name='user_policy_type' value='101' checked>전자거래범용");
		out.println("	<input type=radio name='user_policy_type' value='104'>은행/보험용 <br>");
		out.println("	<input type=radio name='user_policy_type' value='162'>신용카드결제용");
		out.println("	<input type=radio name='user_policy_type' value='169'>보안메일용");

		out.println("<td width='249'>");
		out.println("<span id='block2' style='DISPLAY: none; MARGIN-LEFT: 0px; CURSOR: hand'>");
		out.println("	<input type=radio name='user_policy_type' value='202' checked>금용거래용");
		out.println("	<input type=radio name='user_policy_type' value='205'>전자거래범용<br>");
		out.println("	<input type=radio name='user_policy_type' value='261'>기업뱅킹용");
		out.println("	<input type=radio name='user_policy_type' value='269'>보안메일용");

		out.println("</td>");
		out.println("</tr>");
		out.println("<tr></tr><tr></tr><tr></tr>");
		out.println("<!-- 추가 -->");

		out.println("</table>");
		out.println("<p><input type='image' src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>");
		out.println("</form>");
		out.println("</center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");

	}

}
