<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>

<script type="text/javascript">	
	$(function(){
		
		/* $("a[name=viewLink]").click(function(){
			var empSeq = $(this).attr("id");
			$("#empSeq").val(empSeq);
			$("#pageFrm").attr("action","/admin/formUpdateEmpMng?gseq=${gseq}&lseq=${lseq}").submit();
		});  */
		$("#searchBtn").click(function(){
/* 			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			} */
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#searchVal").val($.trim($("#searchValTxt").val()));
			$("#empSeq").val("");
			$("#pageFrm").attr("action","/front/listEmpPop").submit();
		});
	})
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#empSeq").val("");
		$("#pageFrm").attr("action","/front/listEmpPop").submit();
	}
</script>

</head>

<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="empDept" id="empDept" value="${empDept }"/>
	<input type="hidden" name="empSeq" id="empSeq" />
	<input type="hidden" name="pageNum" id="pageNum" />
</form>
<div class="naviandtitle">
<h3>${empDept }
</h3>
</div>
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
						<div class="fl">
							<select id="searchKeySlct" title="검색 방법 선택">
								<option value="emp_nm"
									<c:if test="${searchKey eq 'emp_nm'}">selected="selected"</c:if>
								>이름</option>
								<option value="emp_part"
									<c:if test="${searchKey eq 'emp_part'}">selected="selected"</c:if>
								>업무</option>
							</select>
							<input type="text" id="searchValTxt" value="${searchVal }" />
							<input type="image" alt="검색" id="searchBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
                      </div>
                      
					</div>
					<!-- Sports & culture list top Search -->
					
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="이름,소속,직위,업무, 연락처의 목록표">
							<caption>
							조직안내 리스트
							</caption>
							<colgroup>
							<col width="110px" />
							<col width="100px" />
							<col width="120px" />
							<col />
							<col width="180px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">이름</th>
									<th scope="col">담당부서</th>
									<th scope="col">직위</th>
									<th scope="col">업무</th>
									<th scope="col">연락처</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${listEmpMng != null && fn:length(listEmpMng) > 0 }">
										<c:forEach items="${listEmpMng }" var="list">
										<tr>
											<td width="10%">
												${list.empNm }
											</td>
											<td width="20%">
												${list.empDept }
											</td>
											<td width="20%">
												${list.empPosition }
											</td>
											<td width="20%" class="title">
												${list.empJob }
											</td>
											<td class="ta_l pl10">
												<c:choose>
													<c:when test="${list.empPhone1 != null && list.empPhone1 != ''}">
														${list.empPhone1 }-${list.empPhone2 }-${list.empPhone3 }	
													</c:when>
												</c:choose>
											</td>
										</tr>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" align="center">등록된 직원이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
					<!-- board paging -->
					<c:if test="${listEmpMng != null && fn:length(listEmpMng) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					<!-- board paging --> 
				</div>
</body>
</html>