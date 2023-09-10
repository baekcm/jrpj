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
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
						<form name="pgtSearch" method="post" action="/open/gallery_list.jsp">
							<select name="pgtFacil" id="pgtFacil" title="시설명 선택">
								<option>시설관리공단</option>
								<option>올림픽기념국민생활관</option>
								<option>종로구민회관</option>
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
					<!-- Sports & culture list top Search -->
					
					<div class="boardWrap">
						<ul id="galleryList" class="galleryList">
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/cam01654.jpg" alt="1이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>매월 격주로 운동하고 있는 혜화 Hans입니다.</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/CAM01655.jpg" alt="2이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>올림픽기념국민생활관</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/cam01689.jpg" alt="3이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>종로구민회관</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/IMG_8276.jpg" alt="4이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>종로문화체육센터</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/cam01691.jpg" alt="5이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>동부문화여성센터</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/SNC10114[0].jpg" alt="6이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>청소년문화센터</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/SNC10118[0].jpg" alt="7이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>삼청테니스장</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/SNC10118[0].jpg" alt="7이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>종로문화체육센터</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/SNC10118[0].jpg" alt="7이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>종로문화체육센터</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><a href="gallery_view.jsp"><img src="/resources/include/commonfile/image/attached/SNC10118[0].jpg" alt="7이미지에 대한 설명을 alt값으로 가지고 있다가, viewDesc에 설명글로 뿌려주어야 함." /></a> </dt>
									<dd>올림픽기념국민생활관</dd>
									<dd>제목은 마음데로 길게 해도 적당한 크기로 잘림</dd>
								</dl>
							</li>
						</ul>
					</div>
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
			<jsp:include page="/front/satfact/${menuSeq}"/>
			<!--만족도 조사가 들어갈 영역 --> 
			
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(4,3,0,0);</script>
</body>
</html>