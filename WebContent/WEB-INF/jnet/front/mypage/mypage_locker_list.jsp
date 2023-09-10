<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
</head>

<body>
<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
<div id="topheader">
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>
<div id="topVisual">
	<div id="visual"><img src="/resources/include/commonfile/image/visual/visual01.jpg" alt="눈과 귀를 열고 고객만족 1등 공기업을 만들기위해 최선을 다하겠습니다." /> </div>
</div>
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<div class="lnbBody">
				<ul id="lnb" class="lnbul">
					<li></li>
				</ul>
			</div>
			<!--lnb Bottom Icon Area -->
			<%@ include file="/resources/include/commonfile/inc/lnb_bottom.jsp" %>
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<!--  
					<div class="pageTopSearch">
						<form name="pgtSearch" method="post" action="../facil/gumin/반드시 기입">
							<select name="pgtFacil" id="pgtFacil" title="시설명 선택">
								<option>시설관리공단</option>
								<option>올림픽기념국민생활관</option>
								<option>홍길동</option>
								<option>종로문화체육센터</option>
								<option>동부여성문화센터</option>
								<option>청소년문화센터</option>
								<option>삼청테니스장</option>
							</select>
							<select name="kwdtype" id="kwdtype" title="검색방법 선택" class="schSel">
								<option>제목</option>
								<option>내용</option>
							</select>
							<input type="text" name="schKwd" id="schKwd" title="검색어 입력" class="schKwd"  style="width:200px;" />
							<input type="image" alt="검색" id="pgtschBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
						</form>
					</div>
					-->
					<!-- Sports & culture list top Search -->
					
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,회원명,품목명,락카번호,접수일,시작일,종료일,이용금액으로 이루어진 표">
							<caption>
							사물함 내역
							</caption>
							<colgroup>
							<col width="40px" />
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
							<col />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">회원명</th>
									<th scope="col">품목명</th>
									<th scope="col">락카번호</th>
									<th scope="col">접수일</th>
									<th scope="col">시작일</th>
									<th scope="col">종료일</th>
									<th scope="col">이용금액</th>
								</tr>
							</thead>
							<tbody>

								<c:choose>
								<c:when test="${ listLocker != null && fn:length(listLocker) > 0 }">
											<c:forEach items="${ listLocker }" var="list">
												<tr>
													<td>
														${ list.listNo }
													</td>
													<td>
														${ list.userNm }
													</td>
													<td >
														${ list.itemNm }
													</td>
													<td>
														${ list.boxNo }
													</td>
													<td>
														${fn:substring(list.startDt,0,4)}-${fn:substring(list.startDt,4,6)}-${fn:substring(list.startDt,6,8)}
													</td>
													<td>
														${fn:substring(list.lastEndDt,0,4)}-${fn:substring(list.lastEndDt,4,6)}-${fn:substring(list.lastEndDt,6,8)}
													</td>
													<td>
														${fn:substring(list.issueDt,0,4)}-${fn:substring(list.issueDt,4,6)}-${fn:substring(list.issueDt,6,8)}
													</td>
													<td>
														<fmt:formatNumber value="${list.rcvAmt }" pattern="#,###"/>
													</td>
												</tr>
											</c:forEach>  
										</c:when>
								<c:otherwise>
								<tr>
									<td colspan="8" align="center">사물함 내역이 없습니다.</td>
								</tr>
								</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- board paging -->
					
					<c:if test="${listLocker != null && fn:length(listLocker) > 0 }">
						<!-- board paging --> 
						<div class="pgeAbs mt30">
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					<!-- board paging --> 
				</div>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%--@ include file="/resources/include/commonfile/inc/poll.jsp" --%>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(9,1,5,0);</script>
</body>
</html>