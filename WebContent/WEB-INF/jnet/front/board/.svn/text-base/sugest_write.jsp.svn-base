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
		$("#submitBtn").click(function(){
			
/* 			if( $("input[name='suggestGbnCd']:checked").length == 0 ) {

				alert("제안구분을 선택하세요.");
				$("#divsion").focus();
				return false;
			} */
			if($.trim($("#phone1").val()) == "" ||$.trim($("#phone2").val()) == "" ||$.trim($("#phone3").val()) == "" ) {
				alert("연락처를 입력하세요.");
				$("#phone1").focus();
				return false;
			}
			if($.trim($("#email1").val()) == "" ||$.trim($("#email2").val()) == "" ) {
				alert("이메일을 입력하세요.");
				$("#email1").focus();
				return false;
			}
			if( $("input[name='useYn']:checked").length == 0 ) {

				alert("공개여부를 선택하세요.");
				$("#useYn1").focus();
				return false;
			}
			if($.trim($("#subject").val()) == "" ) {
				alert("제목을 입력하세요.");
				$("#subject").focus();
				return false;
			}
			if($.trim($("#purpose").val()) == "" ) {
				alert("개요/목적을 입력하세요.");
				$("#purpose").focus();
				return false;
			}
			if($.trim($("#problem").val()) == "" ) {
				alert("현황/문제점을 입력하세요.");
				$("#problem").focus();
				return false;
			}
			if($.trim($("#way").val()) == "" ) {
				alert("개선방안을 입력하세요.");
				$("#way").focus();
				return false;
			}
			if($.trim($("#effect").val()) == "" ) {
				alert("기대효과를 입력하세요.");
				$("#effect").focus();
				return false;
			}
			$("#frm").submit();
		});
		
		$("#cancelBtn").click(function(){
			location.href="/admin/listBbsData/${boardSeq}?gseq=${gseq}&lseq=${lseq}";
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
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				<!-- real Contents -->
				<form action="/front/saveSugest" method="post" name="frm" id="frm" enctype="multipart/form-data">
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
						<caption>
						분실물습득안내 작성하기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row"><label for="userNm">작성자</label></th>
							<td class="bd01td"><span class="bd01td listx">
								<input readonly="readonly" name="userNm" id="userNm" type="text" value="${userNm }" />
								</span></td>
						</tr>
						<!-- <tr>
							<th class="ta_l" scope="row">제안구분</th>
							<td class="bd01td">
								<label for="divsion"><input type="radio" name="suggestGbnCd" id="divsion" value="1" />
								<strong>공단직원</strong></label> &nbsp; 
								<label for="divsion2"><input type="radio" name="suggestGbnCd" id="divsion2" value="2" />
								<strong>주민제안</strong></label></td>
						</tr> -->
						<tr>
									<th class="ta_l" scope="row"><label for="phone1">연락처</label></th>
									<td class="bd01td" >
									<select id="phone1Slct" name="phone1Slct" style="width: 80px;" title="연락처 앞자리">
										<option value="">선택</option>
										<c:forEach items="${phoneList }" var="phone">
											<option value="${phone.codeNm }"
												<c:if test="${phone1 eq phone.codeNm }">selected="selected"</c:if>
											>${phone.codeNm }</option>
										</c:forEach>
									</select>
									<input value="${phone1 }" type="hidden"  name="phone1" id="phone1" title="연락처 앞자리" />
										- 
										<input maxlength="4" size="5" name="phone2"id="phone2" style="ime-mode:disabled" value="${phone2 }" title="연락처 중간자리" />
										- 
										<input maxlength="4" size="5" name="phone3" id="phone3" style="ime-mode:disabled" value="${phone3 }" title="연락처 뒷자리" /></td>
								</tr>
								<tr>
									<th class="ta_l" scope="row"><label for="email1">E-MAIL</label></th>
									<td class="bd01td" >
									<input value="${email1 }" maxlength="30" size="30" name="email1" style="ime-mode:disabled" id="email1" />@
									<input value="${email2 }" maxlength="30" size="30" name="email2" readonly="readonly" style="ime-mode:disabled" id="email2" />
					                <c:set var="cnt" value="0" />
									<select id="emailSlct" name="emailSlct" style="width: 120px;" title="이메일 도메인 선택">
										<option value="">선택</option>
										<c:forEach items="${mailList }" var="mail">
											<option value="${mail.codeNm }"
												<c:if test="${email2 eq mail.codeNm }">selected="selected"</c:if>
												<c:if test="${fn:trim(email2) != '' && fn:trim(email2 ) eq mail.codeNm}">
													<c:set var="cnt" value="${cnt+1 }" />		
												</c:if>
											>${mail.codeNm}</option>
										</c:forEach>
										<option value="self"
											<c:if test="${cnt eq 0 }">selected="selected"</c:if>
										>직접입력</option>
									</select>
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">공개여부</th>
									<td class="bd01td">
										<label for="useYn1"><input type="radio" name="useYn" id="useYn1" value="Y" />
										<strong>공개</strong></label> &nbsp; 
										<label for="useYn2"><input type="radio" name="useYn" id="useYn2" value="N" />
										<strong>비공개</strong></label></td>
								</tr>
						<tr>
							<th scope="row" class="ta_l"><label for="subject">제안제목</label></th>
							<td class="bd01td"><input name="subject" id="subject"  size="73" maxlength="60" align="absmiddle" /></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">내용</th>
							<td class="bd01tdD"><ul class="guide">
									<li><strong>개요/목적</strong>
										<p><textarea name="purpose" id="purpose" cols="70" rows="10" title="개요/목적 입력"></textarea></p>
									</li>
									<li><strong>현황/문제점</strong>
										<p><textarea name="problem" id="problem" cols="70" rows="10" title="현황/문제점 입력"></textarea></p>
									</li>
									<li><strong>개선방안</strong>
										<p><textarea name="way" id="way" cols="70" rows="10" title="개선방안 입력"></textarea></p>
									</li>
									<li><strong>기대효과</strong>
										<p><textarea name="effect" id="effect" cols="70" rows="10" title="기대효과 입력"></textarea></p>
									</li>
								</ul></td>
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
					<span class="txtBtn_lightGray"><a href="#" id="submitBtn">신청확인</a></span> &nbsp; <span class="txtBtn_lightGray">
					<a href="/front/sugestList" >취소</a></span> 
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
<script type="text/javascript">
function submit() {
	alert("제안이 접수되었습니다. 감사합니다.");
	window.location.href="/open/sugest_list.jsp";
}
</script>
</body>
</html>