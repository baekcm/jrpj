<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/jquery-ui.css"> 
<script type="text/javascript" src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[name=formatBtn]").click(function(){
			$(this).parent().find("input[type=text]").val("");
		});

		$("div.ui-datepicker").hide();
		
		$("#searchBtn").click(function(){
			var qStDtm = $("#qStCreateYmdTxt").val().replace(/-/gi, "");
			var qEdDtm = $("#qEdCreateYmdTxt").val().replace(/-/gi, "");
			
			if(qStDtm == "" && qEdDtm != "") {
				alert("시작일과 종료일 모두 있거나 없어야 합니다.");
				return;
			}
			if(qEdDtm == "" && qStDtm != "") {
				alert("시작일과 종료일 모두 있거나 없어야 합니다.");
				return;	
			}
			
			if(qStDtm > qEdDtm) {
				alert("접수기간조건이 종료일보다 시작일이 더 클수 없습니다.");
				return;
			}
			
			$("#qStCreateYmd").val(qStDtm);
			$("#qEdCreateYmd").val(qEdDtm);
			$("#pageFrm").attr("action","/admin/listCptStats?gseq=${gseq}&lseq=${lseq}").submit();
		});
		
		
		$( "#qStCreateYmdTxt" ).datepicker({
		    dateFormat: 'yy-mm-dd'
	 	});
		$( "#qEdCreateYmdTxt" ).datepicker({
		    dateFormat: 'yy-mm-dd'
	 	});
		
		listPage("${flag}","${qStCreateYmd}","${qEdCreateYmd}");
		
		$("a.tabBtn").click(function(){
			listPage($(this).attr("id"),"${qStCreateYmd}","${qEdCreateYmd}");
			$("#flag").val($.trim($(this).attr("id")));
			$("a.tabBtn").parent().removeClass("choiced");
			$(this).parent().addClass("choiced");
		});
		
		$("#excelBtn").click(function(){
			$("#pageFrm").attr("action","/admin/excelDownCptStat").submit();
		});
	});
	function listPage(flag, stYmd, edYmd){
		$.ajax({
	           type:"POST", 
	           url: "/admin/listCptAjaxStats",
	           data : {"flag" : flag, "qStCreateYmd": stYmd, "qEdCreateYmd" : edYmd},
	           success: function(data){
	        	   $("table.bd00Bbs").html(data);
	        	   mergeRowSpan("mergeTbl",0,"cpt");
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
	<input type="hidden" name="flag" id="flag" value="${flag }" />
	<input type="hidden" name="qStCreateYmd" id="qStCreateYmd" value="${qStCreateYmd }" />
	<input type="hidden" name="qEdCreateYmd" id="qEdCreateYmd" value="${qEdCreateYmd }" />
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
				<h3>민원 통계</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="ttabWrap">
						<ul id="ttab3">
							<li <c:if test="${flag eq 'year' }">class="choiced"</c:if>>
								<a style="text-decoration: none;" href="#" class="tabBtn" id="year">
									연도별
								</a>
							</li>
							<li <c:if test="${flag eq 'answerDate' }">class="choiced"</c:if>>
								<a style="text-decoration: none;" href="#" class="tabBtn" id="answerDate">
									처리기일별
								</a>
							</li>
							<li <c:if test="${flag eq 'area' }">class="choiced"</c:if>>
								<a style="text-decoration: none;" href="#" class="tabBtn" id="area">
									분야별
								</a>
							</li>
							<li <c:if test="${flag eq 'sex' }">class="choiced"</c:if>>
								<a style="text-decoration: none;" href="#" class="tabBtn" id="sex">
									성별
								</a>
							</li>
							<li <c:if test="${flag eq 'happyCall' }">class="choiced"</c:if>>
								<a style="text-decoration: none;" href="#" class="tabBtn" id="happyCall">
									해피콜별
								</a>
							</li>
							<li <c:if test="${flag eq 'status' }">class="choiced"</c:if>>
								<a style="text-decoration: none;" href="#" class="tabBtn" id="status">
									만족도별
								</a>
							</li>
							<li <c:if test="${flag eq 'age' }">class="choiced"</c:if>>
								<a style="text-decoration: none;" href="#" class="tabBtn" id="age">
									연령대별
								</a>
							</li>
						</ul>
					</div>
					<div style="padding-top: 20px;"></div>
					<div class="pageTopSearch">
						접수기간 : 
						<c:choose>
							<c:when test="${qStCreateYmd != null && qStCreateYmd ne '' }">
								<input type="text" id="qStCreateYmdTxt" style="width: 80px" readonly="readonly" value="${fn:substring(qStCreateYmd,0,4)}-${fn:substring(qStCreateYmd,4,6)}-${fn:substring(qStCreateYmd,6,8)}"/>	
							</c:when>
							<c:otherwise>
								<input type="text" id="qStCreateYmdTxt" style="width: 80px" readonly="readonly" />
							</c:otherwise>
						</c:choose>
						~
						<c:choose>
							<c:when test="${qEdCreateYmd != null && qEdCreateYmd ne '' }">
								<input type="text" id="qEdCreateYmdTxt" style="width: 80px" readonly="readonly" value="${fn:substring(qEdCreateYmd,0,4)}-${fn:substring(qEdCreateYmd,4,6)}-${fn:substring(qEdCreateYmd,6,8)}"/>	
							</c:when>
							<c:otherwise>
								<input type="text" id="qEdCreateYmdTxt" style="width: 80px" readonly="readonly" />
							</c:otherwise>
						</c:choose>
						<input type="button" value="초기화" name="formatBtn" />&nbsp;&nbsp;&nbsp;
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표" id="mergeTbl"></table>
					</div>
				</div>
				<div class="btn_farm2 mt20 mb20" style="text-align: right;">
					<span class="txtBtn_lightGray"><a href="#" id="excelBtn" >엑셀다운로드</a></span> &nbsp;
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>