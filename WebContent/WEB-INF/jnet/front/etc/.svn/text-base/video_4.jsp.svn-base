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
					<!-- Year Page Move -->
					<div class="pageTopSearch">
						<div class="fl">
							<form name="pgtschEmpl" method="post" action="video_4.jsp">
								<select name="pgtschgoYear" id="pgtschgoYear" title="이동 기관 선택">
									<option value="1">올림픽기념국민생활관</option>
									<option value="2">종로구민회관</option>
									<option value="3" >종로문화체육센터</option>
									<option value="4" selected="selected">동부여성문화센터</option>
									<option value="5">청소년문화센터</option>
									<option value="6">삼청테니스장</option>
								</select>
								<img alt="이동" id="pgtschBtn" src="/resources/include/commonfile/image/common/btn_gomovep.gif" onclick="javascript:goYear();" />
							</form>
						</div>
						<script type="text/javascript">
			function goYear() {
				var pageName="video_";
				var tmpY=document.pgtschEmpl;
				tmpY=tmpY.pgtschgoYear.value
				pageName = pageName + tmpY + ".jsp";
				window.location.href = pageName;
			}
			</script> 
					</div>
					<!-- Year Page Move --> 
					
					<!-- real Contents --> 
					<!--만족도 조사가 들어갈 영역 -->
					<%@ include file="/resources/include/commonfile/inc/poll.jsp" %>
					<!--만족도 조사가 들어갈 영역 --> 
				</div>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(10,3,0,0);</script>
</body>
</html>