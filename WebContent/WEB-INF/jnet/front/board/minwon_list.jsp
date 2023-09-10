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
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />

<script type="text/javascript">
	$(function(){
		 $.ajax({
            type:"POST",
            <c:if test="${my eq 'my' }">
            data:  {"my" : "my"},
		 	</c:if>
            url: "/front/listCpt",
            success: function(data){
				$(".boardDiv").html(data);
            },
            error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
        });		
		 $("#myMinwonBtn").click(function(){
				if("${userInfo.userNm}"==""){
					if(confirm("회원이면 로그인, 비회원은 본인인증이 필요합니다. 로그인하시겠습니까?") == true) {
						$("#returnUrl").val("/front/minwonMyList");
						$("#frm").attr("action","/front/formLogin");
						$("#frm").submit();
					}else{
						/* $("#returnUrl").val("/front/minwonMyList");
						$("#frm").attr("action","/front/formLogin");
						$("#frm").submit(); */
					}
				}else{
					$("#frm").attr("action","/front/minwonMyList");
					$("#frm").submit();
				}
				});
		 $("#searchBtn").click(function(){
			 $.ajax({
		            type:"POST",
		            <c:choose>
		            <c:when test="${my eq 'my' }">
		            data:  {"my" : "my","searchKey" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"upId" : $("#upId").val()},
		            </c:when>
		            <c:otherwise>
		            data:  {"searchKey" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"upId" : $("#upId").val()},
		            </c:otherwise>
		            </c:choose>
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
	
	function setPage(pageNo){
		$.ajax({
		            type:"POST",
		            <c:choose>
		            <c:when test="${my eq 'my' }">
		            data:  {"pageNum" : pageNo, "my" : "my","searchKey" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"upId" : $("#upId").val()},
		            </c:when>
		            <c:otherwise>
		            data:  {"pageNum" : pageNo, "searchKey" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"upId" : $("#upId").val()},
		            </c:otherwise>
		            </c:choose>
		            url: "/front/listCpt",
		            success: function(data){
						$(".boardDiv").html(data);
		            },
		            error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
		        });	
	}
</script>

</head>

<body>
<form name="frm" id="frm"  method="post">
<input type="hidden" name="returnUrl" id="returnUrl" />
</form>
<form action="/front/findMinwon" name="pageFrm" id="pageFrm"  method="post">
<input type="hidden" name="qSeq" id="qSeq" />
<input type="hidden" name="pageNum" id="pageNum" />
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
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				<!-- real Contents -->
				<div class="top_info"> 
					<p class="infom">종로구시설관리공단의 불편사항에 대한 민원을 접수하는 곳입니다.<br />
 공단과 무관한 내용, 상업성, 저속한 표현, 명예훼손, 반사회적인 글과 직원 또는 특정인에 대한 실명기재, 비방, 동일 건에 대한 반복 등의 글은 <strong>예고 없이 삭제 또는 비공개로 전환될 수</strong> 있습니다. <br />
비공개로 등록된 민원은 목록에 표시되지 않으며, <strong>[나의민원보기]</strong>에서만 확인이 가능합니다. </p>
<p class="infom">민원상담 접수 후 <strong>[답변중/답변완료]</strong>인 상태가 되면 삭제/수정할 수 없습니다. </p>
				</div>
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
							<select name="upId" id="upId" title="사업장 카테고리">
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
					<div class="btn_farm2 mt20 mb20">
							<!-- Text Button --> 
							<span class="txtBtn_Gray"><a href="/front/minwonMain" >민원신청하기</a></span> 
							<!-- Text Button --> 
							<!-- Text Button --> 
							<span class="txtBtn_lightGray"><a href="#" id="myMinwonBtn" >나의민원조회</a></span> 
							<!-- Text Button --> 
					</div>
				</div>
				
				<!-- search Box -->
				<!-- search Box --> 
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