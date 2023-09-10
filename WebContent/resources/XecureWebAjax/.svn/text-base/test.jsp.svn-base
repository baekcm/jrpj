<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<script language="JavaScript" src="C:\Program Files\Apache Software Foundation\Tomcat 7.0\webapps\ROOT\XecureObject/xecureweb.js"></script>
<script language='javascript'>
PrintObjectTag();
</script>
<script language="JavaScript">

	function createRequest() {
		var request;
		try{
			request = new XMLHttpRequest();
		} catch(exception){
			try{
				alert("Msxml2");
				request = new ActiveXObject('Msxml2.XMLHTTP');
			} catch(innerException){
				alert("Microsoft");
				request = new ActiveXObject('Microsoft.XMLHTTP');
			}
		}
		return request;
	}

function xsend()
{

		var aRequest = createRequest();
		aRequest.onreadystatechange = function (event){
			if(aRequest.readyState == 4){
				if(aRequest.status == 200) {
				}
			}
		};

	var xecurewebParam = "id=" + document.xform.id.value + "&pwd=" + document.xform.pwd.value;	
	alert("xecurewebParam=[" + xecurewebParam + "]");
	
	
	xecurewebParam = "test2.jsp?q=" + encodeURIComponent(xecureEncrypt(xecurewebParam));
	alert("xecurewebParam encodeURIComponent=[" + xecurewebParam + "]");


	//XecureSubmit(document.xform);


	aRequest.open('GET', xecurewebParam, true);
	aRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8');
	aRequest.setRequestHeader("Cache-Control","no-cache, must-revalidate");
	aRequest.setRequestHeader("Pragma","no-cache");
	aRequest.send();

}
</script>
</head>
<body>
<form name="xecure"><input type="hidden" name="p"></form>
<form id="xform" name="xform">
account : <input type="text" id="id" name="id" value="admin"> <br/>
pass : <input type="text" id="pwd" name="pwd"  value="admin"> <br/>
<input type="text" id="xecurewebParam" name="xecurewebParam" />
<input type="button" id="btnQnaSubmit" onClick="xsend();" value="submit" />
</form>
</body>
</html>
