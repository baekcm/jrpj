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
	$(function(){
		 $.ajax({
            type:"POST",
            data:  {"my" : "my"},
            url: "/front/listCpt",
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
		            data:  {"my" : "my","searchKey" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"upId" : $("#upId").val()},
		            url: "/front/listCpt",
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
<form action="/front/findMinwon" name="pageFrm" id="pageFrm"  method="post">
<input type="hidden" name="qSeq" id="qSeq" />
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
					<!-- 
					<div class="pageTopSearch">
						<form name="pgtSearch" method="post" action="../facil/gumin/반드시 기입">
							<select name="pgtFacil" id="pgtFacil" title="시설명 선택">
								<option>시설관리공단</option>
								<option>올림픽기념국민생활관</option>
								<option>종로구민회관</option>
								<option>종로문화체육센터</option>
								<option>동부여성문화센터</option>
								<option>청소년문화센터</option>
								<option>삼청테니스장</option>
							</select>
							<select name="kwdtype" id="kwdtype" title="검색방법 선택" class="schSel">
								<option>제목</option>
								<option>내용</option>
							</select>
							<input type="text" name="schKwd" id="schKwd" title="검색어 입력" class="schKwd"  style="width:200px;" />
							<input type="image" alt="검색" id="pgtschBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
						</form>
					</div>
					-->
					<div class="pageTopSearch">
							<select name="upId" id="upId" title="사업장 카테고리" >
								<option value="">전체</option>
								<c:if test="${listUpId != null && fn:length(listUpId) > 0 }">
									<c:forEach items="${listUpId }" var="list" varStatus="status" >
										<option value="${list.codeId }">${list.codeNm }</option>	
									</c:forEach>
								</c:if>
							</select>
							<select name="searchKey" id="searchKey" title="검색방법 선택" class="schSel">
							<option value="subject">제목</option>
							<option value="content" >내용</option>
							<option value="name" >작성자</option>
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
<script type="text/javascript">initMenu(9,1,1,0);</script>
</body>
</html>