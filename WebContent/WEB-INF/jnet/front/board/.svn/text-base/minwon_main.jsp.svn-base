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
function certify(upId){
	if("${userInfo.userNm}"==""){
		if(confirm("회원이면 로그인, 비회원은 본인인증이 필요합니다. 로그인하시겠습니까?") == true) {
			$("#returnUrl").val("/front/formCreateMinwon/"+upId);
			$("#frm").attr("action","/front/formLogin");
			$("#frm").submit();
		}else{
			/* $("#returnUrl").val("/front/formCreateMinwon/"+upId);
			$("#frm").attr("action","/front/formLogin");
			$("#frm").submit(); */
		}
	}else{
		$("#frm").attr("action","/front/formCreateMinwon/"+upId);
		$("#frm").submit();
	}
}
</script>	
</head>

<body>
<form name="frm" id="frm"  method="post">
<input type="hidden" name="returnUrl" id="returnUrl" />
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
				<div class="pageSection"> 
					<!-- minwon Top  -->
					<!-- minwon Top  --> 
					<!--minwon main-->
				<p class="mb15"><img src="/resources/include/commonfile/image/content/open/s_title.gif" alt="문화체육시설" /></p>
					<ul class="minwon">
						<li class="minLeft bg1">
							<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon1.gif" alt="올림픽기념국민생활관/ 02-745-6701~4/소중한 만남 건강한 서비스!" /></p>
							<p class="btnMove"><a href="#linkwrite" onclick="certify(1); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p>
						</li>
						<li class="minRight bg2">
							<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon2.gif" alt="종로구민회관/02-3672-2530/행복이 숨쉬는 스포츠 문화공간" /></p>
							<p class="btnMove"><a href="#linkwrite" onclick="certify(2); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p></li>
						<li class="minLeft bg3">
							<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon3.gif" alt="올림픽기념국민생활관/ 02-745-6701~4/소중한 만남 건강한 서비스!" /></p>
							<p class="btnMove"><a href="#linkwrite" onclick="certify(4); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p>
						</li>
						<li class="minRight bg4">
							<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon4.gif" alt="종로구민회관/02-3672-2530/행복이 숨쉬는 스포츠 문화공간" /></p>
							<p class="btnMove"><a href="#linkwrite" onclick="certify(3); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p></li>
						<li class="minLeft bg5">
							<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon5.gif" alt="올림픽기념국민생활관/ 02-745-6701~4/소중한 만남 건강한 서비스!" /></p>
							<p class="btnMove"><a href="#linkwrite" onclick="certify(5); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p>
						</li>
						<li class="minRight bg6">
							<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon6.gif" alt="종로구민회관/02-3672-2530/행복이 숨쉬는 스포츠 문화공간" /></p>
							<p class="btnMove"><a href="#linkwrite" onclick="certify(6); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p></li>
					</ul>
					<!--minwon main--> 
				</div>
				
					<div class="pageSection">
						<p class="mb15"><img src="/resources/include/commonfile/image/content/open/s_title2.gif" alt="주차시설" /></p>
						<ul class="minwon">
							<li class="minLeft bg7">
								<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon7.gif" alt="공영주차장/ 02-2236-0052~3" /></p>
								<p class="btnMove"><a href="#linkwrite" onclick="certify(7); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p>
							</li>
							<li class="minRight bg8">
								<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon8.gif" alt="거주자우선주차/02-2236-0564~5" /></p>
								<p class="btnMove"><a href="#linkwrite" onclick="certify(8); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p>
							</li>
							</ul>
					</div>
					<div class="pageSection">
						<p class="mb15"><img src="/resources/include/commonfile/image/content/open/s_title3.gif" alt="공공시설" /></p>
						<ul class="minwon">
							<li class="minLeft bg9">
								<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon9.gif" alt="문화지구/ 02-2148-1807" /></p>
								<p class="btnMove"><a href="#linkwrite" onclick="certify(9); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p>
							</li>
							<li class="minRight bg10">
								<p class="text"><img src="/resources/include/commonfile/image/content/open/text_minwon10.gif" alt="소공원관리/02-2236-0564~5" /></p>
								<p class="btnMove"><a href="#linkwrite" onclick="certify(10); return false;"><img src="/resources/include/commonfile/image/common/btn_move.gif" alt="이동하기" /></a></p>
							</li>
							</ul>
					</div>
					
					
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%-- <jsp:include page="/front/satfact/${menuSeq }" /> --%>
				
				
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(4,5,0,0);</script>
</body>
</html>