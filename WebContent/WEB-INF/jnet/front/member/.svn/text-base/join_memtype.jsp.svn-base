<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
</head>

<body>
<div class="accessibility"> <a href="#contentcore">Go to Contents</a> </div>
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
			<jsp:include page="/resources/include/commonfile/inc/lnb_bottom.jsp" />
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<!-- real Contents -->
				<div class="mtop mb15"><img src="/resources/include/commonfile/image/member/mtop01.gif" alt="01.회원유형선택(현재단계), 02.약관동의, 03.본인인증, 04.회원정보입력, 05.회원가입완료" /></div>
				<div class="mtext mb30"><img src="/resources/include/commonfile/image/member/mhead01.gif" width="740" height="182" alt="종로구시설관리공단&quot;회원가입&quot;페이지. 방문을 환영합니다.! 회원으로 가입하시면 프로그램 수강신청/조회,결제조회/환불신청 등 다양한 서비스를 이용하실 수 있습니다." /></div>
				<h3 class="mtitle"><img src="/resources/include/commonfile/image/member/title_join01.gif" width="181" height="23" alt="회원유형 선택" /></h3>
				<div class="mbtn ovh">
					<div class="fl"><img src="/resources/include/commonfile/image/member/btn_maparea1.gif" alt="일반회원/외국인(만14세 이상)" usemap="#Map" border="0" />
						<map name="Map" id="Map">
							<area shape="circle" coords="102,171,68" href="/front/agree2/adult" alt="기존회원가입 (오프라인회원인 경우) 가입하기" />
							<area shape="circle" coords="260,169,68" href="/front/agree/adult" alt="" />
						</map>
					</div>
					<div class="fr"> <img src="/resources/include/commonfile/image/member/btn_maparea2.gif" alt="일반회원/외국인(만14세 이하)" usemap="#Map2" border="0" />
						<map name="Map2" id="Map2">
							<area shape="circle" coords="110,170,69" href="/front/agree2/child" alt="기존회원가입(오프라인회원인 경우) 가입하기" />
							<area shape="circle" coords="268,170,68" href="/front/agree/child" alt="신규회원 가입(홈페이지) 가입하기" />
						</map>
					</div>
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
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(8,2,0,0);</script>
</body>
</html>