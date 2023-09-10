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
					
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호, 제목, 등록일, 조회수의 게시물의 목록표">
							<caption>
							게시물 리스트
							</caption>
							<colgroup>
							<col width="50px" />
							<col />
							<col width="120px" />
							<col width="60px" />
							<col width="50px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">조회수</th>
									<th scope="col">첨부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>10</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 10월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.02</td>
									<td>1221</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_han.gif" alt="한글문서파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
								<tr>
									<td>9</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 9월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.01</td>
									<td>23</td>
									<td>&nbsp; </td>
								</tr>
								<tr>
									<td>8</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 8월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.02</td>
									<td>323</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_gif.gif" alt="GIF형식 이미지파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
								<tr>
									<td>7</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 7월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.01</td>
									<td>1221</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_excel.gif" alt="액셀형식문서파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
								<tr>
									<td>6</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 6월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.01</td>
									<td>23</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>5</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 5월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.02</td>
									<td>323</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_han.gif" alt="한글문서파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
								<tr>
									<td>4</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 4월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.02</td>
									<td>222</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_han.gif" alt="한글문서파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
								<tr>
									<td>3</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 3월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.02</td>
									<td>222</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_han.gif" alt="한글문서파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
								<tr>
									<td>2</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 2월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.02</td>
									<td>222</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_han.gif" alt="한글문서파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
								<tr>
									<td>1</td>
									<td class="title"><a href="opexpense_view.jsp">2013년 1월 업무추진비집행 내역 공개</a></td>
									<td>2013.11.01</td>
									<td>222</td>
									<td><img src="/resources/include/commonfile/image/board/b_ic_han.gif" alt="한글문서파일(파일 형식 아이콘 별 alt갑 바뀌어야 함)(보고서명 반드시 alt값으로!!)" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- board paging -->
					<div class="pgeAbs mt30"> 
						<!--페이징 영역 시작 :프로그램 작성시 현재 페이지는 span에 class로 tp를 추가로 부여하면 현재페이지 처리됨.-->
						<p class="paging">
                        <span class="prev"><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></span>
                        <span class="prev mr15"><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></span>
                        <span class="paging tp first">1</span>
                        <span class="paging">2</span>
                        <span class="paging">3</span>
                        <span class="paging">4</span>
                        <span class="paging">5</span>
                        <span class="paging">6</span>
                        <span class="paging">7</span>
                        <span class="paging">8</span>
                        <span class="paging">9</span>
                        <span class="paging">10</span>
                        <span class="next ml10"><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></span>
                        <span class="next"><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></span>
                        </p>                        
                        
                        
<!--                        
						<p class="paging"> <span class="prev"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></a></span> <span class="prev mr15"><a href=""><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></a></span> <span class="paging tp first">1</span> <span class="paging"><a href="">2</a></span> <span class="paging"><a href="">3</a></span> <span class="paging"><a href="">4</a></span> <span class="paging"><a href="">5</a></span> <span class="paging"><a href="">6</a></span> <span class="paging"><a href="">7</a></span> <span class="paging"><a href="">8</a></span> <span class="paging"><a href="">9</a></span> <span class="paging"><a href="">10</a></span> <span class="next ml10"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></a></span> <span class="next"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></a></span> </p>
-->    
					</div>
					<!-- board paging --> 
				</div>
				
				<!-- search Box -->
				<!-- search Box --> 
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(6,2,8,0);</script>
</body>
</html>