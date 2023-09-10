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
		$("img[name=touchImg]").click(function(){
			window.open($(this).attr("src").replace(/thumb_/g, ""))
		});
		$("#insertBtn").click(function(){
			location.href = "/admin/formCreateTeacherMng?gseq=${gseq}&lseq=${lseq}";
		});
		$("input[name=editBtn]").click(function(){
			var teacherSeq = $(this).attr("id");
			$("#teacherSeq").val(teacherSeq);
			$("#pageFrm").attr("action","/admin/formUpdateTeacherMng?gseq=${gseq}&lseq=${lseq}").submit();
		}); 
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			}
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#teacherSeq").val("");
			$("#pageFrm").attr("action","/admin/listTeacherMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
		$("#excelBtn").click(function(){
			$("#pageFrm").attr("action","/admin/excelDownTeacherMng").submit();
		});
		
		
		$("#removeBtn").click(function(){
			if($("input[name=teacherSeqChk]:checked").size() == 0) {
				alert("삭제할 강사를 선택하세요");
				return;
			} else {
				var f = confirm("정말 삭제하시겠습니까?");
				if(f){
					var tag = "";
					$("input[name=teacherSeqChk]:checked").each(function(){
						tag += "<input type='text' name='teacherSeqArr' value='"+$(this).val()+"'/>";
					});
					$("#removeFrm").html(tag);
					$("#removeFrm").attr("action","/admin/removeTeacherMng?gseq=${gseq}&lseq=${lseq}").submit();
				} else {
					return;
				}
			}
		});
		
		$("#allChk").click(function(){
			if($("#allChk").prop("checked")) {
				$("input[name=teacherSeqChk]").prop("checked",true);
			} else {
				$("input[name=teacherSeqChk]").prop("checked",false);	
			}
		});
	});
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#teacherSeq").val("");
		$("#pageFrm").attr("action","/admin/listTeacherMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="removeFrm" id="removeFrm"></form>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="teacherSeq" id="teacherSeq" />
	<input type="hidden" name="pageNum" id="pageNum" />
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
				<h3>강사 리스트</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						<select id="searchKeySlct">
							<option value="all">전체</option>
							<option value="teacher_nm"
								<c:if test="${searchKey eq 'teacher_nm'}">selected="selected"</c:if>
							>강사명</option>
						</select>
						<input type="text" id="searchValTxt" value="${searchVal }" />
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="25px" />
								<col width="40px" />
								<col width="100px" />
								<col width="100px" />
								<col width="80px" />
							</colgroup>
							<tr>
								<th scope="col"><input type="checkbox" id="allChk" /> </th>
								<th scope="col">번호</th>
								<th scope="col">사진</th>
								<th scope="col">강사명</th>
								<th scope="col">관리</th>
							</tr>
							<c:choose>
								<c:when test="${listTeacherMng != null && fn:length(listTeacherMng) > 0 }">
										<c:forEach items="${listTeacherMng }" var="list">
										<tr>
											<td>
												<input type="checkbox" name="teacherSeqChk" value="${list.teacherSeq }" />
											</td>
											<td>
												${list.listNo }
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
												<input type="button" id="${list.teacherSeq }" name="editBtn" value="관리" />
											</td>
										</tr>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" align="center">등록된 강사가 존재하지 않습니다.</td>
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
							<span class="txtBtn_lightGray"><a href="#" id="insertBtn" >강사등록</a></span> &nbsp;
							<span class="txtBtn_lightGray"><a href="#" id="removeBtn" >삭제</a></span> &nbsp;
							<c:if test="${listTeacherMng != null && fn:length(listTeacherMng) > 0 }"> 
								<span class="txtBtn_lightGray"><a href="#" id="excelBtn" >엑셀다운로드</a></span> &nbsp;
							</c:if> 
						</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>