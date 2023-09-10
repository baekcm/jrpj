<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head><title> 소프트포럼 인증기관 : 인증기관 인증서 설치 </title>
</head>
<script language='javascript' src='/XecureObject/xecureweb_xp.js'></script>
<script>
PrintObjectTag();
</script>
 
<body bgcolor='#FFFFFF' background='/XecureDemo/image/back.gif'>
<center>

<img src='/XecureDemo/image/demo_title.gif' width='523' height='74'>
<!--Title-->
<p><font size='6'><font color='#6699CC'><b>소프트포럼 인증기관 : 인증기관 인증서 설치</b></font></font></p>

<% 
        String pem ="";
        BufferedReader in=null;
        boolean eof=false;
		String caCertFN = (new XecureConfig()).getPrivateCaCertFN();
	
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
                        Certificate cacert = new Certificate ( new XecureConfig(), pem );
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
		out.println("사설 인증기관 인증서를 읽을 수 없습니다. 서블릿 엔진의 실행 User 가 파일에 접근할 수 있는지 확인하십시요.");
		out.println("<pre>");
		out.println( "e.toString()" +e.toString() );		
		out.println("</pre>"); 
	}
%>

 
</body>
</html>
