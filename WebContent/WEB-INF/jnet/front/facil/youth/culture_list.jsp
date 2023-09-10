<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
					<div class="pageTopSearch">
						<form name="pgtSearch" method="post" action="../youth/반드시 기입">
							<select name="pgtSchCate" id="pgtSchCate" title="카테고리 선택">
								<option>전체</option>
							</select>
							<select name="pgtSchRange" id="pgtSchRange" title="검색 방법 선택">
								<option>제목</option>
							</select>
							<input type="text" name="pgtSchKwd" id="pgtSchKwd" title="키워드 입력"/>
							<input type="image" alt="검색" id="pgtschBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
						</form>
					</div>
					<!-- Sports & culture list top Search -->
					
					<div class="tblWrap mb20">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="프로그램별 요일, 시간, 대상, 회비,접수 유무를 나열한 표. " class="tbl01 tdCenter">
							<caption>
							프로그램 리스트
							</caption>
							<colgroup>
							<col style="width:150px;*width:136px;" />
							<col style="width:120px;*width:106px;" />
							<col style="width:120px;*width:106px;" />
							<col style="width:120px;*width:106px;" />
							<col style="width:120px;*width:106px;" />
							</colgroup>
							<thead>
							<tr>
								<th scope="col">프로그램명</th>
								<th scope="col">요일</th>
								<th scope="col">시간</th>
								<th scope="col">대상</th>
								<th scope="col">회비(월)</th>
								<th scope="col">강사소개</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td><a href="../youth/culture_view.jsp">헬스 + 월독서실</a></td>
								<td>월~토<br />
									일요일</td>
								<td>06:00~22:50<br />
									09:00~17:50</td>
								<td>청소년 및 일반인</td>
								<td>33,000원</td>
								<td>류경호</td>
							</tr>
							<tr>
								<td><a href="../youth/culture_view.jsp">독서실</a></td>
								<td>월~토<br />
									일요일</td>
								<td>06:00~22:50<br />
									09:00~17:50</td>
								<td>청소년 및 일반인</td>
								<td>15,000원</td>
								<td>총무</td>
							</tr>
							<tr>
								<td><a href="../youth/culture_view.jsp">독서실(일일권)</a></td>
								<td>월~토<br />
									일요일</td>
								<td>06:00~22:50<br />
									09:00~18:00</td>
								<td>청소년 및 일반인</td>
								<td>500원(1일)<br />
									15,000(월)</td>
								<td>총무</td>
							</tr>
							</tbody>
						</table>
					</div>
					<ul class="announce">
						<li>※ (독서실) 개별 삼파장 스탠드 설치 개인사물함 내장형 독서대 완비 실별 냉·난방 시설</li>
						<li>※ (헬스 + 월독서실) 헬스장 : 평 일 : 06:00~22:00 토요일 : 06:00~20:00 </li>
					</ul>
				</div>
				
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq }" />
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(1,5,2,2);</script>
</body>
</html>