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
<script type="text/javascript" src="/resources/include/commonfile/js/jquery.alphanum.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
<script type="text/javascript">
	$(function(){
		$("#phone1").numeric(); 
		$("#phone2").numeric(); 
		$("#phone3").numeric(); 
		 $("#saveBtn").click(function(){
				if($.trim($("#subject").val()) == "" ) {
					alert("제목을 입력하세요.");
					$("#subject").focus();
					return false;
				}
				if($.trim($("#userNm").val()) == "" ) {
					alert("작성자를 입력하세요.");
					$("#userNm").focus();
					return false;
				}
				if($.trim($("#phone1").val()) == "" || $.trim($("#phone2").val()) == "" || $.trim($("#phone3").val()) == "" ) {
					alert("연락처를 입력하세요.");
					if($.trim($("#phone1").val()) == ""){
						$("#phone1").focus();
						return false;
					}else if($.trim($("#phone2").val()) == ""){
						$("#phone2").focus();
						return false;
					}else if($.trim($("#phone3").val()) == ""){
						$("#phone3").focus();
						return false;
					}
					return false;
				}
				if($.trim($("#email1").val()) == "" || $.trim($("#email2").val()) == "" ) {
					alert("이메일을 입력하세요.");
					if($.trim($("#email1").val()) == ""){
						$("#email1").focus();
						return false;
					}else if($.trim($("#email2").val()) == ""){
						$("#email2").focus();
						return false;
					}
					return false;
				}
				if($.trim($("#content").val()) == "" ) {
					alert("내용을 입력하세요.");
					$("#content").focus();
					return false;
				}
			$("#pageFrm").submit();
		});
		 $("#cancleBtn").click(function(){
			window.location.href="/front/cleanMain";
		});
		 
		//연락처 변경 - 지역번호
			$("#phone1Slct").change(function(){
				if($("#phone1Slct").val() == "") {
					$("#phone1").val("");
				} else {
					$("#phone1").val($("#phone1Slct").val());
				}
			});
			
			
			
			
			//메일주소 변경
			$("#emailSlct").change(function(){
				if($("#emailSlct").val() == "") {
					$("#email2").val("");
				} else {
					if($("#emailSlct").val() == "self") {
						$("#email2").val("");
						$("#email2").attr("readonly",false);
						$("#email2").focus();
					} else {
						$("#email2").attr("readonly",true);
						$("#email2").val($("#emailSlct").val());	
					}
				}
			});
	});
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
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				<!-- real Contents -->
				<form action="/front/saveClean" name="pageFrm" id="pageFrm"  method="post"  enctype="multipart/form-data">
				
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
						<caption>
						클린신고 작성하기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row"><label for="subject">제목</label></th>
							<td class="bd01td listx"><input name="subject" id="subject" type="text"  style="width: 400px;"/></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="userNm">작성자</label></th>
							<td class="bd01td"><span class="bd01td listx">
								<input name="userNm" id="userNm" type="text" />
								</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="phone1">연락처</label></th>
							<td class="bd01td"><span class="bd01td listx">
									<select id="phone1Slct" name="phone1Slct" style="width: 80px;" title="연락처 앞자리">
										<option value="">선택</option>
										<c:forEach items="${phoneList }" var="phone">
											<option value="${phone.codeNm }">${phone.codeNm }</option>
										</c:forEach>
									</select>
									<input value="${phone1 }" type="hidden"  name="phone1" id="phone1" title="연락처 앞자리" />-
								<input name="phone2" maxlength="4" size="5" style="ime-mode:disabled"   id="phone2" type="text" title="연락처 중간자리" />-
								<input name="phone3" maxlength="4" size="5" style="ime-mode:disabled"   id="phone3" type="text" title="연락처 뒷자리" />
							</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="email1">이메일</label></th>
							<td class="bd01td"><span class="bd01td listx">
								<input name="email1" id="email1" type="text" style="ime-mode:disabled" />@
								<input name="email2" id="email2" type="text" readonly="readonly" style="ime-mode:disabled" />
				                <c:set var="cnt" value="0" />
								<select id="emailSlct" name="emailSlct" style="width: 120px;" title="이메일 도메인 선택">
									<option value="">선택</option>
									<c:forEach items="${mailList }" var="mail">
										<option value="${mail.codeNm }">${mail.codeNm}</option>
									</c:forEach>
									<option value="self" >직접입력</option>
								</select>
								</span></td>
						</tr>
						<tr>
							<td colspan="2" scope="row" class="bd01tdC">
							<textarea name="content" id="content" cols="60" rows="30" title="내용입력"></textarea></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row" valign="top">
								<label for="file01">파일첨부</label>
							</th>
							<td class="bd01td">
								<input name="boardFileList"  type="file" title="파일 첨부" />
							</td>
						</tr>
					</table>
				</div>
				</form>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#" id="saveBtn" >작성</a></span> &nbsp;
					<span class="txtBtn_lightGray"><a href="#" id="cancleBtn" >취소</a></span> 
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
<script type="text/javascript">initMenu(4,7,0,0);</script>
</body>
</html>