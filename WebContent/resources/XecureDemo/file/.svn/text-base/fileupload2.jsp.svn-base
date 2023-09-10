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
		Config cfg = new Config(); //로그, 업로드 설정 등을 위해서 필요하다.
								   //필요 없으면 사용하지 않아도 된다.
		//Default file path이다. 역시 사용하지 안을 경우 직접 패스를 입력하여 사용할 수 있다.
    	String user_home = cfg.getDefaultUploadPath();
	    String uploadPath;
		if ( user_home.charAt(user_home.length()-1) != '/' )
			uploadPath = user_home + "/";
		else
			uploadPath = user_home;
		
		//업로드 된 파일 목록을 얻는다.
	    xecure.upload.File [] filelist = fileUploader.getFiles(); 
	    int fileCnt = filelist.length;
	    for(int i=0; i < fileCnt; i++) 
	    { 
	    	//각각의 파일을 저장한다.
		    xecure.upload.File upfile = filelist[i]; 
			if(upfile.getSize() < cfg.getMaxSize()){
				if(cfg.isAllowed(upfile.getExtention())){
					fnames = fnames + upfile.getName() + ";";
					/* 파일명은 이곳에서 바꾸어 저장할 수 있다. */
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
	file uplaod 가 성공적으로 이루어졌습니다. <br>
	업로드된 파일 목록은 아래와 같습니다.<br>
	<%
	out.println(fnames);
	}
	if((ret & 0x0001) > 0) {
	%>
	<br>
	<br>
	File Upload Failed! <br> 
	허용되지 않는 종류의 파일입니다.<br>
	파일 목록은 아래와 같습니다.<br>
	<%
	out.println(efnames);
	}
	if((ret & 0x0002) > 0) {
	%>
	<br>
	<br>
	File Upload Failed! <br> 
	너무 큰  파일입니다.<br>
	파일 목록은 아래와 같습니다.<br>
	<%
	out.println(sfnames);
	}
	if((ret & 0x0004) > 0) {
	%>
	<br>
	<br>
	File Upload Failed! <br> 
	저장중 에러가 발생했습니다..
	<%
	}
	if((ret & 0x0008) > 0) {
	%>
	File Upload Failed! <br> 
	설정 파일을 찾을 수 없습니다.
	<%
	}
%> 
 

 
</BODY> 
</HTML> 
