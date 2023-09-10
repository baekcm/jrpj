<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.upload.*" %> 
 
<HTML> 
<BODY BGCOLOR="white"> 
<H1>File Information</H1> 
 
<% 
	FileUploader fileUploader = new FileUploader(application, request, response); 
	XecureFileSaver fileSaver = new XecureFileSaver(fileUploader);
	int ret;
	try {
		ret = fileSaver.save();
		if(ret == 0) {
	%>
	Successful! <br> 
	file uplaod 가 성공적으로 이루어졌습니다. 
	<%
		}
		else if((ret & 0x0001) > 0) {
	%>
	File Upload Failed! <br> 
	허용되지 않는 종류의 파일입니다.
	<%
		}
		else if((ret & 0x0002) > 0) {
	%>
	File Upload Failed! <br> 
	너무 큰  파일입니다.
	<%
		}
		else if((ret & 0x0004) > 0) {
	%>
	File Upload Failed! <br> 
	저장중 에러가 발생했습니다..
	<%
		}
		else if((ret & 0x0008) > 0) {
	%>
	File Upload Failed! <br> 
	설정 파일을 찾을 수 없습니다.
	<%
		}
	} catch(IOException ioe) { 
		ioe.printStackTrace();%>		
		<%= ioe.toString(); %>
<%
	} 
%> 
 
</BODY> 
</HTML> 
