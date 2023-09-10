<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="xecure.upload.*" %> 
<%@ page import="xecure.conf.*" %> 
<HTML> 
<BODY BGCOLOR="white"> 
<H1>File Information</H1> 
 
<% 
	String fnames = "";
	String efnames = "";
	String sfnames = "";
	int ret = 0;
    try { 
    	FileUploader fileUploader = new FileUploader(application, request, response); 
		Config cfg = new Config(); //�α�, ���ε� ���� ���� ���ؼ� �ʿ��ϴ�.
								   //�ʿ� ������ ������� �ʾƵ� �ȴ�.
		//Default file path�̴�. ���� ������� ���� ��� ���� �н��� �Է��Ͽ� ����� �� �ִ�.
    	String user_home = cfg.getDefaultUploadPath();
	    String uploadPath;
		if ( user_home.charAt(user_home.length()-1) != '/' )
			uploadPath = user_home + "/";
		else
			uploadPath = user_home;
		
		//���ε� �� ���� ����� ��´�.
	    xecure.upload.File [] filelist = fileUploader.getFiles(); 
	    int fileCnt = filelist.length;
	    for(int i=0; i < fileCnt; i++) 
	    { 
	    	//������ ������ �����Ѵ�.
		    xecure.upload.File upfile = filelist[i]; 
			if(upfile.getSize() < cfg.getMaxSize()){
				if(cfg.isAllowed(upfile.getExtention())){
					fnames = fnames + upfile.getName() + ";";
					/* ���ϸ��� �̰����� �ٲپ� ������ �� �ִ�. */
				    java.io.File saveFile = new java.io.File( uploadPath + upfile.getName() ); 
				    FileOutputStream fos = new FileOutputStream(saveFile); 
				    fos.write(upfile.getContents()); 
				    fos.close(); 
				 }
				 else {
				 	efnames = efnames + upfile.getName() + ";";
				 	Log.write( cfg,Log.LOG_INFO,"Rejected : Filename=" + upfile.getName() +",Ext=" + upfile.getExtention());
				 	ret = ret | 0x0001;
				 }
			}
			else {
				sfnames = sfnames  + upfile.getName() + ";";
				Log.write( cfg,Log.LOG_INFO,"Max Size Exceeded : Filename=" + upfile.getName() +",Size=" + upfile.getSize());
				ret = ret | 0x0002;
			}
	    } 
	} 
	catch(FileNotFoundException fnfe) 
	{ 
	    ret = ret | 0x0008;
	}
	catch(IOException ioe) 
	{ 
	    ret = ret | 0x0004;
	}
	
	if(fnames.length() > 0) {
	%>
	Successful! <br> 
	file uplaod �� ���������� �̷�������ϴ�. <br>
	���ε�� ���� ����� �Ʒ��� �����ϴ�.<br>
	<%
	out.println(fnames);
	}
	if((ret & 0x0001) > 0) {
	%>
	<br>
	<br>
	File Upload Failed! <br> 
	������ �ʴ� ������ �����Դϴ�.<br>
	���� ����� �Ʒ��� �����ϴ�.<br>
	<%
	out.println(efnames);
	}
	if((ret & 0x0002) > 0) {
	%>
	<br>
	<br>
	File Upload Failed! <br> 
	�ʹ� ū  �����Դϴ�.<br>
	���� ����� �Ʒ��� �����ϴ�.<br>
	<%
	out.println(sfnames);
	}
	if((ret & 0x0004) > 0) {
	%>
	<br>
	<br>
	File Upload Failed! <br> 
	������ ������ �߻��߽��ϴ�..
	<%
	}
	if((ret & 0x0008) > 0) {
	%>
	File Upload Failed! <br> 
	���� ������ ã�� �� �����ϴ�.
	<%
	}
%> 
 

 
</BODY> 
</HTML> 
