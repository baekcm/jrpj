<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/resources/admin_include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript">	
	$(function(){
		$("#selectBtn").click(function(){
			if($("input[name=slctEmp]:checked").size() == 0) {
				alert("담당자를 선택하세요");
				return;
			} else {
				 $("#empSeq", opener.document).val($.trim($("input[name=slctEmp]:checked").val()));
				 $("#empNm", opener.document).val($.trim($("input[name=slctEmp]:checked").parent().next().find("a[name=viewLink]").text()));
				 $("#tmpPhoneNumber", opener.document).text($.trim($("input[name=slctEmp]:checked").parent().next().next().next().next().text()));
				 window.close();
			}
		});
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			}
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#pageFrm").submit();
		});
		$("#closeBtn").click(function(){
			 window.close();
		});
	});
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").submit();
	}
</script>	
</head>
<body>
	<form method="post" name="pageFrm" id="pageFrm" action="/admin/listEmpMngPop">
		<input type="hidden" name="pageNum" id="pageNum" />
		<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
		<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	</form>
	<div class="naviandtitle">
		<h3>담당자 검색</h3>
		<p class="navi"></p>
	</div>
	<div class="pageTopSearch" style="margin-left: 3px;">
		<select id="searchKeySlct">
			<option value="emp_nm"
				<c:if test="${searchKey eq 'emp_nm'}">selected="selected"</c:if>
			>이름</option>
			<option value="emp_dept"
				<c:if test="${searchKey eq 'emp_dept'}">selected="selected"</c:if>
			>부서명</option>
		</select>
		<input type="text" id="searchValTxt" value="${searchVal }" />
		<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
	</div>
	<table width="97.5%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
			<colgroup>
				<col width="40px" />
				<col width="140px" />
				<col width="120px" />
				<col />
				<col width="120px" />
				<col width="120px" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">이름</th>
					<th scope="col">부서명</th>
					<th scope="col">담당업무</th>
					<th scope="col">연락처</th>
					<th scope="col">이메일</th>
				</tr>
			</thead>
	</table>
	<div style="width:100%;
 				height:344px;
				overflow-x:hidden; 
				overflow-y:auto; ">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
			<colgroup>
				<col width="40px" />
				<col width="140px" />
				<col width="120px" />
				<col />
				<col width="120px" />
				<col width="120px" />
			</colgroup>
			<c:choose>
				<c:when test="${listEmpMng != null && fn:length(listEmpMng) > 0 }">
						<c:forEach items="${listEmpMng }" var="list">
						<tr>
							<td >
								<input type="radio" name="slctEmp" value="${list.empSeq }" />
							</td>
							<td >
								<a href="#" id="${list.empSeq }" name="viewLink">${list.empNm }</a>
							</td>
							<td >
								${list.empDept }
							</td>
							<td >
								${list.empJob }
							</td>
							<td>
								<c:if test="${list.empPhone1 != null && list.empPhone1 != '' }">
									${list.empPhone1 } - ${list.empPhone2 } - ${list.empPhone3 }
								</c:if>
							</td>
							<td>
								<c:if test="${list.empEmail1 != null && list.empEmail1 != '' }">
									${list.empEmail1 }@${list.empEmail2 }
								</c:if>
							</td>
						</tr>
						</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" align="center">등록된 직원이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<c:if test="${listEmpMng != null && fn:length(listEmpMng) > 0 }">
		<!-- board paging --> 
		<div class="pgeAbs mt30"> 
			<p class="paging">${pageIndexList }</p>
		</div>
	</c:if>
	<div class="btn_farm2 mt20 mb20" style="text-align: right;"> 
		<span class="txtBtn_lightGray"><a href="#" id="selectBtn" >담당자 선택</a></span> &nbsp;
		<span class="txtBtn_lightGray"><a href="#" id="closeBtn" >닫기</a></span> &nbsp; 
	</div>
</body>
</html>