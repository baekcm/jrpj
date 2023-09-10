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
		
		//직원엑셀파일 일괄등록
		$("#batchBtn").click(function(){
			var fileNm = $.trim($("#batchFile").val().toLowerCase());
			var ext = fileNm.substring(fileNm.lastIndexOf(".")+1);
			if($.trim($("#batchFile").val()) != "")	 {
				if(ext != "xls" && ext != "xlsx")	 {
					alert("엑셀파일만 등록가능합니다.");
					return false;
				}	
			} else {
				alert("엑셀파일을 등록하세요");
				return;
			}
			$("#frm").submit();
		});
		
		//직원등록
		$("#writeBtn").click(function(){
			location.href = "/admin/formCreateEmpMng?gseq=${gseq}&lseq=${lseq}";
		});
		
		//상세보기
		$("a[name=viewLink]").click(function(){
			var empSeq = $(this).attr("id");
			$("#empSeq").val(empSeq);
			$("#pageFrm").attr("action","/admin/formUpdateEmpMng?gseq=${gseq}&lseq=${lseq}").submit();
		}); 
		
		//검색클릭
		$("#searchBtn").click(function(){
			if($("#searchKeySlct").val() == "all") {
				$("#searchVal").val("");
			} else {
				$("#searchVal").val($.trim($("#searchValTxt").val()));	
			}
			$("#empOutYn").val($.trim($("#empOutYnSlct").val()));
			$("#searchKey").val($.trim($("#searchKeySlct").val()));
			$("#empSeq").val("");
			$("#pageFrm").attr("action","/admin/listEmpMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
		
		//엑셀다운로드 클릭
		$("#excelBtn").click(function(){
			$("#pageFrm").attr("action","/admin/excelDownEmpMng").submit();
		});
		
		//직원삭제버튼 클릭
		$("#removeBtn").click(function(){
			if($("input[name=empSeqChk]:checked").size() == 0) {
				alert("삭제할 직원을 선택하세요");
				return;
			} else {
				var f = confirm("정말 삭제하시겠습니까?");
				if(f){
					var tag = "";
					$("input[name=empSeqChk]:checked").each(function(){
						tag += "<input type='hidden' name='empSeqArr' value='"+$(this).val()+"'/>";
					});
					$("#removeFrm").html(tag);
					$("#removeFrm").attr("action","/admin/removeEmpMng?gseq=${gseq}&lseq=${lseq}").submit();
				} else {
					return;
				}
			}
		});
		
		//전체선택
		$("#allChk").click(function(){
			if($("#allChk").prop("checked")) {
				$("input[name=empSeqChk]").prop("checked",true);
			} else {
				$("input[name=empSeqChk]").prop("checked",false);	
			}
		});
		
		$("#sampleDownBtn").click(function(){
			location.href="/admin/empSampleDown";
		});
	})
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#empSeq").val("");
		$("#pageFrm").attr("action","/admin/listEmpMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="removeFrm" id="removeFrm"></form>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="empOutYn" id="empOutYn" value="${empOutYn }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="empSeq" id="empSeq" />
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
				<h3>조직 리스트</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						<select id="searchKeySlct">
							<option value="emp_nm"
								<c:if test="${searchKey eq 'emp_nm'}">selected="selected"</c:if>
							>이름</option>
							<option value="emp_dept"
								<c:if test="${searchKey eq 'emp_dept'}">selected="selected"</c:if>
							>부서명</option>
						</select>
						<select id="empOutYnSlct">
							<option value="all">전체</option>	
							<option value="0"
								<c:if test="${empOutYn eq '0' }">selected="selected"</c:if>	
							>재직중</option>
							<option value="2"
								<c:if test="${empOutYn eq '2' }">selected="selected"</c:if>	
							>휴직중</option>
							<option value="1"
								<c:if test="${empOutYn eq '1' }">selected="selected"</c:if>
							>퇴직</option>
						</select>
						<input type="text" id="searchValTxt" value="${searchVal }" />
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="40px" />
								<col width="40px" />
								<col width="120px" />
								<col width="100px" />
								<col width="80px" />
								<col />
								<col width="120px" />
							</colgroup>
							<tr>
								<th scope="col"><input type="checkbox" id="allChk" /> </th>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">부서명</th>
								<th scope="col">직위</th>
								<th scope="col">담당업무</th>
								<th scope="col">연락처</th>
							</tr>
							<c:choose>
								<c:when test="${listEmpMng != null && fn:length(listEmpMng) > 0 }">
										<c:forEach items="${listEmpMng }" var="list">
										<tr>
											<td>
												<input type="checkbox" name="empSeqChk" value="${list.empSeq }" />
											</td>
											<td width="10%">
												${list.listNo }
											</td>
											<td width="10%">
												<a style="text-decoration:underline;font-weight: bold;" href="#" id="${list.empSeq }" name="viewLink">${list.empNm }</a>
											</td>
											<td width="20%">
												${list.empDept }
											</td>
											<td width="20%">
												${list.empPosition }
											</td>
											<td width="20%">
												${list.empJob }
											</td>
											<td>
												<c:choose>
													<c:when test="${list.empPhone1 != null && list.empPhone1 != ''}">
														${list.empPhone1 } - ${list.empPhone2 } - ${list.empPhone3 }	
													</c:when>
												</c:choose>
											</td>
										</tr>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" align="center">등록된 직원이 존재하지 않습니다.</td>
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
							<form method="post" action="/admin/saveExcelBatch?gseq=${gseq}&lseq=${lseq}" name="frm" id="frm" enctype="multipart/form-data">
								<input type="file" name="batchFile" id="batchFile"/>
								<span class="txtBtn_lightGray"><a href="#" id="batchBtn" >일괄등록</a></span> &nbsp;
							</form>
							<span class="txtBtn_lightGray"><a href="#" id="writeBtn" >개별등록</a></span> &nbsp;
							<span class="txtBtn_lightGray"><a href="#" id="removeBtn" >삭제</a></span> &nbsp;
							<c:if test="${listEmpMng != null && fn:length(listEmpMng) > 0 }">
								<span class="txtBtn_lightGray"><a href="#" id="excelBtn" >엑셀다운로드</a></span> &nbsp;
								<span class="txtBtn_lightGray"><a href="#" id="sampleDownBtn" >샘플양식다운로드</a></span> &nbsp;
							</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>