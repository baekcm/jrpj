<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript" src="/resources/js/jquery-ui.js"></script> 
<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/jquery-ui.css"> 
<style type="text/css">.ui-datepicker-calendar { display: none !important; }</style>
<script type="text/javascript">
$(function(){
	$('#expiryDate').datepicker( { 
		changeMonth: true,
	    changeYear: true,
	    showButtonPanel: true,
	    dateFormat: 'MM yy',
	    onClose: function(dateText, inst) {
	        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	        var monthNo = parseInt(month) + 1;
	        if(monthNo < 10){
	        	monthNo = "0"+monthNo;
	        }
	        $("#expiryDate").val(year+"년"+monthNo+"월");
	        $("#yymm").val(year+""+monthNo);
	    }
	});
	$("div.ui-datepicker").hide();
	
	$("#searchBtn").click(function(){
		//검색키/값
		if($("#searchKeySlct").val() != "") {
			$("#searchKey").val($("#searchKeySlct").val());
			$("#searchVal").val($("#searchValTxt").val());
		} else {
			$("#searchKey").val("");
			$("#searchVal").val("");
		}
		//사업장
		$("#upId").val($("#commCodeSeq").val());
		$("#pageFrm").attr("action","/admin/listPayMng?gseq=${gseq}&lseq=${lseq}").submit();
	})
})
 function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").attr("action","/admin/listPayMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="upId" id="upId" value="${upId }" />
	<input type="hidden" id="yymm" name="yymm" value="${yymm }"  />
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
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
				<h3>결제 리스트</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						사업장 : 
						<select name="commCodeSeq" id="commCodeSeq">
							<c:if test="${upList != null && fn:length(upList) > 0 }">
								<c:forEach items="${upList }" var="list">
									<option value="${list.codeId }"
										<c:if test="${upId eq list.codeId }">selected="selected"</c:if>
									>${list.codeNm }</option>	
								</c:forEach>
							</c:if>
						</select>
						월별 : 
						<input type="text" id="expiryDate" style="width: 80px;" readonly="readonly" value="${fn:substring(yymm,0,4)}년${fn:substring(yymm,4,6)}월"  />
						
						<select id="searchKeySlct">
							<option value="">전체</option>
							<option value="pgmNm"
								<c:if test="${searchKey eq 'pgmNm' }">selected="selected"</c:if>
							>프로그램명</option>
							<option value="memNm"
								<c:if test="${searchKey eq 'memNm' }">selected="selected"</c:if>
							>이름</option>
						</select>
						<input type="text" id="searchValTxt" value="${searchVal }"   />
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="40px" />
								<col width="100px" />
								<col width="100px" />
								<col width="100px" />
								<col width="80px" />
								<col width="100px" />
							</colgroup>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">사업장</th>
								<th scope="col">프로그램명</th>
								<th scope="col">금액</th>
								<th scope="col">결제일</th>
							</tr>
							<c:choose>
								<c:when test="${listPayMng != null && fn:length(listPayMng) > 0 }">
									<c:forEach items="${listPayMng }" var="list">
										<tr>
											<td>
												${list.listNo }
											</td>
											<td>
												${list.memNm }
											</td>
											<td>
												<c:if test="${upList != null && fn:length(upList) > 0 }">
													<c:forEach items="${upList }" var="upList">
														<c:if test="${upList.codeId eq list.upId  }">
														${upList.codeNm }
														</c:if>
													</c:forEach>
												</c:if>
											</td>
											<td>
												${list.pgmNm }
												<c:if test="${list.cnt > 0 }">
													외 ${list.cnt } 건
												</c:if>
											</td>
											<td>
												<fmt:formatNumber value="${list.amt }" pattern="#,###"/>원
											</td>
											<td>
												${fn:substring(list.issueDt,0,4)}-${fn:substring(list.issueDt,4,6)}-${fn:substring(list.issueDt,6,8)}
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" align="center">결제목록이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							
						</table>
					</div>
					<!-- board paging --> 
					<c:if  test="${listPayMng != null && fn:length(listPayMng) > 0 }">
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>