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
		$("#findZipCodeBtn").click(function(){
			
			window.open("/resources/popup/search_address_pop.jsp?category=doro","addr_pop","width=496,height=650,scrollbars=no");
		});
		$("#saveCptBtn").click(function(){
			
			$("#frm").submit();
		});
		$("#cancleBtn").click(function(){
			$("#frm").attr("action","/front/removeMinwon");
			$("#frm").submit();
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
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- minwon Top  -->
					<!-- minwon Top  --> 
					<!--minwon main-->
					
					<form  action="/front/saveMinwon" method="post" name="frm" id="frm" enctype="multipart/form-data">
					<input type="hidden" name="qIdDi" id="qIdDi" value="${outMinwon.qIdDi }"/>
					<input type="hidden" name="qSex" id="qSex" value="${outMinwon.qSex }"/>
					<input type="hidden" name="qSeq" id="qSeq" value="${outMinwon.qSeq }"/>
					<ul class="guide formCreateMinwon">
						<li><strong>개인정보</strong>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="개인 정보를 입력받는 폼을 포함한 표 " class="tbl01">
								<caption>
								개인정보
								</caption>
								<tr>
									<th width="14%" scope="row"><label for="qNm">이름</label></th>
									<td width="29%" class="ta_l"><a href="javascript:ckname();">
										<input readonly="readonly" maxlength="10" size="10" name="qNm" id="qNm" value="${outMinwon.qNm }"/>
										</a></td>
									<th width="14%"><label for="qBirth">생년월일</label></th>
									<td width="43%" class="ta_l"><a href="javascript:ckname();">
										<input readonly="readonly" maxlength="8" size="10" name="qBirth" id="qBirth"  value="${outMinwon.yymm }" />
										</a></td>
								</tr>
								<tr>
									<th rowspan="3" scope="row"><label for="zipcode1">주소</label></th>
									<td colspan="3" class="ta_l"><input readonly="readonly" value="${outMinwon.zipcode1 }" maxlength="3" size="4" name="zipcode1" id="zipcode1" title="우편번호 앞자리" />
										- 
										<input readonly="readonly" maxlength="3" size="4"  value="${outMinwon.zipcode2 }" name="zipcode2" id="zipcode2" title="우편번호 뒷자리"  />
										
										<!-- Text Button --> 
										<span class="txtBtn_lightGray"><a href="#" id="findZipCodeBtn" >우편번호 찾기</a></span> 
										<!-- Text Button --></td>
								</tr>
								<tr>
									<td colspan="3" class="ta_l"><input tabindex="-1" readonly="readonly"  value="${outMinwon.dftAddr }" size="50" name="addr" id="addr" title="주소는 검색 버튼을 눌러서 입력하세요" /></td>
								</tr>
								<tr>
									<td colspan="3" class="ta_l"><input maxlength="50" value="${outMinwon.dtlAddr }" size="50" name="dtlAddr" id="dtlAddr" title="나머지 주소 입력" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="phone1">연락처</label></th>
									<td colspan="3" class="ta_l">
									<select id="phone1Slct" name="phone1Slct" style="width: 80px;" title="연락처 앞자리">
										<option value="">선택</option>
										<c:forEach items="${phoneList }" var="phone">
											<option value="${phone.codeNm }"
												<c:if test="${outMinwon.phone1 eq phone.codeNm }">selected="selected"</c:if>
											>${phone.codeNm }</option>
										</c:forEach>
									</select>
									<input maxlength="3" size="5"  value="${outMinwon.phone1 }" name="phone1" id="phone1" type="hidden" title="연락처 앞자리" />
										- 
										<input maxlength="4" size="5" name="phone2"id="phone2"  value="${outMinwon.phone2 }" title="연락처 중간자리" />
										- 
										<input maxlength="4" size="5" name="phone3" id="phone3"  value="${outMinwon.phone3 }" title="연락처 뒷자리" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="email1">E-MAIL</label></th>
									<td colspan="3" class="ta_l">
									<input maxlength="30" size="30" name="email1" id="email1"  value="${outMinwon.email1 }" />@
									<input maxlength="30" size="30" name="email2" id="email2" readonly="readonly" value="${outMinwon.email2 }" />
					                <c:set var="cnt" value="0" />
									<select id="emailSlct" name="emailSlct" style="width: 120px;" title="이메일 도메인 선택">
										<option value="">선택</option>
										<c:forEach items="${mailList }" var="mail">
											<option value="${mail.codeNm }"
												<c:if test="${outMinwon.email2 eq mail.codeNm }">selected="selected"</c:if>
												<c:if test="${fn:trim(outMinwon.email2) != '' && fn:trim(outMinwon.email2 ) eq mail.codeNm}">
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
									<th scope="row">공개여부</th>
									<td colspan="3" class="ta_l">
										<label for="divsion"><input type="radio" name="showYn" <c:if test="${outMinwon.showYn eq 'Y' }"> checked="checked" </c:if> id="divsion" value="Y" />
										<strong>공개</strong></label> &nbsp; 
										<label for="divsion2"><input type="radio" name="showYn"  <c:if test="${outMinwon.showYn eq 'N' }"> checked="checked" </c:if> id="divsion2" value="N" />
										<strong>비공개</strong></label></td>
								</tr>
								<tr>
									<th scope="row"><label for="resGbnCd">응답구분</label></th>
									<td colspan="3" class="ta_l">
									<select onchange="changeTyle(this.value)" name="resGbnCd" id="resGbnCd" title="응답 구분 선택">
											<option <c:if test="${outMinwon.resGbnCd eq 1 }"> selected="selected" </c:if>  value="1">민원게시판답변</option>
											<option <c:if test="${outMinwon.resGbnCd eq 2 }"> selected="selected" </c:if>  value="2">전화답변</option>
											<option <c:if test="${outMinwon.resGbnCd eq 3 }"> selected="selected" </c:if>  value="3">E-MAIL답변</option>
										</select></td>
								</tr>
							</table>
						</li>
						<li><strong>내용</strong>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="민원내용을 입력하기 위한 표. " class="tbl01">
								<caption>
								내용
								</caption>
								<tr>
									<th width="14%" scope="row"><label for="commCodeSeq1">사업장</label></th>
									<td width="86%" class="ta_l">
										<select name="commCodeSeqList[0]" id="commCodeSeq1" title="사업장 카테고리">
											<option value="">----선택해주세요----</option>
												<c:forEach items="${listUpId }" var="list" varStatus="status" >
													<option <c:if test="${ list.commCodeSeq eq outMinwon.upId }" >  selected="selected" </c:if> value="${list.commCodeSeq }">${list.codeNm }</option>	
												</c:forEach>
										</select>
										</td>
								</tr>
								<tr>
									<th scope="row"><label for="commCodeSeq2">분야</label></th>
									<td class="ta_l">
										<select name="commCodeSeqList[1]" id="commCodeSeq2" title="분야 카테고리">
											<option value="">-선택해주세요-</option>
											<c:if test="${listGbnId != null && fn:length(listGbnId) > 0 }">
												<c:forEach items="${listGbnId }" var="list">
													<option <c:if test="${ list.commCodeSeq  eq outMinwon.areaId }" >  selected="selected" </c:if> value="${list.commCodeSeq }">${list.codeNm }</option>	
												</c:forEach>
											</c:if>
										</select>
										</td>
								</tr>
								<tr>
									<th scope="row"><label for="title">제목</label></th>
									<td class="ta_l"><input maxlength="60" size="73" align="absmiddle" name="subject" id="subject" value="${outMinwon.qSubject}" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="content">내용</label></th>
									<td class="ta_l"><textarea rows="15" cols="90" name="content" id="content">${outMinwon.qContent}</textarea></td>
								</tr>
							</table>
						</li>
					</ul>
					</form>
					<div class="btn_farm2 mt20 mb20"> 
						<!-- Text Button --> 
						<span class="txtBtn_lightGray"><a href="#" id="saveCptBtn" >작성</a></span> &nbsp;
						<span class="txtBtn_Gray"><a href="#" id="cancleBtn" >민원취소</a></span>  &nbsp;
						<span class="txtBtn_lightGray"><a href="/front/minwonMyList" >취소</a></span> 
						<!-- Text Button --> 
					</div>
					<!--minwon main--> 
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