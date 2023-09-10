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
		$("#outBtn").click(function(){
			var userPw = $.trim($("#userPw").val());
			var outDesc = $.trim($("#outDesc").val());
			if(userPw == "") {
				alert("비밀번호를 입력하세요");
				$("#userPw").focus();
				return;
			}
			if(outDesc == "") {
				alert("비밀번호 확인을 입력하세요");
				$("#outDesc").focus();
				return;
			}
			$.ajax({
		           type:"POST",
		           url: "/front/mypage/updateOut",
		           dataType : "json",
		           data:  { "userPw" : userPw, "outDesc" : outDesc },
		           success: function(data){
		        	   if(data.flag == "Y") {
		        		   alert("회원 탈퇴가 완료되었습니다.");	   
		        		   location.href="/main";
		        	   } else {
		        		   alert("비밀번호가 틀립니다.");
		        		   return;
		        	   }
		           },
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
		     });	
		});
	})

</script>
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
				<div class="pageSection mb30">
					<p><img src="/resources/include/commonfile/image/member/mhead06.gif" alt="종로구 시설관리공단 &quot;회원탈퇴&quot;그동안 종로구시설관리공단 홈페이지를 이용해 주셔서 감사합니다. -회원을 탈퇴하시면 기존의 혜택이 모두 사라지며 작성하셨던 모든 컨텐츠는 &quot;종로구시설관리공단&quot;으로 귀속되므로 게시물과 첨부물의 삭제를 원하시면 탈퇴전에 삭제하신 후 탈퇴하여 주십시오. - 이에 동의하시면 아래의 비밀번호와 탈퇴사유를 입력하시고,[확인]버튼을 눌러주시기 바랍니다. 탈퇴는 온라인상에서 즉시 이루어집니다." /></p>
				</div>
				<div class="tblWrap mb20">
					<table class="tbl01" border="0" cellspacing="0" cellpadding="0" summary="아이디,비밀번호,탈퇴사유로 이루어진 표">
						<caption>
						회원탈퇴 양식
						</caption>
						<colgroup>
						<col style="width:180px;" />
						<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td class="ta_l">${userInfo.userId}</td>
							</tr>
							<tr>
								<th scope="row"><label for="loginpw">비밀번호</label></th>
								<td class="ta_l input_size"><input name="userPw" id="userPw" type="password" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="memOut">탈퇴사유</label></th>
								<td class="ta_l"><textarea id="outDesc" name="outDesc" cols="85" rows="15"></textarea></td>
							</tr>
							</tbody>
					</table>
				</div>
				<div class="ta_c">
						<p><a href="#"><img src="/resources/include/commonfile/image/member/btn_out.gif" id="outBtn" alt="탈퇴하기" /></a></p>
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
<script type="text/javascript">initMenu(9,2,0,0);</script>
</body>
</html>