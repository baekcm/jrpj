<%@ include file="/XecureObject/xecure.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<script language=javascript src="/XecureObject/xecureweb.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>
</head>

<body>
<h1>서버 서명 데모</h1>
<!-- 서버가 text에 서명하여 보냄 -->
<%
	
	int		ret;
	Signer	signer=null;
	String signed_data = null;
				
	signer = new Signer(this.getXecureConfig());
	
	out.println(request.getParameter("signed_msg"));
	
	signed_data = signer.MultiSignMessage(request.getParameter("signed_msg"));
	
	ret = signer.getLastError();
%>

<center>
<p><BR><BR>

<table border='1' width='100%'>
<TR>
	<td width='17%'><strong>멀티 서명문 : </strong></td>
	<td width='83%'><strong><pre>
	<%
	if(ret == 0) {
		
		int i;
				
		for ( i = 0; i < signed_data.length(); i+=80 ) {
			if ( i + 80 < signed_data.length() ) 
				out.println ( signed_data.substring( i, i+80 ) );
			else
				out.println ( signed_data.substring( i, signed_data.length() ));
		}
			
	}
	else {
		
		out.println(signer.getLastErrorMsg());
	}
	%>	
	</pre></strong></td>
</TR>
<TR>
	<td width='17%'><strong>Subject : </strong></td>
	<td width='83%'><strong><pre>
	<%
	if(ret == 0) {
			
		int	i;
		int	num;
		String subject;	
		String plain;	
		
		num = signer.getNumberOfSigners();
		out.println(num);
		
		plain = signer.getPlainData_Text();
		out.println(plain);
		
		
		for(i = 0 ; i < num; i++) {
			subject = signer.getSignerSubject(i);
			out.println(subject);
		}
		
		
	}
	%>	
	</pre></strong></td>
</TR>
<TR>
	<td width='17%'><strong>Certificate : </strong></td>
	<td width='83%'><strong><pre>
	<%
	if(ret == 0) {
			
		int	i;
		int	num;
		Certificate cert;
		num = signer.getNumberOfSigners();
		
		
		for(i = 0 ; i < num; i++) {
			cert = signer.getSignerCertificate(i);
			out.println(cert.getCertPem());
			out.println(cert.getSubject());
		}
		
		
	}
	%>	
	</pre></strong></td>
</TR>

<TR>
	<td width='17%'><strong>멀티서명검증 : </strong></td>
	<td width='83%'><strong><pre>
	<%
	if(ret == 0) {
				
		MultiSignVerifier verifier = new MultiSignVerifier ( this.getXecureConfig(),  signed_data);
		
		int nVerifierResult = verifier.getLastError();
		
		if(nVerifierResult != 0) {
		
			out.println(verifier.getLastErrorMsg());
		}
		else {
			int	num;
			int	i;
			Certificate cert = null;
			int	res;
			String	pem;
			
			out.println("서명검증에 성공했습니다.");
			out.println(verifier.getVerifiedMsg_Text());
			num = verifier.getNumberOfSigner();
			for(i = 0 ; i < num ; i++) {
			
				
				out.println(verifier.getSignerSubject(i));
								
				cert = verifier.getSignerCertificate(i);
				
				ret = cert.VerifyCertificate(cert.getCertPem());
							
				if(ret != 0) {
					out.println(cert.getLastErrorMsg());
				}
				else {
					out.println("인증서 검증 성공");
				}

			}
		}
		
		
		
	}
	%>	
	</pre></strong></td>
</TR>


</TABLE>

<br><br> 


<p align='center'><a href='javascript:history.back();'>이전 페이지로</a></p>
</center>
</body>

