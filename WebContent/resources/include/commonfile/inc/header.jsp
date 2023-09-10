<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--[if IE 7]><link rel="stylesheet" href="/resources/include/commonfile/css/ie7.css" type="text/css"><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/resources/include/commonfile/css/ie8.css" type="text/css"><![endif]-->
<script type="text/javascript" src="/resources/include/cyber/commonfile/js/jquery.pseudo.js"></script>
<script type="text/javascript">
$(function(){
	var url = document.location.href.split("?")[0];
	if(url.indexOf("localhost") > -1) {
	} else {
		$.ajax({
	        type:"POST", 
	        url: "/front/saveLog",
	        data : {"logUrl" : document.location.href.split("?")[0]},
	        success: function(data){
	        }, 
	        error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});	
	}
	var summary = "";
	$("table.bd00Bbs tr:eq(0) th").each(function(){
		summary += $.trim($(this).text()) + ",";
	});
	summary = summary.substring(0,summary.length-1);
	$("table.bd00Bbs").attr("summary",summary);
	
	
	var summary1 = "";
	$("table.bd00view tr th").each(function(){
		summary1 += $.trim($(this).text()) + ",";
	});
	summary1 = summary1.substring(0,summary1.length-1);
	$("table.bd00view").attr("summary",summary1);
})
</script>