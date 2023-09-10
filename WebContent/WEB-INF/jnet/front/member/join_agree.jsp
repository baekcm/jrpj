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
<script type="text/javascript">
	$(function(){
		$("#agreeBtn").click(function(){
			if("${adult}" =="child"){
				if(!$("#agree3").attr("checked")){
					alert("약관을 동의하셔야 합니다.");
					return;
				}
			}
			if($("#agree1").attr("checked") && $("#agree2").attr("checked")){
					$("#agreeFrm").attr("action","/front/certy/online").submit();
				} else {
					alert("약관을 동의하셔야 합니다.");
					return;
				}
		});
	});
</script>
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
				<div class="mtop mb15"><img src="/resources/include/commonfile/image/member/mtop02.gif" alt="01.회원유형선택, 02.약관동의(현재단계), 03.본인인증, 04.회원정보입력, 05.회원가입완료" /></div>
				<div class="pageSection">
					<h4 class="pTitle">종로구시설관리공단 서비스이용약관</h4>
					<iframe src="/etc/if_agree" name="agreement" width="100%" height="260" marginwidth="0" marginheight="0" frameborder="1" scrolling="yes" title="도서관 자동화 시스템 운영규정"></iframe>
					<div class="mt05 pt05 ml05 v_align">
						<label for="checkbox1">
							<input type="checkbox" id="agree1" name="agree1" />
							위의 '이용약관'에 동의합니다. </label>
					</div>
				</div>
				<div class="pageSection">
					<h4 class="pTitle">종로구시설관리공단 개인정보처리방침</h4>
					<iframe  src="/etc/if_private" name="agreement" width="100%" height="260" marginwidth="0" marginheight="0" frameborder="1" scrolling="yes" title="도서관 자동화 시스템 운영규정"></iframe>
					<div class="mt05 mb20 pt05 ml05 v_align">
						<label for="checkbox2">
							<input type="checkbox" id="agree2" name="agree2" />
							위의 '개인정보처리방침'에 동의합니다. </label>
					</div>
				</div>
				<c:if test="${adult eq 'child'}">
					<div class="pageSection">
						<h4 class="pTitle pinkBul">만 14세 이하 회원 가입</h4>
						<div class="mt05 mb20 pt05 ml05 v_align">
							<label for="checkbox3">
								<input type="checkbox" id="agree3" name="agree3" />
								위의 '개인정보처리방침'에 동의합니다. </label>
						</div>
					</div>
				</c:if>
				<p class="btn_farm2 mt20 mb20"> <a href="#"><img id="agreeBtn" src="/resources/include/commonfile/image/member/btn_nextStep.gif" alt="다음단계로" /></a>&nbsp;<a href="#"><img src="/resources/include/commonfile/image/member/btn_cancel.gif"alt="취소" /></a></p>
				
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq }" />
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<form method="post" name="agreeFrm" id="agreeFrm" >
<input type="hidden" id="adult" name="adult" value="${adult}" />
</form>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(8,2,0,0);</script>
</body>
</html>