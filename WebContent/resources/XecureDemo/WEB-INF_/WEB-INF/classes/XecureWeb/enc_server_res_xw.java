package XecureWeb;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import xecure.servlet.*;

public class enc_server_res_xw extends HttpServlet
{

/**** �߰� �ؾ� �� �κ� ***/
	XecureConfig xecConfig;

	public void init ( ServletConfig config ) throws ServletException {
		super.init(config);
		try {
			xecConfig = new XecureConfig ();
		} catch ( Exception e ) {
			return;
		}
	}
/********/
	
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

/**** �߰� �ؾ� �� �κ� ***/
		XecureServlet xservlet=null;

		try {
			xservlet = new XecureServlet ( xecConfig, request, response );
		} catch ( XecureServletConfigException e ) {
			/* ���� ���� */
			out.print( e.toString() );
			out.flush();
			return;
		} catch ( XecureServletException e ) {
			/* ��ȣ ���� ���� */
			out.print( e.toString() );
			out.flush();
			return;
		}
/********/


		out.println( xservlet.sXecureClientObject );

		out.println( "<html>");

		out.println("<head>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("<title>��ȣȭ ���� ���</title>");
		out.println("</head>");
		out.println("<body>");

		out.println("<p align='center'><big><strong>��ȣȭ�� Ŭ���̾�Ʈ Request ��ȣȭ ����Դϴ�. </strong></big></p>");
		out.println("<p>��</p>");
		out.println();

		out.println ( "<table border='1' width='100%%'>") ;
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Client Request QueryString :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getQueryString( ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Client Request QueryString abc:</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("abc") + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Client Request QueryString pop:</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( request.getParameter("pop") + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted QueryString :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( xservlet.request.getQueryString( ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted QueryString abc :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( xservlet.request.getParameter("abc" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted QueryString pop :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( xservlet.request.getParameter("pop" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted text_field1 :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( xservlet.request.getParameter("text_field1" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "<tr>");
		out.println ( "<td width='17%%'><strong>Decrypted text_field2 :</strong></td>");
		out.println ( "<td width='83%%'><strong>");
		out.println ( xservlet.request.getParameter("text_field2" ) + "");
		out.println ( "</strong></td>");
		out.println ( "</tr>");
		out.println ( "</table>"); 

		out.println ( xservlet.encrypt("<p align='center'><big><strong>��ȣȭ�� ���� Response �����Դϴ�. </strong></big></p>") );
		out.println( "<p> </p>");
		out.println( "<p align='center'><a href='/XecureDemo/servlets/enc_client_req_xw.html'>���� ȭ��</a></p>" );
		out.println( "</body></html>");

	        out.close();
        }
}
 
