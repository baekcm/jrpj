<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	$(function(){
		 $.ajax({
            type:"POST",
            data:  {"my" : "my"},
            url: "/front/listSugest",
            success: function(data){
				$(".boardDiv").html(data);
            },
            error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
        });		
		 $("#searchBtn").click(function(){
			 $.ajax({
		            type:"POST",
		            data:  {"my" : "my","statusCd" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"statusCd" : $("#statusCd").val() ,"suggestGbnCd" : $("#suggestGbnCd").val()},
		            url: "/front/listSugest",
		            success: function(data){
						$(".boardDiv").html(data);
		            },
		            error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
		        });	
		});
	});
</script>

</head>

<body>

<form action="/front/findSugest" name="pageFrm" id="pageFrm"  method="post">
<input type="hidden" name="suggestSeq" id="suggestSeq" />
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
			<%@ include file="/resources/include/commonfile/inc/lnb_bottom.jsp" %>
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
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
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
							<select name="statusCd" id="statusCd"  title="처리여부 선택">
								<option value="">전체</option>
								<option value="R">접수중</option>
								<option value="I">처리중</option>
								<option value="C">완료</option>
							</select>
							<select name="suggestGbnCd" id="suggestGbnCd"  title="제안 구분">
								<option value="">전체</option>
								<option value="1">공단직원</option>
								<option value="2">주민제안</option>
							</select>
							<select name="searchKey" id="searchKey" title="검색방법 선택" class="schSel">
							<option value="subject">제목</option>
							<option value="name" >제안인</option>
							</select>
							<input type="text" name="searchVal" id="searchVal" title="검색어 입력" class="schKwd"  style="width:200px;" />
							<input type="image" alt="검색" id="searchBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
					</div>
					<!-- Sports & culture list top Search -->
					<div class ="boardDiv">
					</div>
					<!-- board paging --> 
				</div>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%--@ include file="/resources/include/commonfile/inc/poll.jsp" --%>
				<!--만족도 조사가 들어갈 영역 --> 
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(9,1,2,0);</script>
</body>
</html>