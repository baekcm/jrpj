<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String base_url = "";

String reqUrl = request.getRequestURL()+"";

if(reqUrl.indexOf("m.ijongno.co.kr") > -1) {
	base_url = "/m/index";
} else if(reqUrl.indexOf("localhost") > -1) {
	base_url = "http://localhost/main";
} else if(reqUrl.indexOf("203.251.159.149") > -1){
	base_url = "http://203.251.159.149/main";
} else {
	base_url = "http://www.ijongno.co.kr/main";
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>종로구시설관리공단</title>
<script type="text/javascript">
	location.href="<%= base_url%>";
</script>
</head>
</html>