<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page buffer="16kb" %>
<%@ page import="xecure.servlet.*" %>
<%@ page import="xecure.crypto.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body bgcolor="#FFFFFF" >

<%
	String pem=null;

	pem = "-----BEGIN CERTIFICATE-----\n";
	pem += "MIID6DCCA1GgAwIBAgICAbYwDQYJKoZIhvcNAQEFBQAwSDELMAkGA1UEBhMCa3Ix\n";
	pem += "EjAQBgNVBAoTCVNvZnRmb3J1bTEPMA0GA1UECxMGQXBwRGV2MRQwEgYDVQQDEwtY\n";
	pem += "ZWN1cmVQS0k1MTAeFw0wNTA3MjUwNjE0NTRaFw0xMDA0MjYwODUzMjVaMGYxCzAJ\n";
	pem += "BgNVBAYTAmtyMRgwFgYDVQQKDA/sg4Hsl4Xrk7HquLDshowxDzANBgNVBAsTBkFw\n";
	pem += "cERldjEsMCoGA1UEAwwjMjAwNTA3MjV4Y2EwMSgt7KeB6riJKTIwMDUwNzI1eGNh\n";
	pem += "MDEwgZ4wDQYJKoZIhvcNAQEBBQADgYwAMIGIAoGAd44hGkKGOocG6WnGlKSEj2Q1\n";
	pem += "T4C+PKKd6GG/ZucgebGovcyUBkSexcqQXSYiH3sK/89v5jd7gSNCQIEwQsoK3ddP\n";
	pem += "ufMge7I7B1O9K1ewi4oQI9mIrFjZwqmVFYoVnXcYQq+5KQnqUw+pB5YylzC9ej8k\n";
	pem += "pkdKu2gvXGnBSb8BMakCAwEAAaOCAcIwggG+MB8GA1UdIwQYMBaAFK7JiHSv5iYy\n";
	pem += "jfy33SnoRZXYiypTMB0GA1UdDgQWBBQNi7Oca/MmRhHW7/77Mz3pGICzyTAOBgNV\n";
	pem += "HQ8BAf8EBAMCB4AwZAYDVR0gAQH/BFowWDBWBgsqgxqGjSEFBwFlAjBHMBcGCCsG\n";
	pem += "AQUFBwICMAsaCXNpZ25hdHVyZTAsBggrBgEFBQcCARYgaHR0cDovL3d3dy5zb2Z0\n";
	pem += "Zm9ydW0uY29tL2Nwcy5odG0wDAYDVR0TAQH/BAIwADAPBgNVHSQECDAGgAEBgQEA\n";
	pem += "MGMGA1UdHwRcMFowWKBWoFSGUmxkYXA6Ly8xOTIuMTY4LjEwLjI1OjM4OS9jbj1j\n";
	pem += "YSwgbz1zb2Z0Zm9ydW0sIGM9a3I/Y2VydGlmaWNhdGVSZXZvY2F0aW9ubGlzdDti\n";
	pem += "aW5hcnkwEQYJYIZIAYb4QgEBBAQDAgWgMB0GCiqDGoaNIQUHZQEEDxMNMjAwNTA3\n";
	pem += "MjV4Y2EwMTAdBgoqgxqGjSEFB2UCBA8MDTIwMDUwNzI1eGNhMDEwFgYKKoMaho0h\n";
	pem += "BQdlAwQIDAbsp4HquIkwGQYKKoMaho0hBQdlBAQLDAnquLTrspXsnbgwDQYJKoZI\n";
	pem += "hvcNAQEFBQADgYEAQb57tjoHrTU4s/4WBSsigo2TFpWKDkIL2AsIIck4s6aJUVr+\n";
	pem += "IR9fIyXHFQD9CE5Xo5+F7jVq5BvsK8ca68BJaCTBqBrxePo2M5JNMv45/21yKCwb\n";
	pem += "vpUYHx2IOXrRJ/TE49g92FkS7yowMYFbaA/1EP/DOiRnyPoojc9NSG1mI48=\n";
	pem += "-----END CERTIFICATE-----\n";
/*
	pem = "-----BEGIN CERTIFICATE-----\n";
	pem += "MIIDszCCAxygAwIBAgIBGTANBgkqhkiG9w0BAQUFADBIMQswCQYDVQQGEwJrcjES\n";
	pem += "MBAGA1UEChMJU29mdGZvcnVtMQ8wDQYDVQQLEwZBcHBEZXYxFDASBgNVBAMTC1hl\n";
	pem += "Y3VyZVBLSTUxMB4XDTA1MDUwMzAyMzAzMVoXDTEwMDQyNjA4NTMyNVowRjELMAkG\n";
	pem += "A1UEBhMCa3IxEjAQBgNVBAoTCVNvZnRmb3J1bTEPMA0GA1UECxMGQXBwRGV2MRIw\n";
	pem += "EAYDVQQDDAnquYDtmITrj4gwgZ4wDQYJKoZIhvcNAQEBBQADgYwAMIGIAoGAUQ9m\n";
	pem += "TNrAFG7vsie0V3qHkAg9PipRpih0Tby9sDlnUJWwswuQyWvL64ZzcLIzxAB5ir8u\n";
	pem += "dQWyieHJaB3brsHTakqMHR06pFp1jXsQzHZeQ2GUWJ3j3t+x2dJWYmFPy+qv/dM1\n";
	pem += "Bc1/RT4Mu8ay6vQ7q6lOPxrgt9Z7SW3L4XVSh+kCAwEAAaOCAa4wggGqMB8GA1Ud\n";
	pem += "IwQYMBaAFK7JiHSv5iYyjfy33SnoRZXYiypTMB0GA1UdDgQWBBSsPjiXU78np26O\n";
	pem += "ZIy59jG0Py+gUzAOBgNVHQ8BAf8EBAMCB4AwfgYDVR0RBHcwdYEUeGluZ3JpQHNv\n";
	pem += "ZnRmb3J1bS5jb22gXQYJKoMajJpECgEBoFAwTgwZ7IaM7ZSE7Yq47Y+s65+8Leq5\n";
	pem += "gO2YhOuPiDAxMC8GCiqDGoyaRAoBAQEwITAHBgUrDgMCGqAWBBQtO6tith7JOEhZ\n";
	pem += "Q7nS10MySGTh3jAMBgNVHRMBAf8EAjAAMGMGA1UdHwRcMFowWKBWoFSGUmxkYXA6\n";
	pem += "Ly8xOTIuMTY4LjEwLjI1OjM4OS9jbj1jYSwgbz1zb2Z0Zm9ydW0sIGM9a3I/Y2Vy\n";
	pem += "dGlmaWNhdGVSZXZvY2F0aW9ubGlzdDtiaW5hcnkwEQYJYIZIAYb4QgEBBAQDAgWg\n";
	pem += "MBkGCiqDGoaNIQUHZQEECxMJNjU0NTM2NDU2MBkGCiqDGoaNIQUHZQIECwwJ6rmA\n";
	pem += "7ZiE64+IMBwGCiqDGoaNIQUHZQMEDgwM64yA7ZGc7J207IKsMA0GCSqGSIb3DQEB\n";
	pem += "BQUAA4GBAFUPedx7Ezi9e8kFXyZogs5T0sH3d3iMyz0coZf2ZNyzCxAzwsRh6tfs\n";
	pem += "4AB4fPGKJhNrTBjwDwU5Mzo/TbkLFJVFEyJNfVXV4BvBvyE+jVAoMU+wekq88jNd\n";
	pem += "s4o91atEZsyUrRMhRYn2V5uJFWa8E5ASrRtTpbhN/xKQDQ8hSPL0\n";
	pem += "-----END CERTIFICATE-----\n";
*/
	Certificate user_cert = null;

	user_cert = new Certificate ( new XecureConfig(), pem );

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
		<br>
		RegisteredNumber : <%=user_cert.getRegisteredNumber()%><br>
		RepresentativeName : <%=user_cert.getRepresentativeName()%><br>
		RepresentativeTitle : <%=user_cert.getRepresentativeTitle()%><br>
		CorporationName : <%=user_cert.getCorporationName()%><br>
<%
	}
%>
</body>
</html>
