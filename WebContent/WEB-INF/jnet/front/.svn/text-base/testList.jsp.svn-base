<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />

<script type="text/javascript">
	$(function(){
		 $.ajax({
            type:"POST",
            url: "/front/menuUrlList",
            success: function(data){
				$(".boardDiv").html(data);
            },
            error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
        });		

	});
</script>

</head>

<body>
<form action="/front/updateMenuUrl" name="pageFrm" id="pageFrm"  method="post">
<input type="hidden" name="menuSeq" id="menuSeq" />
<input type="hidden" name="menuUrl" id="menuUrl" />
</form>
					<div class ="boardDiv">
					</div>
</body>
</html>