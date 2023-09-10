
package XecureWeb;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import xecure.servlet.*;
import xecure.crypto.*;

public class sign_demo_result extends XecureHttpServlet
{
	
	public void doPost ( HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException
	{
		doGet( request, response ) ;
	}
	 
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

		out.println( "<html>");

		out.println("<head>");
		out.println("<title>���������κ��� �Է¹��� ����Դϴ�</title>");
		out.println("</head>");
		out.println("<body>");

		out.println("<p align='center'><big><strong>���������κ��� �Է¹��� ����Դϴ�. </strong></big></p>");
		out.println("<p>��</p>");
		out.println();
		out.println ( "<!---BEGIN_ENC--->");
		out.println ( "<table border='1' width='100%%'>") ;
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>�����ȣ :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("ReserveNum" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>�ݾ� :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("fee" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>ī���ȣ :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("CreditNo" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>��ȿ�Ⱓ :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("Year" ) + "/" + request.getParameter("Month" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>������ :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("Pay" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "</table>"); 
		out.println ( "<!---END_ENC--->");

		SignVerifier	verifier = new SignVerifier ( this.getXecureConfig(), request.getParameter("signed_msg") );

		if ( verifier.getLastError() != 0 ) {
			out.println("���� ���� ��� : ������ ������ �ֽ��ϴ�.<br>");
			out.println("���� ��ȣ : " + verifier.getLastError() + "<br>");
		}
		else {
			out.println("���� ���� ��� : ���� Ȯ�� ����<br>");
		}

		out.println("���� <pre>\n");

		String sm = request.getParameter("signed_msg");
		int i;
		for ( i = 0; i < sm.length(); i+=80 ) {
			out.print( "\t\t");
			if ( i + 80 < sm.length() ) 
				out.println ( sm.substring( i, i+80 ) );
			else
				out.println ( sm.substring( i, sm.length() ));
		}
		out.println("</pre>\n"); 
		out.println("����� �޽��� ���� : <pre>\n" + verifier.getVerifiedMsg_Text() + "\n</pre>");
		out.println("������ ������ : <pre>\n" + verifier.getSignerCertificate().getCertPem() + "\n</pre>");
 
		out.println( "<p> </p>");
		out.println( "<p align='center'><a href='/XecureDemo/Servlet/Web/start.html'>�ʱ� ȭ��</a></p>" );
		out.println( "<p> </p>");

	        out.close();
        }
}
 
