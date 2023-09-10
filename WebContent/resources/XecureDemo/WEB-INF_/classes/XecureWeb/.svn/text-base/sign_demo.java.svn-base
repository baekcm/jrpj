

package XecureWeb;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import xecure.servlet.*;

public class sign_demo extends HttpServlet
{ 
	
    	public void doGet ( HttpServletRequest request, HttpServletResponse response) 
       		 throws ServletException, IOException
        {
            	PrintWriter out;

		// set content type and other response header fields first
            	response.setContentType("text/html; charset=euc-kr");

            	// then write the data of the response
            	out = response.getWriter();

		out.println("<OBJECT ID='XecureWeb' CLASSID='CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404'>");
		out.println("</OBJECT>");
		out.println("<form name='xecure' ><input type=hidden name='p'></form>");
		out.println("<script language='javascript' src='/XecureObject/xecureweb.js'></script>");

		out.println( "<html><head></head>");
		out.println( "<body>");

		out.println( "<script language='JavaScript'>" );
		out.println( "function sign_submit(form) {");
		out.println( "var message = '계좌 이체 서명문\\r\\n';");
		out.println( "    message += ' 보내는 이: 조흥은행 111-11-111-1111 예금주 백주성\\r\\n';");
		out.println( "    message += ' 받는   이: 국민은행 222-22-222-2222 예금주 민윤정\\r\\n';");
		out.println( "    message += '  송금액  : 100,000 원\\r\\n';");
		out.println( "    message += '  수수료  : 500 원\\r\\n';");
		out.println( "    form.signed_msg.value = Sign(message);");
		out.println( "    if ( form.signed_msg.value=='' ) return false;");
		out.println( "    else");
		out.println( "	       return XecureSubmit(form);");
		out.println( "}");
		out.println( "</script>");

		out.println ( "<br><center>" );
		out.println ( "<h3>예약 정보 입력</h3>" );

		out.println ( "<form action='XecureWeb.sign_demo_result' method='POST' onSubmit='return sign_submit(this);'>");
		out.println ( "<input type=hidden name=signed_msg>");
		out.println ( "  <ul>");
		out.println ( "    <table cellPadding='10' height='260' border='1'>");
		out.println ( "      <tr>");
		out.println ( "        <td height='25'><b>예약번호 : </b></td>");
		out.println ( "        <td height='25'><b><input type='text' name='ReserveNum' size='20'></b></td>");
		out.println ( "      </tr>");
		out.println ( "      <tr>");
		out.println ( "        <td height='24'><b>금액 : </b></td>");
		out.println ( "        <td height='24'><b><input type='text' name='fee' size='20'></b></td>");
		out.println ( "      </tr>");
		out.println ( "      <tr>");
		out.println ( "        <td height='25'><b>카드번호 :</d> </b></td>");
		out.println ( "        <td height='25'><b><input name='CreditNo' size='16'></b></td>");
		out.println ( "      </tr>");
		out.println ( "      <tr>");
		out.println ( "        <td height='26'><b>유효기간 : </b></td>");
		out.println ( "        <td height='26'><select name='Year' size='1'>");
		out.println ( "          <option selected> </option>");
		out.println ( "          <option value='98'>1998 </option>");
		out.println ( "          <option value='99'>1999 </option>");
		out.println ( "          <option value='00'>2000 </option>");
		out.println ( "          <option value='01'>2001 </option>");
		out.println ( "          <option value='02'>2002 </option>");
		out.println ( "          <option value='03'>2003 </option>");
		out.println ( "          <option value='04'>2004 </option>");
		out.println ( "          <option value='05'>2005 </option>");
		out.println ( "          <option value='06'>2006</option>");
		out.println ( "        </select> 년 <select name='Month' size='1'>");
		out.println ( "          <option selected> </option>");
		out.println ( "          <option value='01'>1 </option>");
		out.println ( "          <option value='02'>2 </option>");
		out.println ( "          <option value='03'>3 </option>");
		out.println ( "          <option value='04'>4 </option>");
		out.println ( "          <option value='05'>5 </option>");
		out.println ( "          <option value='06'>6 </option>");
		out.println ( "          <option value='07'>7 </option>");
		out.println ( "          <option value='08'>8 </option>");
		out.println ( "          <option value='09'>9 </option>");
		out.println ( "          <option value='10'>10 </option>");
		out.println ( "          <option value='11'>11 </option>");
		out.println ( "          <option value='12'>12</option>");
		out.println ( "        </select> 월</td>");
		out.println ( "      </tr>");
		out.println ( "      <tr>");
		out.println ( "        <td height='26'><b>결제방법 :</b> </td>");
		out.println ( "        <td height='26'><select name='Pay' size='1'>");
		out.println ( "          <option selected > </option>");
		out.println ( "          <option value='01'>일시불 </option>");
		out.println ( "          <option value='03'>할부 3개월 </option>");
		out.println ( "          <option value='06'>할부 6개월 </option>");
		out.println ( "          <option value='09'>할부 9개월 </option>");
		out.println ( "          <option value='12'>할부 12개월</option>");
		out.println ( "        </select></td>");
		out.println ( "      </tr>");
		out.println ( "      <tr>");
		out.println ( "        <td colspan='2' height='2'><div align='center'><center><p><input type='submit'");
		out.println ( "        value=' 확  인 '></td>");
		out.println ( "      </tr>");
		out.println ( "    </table>");
		out.println ( "  </ul>");
		out.println ( "</form>");
		out.println ( "<br><a href='/XecureDemo/servlets/index.html'>초기 화면</a>");
		out.println ( "</center>");
		out.println ( "</body>");

	        out.close();
        }
}
 
