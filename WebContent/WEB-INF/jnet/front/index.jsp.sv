<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery.bxSlider.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/maintab.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
</head>

<body>
<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
<div id="topheader">
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>

<div id="middle" style="background:url(include/commonfile/image/main/bg_body.gif) 0 0 repeat-x">
	<div id="contbody"> <a href="facil/gumin/index.jsp"><img src="include/commonfile/image/main/fake.png" alt="" usemap="#Map" border="0" /></a>
	<map name="Map" id="Map"><area shape="rect" coords="14,559,296,574" href="/notice/notice_view.jsp" /><area shape="rect" coords="16,535,298,550" href="/notice/notice_view.jsp" /><area shape="rect" coords="16,512,298,527" href="/notice/notice_view.jsp" /><area shape="rect" coords="15,487,297,502" href="/notice/notice_view.jsp" />
		<area shape="rect" coords="219,196,439,295" href="#" />
		<area shape="rect" coords="481,194,587,295" href="http://jongno.park119.co.kr/user/index.aspx" />
		<area shape="rect" coords="592,195,700,295" href="/public/insadong.jsp" />
		<area shape="rect" coords="864,194,950,211" href="/public/insadong.jsp" />
		<area shape="rect" coords="861,219,951,238" href="/public/univstreet.jsp" />
		<area shape="rect" coords="866,242,953,260" href="/public/octagon.jsp" />
		<area shape="rect" coords="16,465,298,480" href="/notice/notice_view.jsp" />
		<area shape="rect" coords="397,430,448,446" href="/notice/notice_list.jsp" />
		<area shape="rect" coords="79,623,132,684" href="http://jongrodes.yesjnet.com:9080/open/minwon_main.jsp" />
		<area shape="rect" coords="197,618,278,685" href="/open/sugest_write.jsp" />
		<area shape="rect" coords="347,623,424,688" href="/open/faq_list.jsp" />
		<area shape="rect" coords="493,623,565,686" href="/open/gallery_list.jsp" />
		<area shape="rect" coords="657,620,731,686" href="/open/clean_write.jsp" />
		<area shape="rect" coords="811,616,923,686" href="/etc/online.jsp" />
	</map>
	</div>
</div>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(0,0,0,0);</script>
</body>
</html>