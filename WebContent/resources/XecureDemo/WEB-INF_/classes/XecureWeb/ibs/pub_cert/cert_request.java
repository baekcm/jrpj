package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class cert_request extends XecureHttpServlet
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

		String account = request.getParameter("account");
		String ac_pwd = request.getParameter("ac_pwd");
		String pcard = request.getParameter("pcard");
		String operaterId = "internet";
		String user_type = request.getParameter("user_type") ; 
		String company_name = request.getParameter("company_name");
		String user_name = request.getParameter("user_name");
		String euser_name = request.getParameter("euser_name");
		String user_id = request.getParameter("user_id");
		String ssn = request.getParameter("ssn");

		String policy_type ;
		if ( user_type.equals("1") ) policy_type = "01";
		else    policy_type = "02";

		String email = request.getParameter("email");
		String cell_phone = request.getParameter("cell_phone");
		String fax = request.getParameter("fax");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String czipcode = request.getParameter("czipcode");
		String caddress = request.getParameter("caddress");
		String cphone = request.getParameter("cphone");
		int	ra_result;
		
		PublicRA sfra = new PublicRA ( ((XecureHttpServletRequest)request).getXecureSession().getXecureConfig() );

		ra_result = sfra.registerNewUser ( operaterId, user_type, company_name, user_name, euser_name, user_id, 
					ssn, policy_type, email,cell_phone, fax, zipcode, address, phone,
					czipcode, caddress, cphone );

		out.println("<html>");
		out.println("<head>");
		out.println("<title>Untitled Document</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
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

		if ( ra_result == 0 ) {
		 
			out.println("<p><font size='6'><font color='#6699CC'><b>사용자 등록 확인</b></font></font></p>");
			out.println("  <p>&nbsp;</p>");
			out.println("<table>");
			out.println("<tr><td>사용자</td><td>" + user_name + "</td></tr>");
			out.println("<tr><td>계좌번호</td><td>" + account + "</td></tr>");
			out.println("<tr><td>등록일</td><td>" + sfra.getResponseFromRegUser("REGDATE") + "</td></tr>");
			out.println("<tr><td>등록번호</td><td>" + sfra.getResponseFromRegUser("REGSERIAL") + "</td></tr>");
			out.println("<tr><td>사용자 ID</td><td>" + sfra.getResponseFromRegUser("USERID") + "</td></tr>");
			out.println("<tr><td>주민등록번호</td><td>" + sfra.getResponseFromRegUser("SSN") + "</td></tr>");
			out.println("<tr><td>참조코드</td><td>" + sfra.getResponseFromRegUser("REFCODE") + "</td></tr>");
			out.println("<tr><td>인가코드</td><td>" + sfra.getResponseFromRegUser("AUTHCODE") + "</td></tr>");
			out.println("</table>");
			out.println("<br>");
			out.println( request.getParameter("user_name") + "'님의 사용자 정보가 금융결제원 인증기관에 등록 되었습니다. <br>");
			out.println("<br>이제 '확인' 버튼을 누르시면 금융결제원 공인인증기관으로 부터 인증서를 발급받을 수 있습니다.</p>");
			out.println("    <p><font color='#000000' size='5'> </font> </p>");
			out.println("<form name='auth' onSubmit='cert_request(this); return false;'>");
			out.println("<input type=hidden name='ref_code' value='" + sfra.getResponseFromRegUser("REFCODE") + "'>");
			out.println("<input type=hidden name='auth_code' value='" + sfra.getResponseFromRegUser("AUTHCODE") + "'>");
			out.println("<input type=image src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'>");
			out.println("</form>");
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
