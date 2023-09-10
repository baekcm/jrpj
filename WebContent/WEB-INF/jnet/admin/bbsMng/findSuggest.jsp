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
		$("#listBtn").click(function(){
			location.href="/admin/listSuggest?gseq=${gseq}&lseq=${lseq}";
		});
		$("#statusCd").click(function(){
			var f = confirm("완료처리로 진행됩니다.");
			if(f){
				$("#frm").submit();
			}else {
				return;
			}
		});
		$("a[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("id");
			$("#suggestFileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
	});
</script>
</head>
<body>
<form method="post" name="downFrm" id="downFrm" action="/admin/downSuggestFile">
	<input type="hidden" name="suggestFileSeq" id="suggestFileSeq" />
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
				<h3>고객제안 상세보기</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row"><label for="bwriter">제목</label></th>
							<td class="bd01td"><span class="bd01td listx">
								${suggest.subject }
								</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="bwriter">작성자</label></th>
							<td class="bd01td"><span class="bd01td listx">
								${suggest.userNm }
								</span></td>
						</tr>
						<tr>
						
							<th class="ta_l" scope="row">제안구분</th>
							<td class="bd01td">
								<label for="divsion">
									<input type="radio" name="radio" id="divsion" value="1" disabled="disabled"
									<c:if test="${suggest.suggestGbnCd eq '1' }">checked="checked"</c:if>
								 />
								<strong>공단직원</strong>
								</label> &nbsp; 
								<label for="divsion2">
									<input type="radio" name="radio" id="divsion2" value="2" disabled="disabled"
									<c:if test="${suggest.suggestGbnCd eq '2' }">checked="checked"</c:if>
								 />
								<strong>주민제안</strong></label></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">내용</th>
							<td class="bd01tdD"><ul class="guide">
									<li><strong>개요/목적</strong>
										<p><textarea name="textarea1" cols="70" rows="10" title="개요/목적 입력" disabled="disabled">${suggest.purpose }</textarea></p>
									</li>
									<li><strong>현황/문제점</strong>
										<p><textarea name="textarea2" cols="70" rows="10" title="현황/문제점 입력" disabled="disabled">${suggest.problem }</textarea></p>
									</li>
									<li><strong>개선방안</strong>
										<p><textarea name="textarea3" cols="70" rows="10" title="개선방안 입력" disabled="disabled">${suggest.way }</textarea></p>
									</li>
									<li><strong>기대효과</strong>
										<p><textarea name="textarea3" cols="70" rows="10" title="기대효과 입력" disabled="disabled">${suggest.effect }</textarea></p>
									</li>
								</ul>
							</td>
						</tr>
						<c:if test="${suggest.suggestFileSeq != null && suggest.suggestFileSeq > 0 }">
							<tr>
								<th class="ta_l" scope="row"><label for="file01">파일첨부</label></th>
								<td class="bd01td">
									<c:set var="abc" value="${fn:toLowerCase(suggest.orgnlFileNm)}" />
									<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
										<c:if test="${status.last }">
											<c:choose>
												<c:when test="${token eq 'hwp' }">
													<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="${suggest.orgnlFileNm }" />
												</c:when>
												<c:when test="${token eq 'xls' || token eq 'xlsx' }">
													<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="${suggest.orgnlFileNm }" />
												</c:when>
												<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
													<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="${suggest.orgnlFileNm }" />	
												</c:when>
												<c:when test="${token eq 'pdf'}">
													<img style="cursor: pointer; width: 23px;height: 23px;" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="${suggest.orgnlFileNm }" />	
												</c:when>
												<c:when test="${token eq 'ppt' }">
													<img style="cursor: pointer; width: 16px;height: 16px;"  src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="${suggest.orgnlFileNm }" />
												</c:when>
												<c:otherwise>
													<img style="cursor: pointer;width: 20px;height: 20px;" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="${suggest.orgnlFileNm}" />
												</c:otherwise>
											</c:choose>
										</c:if>
							        </c:forTokens>
									<a href="#" name="fileDown" id="${suggest.suggestFileSeq }">${suggest.orgnlFileNm }</a>
								</td>
							</tr>
						</c:if>
						<tr>
							<th class="ta_l" scope="row">완료처리</th>
							<td class="bd01td">
								<form name="frm" id="frm" method="post" action="/admin/updateSuggest?gseq=${gseq}&lseq=${lseq}">
									<input type="hidden" name="suggestSeq" value="${suggest.suggestSeq }" />
									<input type="checkbox" name="statusCd" id="statusCd" value="C"
										<c:if test="${suggest.statusCd eq 'C' }">disabled="disabled" checked="checked"</c:if>
									/>
								</form>
							</td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button -->
					<span class="txtBtn_lightGray"><a href="#" id="listBtn">목록으로</a></span> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>