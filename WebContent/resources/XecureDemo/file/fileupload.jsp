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
	file uplaod �� ���������� �̷�������ϴ�. 
	<%
		}
		else if((ret & 0x0001) > 0) {
	%>
	File Upload Failed! <br> 
	������ �ʴ� ������ �����Դϴ�.
	<%
		}
		else if((ret & 0x0002) > 0) {
	%>
	File Upload Failed! <br> 
	�ʹ� ū  �����Դϴ�.
	<%
		}
		else if((ret & 0x0004) > 0) {
	%>
	File Upload Failed! <br> 
	������ ������ �߻��߽��ϴ�..
	<%
		}
		else if((ret & 0x0008) > 0) {
	%>
	File Upload Failed! <br> 
	���� ������ ã�� �� �����ϴ�.
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
