package XecureWeb.ibs.pri_cert;  
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
		out.println("<title>인증서 갱신</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("<p><font size='6'><font color='#6699CC'><b>소프트포럼 인증기관 : 인증서 갱신 신청</b></font></font></p>");
		out.println("<p><font color='#000000' size='5'>사용자 확인을 위해서 아래의 정보를 입력해 주십시오.</font></p>");
		out.println("<form name='form1' method=post action='XecureWeb.ibs.pri_cert.cert_renew_op' onSubmit='cert_req.value=GenCertReq(); return XecureSubmit(this);'>");
		out.println("<input type=hidden name='cert_req'>");
		out.println("<table>");
		out.println("<tr><td>계좌번호</td><td><input type=text name='account' size='20'></td></tr>");
		out.println("<tr><td>계좌비밀번호</td><td><input type=text name='ac_pwd' size='20'></td></tr>");
		out.println("<tr><td>패스워드카드 15번째 숫자</td><td><input type=text name='pcard' size='20'></td></tr>");

		out.println("<tr><td>이름</td><td><input type=text name='user_name' size='20'></td></tr>");
		out.println("<tr><td>아이디</td><td><input type=text name='user_id' size='20'></td></tr>");
		out.println("<tr><td>주민등록번호</td><td><input type=text name='ssn' size='20'></td></tr>");
		out.println("<tr><td>전자우편</td><td><input type=text name='email' size='20'></td></tr>");
		out.println("<tr><td>자택 주소</td><td><input type=text name='address' size='40'></td></tr>");
		out.println("<tr><td>회사 명</td><td><input type=text name='cname' size='20'></td></tr>");
		out.println("<tr><td>부서 명</td><td><input type=text name='cunit' size='20'></td></tr>");
		out.println("<tr><td>회사 주소</td><td><input type=text name='caddress' size='40'></td></tr>");
		out.println("</table>");
		out.println("<p><input type='image' src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>");
		out.println("</form>");
		out.println("</center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
