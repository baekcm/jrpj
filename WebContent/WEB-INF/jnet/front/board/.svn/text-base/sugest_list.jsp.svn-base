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
            url: "/front/listSugest",
            success: function(data){
				$(".boardDiv").html(data);
            },
            error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
        });		
		 $("#sugWriteBtn").click(function(){
			if("${userInfo.userNm}"==""){
				if(confirm("회원이면 로그인, 비회원은 본인인증이 필요합니다. 로그인하시겠습니까?") == true) {
					$("#returnUrl").val("/front/formCreateSugest");
					$("#frm").attr("action","/front/formLogin");
					$("#frm").submit();
				}else{
					/* $("#returnUrl").val("/front/formCreateSugest");
					$("#frm").attr("action","/front/selfCerty");
					$("#frm").submit(); */
				}
			}else{
				$("#frm").attr("action","/front/formCreateSugest");
				$("#frm").submit();
			}
			});
		 $("#mySugestBtn").click(function(){
			if("${userInfo.userNm}"==""){
				if(confirm("회원이면 로그인, 비회원은 본인인증이 필요합니다. 로그인하시겠습니까?") == true) {
					$("#returnUrl").val("/front/sugestMyList");
					$("#frm").attr("action","/front/formLogin");
					$("#frm").submit();
				}else{
					/* $("#returnUrl").val("/front/sugestMyList");
					$("#frm").attr("action","/front/selfCerty");
					$("#frm").submit(); */
				}
			}else{
				$("#frm").attr("action","/front/sugestMyList");
				$("#frm").submit();
			}
			});
		 $("#searchBtn").click(function(){
			 $.ajax({
		            type:"POST",
		            <c:choose>
		            <c:when test="${my eq 'my' }">
		            data:  {"my" : "my","statusCd" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"statusCd" : $("#statusCd").val() ,"suggestGbnCd" : $("#suggestGbnCd").val()},
		            </c:when>
		            <c:otherwise>
		            data:  {"searchKey" : $("#searchKey").val(),"searchVal" :$("#searchVal").val() ,"statusCd" : $("#statusCd").val() ,"suggestGbnCd" : $("#suggestGbnCd").val()},
		            </c:otherwise>
		            </c:choose>
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
<form name="frm" id="frm"  method="post">
<input type="hidden" name="returnUrl" id="returnUrl" />
</form>
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
				<div class="top_info">
					<p class="infom"><strong>신청안내 </strong>
					<ul class="guide gSmall">
						<li><strong> 기간 :</strong> 수시</li>
						<li> <strong>대상 :</strong> 종로구민,  직장인,  학생 등</li>
						<li> <strong>분야</strong>
							<ul>
								<li> 경영관리  및 신규사업의 개발에 관한 사항</li>
								<li> 업무능률의  향상에 관한 사항</li>
								<li> 조직  또는 사무의 간소화, 합리화에  관한 사항 </li>
								<li> 경비,  자재,  시간,  노력 등의 절감에 관한 사항</li>
								<li>안전,  위생 및 업무환경의 향상에 관한 사항       </li>
								<li> 합리적인 공단시설물 유지관리에 관한 사항</li>
								<li> 직원  사기앙양과 건실한 기풍조성에 관한 사항   </li>
								<li> 기타  공단의 발전에 유익한 사업</li>
							</ul>
						</li>
					</ul>
					<p class="infom"><strong>고객제안</strong></p>
					<ul class="guide gSmall">
						<li>  효율적인 경영방안을 마련하고 각종 제도의 편리한 구성, 구민의  복지 등에 관한 여러분의 고귀한 제안을 연중 접수합니다. </li>
					</ul>
				</div>
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
							<select name="statusCd" id="statusCd" title="처리 여부 선택">
								<option value="">전체</option>
								<option value="R">접수중</option>
								<option value="I">처리중</option>
								<option value="C">완료</option>
							</select>
							<!-- <select name="suggestGbnCd" id="suggestGbnCd" title="제안구분 선택" >
								<option value="">전체</option>
								<option value="1">공단직원</option>
								<option value="2">주민제안</option>
							</select> -->
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
					<!-- board paging -->
					<div class="btn_farm2 mt20 mb20"> 
						<!-- Text Button --> 
						<span class="txtBtn_Gray"><a href="#" id="sugWriteBtn" >신청하기</a></span> 
						<!-- Text Button --> 
						<!-- Text Button --> 
						<span class="txtBtn_lightGray"><a href="#" id="mySugestBtn" >나의 제안 조회</a></span> 
						<!-- Text Button --> 
					</div>
				</div>
				
				<!-- text Box --> 
				<div class="top_info">
					<p class="infom">제안과  상관없는 민원은 전자민원을, 그리고  자유로운 의견개진은 자유게시판을 이용해주시기 바랍니다.</p>
					<p class="infom">공단 발전을 위한 개선사항을 접수하는 곳입니다. 무관한  내용, 상업성, 저속한  표현, 명예훼손, 반사회적인  글 또는 특정인에 대한 실명기재, 비방, 동일  건에 대한 반복 등의 글은 예고없이  삭제 또는 비공개로 전환될 수 있습니다.</p>
				</div>
				<!-- text Box --> 
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%-- <jsp:include page="/front/satfact/${menuSeq }" /> --%>
				
<div class="pollWrap">
	<div class="poll">
		<p class="text">이 페이지의 내용과 편의성에 만족하십니까?</p>
		<ul>
			<li>
				<label for="satisr5">
					<input name="satisr" id="satisr5" type="radio" value="" />매우만족</label>
			</li>
			<li>
				<label for="satisr4">
					<input name="satisr" id="satisr4" type="radio" value="" />만족</label>
			</li>
			<li>
				<label for="satisr3">
					<input name="satisr" id="satisr3" type="radio" value="" />보통</label>
			</li>
			<li>
				<label for="satisr2">
					<input name="satisr" id="satisr2" type="radio" value="" />불만족</label>
			</li>
			<li>
				<label for="satisr1">
					<input name="satisr" id="satisr1" type="radio" value="" />매우불만족</label>
			</li>
		</ul>
	</div>
	<div class="btn"><a href="#link"><img src="/resources/include/commonfile/image/common/btn_regist.png" alt="등록" onclick="alert('만족도 참여에 감사드립니다.')" /></a></div>
	<ul class="satis">
		<li>
			<dl>
				<dt>컨텐츠 관리부서 :</dt>
				<dd>기획 경영팀</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>연락처</dt>
				<dd>02-3673-4071</dd>
			</dl>
		</li>
		<li class="fr">
			<dl>
				<dt>최종수정일:</dt>
				<dd>2013-12-11</dd>
			</dl>
		</li>
	</ul>
</div>
				
				
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(4,6,0,0);</script>
</body>
</html>