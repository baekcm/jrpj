<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String pTitle="문화체육시설";
String sTitle="올림픽기념국민생활관";
String sNo="1";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" wml:lang="ko">
<head>
<title><%=pTitle%>-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/msub.css" rel="stylesheet" type="text/css" />
<%@ include file="/resources/include/mobile/inc/header.jsp" %>
</head>

<body>
<div id="header">
	<%@ include file="/resources/include/mobile/inc/top.jsp" %>
	<%@ include file="/resources/include/mobile/inc/submenu1.jsp" %>
	<%@ include file="/resources/include/mobile/inc/navi.jsp" %>
</div>
<div id="body"> 
	<!--real Contents S-->
	<div class="pageIntro">
		<p><strong>※ 분실물은 습득 후 한달 간 보관하며, 그 이후는 자동 처분 됩니다. <br />
			&nbsp; &nbsp;분실자나 찾고자 하시는 분은 안내데스크로 문의 바랍니다 </strong></p>
	</div>
	<div class="pageSection"> 
		<!-- Thumbnail List Board-->
		<ul class="thumbList">
			<li>
				<dl>
					<dd class="photo"><img src="/resources/include/commonfile/image/attached/lostsampl1.jpg" alt="분실물 제목으로 alt값" /></dd>
					<dt><a href="lost_view">명품화 짝퉁가방과 지갑. 지갑속에 포인트 카드 다수.</a></dt>
					<dd class="desc"><strong>습득 및 분실일</strong> : 2013년 8월 26일</dd>
					<dd class="desc"><strong>습득 및 분실장소:</strong> 구민회관 대강당</dd>
					<dd class="desc"><strong>보관유무</strong> : 보관중</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dd class="photo"><img src="/resources/include/commonfile/image/attached/lostsampl3.jpg" alt="분실물 제목으로 alt값" /></dd>
					<dt><a href="lost_view">명품화 짝퉁가방과 지갑. 지갑속에 포인트 카드 다수.</a></dt>
					<dd class="desc"><strong>습득 및 분실일</strong> : 2013년 8월 26일</dd>
					<dd class="desc"><strong>습득 및 분실장소:</strong> 구민회관 대강당</dd>
					<dd class="desc"><strong>보관유무</strong> : 보관중</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dd class="photo"><img src="/resources/include/commonfile/image/attached/lostsampl2.jpg" alt="분실물 제목으로 alt값" /></dd>
					<dt><a href="lost_view">명품화 짝퉁가방과 지갑. 지갑속에 포인트 카드 다수.</a></dt>
					<dd class="desc"><strong>습득 및 분실일</strong> : 2013년 8월 26일</dd>
					<dd class="desc"><strong>습득 및 분실장소:</strong> 구민회관 대강당</dd>
					<dd class="desc"><strong>보관유무</strong> : 보관중</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dd class="photo"><img src="/resources/include/commonfile/image/attached/lostsampl1.jpg" alt="분실물 제목으로 alt값" /></dd>
					<dt><a href="lost_view">명품화 짝퉁가방과 지갑. 지갑속에 포인트 카드 다수.</a></dt>
					<dd class="desc"><strong>습득 및 분실일</strong> : 2013년 8월 26일</dd>
					<dd class="desc"><strong>습득 및 분실장소:</strong> 구민회관 대강당</dd>
					<dd class="desc"><strong>보관유무</strong> : 보관중</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dd class="photo"><img src="/resources/include/commonfile/image/attached/lostsampl2.jpg" alt="분실물 제목으로 alt값" /></dd>
					<dt><a href="lost_view">명품화 짝퉁가방과 지갑. 지갑속에 포인트 카드 다수.</a></dt>
					<dd class="desc"><strong>습득 및 분실일</strong> : 2013년 8월 26일</dd>
					<dd class="desc"><strong>습득 및 분실장소:</strong> 구민회관 대강당</dd>
					<dd class="desc"><strong>보관유무</strong> : 보관중</dd>
				</dl>
			</li>
		</ul>
		<!-- Thumbnail List Board--> 
		<!-- board paging -->
		<div class="pgeAbs mt30"> 
			<!--페이징 영역 시작 :프로그램 작성시 현재 페이지는 span에 class로 tp를 추가로 부여하면 현재페이지 처리됨.-->
			<p class="paging"> <span class="prev"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></a></span> <span class="prev mr15"><a href=""><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></a></span> <span class="paging tp first">1</span> <span class="paging"><a href="">2</a></span> <span class="paging"><a href="">3</a></span> <span class="paging"><a href="">4</a></span> <span class="paging"><a href="">5</a></span> <span class="paging"><a href="">6</a></span> <span class="paging"><a href="">7</a></span> <span class="paging"><a href="">8</a></span> <span class="paging"><a href="">9</a></span> <span class="paging"><a href="">10</a></span> <span class="next ml10"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></a></span> <span class="next"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></a></span> </p>
			<div class="frBtn"> 
				<!-- Text Button --> 
				<!--<span class="txtBtn_Gray"><a href="../olympic/lost_write.jsp" >글쓰기</a></span> --> 
				<!-- Text Button --> 
			</div>
		</div>
		<!-- board paging --> 
		<!-- search Box -->
		<div id="pageSearch">
			<p>
				<select name="kwdtype" id="kwdtype" title="검색방법 선택" class="schSel">
					<option>제목</option>
					<option>내용</option>
				</select>
				<input type="text" name="schKwd" id="schKwd" title="검색어 입력" class="schKwd"  style="width:200px;" />
				<input type="button" class="inputBtn_Gray" value="검색" title="검색" />
			</p>
		</div>
		<!-- search Box -->
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
