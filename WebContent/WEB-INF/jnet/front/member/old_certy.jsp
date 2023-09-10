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
		$("#ipinAuthBtn").click(function(){
			//if($("#agree").attr("checked")) {
			if(true) {
				//화면 중앙에 팝업 호출		
				var left = (screen.width - 450) / 2;
			    var top = (screen.height - 550) / 2;
				//나이스 아이핀 팝업호출		
				window.open('', 'popupIPIN2', 'width=450, height=550, top='+top+', left='+left+', fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				$("#ipinFrm").attr("target","popupIPIN2").attr("action","https://cert.vno.co.kr/ipin.cb").submit();
			} else {
				alert("약관을 동의하셔야 합니다.");
				return;
			}
		});
		$("#checkAuthBtn").click(function(){
			//if($("#agree").attr("checked")) {
			if(true) {
				//화면 중앙에 팝업 호출		
				var left = (screen.width - 450) / 2;
			    var top = (screen.height - 550) / 2;
				//나이스 아이핀 팝업호출		
				//window.open('', 'popupIPIN2', 'width=450, height=550, top='+top+', left='+left+', fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		    	window.open('', 'popupCheck', 'width=500, height=550,toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top='+top+', left='+left);
				$("#checkFrm").attr("target","popupCheck").attr("action","https://cert.namecheck.co.kr/NiceID2/certpass_input.asp").submit();
				
			} else {
				alert("약관을 동의하셔야 합니다.");
				return;
			}
		});
	});
</script>
</head>

<body>
<!-- 가상주민번호 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="ipinFrm" id="ipinFrm" method="post">
	<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="m" value="pubmain" />						
	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
    <input type="hidden" name="enc_data" value="${ipinInfo.encData }" />	
    <input type="hidden" name="param_r1" value="${adult}">	
</form>
<!-- 가상주민번호 서비스 팝업 페이지에서 사용자가 인증을 받으면 암호화된 사용자 정보는 해당 팝업창으로 받게됩니다.
	 따라서 부모 페이지로 이동하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="vnoform" id="vnoform" method="post">
	<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
	<input type="hidden" name="enc_data" id="encData" />								
	<input type="hidden" name="adult" id="adult" value="${adult}" />								
	<input type="hidden" name="parm" id="parm"  />
	<input type="hidden" name="sDupInfo" id="sDupInfo"  />		
</form>

<form method="post" name="checkFrm" id="checkFrm">
		<input type="hidden" name="enc_data" value="${checkInfo.encData }">
		<input type="hidden" name="RESERVED1" value="${adult}" />		
</form>
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

				<c:if test="${userInfo.userNm eq null || userInfo.userNm eq ''}">
					<div class="mtop mb15"><img src="/resources/include/commonfile/image/member/mtop03.gif" alt="01.회원유형선택, 02.약관동의, 03.본인인증(현재단계), 04.회원정보입력, 05.회원가입완료" /></div>
				</c:if>				
				<div class="pageSection mb30">
					<c:choose>
						<c:when  test="${adult eq 'child'}">
							<h3 class="mb05"><img src="/resources/include/commonfile/image/member/title_join03_03.gif" alt="회원 본인 여부 확인" /></h3>
						</c:when>
						<c:otherwise>
							<h3 class="mb05"><img src="/resources/include/commonfile/image/member/title_join03.gif" alt="회원 본인 여부 확인" /></h3>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${userInfo.userNm ne null && userInfo.userNm ne ''}">
							<p><img src="/resources/include/commonfile/image/member/mhead03_check.gif" alt="종로구 시설관리공단 &quot;본인인증&quot;페이지. 기존회원의 본인여부를 확인합니다. -기존회원의 온라인 회원가입을 위해 본인확인 절차가 필요합니다. 아래 안심체크 인증 또는 아이핀 인증 중에서 선택하세요. - 주민등록법 제 37조(별칙)에 따라 다른 사람의 정보 및 주민등록번호를 부정하게 사용하는 경우 3년 이하의 징역 또는 1천만원 이하의 벌금에 처해지게 됩니다. - 나이스신용평가정보(주)의 본인 확인 서비스를 통해 이루어집니다." /></p>
						</c:when>		
						<c:otherwise>
							<p><img src="/resources/include/commonfile/image/member/mhead03.gif" alt="종로구 시설관리공단 &quot;본인인증&quot;페이지. 회원가입을 위한 본인 여부를확인합니다. -회원여러분의 개인정보보호를 위해 최선을 다하고 있으며, 보다 안전한 서비스 이용을 위하여 회원가입시 본인 확인 절차가 필요합니다. - 주민등록법 제 37조(별칙)에 따라 다른 사람의 정보 및 주민등록번호를 부정하게 사용하는 경우 3년 이하의 징역 또는 1천만원 이하의 벌금에 처해지게 됩니다. - 나이스신용평가정보(주)의 본인 확인 서비스를 통해 이루어집니다." /></p>
						</c:otherwise>		
					</c:choose>					
					
				</div>
				
				
				<div class="memCerti">
					<div class="mcLeft">
						<ul class="guide">
							<li><strong>안심체크 인증</strong>
								<ul>
									<li class="none">주민등록번호를 사용하지 않고 <span class="point_color03"><strong>이름, 생년월일, 성별, <br />
										전화번호, 집주소 </strong></span>등 정보의 진위 확인을 위한
										나이스신용평가정보(주) 화면으로 이동합니다.</li>
								</ul>
							</li>
							<li class="btn"><a href="#"><img src="/resources/include/commonfile/image/member/btn_ansim.gif" id="checkAuthBtn" alt="안심체크 인증" /></a></li>
						</ul>
					</div>
					<div class="mcRight">
						<ul class="guide">
							<li><strong>아이핀(I-pin)인증</strong>
								<ul>
									<li class="none"><span class="point_color03"><strong>아이핀</strong></span>을 이용하여 실명인증을 할 수 있으며 실명 확인을
										위한 나이스신용평가정보(주) 화면으로
										이동합니다.</li>
								</ul>
							</li>
							<li class="btn"><a href="#"><img src="/resources/include/commonfile/image/member/btn_ipin.gif" id="ipinAuthBtn" alt="아이핀(I-pin)인증" /></a></li>
						</ul>
					</div>
				</div>
				<div class="pageSection">
				<img src="/resources/include/commonfile/image/member/text_join03.gif" alt="주의사항(Notice): 아이핀(I-PIN)이란 인터넷에서 주민등록번호를 대체하기 위한 수단으로 아이핀 ID와 PW을 이용하여 실명인증을 할 수 있는 서비스입니다. 아이핀(I-PIN) 인증을 원하거나, 아이핀 ID 신규발급이 필요하신 분은 위쪽 버튼을 눌러서 이용하실 수 있습니다." /> </div>
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

<c:choose>
	<c:when test="${userInfo.userNm ne null && userInfo.userNm ne ''}">
		<script type="text/javascript">initMenu(8,5,0,0);</script>
	</c:when>		
	<c:otherwise>
		<script type="text/javascript">initMenu(8,2,0,0);</script>
	</c:otherwise>		
</c:choose>		

</body>
</html>