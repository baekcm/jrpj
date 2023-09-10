package XecureWeb;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import xecure.servlet.*;

public class enc_server_response extends XecureHttpServlet
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

		out.println( sXecureClientObject );

		out.println( "<html>");

		out.println("<head>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("<title>암호화 데모 결과</title>");
		out.println("</head>");
		out.println("<body>");

		out.println("<p align='center'><big><strong>암호화된 클라이언트 Request 복호화 결과입니다. </strong></big></p>");
		out.println("<p>　</p>");
		out.println();

		out.println ( "<!---BEGIN_ENC--->");
		out.println ( "<table border='1' width='100%%'>") ;
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Client Request QueryString :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( ((XecureHttpServletRequest)request).req.getQueryString( ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Client Request QueryString abc:</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( ((XecureHttpServletRequest)request).req.getParameter("abc") + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Client Request QueryString pop:</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( ((XecureHttpServletRequest)request).req.getParameter("pop") + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted QueryString :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getQueryString( ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted QueryString abc :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("abc" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted QueryString pop :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("pop" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted text_field1 :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("text_field1" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted text_field2 :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("text_field2" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "</table>"); 
		out.println ( "<!---END_ENC--->");

		out.println( "<p> </p>");
		out.println( "<p align='center'><a href='/XecureDemo/servlets/enc_client_request.html'>이전 화면</a></p>" );
		out.println( "</body></html>");

	        out.close();
        }
}
 
