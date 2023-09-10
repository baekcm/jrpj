<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단 - 관리자 페이지</title>
<link href="/resources/admin_include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/common_script.js"></script>
<script type="text/javascript">
	var oEditors = [];
	var oEditors2 = [];
	$(function(){ 
		$("input[type=text],input[type=password]").css("height","18px");
		
		<c:choose>
			<c:when test="${adminInfo.admAuthCode eq 'S' }">
				if("${gseq}" == "") {
					$("#topmenu li:eq(0) > a").addClass("fb");
				}else {
					$("#topmenu li:eq(${gseq}) > a").addClass("fb");
				}	
			</c:when>
			<c:otherwise>
				if("${gseq}" == "") {
					$("#topmenu li:eq(0) > a").addClass("fb");
				}else if("${gseq}" == "3") {
					//bbs
					var truefalse = true;
					$("#topmenu li > a").each(function(){
						if($.trim($(this).text()) == "게시판관리"){
							$(this).addClass("fb");
							truefalse = false;
							return false;
						}
					});
				}else if("${gseq}" == "4") {
					//cts
					var truefalse = true;
					$("#topmenu li > a").each(function(){
						if($.trim($(this).text()) == "컨텐츠관리"){
							$(this).addClass("fb");
							truefalse = false;
							return false;
						}
					});
				}else if("${gseq}" == "5") {
					//pgm
					var truefalse = true;
					$("#topmenu li > a").each(function(){
						if($.trim($(this).text()) == "프로그램관리"){
							$(this).addClass("fb");
							truefalse = false;
							return false;
						}
					});
				}else if("${gseq}" == "7") {
					//cpt
					var truefalse = true;
					$("#topmenu li > a").each(function(){
						if($.trim($(this).text()) == "민원관리"){
							$(this).addClass("fb");
							truefalse = false;
							return false;
						}
					});
				}
			</c:otherwise>
		</c:choose>
		
	})
</script>

