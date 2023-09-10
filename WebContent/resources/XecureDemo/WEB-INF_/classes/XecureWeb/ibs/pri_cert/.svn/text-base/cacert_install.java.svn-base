package XecureWeb.ibs.pri_cert;  
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import xecure.servlet.*;
import xecure.crypto.*;

public class cacert_install extends XecureHttpServlet 
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
		out.println("<title>인증기관 인증서 설치</title>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=ks_c_5601-1987'>");
		out.println("</head>");
		out.println("<!---BEGIN_ENC--->");
		out.println("<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>");
		out.println("<center>");

		out.println("<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>");
		out.println("<p><font size='6'><font color='#6699CC'><b>소프트포럼 인증기관 : 인증기관 인증서 설치</b></font></font></p>");

		String pem ="";
		BufferedReader in=null;
		boolean eof=false;
		String caCertFN = getXecureConfig().getPrivateCaCertFN();
		
		try {
		
			in = new BufferedReader(new InputStreamReader(new FileInputStream( caCertFN )));

			if(in == null) {
				out.println("사설 인증기관 인증서를 찾을 수 없습니다.");
			}
			else {
				while(!eof) {
					String line = null;

					try {

						line = in.readLine(); 
						if(line == null) {
							eof = true;
							continue;
						}
					}catch(IOException e) {}
						pem += line ;
						pem += "\n" ;
				}
				Certificate cacert = new Certificate ( getXecureConfig(), pem );
				out.println( "인증기관 인증서 DN : " + cacert.getSubject() + "<br><br>" );
				out.println( "</center>");
				out.println( "<pre>" );
				out.println( cacert.getCertPem() );
				out.println( "</pre>");
				out.println( "<script language='javascript'>" );
				out.println( cacert.certInstallScript( Certificate.INSTALL_CA_CERT ) );
				out.println( "</script>" );
			}
		}
		catch (Exception e) {
			out.println("사설 인증기관 인증서를 읽을 수 없습니다. 서블릿 엔진의 실행 User 가 이 파일에 접근가능한지 확인하시기 바랍니다.");
			out.println("<pre>");
			out.println( e.toString() );
			out.println("</pre>");
		}

		out.println("<!---END_ENC--->");
		out.println("</body>");
		out.println("</html>");
	}
}
