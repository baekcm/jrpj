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
			var TRIM_PATTERN = /(^\s*)|(\s*$)/g;	// 빈 공백을 trim하기 위한 것

			String.prototype.trim = function() {
				return this.replace(TRIM_PATTERN, "");
			}
</script>
<script type="text/javascript">
$(function(){
	$("#showMsg").hide();
$("#findId").click(function(){
	
	if($.trim($("#email").val()) == "" || $.trim($("#email1").val()) == "") {
		alert("이메일을 입력하세요");
		return;
	}else{
		$("#email").val($.trim($("#email").val())+"@"+$.trim($("#email1").val()));
	}
	
	
	<%
	if(CommonUtil.getSystemProperties("os.name").indexOf("Windows") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
    	System.out.println("client window ---------------> " );
		%>
		
	$.ajax({
        type:"POST",
        url: "/front/findAjaxIdPw",
        dataType : "json",
        data:  {"userNm" : $("#userNm").val(),"email" : $("#email").val(),"userId" : null},
        success: function(data){
        	$("#showMsg").show();
        	$("#showUl").hide();
        	$(".btn_go").hide();
      	   if(data.flag == "C") {
      		   $("#spMsg").html("회원님의 ID는 ["+data.userId+"] 입니다.");
      	   }else if(data.flag == "D"){
      		 $("#spMsg").html("회원 ID가 여러개 있습니다 관리자 문의");
      	   }else if(data.flag == "E"){
      		 $("#spMsg").html("사용자가 없습니다. 관리자 문의");
      	   } else {
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
	//메일주소 변경
	$("#emailSlct").change(function(){
		if($("#emailSlct").val() == "") {
			$("#email1").val("");
		} else {
			if($("#emailSlct").val() == "self") {
				$("#email1").val("");
				$("#email1").attr("readonly",false);
				$("#email1").focus();
			} else {
				$("#email1").attr("readonly",true);
				$("#email1").val($("#emailSlct").val());	
			}
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
	
					url = "/front/findAjaxIdPw";
					url = XecureAjaxGet(url);
					xmlHttp.open("POST", url, false);
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
			        	$("#showMsg").show();
			        	$("#showUl").hide();
			        	$(".btn_go").hide();
			      	   if(data.flag == "C") {
			      		   $("#spMsg").html("회원님의 아이디는  [ <strong> "+data.userId+"</strong>] 입니다.");
			      	   }else if(data.flag == "D"){
			      		 $("#spMsg").html("회원 ID가 중복되었습니다. 관리자에게문의하세요.");
			      	   }else if(data.flag == "E"){
			      		 $("#spMsg").html("사용자가 없습니다. 관리자에게문의하세요.");
			      	   } else {
			      		   return;
			      	   }
					}
				}
			}
		</script>
</head>

<body>
<form name='xecure'><input type=hidden name='p'></form>
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
				<!-- real Contents -->
				<div class="loginBox bg_memPw">
					<div class="loginText"><img src="/resources/include/commonfile/image/member/text_sehId.gif" alt="Search. ID" /></div>
					<div class="loginText2 txColor">회원가입 시 입력한 정보를 정확히 입력해 주시기 바랍니다.</div>
					<div class="login mt15">
					<form action="#" name="f1">
							<ul id="showUl" >
								<li>
									<dl>
										<dt>
											<label for="userNm"><img src="/resources/include/commonfile/image/member/title_memName.gif" alt="회원이름" /></label>
										</dt>
										<dd>
											<input name="userNm" id="userNm" type="text" title="회원이름 입력" />
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>
											<label for="loginEmail"><img src="/resources/include/commonfile/image/member/title_email.gif" alt="이메일" /></label>
										</dt>
										<dd>
											<input type="text" name="email" id="email" style="width: 100px;" />@										
							                <input type="text" id="email1" name="email1" readonly="readonly" />
											<select id="emailSlct" name="emailSlct" style="width: 100px;" title="이메일 도메인 선택">
												<option value="">선택</option>
												<c:forEach items="${mailList }" var="mail">
													<option value="${mail.codeNm }">${mail.codeNm}</option>
												</c:forEach>
												<option value="self">직접입력</option>
											</select>
										</dd>
									</dl>
								</li>
							</ul>
					</form>
							<ul id="showMsg" >
								<li>
									<dl>
										<span id="spMsg"></span>
									</dl>
								</li>
							</ul>
							
					</div>
					<div class="btn_go"><a href="#"><img id="findId" src="/resources/include/commonfile/image/member/btn_searchid.gif" alt="아이디 찾기" /></a></div>
					
						
						
				</div>
				
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(8,3,0,0);</script>
</body>
</html>