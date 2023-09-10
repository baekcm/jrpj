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
		
		 $("#updateBtn").click(function(){
			$("#pageFrm").attr("action","/front/formUpdateSugest");
			$("#pageFrm").submit();	
				});
		 $("#removeBtn").click(function(){
			 if(confirm("삭제 하시겠습니까?")){
			$("#pageFrm").attr("action","/front/removeSugest");
			$("#pageFrm").submit();				
			 }
		});
		 $("#listBtn").click(function(){
			$("#pageFrm").attr("action","/front/sugestList");
			$("#pageFrm").submit();	
		});
			$("a[name=fileDown]").click(function(){
				var fileSeq = $(this).attr("data");
				$("#suggestFileSeq").val(fileSeq);
				$("#downFrm").submit();
			});
	});
</script>

</head>

<body>
<form method="post" name="downFrm" id="downFrm" action="/admin/downSuggestFile">
	<input type="hidden" name="suggestFileSeq" id="suggestFileSeq" />
</form>
<form  name="pageFrm" id="pageFrm"  method="post">
	<input type="hidden" name="suggestSeq" id="suggestSeq" value="${outBbs.suggestSeq}" />
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
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제안제목과 내용을 포함한 제안내용 상세보기의 표" class="bd00view">
						<caption>
						제안내용 상세보기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row">성명</th>
							<td class="bd01td">${outBbs.userNm }</td>
						</tr>
						<%-- <tr>
							<th class="ta_l" scope="row">구분</th>
							<td class="bd01td">
							<c:if test="${outBbs.suggestGbnCd =='1' }">공단직원</c:if>
							<c:if test="${outBbs.suggestGbnCd =='2' }">주민제안</c:if>
							
							</td>
						</tr> --%>
						<tr>
							<th class="ta_l" scope="row">연락처</th>
							<td class="bd01td">${outBbs.phone1 }-${outBbs.phone2 }-${outBbs.phone3 }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">이메일</th>
							<td class="bd01td">${outBbs.email1 }@${outBbs.email2 }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">공개여부</th>
							<td class="bd01td">
							<c:if test="${outBbs.useYn =='Y' }">공개</c:if>
							<c:if test="${outBbs.useYn =='N' }">비공개</c:if>
							</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">제안제목</th>
							<td class="bd01td">${outBbs.subject }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">개요/목적</th>
							<td class="bd01td">${outBbs.purpose }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">현황/문제점</th>
							<td class="bd01td">${outBbs.problem }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">개선방안</th>
							<td class="bd01td">${outBbs.way }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">기대효과</th>
							<td class="bd01td">${outBbs.effect }</td>
						</tr>
						<c:if test="${outBbs.suggestFileSeq != null && outBbs.suggestFileSeq > 0 }">
							<tr>
								<th class="ta_l" scope="row"><label for="file01">파일첨부</label></th>
								<td class="bd01td">
									<a href="#" name="fileDown" data="${outBbs.suggestFileSeq }">${outBbs.orgnlFileNm }</a>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<c:if test="${userInfo.userId eq outBbs.createId or userInfo.userDi eq outBbs.createId }">
						<!-- Text Button --> 
						<span class="txtBtn_Gray"><a href="#" id="updateBtn" >수정</a></span> 
						<!-- Text Button --> 
						<!-- Text Button --> 
						<span class="txtBtn_Gray"><a href="#" id="removeBtn" >삭제</a></span> 
						<!-- Text Button --> 
					</c:if>
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#" id="listBtn" >목록으로</a></span> 
					<!-- Text Button --> 
				</div>
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