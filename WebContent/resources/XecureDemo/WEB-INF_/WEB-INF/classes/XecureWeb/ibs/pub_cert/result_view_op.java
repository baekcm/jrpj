package XecureWeb.ibs.pub_cert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class result_view_op extends XecureHttpServlet
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

		out.println("<html>");
		out.println("<head>");
		out.println("<title>접수 처리 결과</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("<p><font size='6'><font color='#6699CC'><b>접수 처리 결과</b></font></font></p>");

		String reg_date = request.getParameter("reg_date");
		String reg_serial = request.getParameter("reg_serial");
		String policy_type = request.getParameter("policy_type");
		String user_id = request.getParameter("user_id");
		String status;
		int	ra_result;

		PublicRA sfra = new PublicRA ( getXecureConfig() );

		ra_result = sfra.viewRegisterUserResult(reg_date, reg_serial ,policy_type, user_id);

		if ( ra_result != 0 ) {

			out.println("		<p><font color='#000000' size='5'>접수 처리 조회 오류</font></p>");
			out.println("		error code : "+sfra.getLastError()+" <br>");
			out.println("		error msg : "+sfra.getLastErrorMsg()+" <br>");
		}
		else {

			out.println("		<p><font color='#000000' size='5'>접수 처리 조회 성공</font></p>");

			out.println("		<table>");
			out.println("		<tr><td>응답메시지</td><td>"+sfra.getResponseFromResultView("MESSAGE")+"</td></tr>");
			out.println("		<tr><td>등록일시</td><td>"+sfra.getResponseFromResultView("REGDATE")+"</td></tr>");
			out.println("		<tr><td>접수일련번호</td><td>"+sfra.getResponseFromResultView("REGSERIAL")+"</td></tr>");
			out.println("		<tr><td>접수처리결과 타입코드</td><td>"+sfra.getResponseFromResultView("REGTYPE")+"</td></tr>");

			if ( sfra.getResponseFromResultView("REGTYPE").equals("1") ) {
				out.println("			<tr><td colspan=2>사용자 등록후 인증서를 아직 발급받지 않은 경우</td></tr>");
				out.println("			<tr><td>법인명</td><td>"+sfra.getResponseFromResultView("COMPANY")+"</td></tr>");
				out.println("			<tr><td>개인명,법인단체 세부명</td><td>"+sfra.getResponseFromResultView("USERNAME")+"</td></tr>");
				out.println("			<tr><td>개인(법인)ID</td><td>"+sfra.getResponseFromResultView("USERID")+"</td></tr>");
				out.println("			<tr><td>주민등록번호</td><td>"+sfra.getResponseFromResultView("SSN")+"</td></tr>");
				out.println("			<tr><td>참조번호</td><td>"+sfra.getResponseFromResultView("REFCODE")+"</td></tr>");
				out.println("			<tr><td>인가코드</td><td>"+sfra.getResponseFromResultView("AUTHCODE")+"</td></tr>");
			}
			else {
		
				out.println("			<tr><td colspan=2>사용자 등록후 인증서를 발급받은 경우</td></tr>");
				out.println("			<tr><td>이벤트발생일</td><td>"+sfra.getResponseFromResultView("EVENTDATE")+"</td></tr>");
				out.println("			<tr><td>인증서일련번호</td><td>"+sfra.getResponseFromResultView("SERIAL")+"</td></tr>");
				out.println("			<tr><td>이벤트타입코드</td><td>"+sfra.getResponseFromResultView("EVENTTYPE")+"</td></tr>");
				out.println("			<tr><td>유효기간시작</td><td>"+sfra.getResponseFromResultView("VALIDFROM")+"</td></tr>");
				out.println("			<tr><td>유효기간종료</td><td>"+sfra.getResponseFromResultView("VALIDTO")+"</td></tr>");
				out.println("			<tr><td>주민등록번호</td><td>"+sfra.getResponseFromResultView("SSN")+"</td></tr>");
				out.println("			<tr><td>전자서명검증키</td><td>");
				
				String pubkey = sfra.getResponseFromResultView("PUBKEY");
				int i;
				for ( i = 0; i < pubkey.length(); i+=80 ) {
					if ( i + 80 < pubkey.length() )
						out.println ( pubkey.substring( i, i+80 ) );
					else
						out.println ( pubkey.substring( i, pubkey.length() ));
					out.println("<br>");
				}
				
				out.println("			    </td></tr>");

			}
			out.println("		</table>");
		}
		out.println("</center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
