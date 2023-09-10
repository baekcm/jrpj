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
	$("#excelBtn").click(function(){
		$("#pageFrm").attr("action","/admin/excelDownSatisStat").submit();
	})
})
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm"></form>

<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>만족도 통계</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표" id="tbl">
							<colgroup>
								<col />
								<col width="100px"  />
								<col width="100px"  />
								<col width="100px"  />
								<col width="100px"  />
								<col width="100px"  />
							</colgroup>
							<thead> 
								<tr>
									<th  rowspan="2" scope="col"  >사이트구분</th>
									<th colspan="5" scope="col">만족도 결과</th>
								</tr>
								<tr>
									<th  scope="col">매우만족</th>
									<th  scope="col">만족</th>
									<th  scope="col">보통</th>
									<th  scope="col">불만족</th>
									<th scope="col">매우불만족</th>
								</tr>
							</thead>
							<c:if test="${listSiteMap != null && fn:length(listSiteMap) > 0 }">
								<c:forEach items="${listSiteMap }" var="list">
									<c:set var="scoreCnt5" value="0" />
									<c:set var="scoreCnt4" value="0" />
									<c:set var="scoreCnt3" value="0" />
									<c:set var="scoreCnt2" value="0" />
									<c:set var="scoreCnt1" value="0" />
									<c:if test="${listSatisFactionStats != null && fn:length(listSatisFactionStats) > 0 }">
										<c:forEach items="${listSatisFactionStats }" var="sublist">
											<c:if test="${list.menuSeq eq  sublist.menuSeq }">
												<c:if test="${sublist.scoreVal eq '5'}">
														<c:set var="scoreCnt5" value="${sublist.scoreCnt }" />
												</c:if>	
												<c:if test="${sublist.scoreVal eq '4'}">
														<c:set var="scoreCnt4" value="${sublist.scoreCnt }" />
												</c:if>
												<c:if test="${sublist.scoreVal eq '3'}">
														<c:set var="scoreCnt3" value="${sublist.scoreCnt }" />
												</c:if>
												<c:if test="${sublist.scoreVal eq '2'}">
														<c:set var="scoreCnt2" value="${sublist.scoreCnt }" />
												</c:if>
												<c:if test="${sublist.scoreVal eq '1'}">
														<c:set var="scoreCnt1" value="${sublist.scoreCnt }" />
												</c:if>
											</c:if>
										</c:forEach>
									</c:if>
									
									<tr>
										<td align="left" style="text-align: left;">
											${list.treeNm1 }  
											<c:if test="${list.treeNm2 != null }">
												> ${list.treeNm2 }
											</c:if>
											<c:if test="${list.treeNm3 != null }">
											> ${list.treeNm3 } 
											</c:if>
											<c:if test="${list.treeNm4 != null }">
											> ${list.treeNm4 }   		
											</c:if>
										</td>
										<td>
											${scoreCnt5 }명
										</td>
										<td>
											${scoreCnt4 }명
										</td>
										<td>
											${scoreCnt3 }명
										</td>
										<td>
											${scoreCnt2 }명
										</td>
										<td>
											${scoreCnt1 }명
										</td>
									</tr>	
								</c:forEach>
							</c:if>
							
						</table>
					</div>
				</div>
				<div class="btn_farm2 mt20 mb20" style="text-align: right;">
					<span class="txtBtn_lightGray"><a href="#" id="excelBtn" >엑셀다운로드</a></span> &nbsp;
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>