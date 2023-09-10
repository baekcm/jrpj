<%@page import="com.jnet.util.CommonUtil"%>
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
<script language="javascript" src="/resources/XecureObject/xecureweb.js"></script>
<script language="javascript">
	PrintObjectTag();
</script>

<script type="text/javascript">

	$(function(){
		$("#ipinAuthBtn").click(function(){
			//if($("#agree").attr("checked")) {
			if($("#strUserId").val()!= "" ) {
				//화면 중앙에 팝업 호출		
				var left = (screen.width - 450) / 2;
			    var top = (screen.height - 550) / 2;
				//나이스 아이핀 팝업호출		
				//$("#param_r1").val($("#userNm").val());
				$("#param_r1").val($("#strUserId").val());
				window.open('', 'popupIPIN2', 'width=450, height=550, top='+top+', left='+left+', fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				$("#ipinFrm").attr("target","popupIPIN2").attr("action","https://cert.vno.co.kr/ipin.cb").submit();
			} else {
				alert("회원아이디를 입력하세요.");
				return;
			}
		});
		$("#checkAuthBtn").click(function(){
			//if($("#agree").attr("checked")) {
			if($("#strUserId").val()!= "" ) {
				
				$.ajax({
			           type:"POST",
			           url: "/front/findCertyPopup",
			           dataType : "json",
			           data:  {"userId" : $("#strUserId").val()},
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
		$("#loginBtn").click(function(){
			var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			var number = "1234567890";
			var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
			var sChar_Count = 0;
			var alphaCheck = false;
			var numberCheck = false;
			var pwdLength = $.trim($("#userPw").val()).length;
				
			if(8 <= pwdLength && pwdLength <= 20){
				
				for(var i=0; i<pwdLength; i++){
					if(sChar.indexOf($("#userPw").val().charAt(i)) != -1){
						sChar_Count++;
					}
					if(alpha.indexOf($("#userPw").val().charAt(i)) != -1){
						alphaCheck = true;
					}
					if(number.indexOf($("#userPw").val().charAt(i)) != -1){
						numberCheck = true;
					}
				}
				
				if(alphaCheck != true){
					alert("비밀번호에 영문을 포함하여 입력해 주세요");
					return false;
				}		
				if(numberCheck != true){
					alert("비밀번호에 숫자를 포함하여 입력해 주세요");
					return false;
				}		
				if(sChar_Count < 1){
					alert("비밀번호에 특수문자를 포함하여 입력해 주세요");
					return false;
				}
						
				if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){			
					alert("비밀번호는 8~20자리이내 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요");
					$("#userPw").val("");
					$("#userPw1").val("");
					$("#userPw").focus();
					return false;
				}
			}else{
				
				alert("비밀번호는 8~20 자리이내 입니다");
				$("#userPw").val("");
				$("#userPw1").val("");
				$("#userPw").focus();
				return false;
			}
			
			if($.trim($("#userPw").val()) != $.trim($("#userPw1").val())) {
				alert("새 비밀번호와 새 비밀번호확인 입력번호가 다릅니다.");
				return false;
			}else{
				
				
				<%
				if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
		        	System.out.println("client window ---------------> " );
					%>
					$.ajax({
				           type:"POST",
				           url: "/front/updatePassword",
				           dataType : "json",
				           data:  {"userDi" : $("#userDi").val(), "userPw" :  $("#userPw").val(), "userId" :  $("#userId").val()},
				           success: function(data){
				        	   alert("비밀번호가 변경되었습니다.");
				        	   location.href = "/front/formLogin";
				           },
				           error : function(request, status, error) {
							alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
						}
				     });		
					
		        	<%
		        } else {
		        	System.out.println("client linux ---------------> " );
		        	%>
					doRequestUsingPOST();
		        	<%
		        }
				%>
				
				

			}
		});
	})

</script>
<script type="text/javascript">
			var xmlHttp;

			function createXMLHttpRequest()
			{
				if (window.ActiveXObject) {
					try {
						xmlHttp =  new ActiveXObject("Msxml2.XMLHTTP");	// IE6
					}
					 catch (e) {
						try {
							xmlHttp =  new ActiveXObject("Microsoft.XMLHTTP");	// IE4, IE5
						} catch (e2) {}
					}
				} else if (window.XMLHttpRequest) {
					xmlHttp =  new XMLHttpRequest();
				}
			}


			function doRequestUsingPOST() {
				<%
				if(CommonUtil.getSystemProperties("os.name").indexOf("Linux") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
		        	System.out.println("client linux ---------------> " );
	        	%>
					createXMLHttpRequest();
					var url;
	
					url = "/front/mypage/updatePwChange";
					url = XecureAjaxGet(url);
					xmlHttp.open("POST", url, true);
					xmlHttp.onreadystatechange = handleStateChange;
					xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
					var p_value = XecureAjaxPost(XecureMakePlain(document.f1));
					xmlHttp.send(p_value);
					return false;
	        	<%
				}
				%>
				
			}

			function handleStateChange() {
				if(xmlHttp.readyState == 4) {
					if(xmlHttp.status == 200) {
						var enc = xmlHttp.responseText;
						var data = JSON.parse(enc);
			        	   alert("비밀번호가 변경되었습니다.");
			        	   location.href = "/front/formLogin";
					}
				}
			}
		</script>
</head>

<body>
<form name='xecure'><input type=hidden name='p'></form>
<%
if(CommonUtil.getSystemProperties("os.name").indexOf("Linux") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
      	System.out.println("client linux ---------------> " );
%>
<form name="ipinFrm" id="ipinFrm" method="post" onSubmit="return XecureSubmit(this);" >
<%
}else{
	System.out.println("client window ---------------> " );
%>

<form name="ipinFrm" id="ipinFrm" method="post">
<%
}
%>
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
	<input type="hidden" name="userDi" id="userDi" value="${userDi }" />										
	<input type="hidden" name="userId" id="userId" value="${userId }" />										
	<input type="hidden" name="returnUrl" id="returnUrl" value="${returnUrl }"  />
</form>


<%
if(CommonUtil.getSystemProperties("os.name").indexOf("Linux") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
      	System.out.println("client linux ---------------> " );
%>
<form method="post" name="checkFrm" id="checkFrm" onSubmit="return XecureSubmit(this);" >
<%
}else{
	System.out.println("client window ---------------> " );
%>

<form method="post" name="checkFrm" id="checkFrm">
<%
}
%>
		<input type="hidden" name="enc_data" id="enc_data1" value="${checkInfo.encData }">
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
				<div class="loginBox bg_memPw" style="height:480px;">
					<div class="loginText"><img src="/resources/include/commonfile/image/member/text_sehPw.gif" alt="Search. PW" /></div>
					<div class="loginText2 txColor">* 8~20자리 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요.</div>
					<div class="login">
								<c:choose>
								<c:when  test="${userDi ne '' && userDi ne null }">
								<form method="post" name="f1" >
								<ul>
									<li>
										<dl>
											<dt>
												<label for="loginpw"><img src="/resources/include/commonfile/image/member/title_newpw.gif" alt="비밀번호" /></label>
											</dt>
											<dd>
												<input type="password" name="userPw" id="userPw" type="text" title="비밀번호 입력" /><!--  * 8~20자리 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요 -->
											</dd>
										</dl>
									</li>
									<li>
										<dl>
											<dt>
												<label for="loginpw"><img src="/resources/include/commonfile/image/member/title_newpw.gif" alt="비밀번호 확인" /></label>
											</dt>
											<dd>
												<input type="password" name="userPw1" id="userPw1" type="text" title="비밀번호확인 입력" /><!--  * 위의 비밀번호를 한번 더 입력해 주세요 -->
											</dd>
										</dl>
									</li>
								</ul>
								</form>
								<input type="image" alt="로그인" id="loginBtn" src="/resources/include/commonfile/image/member/bg_btn_change.gif" />
								<!-- <ul style="width: 500px;">
									<li>* 8~20자리 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요.</li>
								</ul> -->
								</c:when>
								<c:otherwise>
								<ul>
								<li>
									<dl>
										<dt>
											<label for="loginId"><img src="/resources/include/commonfile/image/member/title_memid.gif" alt="회원아이디" /></label>
										</dt>
										<dd>
											<input name="strUserId" id="strUserId" type="text" title="회원아이디 입력" />
										</dd>
									</dl>
								</li>
								
								</c:otherwise>
								</c:choose>
								
					</div>
					<div class="loginSearch poTop" style="width:500px">
						<!--p class="mb15">* 임시비밀번호가 입력하신 이메일로 발송됩니다.</p>
						<p>* 입력하신 이메일이 한메일(hanmail.net)경우 발송이 안될 수 있으므로 전화(02-2236-0096)문의 바랍니다.</p-->
						
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
<script type="text/javascript">initMenu(8,4,0,0);</script>
</body>
</html>