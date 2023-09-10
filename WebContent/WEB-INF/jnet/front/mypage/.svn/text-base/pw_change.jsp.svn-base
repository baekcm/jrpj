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

<script type="text/javascript" src="/resources/js/jquery.js"></script>
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
		$("#changBtn").click(function(){
			var userPw = $.trim($("#userPw").val());
			var userPw1 = $.trim($("#userPw1").val());
			var userPw2 = $.trim($("#userPw2").val());
			if(userPw == "") {
				alert("기존비밀번호를 입력하세요");
				$("#userPw").focus();
				return;
			}
			if(userPw1 == "") {
				alert("새 비밀번호를 입력하세요");
				$("#userPw1").focus();
				return;
			}
			if(userPw2 == "") {
				alert("비밀번호 확인을 입력하세요");
				$("#userPw2").focus();
				return;
			}
			if(userPw1 != userPw2) {
				alert("새 비밀번호가 다릅니다.");
				$("#userPw1").focus();
				return;
			}
			var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			var number = "1234567890";
			var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
			var sChar_Count = 0;
			var alphaCheck = false;
			var numberCheck = false;
			var pwdLength = $.trim($("#userPw1").val()).length;
				
			if(8 <= pwdLength && pwdLength <= 20){
				
				for(var i=0; i<pwdLength; i++){
					if(sChar.indexOf($("#userPw1").val().charAt(i)) != -1){
						sChar_Count++;
					}
					if(alpha.indexOf($("#userPw1").val().charAt(i)) != -1){
						alphaCheck = true;
					}
					if(number.indexOf($("#userPw1").val().charAt(i)) != -1){
						numberCheck = true;
					}
				}
				
				if(alphaCheck != true){
					alert("새 비밀번호에 영문을 포함하여 입력해 주세요");
					return false;
				}		
				if(numberCheck != true){
					alert("새 비밀번호에 숫자를 포함하여 입력해 주세요");
					return false;
				}		
				if(sChar_Count < 1){
					alert("새 비밀번호에 특수문자를 포함하여 입력해 주세요");
					return false;
				}
						
				if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){			
					alert("새 비밀번호는 8~20자리이내 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요");
					$("#userPw1").val("");
					$("#userPw2").val("");
					$("#userPw1").focus();
					return false;
				}
			}else{
				
				alert("새 비밀번호는 8~20 자리이내 입니다");
				$("#userPw1").val("");
				$("#userPw2").val("");
				$("#userPw1").focus();
				return false;
			}
			
			<%
			if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
	        	System.out.println("client window ---------------> " );
				%>
				$.ajax({
			           type:"POST",
			           url: "/front/mypage/updatePwChange",
			           dataType : "json",
			           data:  { "userPw" : userPw, "userPw1" : userPw1, "userPw2" : userPw2},
			           success: function(data){
			        	   if(data.flag == "Y") {
			        		   alert("비밀번호가 변경되었습니다.");	   
			        		   location.href="/front/mypage/pwChange";
			        	   } else {
			        		   alert("기존비밀번호가 틀립니다.");
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
			
			
			
		});
	})

	
function uu(e) {
		var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		var number = "1234567890";
		var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
		var sChar_Count = 0;
		var alphaCheck = false;
		var numberCheck = false;
		var pwdLength = $.trim($("#userPw1").val()).length;
			
		if(8 <= pwdLength && pwdLength <= 20){
			
			for(var i=0; i<pwdLength; i++){
				if(sChar.indexOf($("#userPw1").val().charAt(i)) != -1){
					sChar_Count++;
				}
				if(alpha.indexOf($("#userPw1").val().charAt(i)) != -1){
					alphaCheck = true;
				}
				if(number.indexOf($("#userPw1").val().charAt(i)) != -1){
					numberCheck = true;
				}
			}
			
			if(alphaCheck != true){
				$("#pwMsg").html("새 비밀번호에 영문을 포함하여 입력해 주세요.");
				return false;
			}		
			if(numberCheck != true){
				$("#pwMsg").html("새 비밀번호에 숫자를 포함하여 입력해 주세요.");
				return false;
			}		
			if(sChar_Count < 1){
				$("#pwMsg").html("새 비밀번호에 특수문자를 포함하여 입력해 주세요.");
				return false;
			}
					
			if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){			
				
				$("#pwMsg").html("새 비밀번호는 8~20자리이내 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요");
				return false;
			}
		}else{
			
			$("#pwMsg").html("새 비밀번호는 8~20 자리이내 입니다");
			return false;
		}
		$("#pwMsg").html("OK!");
}
function dd(e) {
	var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	var number = "1234567890";
	var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
	var sChar_Count = 0;
	var alphaCheck = false;
	var numberCheck = false;
	var pwdLength = $.trim($("#userPw1").val()).length;
		
	if(8 <= pwdLength && pwdLength <= 20){
		
		for(var i=0; i<pwdLength; i++){
			if(sChar.indexOf($("#userPw1").val().charAt(i)) != -1){
				sChar_Count++;
			}
			if(alpha.indexOf($("#userPw1").val().charAt(i)) != -1){
				alphaCheck = true;
			}
			if(number.indexOf($("#userPw1").val().charAt(i)) != -1){
				numberCheck = true;
			}
		}
		
		if(alphaCheck != true){
			$("#pwMsg").html("새 비밀번호에 영문을 포함하여 입력해 주세요.");
			return false;
		}		
		if(numberCheck != true){
			$("#pwMsg").html("새 비밀번호에 숫자를 포함하여 입력해 주세요.");
			return false;
		}		
		if(sChar_Count < 1){
			$("#pwMsg").html("새 비밀번호에 특수문자를 포함하여 입력해 주세요.");
			return false;
		}
				
		if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){			
			
			$("#pwMsg").html("새 비밀번호는 8~20자리이내 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요");
			
			return false;
		}
	}else{
		
		$("#pwMsg").html("새 비밀번호는 8~20 자리이내 입니다");
		return false;
	}
	$("#pwMsg").html("OK!");
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
			        	   if(data.flag == "Y") {
			        		   alert("비밀번호가 변경되었습니다.");	   
			        		   location.href="/front/mypage/pwChange";
			        	   } else {
			        		   alert("기존비밀번호가 틀립니다.");
			        		   return;
			        	   }
					}
				}
			}
		</script>
</head>
<body>
<form name='xecure'><input type=hidden name='p'></form>
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
		<div class="ttabWrap">
			<ul id="ttab3">
				<li></li>
			</ul>
		</div>
      	
        <!-- real Contents -->
        <div class="pageSection mb30" style="background:url(/resources/include/commonfile/image/board/bg_tbl.gif) 0 100% repeat-x; padding-bottom:7px; overflow:hidden">
          <!-- minwon Top  -->
          <div class="boardWrap2">
	      	<form method="post" name="f1" >
            <table border="0" cellpadding="0" cellspacing="0" summary="회원 가입에 필요한 정보 입력을 받기 위한 표. " class="tbl01 tblLeft" id="memjoin">
              <caption>
              비밀번호 변경
              </caption>
              <tr>
                <th width="18%" scope="row"><label for="memid">기존 비밀번호</label></th>
                <td width="82%"><input type="password" name="userPw" id="userPw" />
                </td>
              </tr>
              <tr>
                <th scope="row"><label for="mempw">새 비밀번호</label></th>
                <td><input type="password" name="userPw1" id="userPw1" />
                <span id="pwMsg" />
                 * 8~20자리 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요 
                 </td>
              </tr>
              <tr>
                <th scope="row"><label for="mempw2">비밀번호 확인</label></th>
                <td><input type="password" name="userPw2" id="userPw2" /> * 위의 비밀번호를 한번 더 입력해 주세요</td>
              </tr>
              
            </table>
            </form>
          </div>
        </div>
        <p class="btn_farm2 mt20 mb20"> <a href="#"><img src="/resources/include/commonfile/image/member/btn_change.gif" id="changBtn" alt="회원에 가입합니다." /></a>&nbsp;<a href="#"><img src="/resources/include/commonfile/image/member/btn_cancel.gif"alt="취소" /></a></p>
        <!-- minwon Top  -->
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
<script type="text/javascript">initMenu(9,2,2,0);</script>
</body>
</html>