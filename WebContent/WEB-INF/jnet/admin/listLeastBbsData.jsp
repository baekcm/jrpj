<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript">
	$(function(){
		$("a[name=clkSubject]").click(function(){
			var boardSeq = $(this).attr("data");
			var dataSeq = $(this).attr("id");
			$("#boardSeq").val(boardSeq);
			$("#dataSeq").val(dataSeq);
			$("#pageFrm").attr("action","/admin/findBbsData?gseq=3&lseq=0").submit();
		});
	})
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#boardSeq").val("");
		$("#dataSeq").val("");
		$("#pageFrm").attr("action","/admin/listLeastBbsData").submit();
	}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="dataSeq" id="dataSeq" />
	<input type="hidden" name="searchKey" id="searchKey" value="${searchKey }" />
	<input type="hidden" name="searchVal" id="searchVal" value="${searchVal }" />
	<input type="hidden" name="boardSeq" id="boardSeq" />
	<input type="hidden" name="pageNum" id="pageNum" />
</form>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<div class="lnbBody"> 
				<ul id="lnb" class="lnbul">
					<c:if test="${adminInfo.admAuthCode eq 'S' }">
						<c:if test="${gnb != null && fn:length(gnb) > 0 }">
							<c:forEach items="${gnb }" var="gnb">
								<li> 
									<a href="${gnb.menuUrl }?gseq=${gnb.menuSeq}&lseq=0">
										${gnb.menuNm }
									</a>
								</li>
							</c:forEach>
						</c:if>
					</c:if>
					<c:if test="${adminInfo.admAuthCode eq 'O' }">
						<c:if test="${authInfo != null && fn:length(authInfo) > 0 }">
							<c:set var="bbsCnt" value="0" />	
							<c:set var="ctsCnt" value="0" />
							<c:set var="pgmCnt" value="0" />
							<c:set var="ctsMainUrl" value="" />
							<c:set var="pgmMainUrl" value="" />
							<c:set var="bbsMainUrl" value="" />
							<c:forEach items="${authInfo }" var="list">
								<c:if test="${list.menuType eq 'BBS' }">
									<c:if test="${bbsCnt eq 0 }">
										<c:set var="bbsMainUrl" value="/admin/listBbsMng?gseq=3" />
									</c:if>
									<c:set var="bbsCnt" value="${bbsCnt+1 }" />
								</c:if>
								<c:if test="${list.menuType eq 'ACTS' }">
									<c:if test="${ctsCnt eq 0 }">
										<c:set var="ctsMainUrl"  value="${list.menuUrl }?gseq=4" />
									</c:if>								
									<c:set var="ctsCnt" value="${ctsCnt+1 }" />
								</c:if>
								
							</c:forEach>
							<c:if test="${bbsCnt > 0 }">
								<li id="gnb2" >
									<a href="${bbsMainUrl }">
										게시판관리
									</a>
								</li>
							</c:if>
							<c:if test="${ctsCnt > 0 }">
								<li id="gnb2" >
									<a href="${ctsMainUrl }">
										컨텐츠관리
									</a>
								</li>
							</c:if>
							
						</c:if>
						<c:if test="${pgmAuthInfo != null && fn:length(pgmAuthInfo) > 0 }">
							<li id="gnb2" >
								<a href="/admin/listPgmMng?gseq=5">
									프로그램관리
								</a>
							</li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>최근 게시물 목록</h3>
				<p class="navi"></p>
			</div> 
			<div class="contents"> 
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="40px" />
								<col width="140px" />
								<col width="140px" />
								<col width="120px" />
								<col />
								<col width="60px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">시설명</th>
									<th scope="col">제목</th>
									<th scope="col">이름</th>
									<th scope="col">날짜</th>
									<th scope="col">조회</th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${listLeastBbsData != null && fn:length(listLeastBbsData) > 0 }">
									<c:forEach items="${listLeastBbsData }" var="list">
										<tr>
											<td>
												${list.listNo }
											</td>
											<td>
												${list.codeNm }
											</td>
											<td align="center">
												<a style="text-decoration:underline;font-weight: bold;" href="#" data="${list.boardSeq }" id="${list.dataSeq }" name="clkSubject">${list.subject }</a>
											</td>
											<td>
												${list.createNm }
											</td>
											<td>
												${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)}
											</td>
											<td>
												${list.hitnum }
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" align="center">등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
				</div>
				<c:if test="${listLeastBbsData != null && fn:length(listLeastBbsData) > 0 }">
					<!-- board paging --> 
					<div class="pgeAbs mt30"> 
						<p class="paging">${pageIndexList }</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>

</body>
</html>