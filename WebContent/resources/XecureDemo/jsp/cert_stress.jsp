<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page language="java" extends="xecure.servlet.jsp.XecureHttpJspPage"  %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<OBJECT ID="XecureWeb" CLASSID="CLSID:7E9FDB80-5316-11D4-B02C-00C04F0CD404">
<COMMENT>
        <EMBED type='application/x-SoftForum-XecSSL40' hidden=true name='XecureWeb'>
        <NOEMBED>
</COMMENT>
           No XecureWeb 4.0 PlugIn
        </NOEMBED>
        </EMBED>
</OBJECT> 

<form name='xecure'><input type=hidden name='p'></form>
<script Language=javascript src='/resources/XecureObject/xecureweb.js'></script>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
</head>

<body bgcolor="#FFFFFF" >

<%
	String signedMsg = request.getParameter("signed_msg");
	String pem=null;

	if(signedMsg!=null || signedMsg.length()!=0){
		SignVerifierM verifier = new SignVerifierM ( this.getXecureConfig(), signedMsg);
		if(verifier.getLastError()==0){
			pem = verifier.getSignerCertificate().getCertPem();
			out.println("certificate from client<br><br>");
		}
	}

	if(pem==null){
		pem = "-----BEGIN CERTIFICATE-----\n";
		pem += "MIIDGDCCAoGgAwIBAgICCjAwDQYJKoZIhvcNAQEFBQAwTTELMAkGA1UEBhMCa3Ix\n";
		pem += "EDAOBgNVBAoTB3llc3NpZ24xEzARBgNVBAsTCkxpY2Vuc2VkQ0ExFzAVBgNVBAMT\n";
		pem += "Dnllc3NpZ25DQS1URVNUMB4XDTAxMDIyMjE1MDAwMFoXDTAxMDQyMzE0NTkwMFow\n";
		pem += "bzELMAkGA1UEBhMCa3IxEDAOBgNVBAoTB3llc3NpZ24xETAPBgNVBAsTCHBlcnNv\n";
		pem += "bmFsMRIwEAYDVQQLEwlTT0ZURk9SVU0xJzAlBgNVBAMTHmhqajAyMjMoaGpqMDIy\n";
		pem += "MykwMDkwMDkwMDA5MDAwOTCBnjANBgkqhkiG9w0BAQEFAAOBjAAwgYgCgYBDUCYo\n";
		pem += "ztlJN+wnKBZa1mu4We0KBZGiHzTbW9cy9d8bxekfMFjg38ZK3v9QETwdMzLFIqd5\n";
		pem += "0su9gpdWvrdtV6LvMptR9URJG6SMygqifINUq2TYzpXDiA4ww9BCWWJ9PbjvVIQY\n";
		pem += "hgBoTCLkr4zzKlbFOFdPWehXzmnRLzsnd21KRQIDAQABo4HlMIHiMB8GA1UdIwQY\n";
		pem += "MBaAFMCrHfoXAVmyKk1zrUu+0tjN9pzFMB0GA1UdDgQWBBRy/c/p8l5754HA5j6j\n";
		pem += "BuQA6420DzAOBgNVHQ8BAf8EBAMCBsAwGQYDVR0gAQH/BA8wDTALBgkqgxqMmkUB\n";
		pem += "AQEwIgYDVR0RBBswGaAXBggqgxqMmkQGAaALMAkMB2hqajAyMjMwUQYDVR0fBEow\n";
		pem += "SDBGoESgQoZAbGRhcDovLzIwMy4yMzMuOTEuMjM0OjYwMjAvb3U9ZHAycDYsb3U9\n";
		pem += "TGljZW5zZWRDQSxvPXllc3NpZ24sYz1rcjANBgkqhkiG9w0BAQUFAAOBgQAINmNh\n";
		pem += "sXk6jz8tbfYticpl1CPrwWDogqquAgOH4G/Eg7d67mJ95eFaQUNuLwmSVnZdIbfs\n";
		pem += "yF4Lh1GF2btRqGo/QrUjdM0yOM7sDtEp5aoP9nV4fbwgPdwcp3rR3NBQojEtQlyZ\n";
		pem += "YoYpCCFm93My6h175TmUQDst58B4SIGh768Qqg==\n";
		pem += "-----END CERTIFICATE-----\n";
		out.println("certificate embedded in this page<br>");
	}

	Certificate user_cert = null;

	try {
		user_cert = new Certificate ( this.getXecureConfig(), pem );
	} catch ( Exception e ) {
	}

	if ( user_cert != null ) {	
%>
		version : <%=user_cert.getVersion()%><br>
		serial : <%=user_cert.getSerial()%><br>
		signature algorithm : <%=user_cert.getSignatureAlgId()%><br>
		issuer : <%=user_cert.getIssuer()%><br>
		subject : <%=user_cert.getSubject()%><br>
		SubjectPublicKeyAlgId : <%=user_cert.getSubjectPublicKeyAlgId()%><br>
		From : <%=user_cert.getFrom()%><br>
		To : <%=user_cert.getTo()%><br>
		Signature : <%=user_cert.getSignature()%><br>
		IssuerAltName : <%=user_cert.getIssuerAltName()%><br>
		SubjectAltName : <%=user_cert.getSubjectAltName()%><br>
		KeyUsage : <%=user_cert.getKeyUsage()%><br>
		ExtKeyUsage : <%=user_cert.getExtKeyUsage()%><br>
		Policy : <%=user_cert.getPolicy()%><br>
		PolicyMapping : <%=user_cert.getPolicyMapping()%><br>
		BasicConstraint : <%=user_cert.getBasicConstraint()%><br>
		PolicyConstraint : <%=user_cert.getPolicyConstraint()%><br>
		DistributionPoints : <%=user_cert.getDistributionPoints()%><br>
		AuthorityKeyId : <%=user_cert.getAuthorityKeyId()%><br>
		SubjectKeyId : <%=user_cert.getSubjectKeyId()%><br>
		PublicKey : <%=user_cert.getPublicKey()%><br>
		PubKeyLen : <%=user_cert.getPubKeyLen()%><br>
		UserNotice : <%=user_cert.getUserNotice()%><br>
		CPS : <%=user_cert.getCPS()%><br>
		VirtualID : <%=user_cert.isVirtualID()%><br>
		SFCAcert : <%=user_cert.isSFCAcert()%><br>
		CertType : <%=user_cert.getCertType()%><br>
		CertPem : <%=user_cert.getCertPem()%><br>
		certInstallScript(INSTALL_CA_CERT) :<br>
		<%=user_cert.certInstallScript(Certificate.INSTALL_CA_CERT)%><br>
		certInstallScript(INSTALL_USER_CERT) :<br>
		<%=user_cert.certInstallScript(Certificate.INSTALL_USER_CERT)%><br>
		certInstallScript(INSTALL_SERVER_CERT) :<br>
		<%=user_cert.certInstallScript(Certificate.INSTALL_SERVER_CERT)%><br>
		certInstallScript(INSTALL_PEOPLE_CERT) :<br>
		<%=user_cert.certInstallScript(Certificate.INSTALL_PEOPLE_CERT)%><br>
		certInstallScript(INSTALL_ENCRYPTED_USER_CERT) :<br>
		<%=user_cert.certInstallScript(Certificate.INSTALL_ENCRYPTED_USER_CERT)%><br>
<%
		out.print("VerifyCertificate : ");
		if(user_cert.VerifyCertificate()==0){
			out.println("OK!!!<br>");
		}else{
			out.println("Failed!!!<br>");
			out.println("error : "+user_cert.getLastError()+"["+user_cert.getLastErrorMsg()+"]");
		}
%>
		
<%
	}
%>
</body>
</html>
