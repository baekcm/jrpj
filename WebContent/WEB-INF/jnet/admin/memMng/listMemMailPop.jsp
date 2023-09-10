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
		
		$("#allChk").click(function(){
			if($("#allChk").prop("checked")) {
				$("input[name=chkMemSeq]").prop("checked",true);	
			} else {
				$("input[name=chkMemSeq]").prop("checked",false);
			}
		});
		
		$("#selectBtn").click(function(){
			if($("input[name=chkMemSeq]:checked").size() == 0) {
				alert("회원을 선택하세요");
				return;
			} else {
				var tag = "";
				$("input[name=chkMemSeq]:checked").each(function(){
					var memNm = $.trim($(this).parent().next().text());
					var memEmail = $.trim($(this).val());
					if($("#memList", opener.document).find("input[name=memEmail]").size() == 0) {
						tag += '<span>'+memNm+' - '+memEmail+' <input type="hidden" name="memEmailArr" value="'+memEmail+'"/></span>';
						tag += '<span><input type="button" name="tmpRemoveBtn" value="X"/><br/></span>';	
					} else {
						var flag = true;
						$("#memList", opener.document).find("input[name=memEmail]").each(function(){
							if($(this).val() == memEmail) {
								flag = false;
								return false;
							}
						})
						if(flag) {
							tag += '<span>'+memNm+' - '+memEmail+' <input type="hidden" name="memEmailArr" value="'+memEmail+'"/></span>';
							tag += '<span><input type="button" name="tmpRemoveBtn" value="X"/><br/></span>';	
						}
					}
				})
				$("#memList", opener.document).append(tag);
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
	<form method="post" name="pageFrm" id="pageFrm" action="/admin/listMemMailPop">
		<input type="hidden" name="pageNum" id="pageNum" />
		<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
		<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	</form>
	<div class="naviandtitle">
		<h3>회원 검색</h3>
		<p class="navi"></p>
	</div>
	<div class="pageTopSearch" style="margin-left: 3px;">
		<select id="searchKeySlct">
			<option value="user_id"
				<c:if test="${searchKey eq 'user_id'}">selected="selected"</c:if>
			>아이디</option>
			<option value="user_nm"
				<c:if test="${searchKey eq 'user_nm'}">selected="selected"</c:if>
			>이름</option>
		</select>
		<input type="text" id="searchValTxt" value="${searchVal }" />
		<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
	</div>
	<table width="97.5%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
			<colgroup>
				<col width="40px" />
				<col width="140px" />
				<col width="140px" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="allChk" /></th>
					<th scope="col">이름(아이디)</th>
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
				<col width="90px" />
				<col width="318px" />
				<col />
			</colgroup>
			<c:choose>
				<c:when test="${listMember != null && fn:length(listMember) > 0 }">
						<c:forEach items="${listMember }" var="list">
						<tr>
							<td >
								<input type="checkbox" name="chkMemSeq" value="${list.email }" />
							</td>
							<td>
								${list.userNm}(${list.userId })
							</td>
							<td>
								${list.email }
							</td>
						</tr>
						</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3" align="center">등록된 회원이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<c:if test="${listMember != null && fn:length(listMember) > 0 }">
		<!-- board paging --> 
		<div class="pgeAbs mt30"> 
			<p class="paging">${pageIndexList }</p>
		</div>
	</c:if>
	<div class="btn_farm2 mt20 mb20" style="text-align: right;"> 
		<span class="txtBtn_lightGray"><a href="#" id="selectBtn" >추가</a></span> &nbsp;
		<span class="txtBtn_lightGray"><a href="#" id="closeBtn" >닫기</a></span> &nbsp; 
	</div>
</body>
</html>