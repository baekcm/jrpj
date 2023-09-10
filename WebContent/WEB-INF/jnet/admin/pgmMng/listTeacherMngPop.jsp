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
		$("#allChk").click(function(){
			if($("#allChk").prop("checked")) {
				$("input[name=chkTeacherSeq]").prop("checked",true);	
			} else {
				$("input[name=chkTeacherSeq]").prop("checked",false);
			}
		});
		$("#selectBtn").click(function(){
			if($("input[name=chkTeacherSeq]:checked").size() == 0) {
				alert("강사를 선택하세요");
				return;
			} else {
				var tag = "";
				$("input[name=chkTeacherSeq]:checked").each(function(){
					var teacherNm = $.trim($(this).parent().next().next().text());
					var teacherSeq = $.trim($(this).val());
					if($("#tempData", opener.document).find("input[name=teacherSeqArr]").size() == 0) {
						tag += '<span>'+teacherNm+' 강사<input type="hidden" name="teacherSeqArr" value="'+teacherSeq+'"/></span>';
						tag += '<span><input type="button" name="tmpRemoveBtn" value="X"/><br/></span>';	
					} else {
						var flag = true;
						$("#tempData", opener.document).find("input[name=teacherSeqArr]").each(function(){
							if($(this).val() == teacherSeq) {
								flag = false;
								return false;
							}
						})
						if(flag) {
							tag += '<span>'+teacherNm+' 강사<input type="hidden" name="teacherSeqArr" value="'+teacherSeq+'"/></span>';
							tag += '<span><input type="button" name="tmpRemoveBtn" value="X"/><br/></span>';	
						}
					}
				})
				$("#tempData", opener.document).append(tag);
				 window.close();
			}
		});	
		
		$("#closeBtn").click(function(){
			 window.close();
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
	});
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").submit();
	}
</script>	
</head>
<body>
	<form method="post" name="pageFrm" id="pageFrm" action="/admin/listTeacherMngPop">
		<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
		<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
		<input type="hidden" name="pageNum" id="pageNum" />
	</form>
	<div class="naviandtitle">
		<h3>강사 검색</h3>
		<p class="navi"></p>
	</div>
	<div class="pageTopSearch" style="margin-left: 3px;">
		<select id="searchKeySlct">
			<option value="all">전체</option>
			<option value="teacher_nm"
				<c:if test="${searchKey eq 'teacher_nm'}">selected="selected"</c:if>
			>강사명</option>
		</select>
		<input type="text" id="searchValTxt" value="${searchVal }" />
		<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
	</div>
	<table width="97.5%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
			<colgroup>
				<col width="80px" />
				<col width="100px" />
				<col  />
				<col width="130px" />
				<col width="130px" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="allChk" /></th>
					<th scope="col">사진</th>
					<th scope="col">강사명</th>
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
				<col width="80px" />
				<col width="100px" />
				<col  />
				<col width="130px" />
				<col width="130px" />
			</colgroup>
			<c:choose>
				<c:when test="${listTeacherMng != null && fn:length(listTeacherMng) > 0 }">
						<c:forEach items="${listTeacherMng }" var="list">
						<tr>
							<td>
								<input type="checkbox" name="chkTeacherSeq" value="${list.teacherSeq }" />
							</td>
							<td>
								<c:choose>
									<c:when test="${list.imgPath != null && list.imgPath != ''  }">
										<img src="${list.imgPath }${list.realFileNm }" name="touchImg" style="cursor: pointer;"/>
									</c:when>
									<c:otherwise>
										<img src="/resources/admin_include/commonfile/image/common/no_img.gif" style="width: 100px;height: 100px;" />
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								${list.teacherNm }
							</td>
							<td>
								<c:if test="${list.teacherPhone1 != null && list.teacherPhone1 != '' }">
									${list.teacherPhone1 } - ${list.teacherPhone2 } - ${list.teacherPhone3 }
								</c:if>
							</td>
							<td>
								<c:if test="${list.teacherEmail1 != null && list.teacherEmail1 != '' }">
									${list.teacherEmail1 }@${list.teacherEmail2 }
								</c:if>
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
		</table>
	</div>
	<c:if test="${listTeacherMng != null && fn:length(listTeacherMng) > 0 }">
		<!-- board paging --> 
		<div class="pgeAbs mt30"> 
			<p class="paging">${pageIndexList }</p>
		</div>
	</c:if>
	<div class="btn_farm2 mt20 mb20" style="text-align: right;"> 
		<span class="txtBtn_lightGray"><a href="#" id="selectBtn" >강사 선택</a></span> &nbsp; 
		<span class="txtBtn_lightGray"><a href="#" id="closeBtn" >닫기</a></span> &nbsp;
	</div>
</body>
</html>