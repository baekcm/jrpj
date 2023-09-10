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
<!-- <script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script> -->
<!--[if IE 7]><script type="text/javascript" src="/resources/js/json2.js"></script><![endif]-->
<!--[if IE 8]><script type="text/javascript" src="/resources/js/json2.js"></script><![endif]-->
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<script type="text/javascript" src="/resources/js/noback.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
<script type="text/javascript" src="/resources/XecureObject/xecureweb.js"></script>
<script type="text/javascript">
			PrintObjectTag();
			var TRIM_PATTERN = /(^\s*)|(\s*$)/g;	// 빈 공백을 trim하기 위한 것

			String.prototype.trim = function() {
				return this.replace(TRIM_PATTERN, "");
			}
</script>

		
<script type="text/javascript">
	$(function(){
		//noBackScript();
		$("#userId").focus();
		//onKeyPress="JavaScript: if(event.keyCode == 13) fncLogin(document.LoginForm);"
		$("#loginBtn").click(function(){
			login();
		});
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
		    	window.open('', 'popupCheck', 'width=500, height=550,toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top='+top+', left='+left);
				$("#checkFrm").attr("target","popupCheck").attr("action","https://cert.namecheck.co.kr/NiceID2/certpass_input.asp").submit();
				
			} else {
				alert("약관을 동의하셔야 합니다.");
				return;
			}
		});
	})
	
	function login(){
		var userId = $.trim($("#userId").val());
		var userPw = $.trim($("#userPw").val());
		if(userId == "") {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return;
		}
		if(userPw == "") {
			alert("비밀번호를 입력하세요");
			$("#userPw").focus();
			return;
		}
		
		<%
		if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
        	System.out.println("client window ---------------> " );
			%>
	        	$.ajax({
	  	           type:"POST",
	  	           async : false,
	  	           url: "/front/findMemberLoginInfo",
	  	           dataType : "json",
	  	           data:  {"userId" : userId, "userPw" : userPw},
	  	           success: function(data){
	  	        	   if(data.flag == "Y") {
	  	        		   if(data.returnUrl!=""){
	  	        			   location.href = data.returnUrl;   
	  	        		   }else{
	  	        				location.href = "/main";	   
	  	        		   }
	  	        	   } else {
	  	        		   alert("비밀번호가 틀렸습니다");
	  	        		   return;
	  	        	   }
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
					var userId = $.trim($("#userId").val());
					var userPw = $.trim($("#userPw").val());
					$("#userPw").val("");
					$("#userId").val("");
					url = "/front/findMemberLoginInfo";
					url = XecureAjaxGet(url);
					xmlHttp.open("POST", url, false);
					xmlHttp.onreadystatechange = handleStateChange;
					xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
					//var p_value = XecureAjaxPost(XecureMakePlain(document.f1));
					var p_value = XecureAjaxPost("userId="+userId+"&userPw="+userPw);
					xmlHttp.send(p_value);
					
	        	<%
				}
				%>
				
			}

			function handleStateChange() {
				
			
				if(xmlHttp.readyState == 4) {
					if(xmlHttp.status == 200) {
						var enc = xmlHttp.responseText;
						var data = JSON.parse(enc);
			        	   if(data.flag == "Y") {
			        		   if(data.returnUrl!=""){
			        			   location.href = data.returnUrl;   
			        		   }else{
			        			location.href = "/main";	   
			        		   }
			        	   } else {
			        		   alert("비밀번호가 틀렸습니다");
			        		   return;
			        	   }
					}
				}
			}
		</script>
</head>

<body>
<form name='xecure'><input type=hidden name='p'></form>
<form name="ipinFrm" id="ipinFrm" method="post">
	<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="m" value="pubmain" />						
	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
    <input type="hidden" name="enc_data" value="${ipinInfo.encData }" />	
</form>
<!-- 가상주민번호 서비스 팝업 페이지에서 사용자가 인증을 받으면 암호화된 사용자 정보는 해당 팝업창으로 받게됩니다.
	 따라서 부모 페이지로 이동하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="vnoform" id="vnoform" method="post">
	<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
	<input type="hidden" name="enc_data" id="encData" />								
	<input type="hidden" name="qNm" id="qNm"  />								
	<input type="hidden" name="qBirth" id="qBirth"  />
	<input type="hidden" name="qIdDi" id="qIdDi"  />							
	<input type="hidden" name="qSex" id="qSex"  />							
	<input type="hidden" name="userNm" id="userNm"  />							
	<input type="hidden" name="returnUrl" id="returnUrl" value="${returnUrl }"  />							
</form>

<form method="post" name="checkFrm" id="checkFrm">
		<input type="hidden" name="enc_data" value="${checkInfo.encData }" />
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
				<div class="loginBox">
					<div class="loginText"><img src="/resources/include/commonfile/image/member/text_login.gif" width="75" height="35" alt="Members. Login" /></div>
					<div class="loginText2">가입하신 아이디와 비밀번호로 로그인 하실 수 있습니다.</div>
					<form action="#" name="f1">
					<div class="login">
							<ul>
								<li>
									<dl>
										<dt>
											<label for="loginid"><img src="/resources/include/commonfile/image/member/title_id.gif" alt="아이디" /></label>
										</dt>
										<dd>
											<input name="userId" id="userId" type="text" title="아이디 입력" style="ime-mode:disabled" />
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<label for="loginpw"><img src="/resources/include/commonfile/image/member/title_pw.gif" alt="비밀번호" /></label>
										</dt>
										<dd>
											<input type="password" name="userPw" id="userPw" title="비밀번호 입력" onkeypress="if(event.keyCode==13){login();return false;}"  />
										</dd>
									</dl>
								</li>
							</ul>
							<a href="javascript:login()"><input type="image" alt="로그인" id="loginBtn" src="/resources/include/commonfile/image/member/btn_login.gif" /></a>
					</div>
					</form>
					<div class="loginJoin">
						<p>회원가입을 하시면 종로구 시설관리공단의 다양한 혜택을 이용하실 수 있습니다.</p>
						<p><a href="/front/sign"><img src="/resources/include/commonfile/image/member/btn_join.gif" alt="회원가입하기" /></a></p>
					</div>
					<div class="loginFIn">
						<p>아이디 및 비밀번호를 잊으셨나요?<br />
							찾기버튼을 이용해 주세요.</p>
						<p><a href="/front/findId"><img src="/resources/include/commonfile/image/member/btn_findid.gif" alt="아이디 찾기" /></a> <a href="/front/findPw"><img src="/resources/include/commonfile/image/member/btn_findpw.gif" alt="비밀번호 찾기" /></a></p>
					</div>
				</div>


				<div class="memCerti mb40" style="display:${style}">
					<div class="mcLeft">
						<ul class="guide">
							<li><strong>안심체크 인증</strong>
								<ul>
									<li class="none">주민등록번호를 사용하지 않고 <span class="point_color03"><strong>이름, 생년월일, 성별, <br />
										전화번호, 집주소 </strong></span>등 정보의 진위 확인을 위한
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
							<li class="btn"><a href="#"><img id="ipinAuthBtn" src="/resources/include/commonfile/image/member/btn_ipin.gif" alt="아이핀(I-pin)인증" /></a></li>
						</ul>
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
<script type="text/javascript">initMenu(8,1,0,0);</script>
<!--nProtect 키보드보안 적용 시작-->
<script type="text/javascript" src="http://update.nprotect.net/keycrypt/ijongno/npkfx.js"></script>
<!--nProtect 키보드보안 적용 끝-->
</body>
</html>