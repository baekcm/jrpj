package XecureWeb.ibs;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;

public class transfer_confirm extends XecureHttpServlet 
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
		out.println("<title>Untitled Document</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");

		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<script language='javascript'>");
		out.println("function sign_and_submit(form)");
		out.println("{");
		out.println("	msg = '" + new String(((XecureHttpServletRequest)request).getXecureUserCert().getSubject("cn")) + "->�Ӳ���\\n';");
		out.println("	msg += '���¹�ȣ : " + request.getParameter("account") + "\\n';");
		out.println("	msg += '��ü�ݾ� : " + request.getParameter("money") + "\\n';");
		out.println("	form.signed_msg.value = Sign( msg );");
		out.println("	if ( form.signed_msg.value == '' )");
		out.println("		return false;");
		out.println("	return XecureSubmit(form);");
		out.println("}");
		out.println("</script>");
		out.println("<center>");

		out.println("  <img src='/XecureDemo/image/demo_title.gif' width='523' height='74'> ");
		out.println("  <p><font size='6'><font color='#6699CC'><b>���ͳݹ�ŷ ������ü Ȯ��</b></font></font></p>");
		out.println("  <p><font color='#000000' size='3'>'<b>" + new String(((XecureHttpServletRequest)request).getXecureUserCert().getSubject("cn")) + "</b>' �Բ��� �Է��Ͻ� ������ ������ �����ϴ�.</font></p>");
		out.println("  <form name='form1' method=post action='XecureWeb.ibs.transfer_tr' onSubmit='return sign_and_submit(this);'>");
		out.println("	<input type=hidden name=signed_msg>");
		out.println("<table border=1>");
		out.println("<tr>");
		out.println("	<td width=100>��ü����</td>");
		out.println("	<td width=200>" + new String( request.getParameter("bank").getBytes(), "EUC-KR" ) + "</td>");
		out.println("</tr>");
		out.println("<tr>	<td>���¹�ȣ</td>");
		out.println("	<td>" + request.getParameter("account") + "</td>");
		out.println("</tr>");
		out.println("<tr>	<td>������</td>");
		out.println("	<td>�Ӳ���</td>");
		out.println("</tr>");
		out.println("<tr>	<td>��ü�ݾ�</td>");
		out.println("	<td>" + request.getParameter("money") + " ��</td>");
		out.println("</tr>");
		out.println("</table>");	
		out.println(" <p><font color='#000000' size='3'>�Է��Ͻ� ������ �´��� Ȯ���Ͻð� ��ü�Ͻ÷��� Ȯ���� �����ʽÿ�.</font></p>");
		out.println(" <p><font color='#000000' size='3'> </font> </p>");
		out.println("	<p><input type=image src='/XecureDemo/image/button_ok.jpg' width='180' height='47' border='0'></p>");
		out.println("    </form>");
		out.println("  <p>&nbsp;</p>");
		out.println("  </center>");
		out.println("</body>");
		out.println("<!---END_ENC--->");
		out.println("</html>");
	}
}
