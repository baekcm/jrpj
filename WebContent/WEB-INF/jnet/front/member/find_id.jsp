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
				//$("#param_r1").val($("#userNm").val());
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
				
				$.ajax({
			           type:"POST",
			           url: "/front/findCertyPopup",
			           dataType : "json",
			           data:  {"userNm" : $("#userNm").val(), "userId" : $("#userId").val()},
			           success: function(data){
			        	   var left = (screen.width - 450) / 2;
						    var top = (screen.height - 550) / 2;
							//나이스 아이핀 팝업호출		
							$("#enc_data1").val(data.checkInfo);
					    	window.open('', 'popupCheck', 'width=500, height=550,toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top='+top+', left='+left);
							$("#checkFrm").attr("target","popupCheck").attr("action","https://cert.namecheck.co.kr/NiceID2/certpass_input.asp").submit();
			           },
			           error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
			     });
				
				
			} else {
				alert("약관을 동의하셔야 합니다.");
				return;
			}
		});
/* 		$("#checkAuthBtn").click(function(){
			//if($("#agree").attr("checked")) {
			if(true) {
				//화면 중앙에 팝업 호출		
				var left = (screen.width - 450) / 2;
			    var top = (screen.height - 550) / 2;
				//나이스 아이핀 팝업호출		
				$("#RESERVED1").val($("#userNm").val());
		    	window.open('', 'popupCheck', 'width=500, height=550,toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top='+top+', left='+left);
				$("#checkFrm").attr("target","popupCheck").attr("action","https://cert.namecheck.co.kr/NiceID2/certpass_input.asp").submit();
				
			} else {
				alert("약관을 동의하셔야 합니다.");
				return;
			}
		}); */
	})

</script>


</head>

<body>

<form name="ipinFrm" id="ipinFrm" method="post" >
	<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="m" value="pubmain" />						
	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
    <input type="hidden" name="enc_data" value="${ipinInfo.encData }" />
    <input type="hidden" name="param_r1"  id="param_r1" />	
</form>
<!-- 가상주민번호 서비스 팝업 페이지에서 사용자가 인증을 받으면 암호화된 사용자 정보는 해당 팝업창으로 받게됩니다.
	 따라서 부모 페이지로 이동하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="vnoform" id="vnoform" method="post">
	<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
	<input type="hidden" name="enc_data" id="encData" />								
	<input type="hidden" name="userId" id="userId" />														
	<input type="hidden" name="returnUrl" id="returnUrl" value="${returnUrl }"  />
</form>

<form method="post" name="checkFrm" id="checkFrm">
	<input type="hidden" name="enc_data"  id="enc_data1"  >
	<input type="hidden" name="RESERVED1"  id="RESERVED1"  />	
</form>
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
				<div class="loginBox bg_memseh">
					<div class="loginText"><img src="/resources/include/commonfile/image/member/text_sehId.gif" alt="Search. ID" /></div>
					<div class="loginText2 txColor">신규회원 가입 시 입력한 정보를 정확히 입력해 주시기 바랍니다.</div>
					<div class="login mt15">
						<form name="searchName" action="">
							<ul>
								<li>
									<dl>
									<c:choose>
									<c:when  test="${userId ne '' && userId ne null && userId ne 'N' }">
										회원님의 아이디는  [ <strong> ${userId} </strong>] 입니다.
									</c:when>
									<c:otherwise>
									<c:if  test="${userId eq 'N' }">
										<strong> 홈페이지에 가입된 회원이 아닙니다. </strong>
									</c:if>
									
									<!-- 	<dt>
											<label for="loginName"><img src="/resources/include/commonfile/image/member/title_memName.gif" alt="회원이름" /></label>
										</dt>
										<dd>
										<input name="userNm" id="userNm" type="text" title="회원이름 입력" />
										</dd> -->
									</c:otherwise>
									</c:choose>
										
									</dl>
								</li>
								<!--li>
									<dl>
										<dt>
											<label for="loginEmail"><img src="/resources/include/commonfile/image/member/title_email.gif" alt="이메일" /></label>
										</dt>
										<dd>
											<input name="loginEmail" id="loginEmail" type="text" title="이메일 입력" />
										</dd>
									</dl>
								</li-->
							</ul>
						</form>
					</div>
					<div class="loginSearch wid ovh"> 
						<!--p class="fl call">* 입력하신 이메일이 한메일(hanmail.net)경우 발송이 안될 수 있으므로 전화(02-2236-0096)문의 바랍니다.</p>
						<p class="fr mt07"><a href="join_memtype.jsp"><img src="/resources/include/commonfile/image/member/btn_seh.gif" alt="찾기" /></a></p-->
						<div class="memCerti">
							<div class="mcLeft">
								<ul class="guide">
									<li><strong>안심체크 인증</strong>
										<ul>
											<li class="none">주민등록번호를 사용하지 않고 <span class="point_color03"><strong>이름, 생년월일, 성별,	전화번호, 집주소 </strong></span>등 정보의 진위 확인을 위한
												나이스신용평가정보(주) 화면으로 이동합니다.</li>
										</ul>
									</li>
									<li class="btn"><a href="#"><img id="checkAuthBtn" src="/resources/include/commonfile/image/member/btn_ansim.gif" alt="안심체크 인증" /></a></li>
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
									<li class="btn"><a href="#"><img  id="ipinAuthBtn" src="/resources/include/commonfile/image/member/btn_ipin.gif" alt="아이핀(I-pin)인증" /></a></li>
								</ul>
							</div>
						</div>
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
<script type="text/javascript">initMenu(8,3,0,0);</script>
</body>
</html>