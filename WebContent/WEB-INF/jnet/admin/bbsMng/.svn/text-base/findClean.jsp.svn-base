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
			location.href="/admin/listClean?gseq=${gseq}&lseq=${lseq}";
		})
		$("a[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("id");
			$("#cleanFileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
	})
</script>
</head>
<body>
<form method="post" name="downFrm" id="downFrm" action="/admin/downCleanFile">
	<input type="hidden" name="cleanFileSeq" id="cleanFileSeq" />
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
				<h3>클린신고센터 상세보기</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
						<caption>
						분실물습득안내 작성하기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row"><label for="btitle">제목</label></th>
							<td class="bd01td listx">${clean.subject }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="bwriter">작성자</label></th>
							<td class="bd01td"><span class="bd01td listx">
								${clean.userNm }
								</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="blostPlace">연락처</label></th>
							<td class="bd01td"><span class="bd01td listx">
								${clean.phone1 }-${clean.phone2 }-${clean.phone3 }
							</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="blostDate">이메일</label></th>
							<td class="bd01td"><span class="bd01td listx">
								${clean.email1 }@${clean.email2 }
								</span></td>
						</tr>
						<tr>
							<td colspan="2" scope="row" class="bd01tdC">
								${clean.content }
							</td>
						</tr>
						<c:if test="${clean.cleanFileSeq != null && clean.cleanFileSeq > 0 }">
							<tr>
								<th class="ta_l" scope="row"><label for="file01">파일첨부</label></th>
								<td class="bd01td">
										<c:set var="abc" value="${fn:toLowerCase(clean.orgnlFileNm)}" />
										<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
											<c:if test="${status.last }">
												<c:choose>
													<c:when test="${token eq 'hwp' }">
														<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="${clean.orgnlFileNm }" />
													</c:when>
													<c:when test="${token eq 'xls' || token eq 'xlsx' }">
														<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="${clean.orgnlFileNm }" />
													</c:when>
													<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
														<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="${clean.orgnlFileNm }" />	
													</c:when>
													<c:when test="${token eq 'pdf'}">
														<img style="cursor: pointer; width: 23px;height: 23px;" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="${clean.orgnlFileNm }" />	
													</c:when>
													<c:when test="${token eq 'ppt' }">
														<img style="cursor: pointer; width: 16px;height: 16px;"  src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="${clean.orgnlFileNm }" />
													</c:when>
													<c:otherwise>
														<img style="cursor: pointer;width: 20px;height: 20px;" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="${clean.orgnlFileNm}" />
													</c:otherwise>
												</c:choose>
											</c:if>
								        </c:forTokens>
									<a href="#" name="fileDown" id="${clean.cleanFileSeq }">${clean.orgnlFileNm }</a>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#"  id="listBtn">목록으로</a></span> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>