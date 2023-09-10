package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class cert_view extends XecureHttpServlet
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


		String user_policy_type = request.getParameter("user_policy_type");
		String serial = request.getParameter("serial");
		String id = request.getParameter("user_id");
		String ssn = request.getParameter("ssn");
		PublicRA sfra = new PublicRA ( getXecureConfig() );
		String is_corp;	
		String service_code, service_key;
		String policy_type;
		boolean invalid_input = false;
		boolean is_corp_ssn = false;
		int	i;
		int	ra_result = 1;
		int start_rec_num = 0;
		int req_rec_num = 1;
	
		service_code = "2";
		service_key = "";
	
		is_corp = user_policy_type.substring(0, 1);
	
		if( is_corp.equals("1") ) {
			policy_type = user_policy_type.substring(1,3);
		}else if ( is_corp.equals("2") ) {
			policy_type = user_policy_type.substring(1,3);
		}else
			policy_type = user_policy_type.substring(1,3);
	
		if ( id != null && id.length() > 0 ) {
			service_code = "2";
			service_key = id;
		}else if ( ssn != null && ssn.length() > 0) {
			service_code = "3";
			service_key = ssn;
			if(!is_corp.equals("1")) {
				req_rec_num = 10;
				ra_result = 10;
				is_corp_ssn = true;
			}
		}else if(serial != null && serial.length() > 0) {
			service_code = "1";
			service_key = serial;
		}else
			invalid_input = true;


		out.println("<html>");
		out.println("<head>");
		out.println("<title>Untitled Document</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("<p><font size='6'><font color='#6699CC'><b>사용자 인증서 상태 조회</b></font></font></p>");
		out.println("<table border=1>");

		if ( !invalid_input ) {
			while ( true ) {
				ra_result = sfra.viewCertificate ( "internet", policy_type, service_code, service_key, start_rec_num, req_rec_num );
				if ( ra_result > 0 ) {
					out.println("<tr>	<td colspan=6 align=center>총 레코드 수 : " + ra_result + "</td></tr>");
					out.println("<tr>");
					out.println("	<td>번호</td>");
					out.println("	<td>일련번호</td>");
					out.println("	<td>사용자 ID</td>");
					out.println("	<td>주민번호</td>");
					out.println("	<td>인증서 정보</td>");
					out.println("	<td>상태</td>");
					out.println("	<td>상태 변경</td>");
					out.println("</tr>");

					for ( i=1; i<= ra_result; ++i ) {

						out.println("<tr>");
						out.println("	<td>" + sfra.getResponseFromCertView("RECNUM",i) + "</td>");
						out.println("	<td>" + sfra.getResponseFromCertView("SERIAL",i) + "</td>");
						out.println("	<td>" + sfra.getResponseFromCertView("USERID",i) + "</td>");
						out.println("	<td>" + sfra.getResponseFromCertView("SSN",i) + "</td>");
						out.println("	<td>DN : " + sfra.getResponseFromCertView("USERDN",i) + "<br>");
						out.println("	    유효기간 : " + sfra.getResponseFromCertView("VALIDFROM",i) + " - " + sfra.getResponseFromCertView("VALIDTO",i) + "</td>");
						out.println("	<td> ");

						String cert_status = (String)sfra.getResponseFromCertView("STATUS",i);
						if ( cert_status.equals("10") ) out.println("유효");
						else if ( cert_status.equals("30") ) out.println("폐지");
						else if ( cert_status.equals("40") ) out.println("효력정지");
						else out.println("오류");

						out.println("	    </td>");
						out.println("	<td>");

						if ( cert_status.equals("10") ) {
							out.println("<a href='XecureWeb.ibs.pub_cert.cert_man_op?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=30' onClick='return XecureLink(this);'>폐지</a>");
							out.println("<br>");
							out.println("<a href='XecureWeb.ibs.pub_cert.cert_man_op?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=40' onClick='return XecureLink(this);'>효력정지</a>");
						}
						else if ( cert_status.equals("40") ) {
							out.println("<a href='XecureWeb.ibs.pub_cert.cert_man_op?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=30' onClick='return XecureLink(this);'>폐지</a>");
							out.println("<br>");
							out.println("<a href='XecureWeb.ibs.pub_cert.cert_man_op?serial=" + sfra.getResponseFromCertView("SERIAL",i) + "&policy_type=" + sfra.getResponseFromCertView("POLICYTYPE", i) + "&service=41' onClick='return XecureLink(this);'>효력회복</a>");

						}
						out.println("	   </td>");
						out.println("</tr>");
					}
					if ( ra_result != req_rec_num )
						break;

					if(is_corp_ssn)//added for 
						start_rec_num = start_rec_num + req_rec_num + 1;
					else
						break;

				}
				else {
					out.println("<tr><td>error code : " + sfra.getLastError() + "</td><td>error msg : " + sfra.getLastErrorMsg());
					break;
				}
				if ( ra_result != req_rec_num )
					break;
				if(!is_corp_ssn)
					break;
			}
		}
		else {
			out.println("<tr><td>error code : " + sfra.getLastError() + "</td><td>error msg : " + sfra.getLastErrorMsg());
		}

		out.println("</table>");
		out.println("<p><input type='image' src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>");
		out.println("</form>");
		out.println("</center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
