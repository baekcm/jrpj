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
						<form name="pgtSearch" method="post" action="../jculture/반드시 기입">
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
					
					<div class="tblWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="프로그램별 요일, 시간, 대상, 회비,접수 유무를 나열한 표. " class="tbl01 tdCenter">
							<caption>
							프로그램 리스트
							</caption>
							<colgroup>
							<col style="width:50px;*width:36px;" />
							<col />
							<col style="width:90px;*width:76px;" />
							<col style="width:90px;*width:76px;" />
							<col style="width:80px;*width:66px;" />
							<col style="width:80px;*width:66px;" />
							<col style="width:110px;*width:96px;" />
							</colgroup>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">프로그램명</th>
								<th scope="col">요일</th>
								<th scope="col">시간</th>
								<th scope="col">대상</th>
								<th scope="col">회비</th>
								<th scope="col">접수</th>
							</tr>
							<tr>
								<td>1</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 A</a></td>
								<td>월 수 금</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color01">접수중</strong> (30/40)</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 B</a></td>
								<td>화 목 토</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color03">마감 </strong>(30/40)</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 A</a></td>
								<td>월 수 금</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color01">접수중</strong> (30/40)</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 B</a></td>
								<td>화 목 토</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color03">마감 </strong>(30/40)</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 A</a></td>
								<td>월 수 금</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color01">접수중</strong> (30/40)</td>
							</tr>
							<tr>
								<td>6</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 B</a></td>
								<td>화 목 토</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color03">마감 </strong>(30/40)</td>
							</tr>
							<tr>
								<td>7</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 A</a></td>
								<td>월 수 금</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color01">접수중</strong> (30/40)</td>
							</tr>
							<tr>
								<td>8</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 B</a></td>
								<td>화 목 토</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color03">마감 </strong>(30/40)</td>
							</tr>
							<tr>
								<td>9</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 A</a></td>
								<td>월 수 금</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color01">접수중</strong> (30/40)</td>
							</tr>
							<tr>
								<td>10</td>
								<td><a href="../jculture/culture_view.jsp">06시 해오름 수영 B</a></td>
								<td>화 목 토</td>
								<td>06:00~06:50</td>
								<td>성인남녀</td>
								<td>49,500원</td>
								<td><strong class="point_color03">마감 </strong>(30/40)</td>
							</tr>
						</table>
					</div>
					<!-- board paging -->
					<div class="pgeAbs mt30"> 
						<!--페이징 영역 시작 :프로그램 작성시 현재 페이지는 span에 class로 tp를 추가로 부여하면 현재페이지 처리됨.-->
						<p class="paging"> <span class="prev"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></a></span> <span class="prev mr15"><a href=""><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></a></span> <span class="paging tp first">1</span> <span class="paging"><a href="">2</a></span> <span class="paging"><a href="">3</a></span> <span class="paging"><a href="">4</a></span> <span class="paging"><a href="">5</a></span> <span class="paging"><a href="">6</a></span> <span class="paging"><a href="">7</a></span> <span class="paging"><a href="">8</a></span> <span class="paging"><a href="">9</a></span> <span class="paging"><a href="">10</a></span> <span class="next ml10"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></a></span> <span class="next"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></a></span> </p>
					</div>
					<!-- board paging --> 
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
<script type="text/javascript">initMenu(1,3,2,2);</script>
</body>
</html>