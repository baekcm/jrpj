<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
<script type="text/javascript">
//<![CDATA[
    $(function(){
    	goYear();
    	
		//댓글등록버튼 클릭
		$("#pgtschBtn").click(function(){
			goYear();
		})
		
		
    });

    function goYear(){
		$.ajax({
	           type:"POST", 
	           url: "/front/findYear",
	           data : {"title" : "inspection_", "year":$("#pgtschgoYear").val()},
	           success: function(data){ 
	        	  $("#yearDiv").html(data); $('.tbl01').before('<div class="tblbefore"></div>');
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
    }
    
    

//]]>
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
			<%@ include file="/resources/include/commonfile/inc/lnb_bottom.jsp" %>
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"> </p>
			</div>
			<div class="contents"> 
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Year Page Move -->
					<div class="pageTopSearch">
						<div class="fl">
							<form name="pgtschEmpl" method="post" action="inspection_last.jsp">
								<select name="pgtschgoYear" id="pgtschgoYear" title="이동 년도 선택">
									<option value="2012" selected="selected">2012년</option>
									<option value="2011" >2011년</option>
									<option value="2010">2010년</option>
									<option value="2009">2009년</option>
									<option value="2008">2008년</option>
									<option value="2007">2007년</option>
									<option value="2006">2006년</option>
									<option value="2005">2005년</option>
									<option value="2004">2004년</option>
								</select>
								<img alt="이동" id="pgtschBtn" style="cursor:pointer;" src="/resources/include/commonfile/image/common/btn_gomovep.gif"  />
							</form>
						</div>
					</div>
					<!-- Year Page Move -->
				 <div id="yearDiv">
				 </div>
				</div>
				
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(6,2,5,0);</script>
</body>
</html>