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
<script type="text/javascript" src="/resources/include/commonfile/js/jquery.bxSlider.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/maintab.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/facil_main.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
<script type="text/javascript">


	$(function(){
		//$(document).on("click","a[name=clkSubject]",function(){
	$("dl[name=clkSubject]").click(function(){
			
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			
			$("#pageFrm").attr("action", "/front/notice/notice_view").submit();
		});
	
		$("#ptschBtn").click(function(){
			subMainSearch();
		});
	});
		
		function subMainSearch(){

		
		if($.trim($("#ptschKwd").val())==""){
			alert("검색어를 입력해주세요.");
			$("#ptschKwd").focus();
			return false;
		}
		<c:choose>
			<c:when test="${path eq 'eastcult' }">
				$("#ptsearch").attr("action","/main/search/31").submit();
			</c:when>
			<c:when test="${path eq 'gumin' }">
				$("#ptsearch").attr("action","/main/search/21").submit();
			</c:when>
			<c:when test="${path eq 'jculture' }">
				$("#ptsearch").attr("action","/main/search/41").submit();
			</c:when>
			<c:when test="${path eq 'olympic' }">
				$("#ptsearch").attr("action","/main/search/11").submit();
			</c:when>
			<c:when test="${path eq 'stennis' }">
				$("#ptsearch").attr("action","/main/search/33").submit();
			</c:when>
			<c:when test="${path eq 'youth' }">
				$("#ptsearch").attr("action","/main/search/32").submit();
			</c:when>
		</c:choose>
		
		}
</script>
</head>

<body>

<jsp:include page="/common/facil_index.jsp" />
<c:choose>
	<c:when test="${path eq 'eastcult' }">
		<script type="text/javascript">initMenu(1,4,0,0);</script>
	</c:when>
	<c:when test="${path eq 'gumin' }">
		<script type="text/javascript">initMenu(1,2,0,0);</script>
	</c:when>
	<c:when test="${path eq 'jculture' }">
		<script type="text/javascript">initMenu(1,3,0,0);</script>
	</c:when>
	<c:when test="${path eq 'olympic' }">
		<script type="text/javascript">initMenu(1,1,0,0);</script>
	</c:when>
	<c:when test="${path eq 'stennis' }">
		<script type="text/javascript">initMenu(1,6,0,0);</script>
	</c:when>
	<c:when test="${path eq 'youth' }">
		<script type="text/javascript">initMenu(1,5,0,0);</script>
	</c:when>
</c:choose>
</body>
</html>