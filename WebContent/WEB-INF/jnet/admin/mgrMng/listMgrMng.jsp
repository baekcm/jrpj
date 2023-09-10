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
		//체크박스 전체 선택
		$("#allChk").click(function(){
			if($("#allChk").prop("checked")) {
				$("input[name=admChk]").prop("checked",true);
			} else {
				$("input[name=admChk]").prop("checked",false);	
			}
		})
		
		//선택삭제
		$("#removeBtn").click(function(){
			if($("input[name=admChk]:checked").size() == 0) {
				alert("삭제할 관리자를 선택해주세요");
				return;
			} else {
				var f = confirm("선택하신 관리자를 삭제하시겠습니까?");
				if(f){
					$("#frm").submit();					
				} else {
					return;
				}
			}
		});
		//관리자 등록페이지 이동
		$("#insertBtn").click(function(){
			location.href="/admin/formCreateMgrMng?gseq=${gseq}&lseq=${lseq}";
		});
		//관리페이지 이동
		$("input[name=mngBtn]").click(function(){
			var admSeq = $(this).attr("data");
			$("#admSeq").val(admSeq);
			$("#pageFrm").attr("action","/admin/formUpdateMgrMng?gseq=${gseq}&lseq=${lseq}").submit();
		}); 
		
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			}
			$("#searchLvl").val($.trim($("#searchLvlSlct").val()));
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#admSeq").val("");
			$("#pageFrm").attr("action","/admin/listMgrMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
	});
	
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#admSeq").val("");
		$("#pageFrm").attr("action","/admin/listMgrMng?gseq=${gseq}&lseq=${lseq}").submit();
	} 
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="admSeq" id="admSeq" />
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="searchLvl" id="searchLvl" value="${searchLvl }" />
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
				<h3>하위관리자 관리</h3>
				<p class="navi"></p>
			</div>
		<div class="contents">
			<div class="pageSection">
				<div class="pageTopSearch">
					<select id="searchLvlSlct">
						<option value="all">전체</option>
						<option value="S"
							<c:if test="${searchLvl eq 'S'}">selected="selected"</c:if>
						>관리자</option>
						<option value="O"
							<c:if test="${searchLvl eq 'O'}">selected="selected"</c:if>
						>운영자</option>
					</select>
					<select id="searchKeySlct">
						<option value="admin_id"
							<c:if test="${searchKey eq 'admin_id'}">selected="selected"</c:if>
						>아이디</option>
						<option value="admin_nm"
							<c:if test="${searchKey eq 'admin_nm'}">selected="selected"</c:if>
						>이름</option>
					</select>
					<input type="text" id="searchValTxt" value="${searchVal }" />
					<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
				</div>
				<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
							<col width="40px" />
							<col width="140px" />
							<col width="120px" />
							<col />
							<col width="140px" />
							<col width="60px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="allChk" /></th>
									<th scope="col">아이디</th>
									<th scope="col">레벨</th>
									<th scope="col">담당자명</th>
									<th scope="col">연락처</th>
									<th scope="col">사용유무</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${listMgrMng != null && fn:length(listMgrMng) > 0 }">
										<form id="frm" action="/admin/removeMgrMng?gseq=${gseq}&lseq=${lseq}" method="post">
											<c:forEach items="${listMgrMng }" var="list">
											<tr align="center">
												<td>
													<c:if test="${list.admId ne 'admin' }">
														<input type="checkbox" name="admChk" value="${list.admSeq }" />
													</c:if>
													&nbsp;
												</td>
												<td>
													${list.admId }
												</td>
												<td>
													<c:choose>
														<c:when test="${list.admType eq 'O' }">
															운영자
														</c:when>
														<c:when test="${list.admType eq 'S' }">
															관리자
														</c:when>
													</c:choose>
												</td>
												<td>
													${list.admNm }
												</td>
												<td>
													<c:if test="${list.admPhone1 != null && list.admPhone1 != '' }">
														${list.admPhone1 } - ${list.admPhone2 } - ${list.admPhone3 } 
													</c:if>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.rmYn eq 'Y' }">사용안함</c:when>
														<c:when test="${list.rmYn eq 'N' }">사용중</c:when>
													</c:choose>
												</td>
												<td>
													<input type="button" data="${list.admSeq }" value="관리" name="mngBtn" />
												</td>
											</tr>
											</c:forEach>
										</form>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7" align="center">등록된 관리자가 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<c:if test="${listMgrMng != null && fn:length(listMgrMng) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					<div class="btn_farm2 mt20 mb20" style="text-align: right;"> 
						<span class="txtBtn_lightGray"><a href="#" id="insertBtn" >관리자등록</a></span> &nbsp; 
						<span class="txtBtn_lightGray"><a href="#" id="removeBtn" >선택삭제</a></span> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>