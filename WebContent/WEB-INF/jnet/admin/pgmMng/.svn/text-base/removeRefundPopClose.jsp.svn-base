<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		<c:choose>
			<c:when test="${flag eq 'Y' }">
				alert("결제취소가 완료되었습니다.");
				var frm = document.frm; 
			    frm.action = '/admin/listRefundMng?gseq=${gseq}&lseq=${lseq}'; 
				opener.parent.name = opener.parent.name || "opener_parent"; 
				frm.target = opener.parent.name; 
				frm.submit(); 
			    window.close(); 
			</c:when>
			<c:otherwise>
				alert("오류발생");
				return;
			</c:otherwise>
		</c:choose>
	})
</script>
</head>
<body>
	<form method="post" name="frm" id="frm">
		<input type="hidden" id="dateGbnCd" name="dateGbnCd" value="${dateGbnCd }"  />
	</form>
</body>
</html>