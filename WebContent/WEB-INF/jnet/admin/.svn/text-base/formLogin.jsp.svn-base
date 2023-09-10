<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.jnet.util.CommonUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript" src="/resources/js/noback.js"></script>
<script type="text/javascript">
	$(function(){ 
		noBackScript();
		getid();
		
		$("#idChk").click(function(){
			saveid();
		});
		
		$("#userId").css('heigth','28px');
		$("#userPwd").css('heigth','28px');
		$("#userId").focus();
		
		/* onKeyPress="JavaScript: if(event.keyCode == 13) fncLogin(document.LoginForm);" */
		$("#userId").keypress(function(e){
			if(e.keyCode == 13){
				login();
				return false;
			}
		})
		$("#userPwd").keypress(function(e){
			if(e.keyCode == 13){
				login();	
				return false;
			}
		})
		$("#loginBtn").click(function(e){
			login();
			return false;
		});
	})
	function login(){
		var userId = $.trim($("#userId").val());
		var userPwd = $.trim($("#userPwd").val());
		if(userId == "") {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return;
		}
		if(userPwd == "") {
			alert("비밀번호를 입력하세요");
			$("#userPwd").focus();
			return;
		}
		$.ajax({
	           type:"POST",
	           url: "/admin/findLoginInfo",
	           dataType : "json",
	           data:  {"admId" : userId, "admPwd" : userPwd},
	           success: function(data){
	        	   if(data.flag == "Y") {
	        			location.href = "/admin/formMain";	   
	        	   } else {
	        		   alert("로그인 실패");
	        		   return;
	        	   }
	           },
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
	     });	
	}
</script>
<style>
<!--
BODY {background:url('/resources/include/commonfile/image/admin/bg_main.png') 0 0 repeat-x; margin:0; padding:0;}
UL,LI { list-style:none; padding:0; margin:0}
.loginWrap {width:980px; background:url('/resources/include/commonfile/image/admin/bg_login.png') 50% 0 no-repeat; margin:0 auto; position:relative; height:600px;}
.loginBox {position:absolute; top:510px; left:300px; width:337px;}
.loginBox UL {width:245px;float:left}
.loginBox UL LI { margin:0px 0}
.loginBox UL LI INPUT[type=text],INPUT[type=password] {border:1px solid #b1b1b1; width: 135px; height: 30px; font-family: 'NanumGothic';font-size: 12px; }
.loginBox .btnRight { float:right}
.loginWrap .text { position:absolute; top:155px; left:250px}
-->
</style>
</head>
<body>
<form name="mainform" >
	<div class="loginWrap">
		<div class="text"><img src="/resources/include/commonfile/image/admin/text.png" width="477" height="111" alt="종로구시설관리공단. 홈페이지 관리자 시스템. Manament system f jong-ro facilities management corportation Hompage."></div>
		<div class="loginBox">
			<ul>
				<li>
					<label for="userId"><img src="/resources/include/commonfile/image/admin/title_id.png" alt="아이디">
						<input type="text" name="userId"  id="userId" title="아이디" />
					</label>
				</li>
				<li>
					<label for="userPwd"><img src="/resources/include/commonfile/image/admin/title_pw.png" alt="비밀번호">
						<input type="password"  id="userPwd" title="패스워드" />
					</label>
					<input type="checkbox" name="idChk" id="idChk"  />&nbsp;아이디 저장
				</li>
			</ul>
			<div class="btnRight">
				<input type="image" value="로그인" id="loginBtn" src="/resources/include/commonfile/image/admin/btn_login.png" alt="로그인">
			</div>
		</div>
	</div>
</form>
</body>
</html>