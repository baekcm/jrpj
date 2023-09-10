<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.jsp.HttpJspPage" %>

<%
	String mainVer		= request.getParameter("main");
	String cryptoVer	= request.getParameter("crypto");
	String pkiVer		= request.getParameter("pki");
	String iccardVer	= request.getParameter("iccard");
	String guiVer		= request.getParameter("gui");
	String csmVer		= request.getParameter("csm");
	
	if( mainVer != null )
	{
		if( mainVer.equals("5.1.0.5") )
		{
		
			if( cryptoVer != null && cryptoVer.compareTo("3.0.22.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/SFCrypt.dll.xwz");
			if( pkiVer != null && pkiVer.compareTo("3.0.22.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/MiraePKIX.dll.xwz");
			if( iccardVer != null && iccardVer.compareTo("1.0.1.2") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/SFSmartCard.dll.xwz");
			if( guiVer != null && guiVer.compareTo("5.1.0.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/XWebSSL.dll.xwz");
			if( csmVer != null && csmVer.compareTo("3.1.0.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/ClientSM.exe.xwz");


/*		
			if( cryptoVer != null && cryptoVer.compareTo("3.0.22.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/SFCrypt.dll");
			if( pkiVer != null && pkiVer.compareTo("3.0.22.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/MiraePKIX.dll");
			if( iccardVer != null && iccardVer.compareTo("1.0.1.2") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/SFSmartCard.dll");
			if( guiVer != null && guiVer.compareTo("5.1.0.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/XWebSSL.dll");
			if( csmVer != null && csmVer.compareTo("3.1.0.1") < 0 )
				out.println("http://phobos.softforum.co.kr:8188/XecureObject/XWeb/5.1.0.0/ClientSM.exe");
*/		

		}
		else
			out.println("");
	}
	else
		out.println("");
%>