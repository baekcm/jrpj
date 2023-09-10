<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript">
	$(function(){
		listPage(1,"","");
		
		$(document).on("click","input[name=mngBtn]",function(){
			var menuSeq = $(this).attr("data");
			$("#menuSeq").val(menuSeq); 
			$("#pageFrm").attr("action","/admin/formUpdateCtsMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
		 
		$("#searchKeySlct").change(function(){
			if($(this).val() == "menu_cat") {
				$("#searchValTxt").hide();
				listDepthCat(1);
			} else {
				$("#searchValTxt").show();
				$("select[name=changeDeptSlct]").remove();
			}
		});
		$(document).on("change","select[name=changeDeptSlct]",function(){
			var idx = $("select[name=changeDeptSlct]").index(this);
			if($(this).val() != "") {
				listDepthCat(idx+2,$(this).val());	
			} else {
				for(var i=(idx+1); i<$("select[name=changeDeptSlct]").size(); i++){
					$("select[name=changeDeptSlct]:eq("+i+")").remove();
				}
			}
		});
		
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "menu_nm") {
				listPage(1,$("#searchKeySlct").val(),$.trim($("#searchValTxt").val()));	
			} else {
				var prntMenuSeq = 0;
				var menuSeq = 0;
				if($("select[name=changeDeptSlct]:last").val() == "") {
					prntMenuSeq = $("select[name=changeDeptSlct]:last").prev().val();
					menuSeq = 0; 
				}else {
					prntMenuSeq = 0;
					menuSeq = $("select[name=changeDeptSlct]:last").val();
				}
				
				if($("select[name=changeDeptSlct]").size() > 1) {
					listPage(1,$("#searchKeySlct").val(),$.trim($("#searchValTxt").val()),menuSeq,prntMenuSeq);	
				} else {
					alert("1depth 이상의 카테고리를 선택하세요");
					return;
				}
				
			}
		});
	});
	function setPage(pageNo){
		listPage(pageNo,"","");
	}
	
	function listDepthCat(menuLvl,menuSeq){
		$.ajax({
	           type:"POST", 
	           url: "/admin/listDepthCat",
	           data : {"menuLvl" : menuLvl,"menuSeq":menuSeq},
	           dataType : "json",
	           success: function(data){
	        	   if(data != undefined && data.listDepthCat != null && data.listDepthCat != ''){
			  		   	 var slctTag = "<select name='changeDeptSlct'>";
			  		   	     slctTag+="<option value=''>선택</option>";
			  		   	   $.each(data.listDepthCat,function(idx,val){
			  	 	   				slctTag+="<option value='"+val.menuSeq+"'>"+val.menuNm+"</option>";
			  		   	   });
			  		   	   slctTag+="</select>";
			  		   	 if($("select[name=changeDeptSlct]").size() == 0) {
			  		   			$("#searchKeySlct").after(slctTag);	 
			  		   	 } else {
			  		   		 if(menuLvl == 2) {
			  		   			$("select[name=changeDeptSlct]:eq(3)").remove();
			  		   			$("select[name=changeDeptSlct]:eq(2)").remove();
			  		   			$("select[name=changeDeptSlct]:eq(1)").remove();	 
			  		   		 } else if(menuLvl == 3) {
			  		   			$("select[name=changeDeptSlct]:eq(3)").remove();
			  		   			$("select[name=changeDeptSlct]:eq(2)").remove();	 
			  		   		 } else if(menuLvl == 4) {
			  		   			$("select[name=changeDeptSlct]:eq(3)").remove();	 
			  		   		 }
			  		   		$("select[name=changeDeptSlct]:last").after(slctTag);
			  		   	 }
	        	   } else {
	        		   if(menuLvl == 2) {
		  		   			$("select[name=changeDeptSlct]:eq(3)").remove();
		  		   			$("select[name=changeDeptSlct]:eq(2)").remove();
		  		   			$("select[name=changeDeptSlct]:eq(1)").remove();	 
		  		   		 } else if(menuLvl == 3) {
		  		   			$("select[name=changeDeptSlct]:eq(3)").remove();
		  		   			$("select[name=changeDeptSlct]:eq(2)").remove();	 
		  		   		 } else if(menuLvl == 4) {
		  		   			$("select[name=changeDeptSlct]:eq(3)").remove();	 
		  		   		 }
	        	   }
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
	}
	
	function listPage(pageNo, searchKey, searchVal,menuSeq,prntMenuSeq){
		$.ajax({
	           type:"POST", 
	           url: "/admin/listAjaxCtsMng",
	           data : {"pageNum" : pageNo,"searchKey" : searchKey,"searchVal" : searchVal,"menuSeq":menuSeq,"prntMenuSeq":prntMenuSeq},
	           success: function(data){
	        	   $("#appendTbl").html(data);
	        	   if($.trim($("#pagingTag").val()) != "" && $("#cnt").val() != "undefined" || $("#cnt").val() != "0"){
	        		   $("p.paging").html($.trim($("#pagingTag").val()));
	        	   }
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
	}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="menuSeq" id="menuSeq" />
</form>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>컨텐츠리스트</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						<select id="searchKeySlct">
							<option value="menu_nm">메뉴명</option>
							<option value="menu_cat">메뉴카테고리</option>
						</select>
						<input type="text" id="searchValTxt" value="${searchVal }" />
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appendTbl" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표"></table>
					</div>
					<div class="pgeAbs mt30">
						<p class="paging"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>