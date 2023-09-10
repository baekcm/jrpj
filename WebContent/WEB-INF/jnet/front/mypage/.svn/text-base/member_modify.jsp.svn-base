<%@page import="com.jnet.util.CommonUtil"%>
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
<script type="text/javascript" src="/resources/include/commonfile/js/jquery.alphanum.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
<script language="javascript" src="/resources/XecureObject/xecureweb.js"></script>
<script language="javascript">
	PrintObjectTag();
</script>
<script type="text/javascript">
	$(function(){
		if("${flag}" == "Y"){
			alert("수정되었습니다.");
		}
		$("#phone2").numeric();
		$("#phone3").numeric();
		$("#tel2").numeric();
		$("#tel3").numeric();
		$("#joinBtn").click(function(){
			
			if($.trim($("#email").val()) == "" || $.trim($("#email1").val()) == "") {
				alert("이메일을 입력하세요");
				return;
			}else{
				$("#email").val($.trim($("#email").val()) +"@" + $.trim($("#email1").val()));
			}
			 if($.trim($("#phone1").val()) == "" || $.trim($("#phone2").val()) == "" || $.trim($("#phone3").val()) == ""){
					alert("휴대폰번호를 입력하세요");
					return;
			} else {
				$("#phone").val($.trim($("#phone1").val())+"-"+$.trim($("#phone2").val())+"-"+$.trim($("#phone3").val()));
			}
			 if($.trim($("#tel1").val()) == "" || $.trim($("#tel2").val()) == "" || $.trim($("#tel3").val()) == ""){
			} else {
				$("#tel").val($.trim($("#tel1").val())+"-"+$.trim($("#tel2").val())+"-"+$.trim($("#tel3").val()));
			}
			 if( $.trim($("#zipcode1").val()) == "" || $.trim($("#zipcode2").val()) == ""){
					alert("우편번호를 입력하세요");
					return;
			} else {
				$("#zipcode").val($.trim($("#zipcode1").val())+""+$.trim($("#zipcode2").val()) );
			}
			 if( $.trim($("#compZip1").val()) == "" || $.trim($("#compZip2").val()) == ""){
			} else {
				$("#compZip").val($.trim($("#compZip1").val())+""+$.trim($("#compZip2").val()) );
			}
			
			$("#memberFrm").submit();
		});
		
		$("#findZipCodeBtn").click(function(){
			
			window.open("/resources/popup/search_address_pop.jsp","addr_pop","width=496,height=650,scrollbars=no");
		});
		$("#findCompZipCodeBtn").click(function(){
			
			window.open("/resources/popup/search_address_pop.jsp?category=doro&comp=comp","addr_pop","width=496,height=650,scrollbars=no");
		});
		$("#outBtn").click(function(){
			
			location.href="/front/mypage/memberOut";
		});
		
		//연락처 변경 - 지역번호
		$("#phone1Slct").change(function(){
			if($("#phone1Slct").val() == "") {
				$("#phone1").val("");
			} else {
				$("#phone1").val($("#phone1Slct").val());
			}
		});
		
		$("#tel1Slct").change(function(){
			if($("#tel1Slct").val() == "") {
				$("#tel1").val("");
			} else {
				$("#tel1").val($("#tel1Slct").val());
			}
		});
		
		
		
		//메일주소 변경
		$("#emailSlct").change(function(){
			if($("#emailSlct").val() == "") {
				$("#email1").val("");
			} else {
				if($("#emailSlct").val() == "self") {
					$("#email1").val("");
					$("#email1").attr("readonly",false);
					$("#email1").focus();
				} else {
					$("#email1").attr("readonly",true);
					$("#email1").val($("#emailSlct").val());	
				}
			}
		});
	});
	
</script>
</head>
<body>
<form name='xecure'><input type=hidden name='p'></form>
<div class="accessibility"> <a href="#contentcore">Go to Contents</a> </div>
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
		<div class="ttabWrap">
			<ul id="ttab3">
				<li></li>
			</ul>
		</div>
				<%
				if(CommonUtil.getSystemProperties("os.name").indexOf("Linux") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
		        	System.out.println("client linux ---------------> " );
	        	%>
	        	
		      	<form method="post" name="memberFrm" id="memberFrm" action="/front/saveMember" onSubmit="return XecureSubmit(this);" >
		      	
	        	<%
				}else{
					System.out.println("client window ---------------> " );
				%>
				
		      	<form method="post" name="memberFrm" id="memberFrm" action="/front/saveMember"  >
	        	<%
				}
				%>
      	
        <!-- real Contents -->
        <div class="pageSection mb30" style="background:url(/resources/include/commonfile/image/board/bg_tbl.gif) 0 100% repeat-x; padding-bottom:7px; overflow:hidden">
          <!-- minwon Top  -->
          <!-- <div class="pageMinwonTop mb10">
            <p>모든 항목은 필수 입력입니다. 정확히 입력하시면 더욱 편리하게 이용하실 수 있습니다.</p>
          </div> -->
          <div class="boardWrap2">
            <table border="0" cellpadding="0" cellspacing="0" summary="회원 가입에 필요한 정보 입력을 받기 위한 표. " class="tbl01 tblLeft" id="memjoin">
              <caption>
              회원정보입력
              </caption>
              <tr>
                <th width="18%" scope="row"><label for="memid">아이디</label></th>
                <td width="82%">${member.userId}
                </td>
              </tr>
<!--               <tr>
                <th scope="row"><label for="mempw">비밀번호</label></th>
                <td><input type="password" name="userPw" id="userPw" /></td>
              </tr>
              <tr>
                <th scope="row"><label for="mempw2">비밀번호 확인</label></th>
                <td><input type="password" name="userPw2" id="userPw2" /></td>
              </tr> -->
              <tr>
                <th scope="row">성명</th>
                <td>${member.userNm}  
                </td>
              </tr>
              <tr>
                <th scope="row">생년월일</th>
                <td>${member.birthday}</td>
              </tr>
              <tr>
                <th scope="row"><label for="mememail">이메일</label></th>
                <td>
	                <input type="text" name="email" id="email"  value="${fn:split(member.email,'@')[0] }" />@										
	                <input type="text" id="email1" name="email1" readonly="readonly" value="${fn:split(member.email,'@')[1] }" />
	                <c:set var="cnt" value="0" />
					<select id="emailSlct" name="emailSlct" style="width: 120px;" title="이메일 도메인 선택">
						<option value="">선택</option>
						<c:forEach items="${mailList }" var="mail">
							<option value="${mail.codeNm }"
								<c:if test="${fn:split(member.email,'@')[1] eq mail.codeNm }">selected="selected"</c:if>
								<c:if test="${fn:trim(fn:split(member.email,'@')[1] ) != '' && fn:trim(fn:split(member.email,'@')[1] ) eq mail.codeNm}">
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
                <th scope="row">이메일 수신</th>
                <td><label for="radio">
                    <input type="radio" name="emailYn" <c:if test="${member.emailYn eq 'Y'}">checked="checked" </c:if> value="Y"  />
                    수신</label>
                  &nbsp;
                  <label for="radio2">
                    <input  type="radio" name="emailYn" <c:if test="${member.emailYn eq 'N'}">checked="checked" </c:if>  value="N" />
                    비수신</label>
                    </td>
              </tr>
            <tr>
              <th scope="row"><label for="memlect">수강장소선택</label></th>
              <td class="ta_l">
                <select name="location" id="location" title="수강장소" disabled="disabled">
                <option <c:if test="${member.location eq '11'}">selected="selected" </c:if> value="11">올림픽기념국민생활관</option>
                <option <c:if test="${member.location eq '21'}">selected="selected" </c:if> value="21">종로구민회관</option>
                <option <c:if test="${member.location eq '31'}">selected="selected" </c:if> value="31">동부여성문화센터</option>
                <option <c:if test="${member.location eq '32'}">selected="selected" </c:if> value="32">청소년문화센터</option>
                <option <c:if test="${member.location eq '33'}">selected="selected" </c:if> value="33">삼청테니스장</option>
                <option <c:if test="${member.location eq '41'}">selected="selected" </c:if> value="41">종로문화체육센터</option>
                  </select>
              </td>
            </tr>
              <tr>
                <th scope="row"><label for="cel1">휴대폰 번호</label></th>
                <td>
                <input type="hidden" name="phone"  id="phone"></input>
                  
			<select id="phone1Slct" name="phone1Slct" style="width: 80px;" title="휴대폰 앞자리">
				<option value="">선택</option>
				<c:forEach items="${mobileList }" var="mobile">
					<option value="${mobile.codeNm }"
						<c:if test="${member.phone1 eq mobile.codeNm }">selected="selected"</c:if>
					>${mobile.codeNm }</option>
				</c:forEach>
			</select>
			<input type="hidden" id="phone1" name="phone1" value="${member.phone1}" />
                  -
                  <input type="text" name="phone2" id="phone2"  style="ime-mode:disabled" title="휴대폰 중간자리" value="${member.phone2}" />
                  -
                  <input type="text" name="phone3" id="phone3" style="ime-mode:disabled" title="휴대폰 마지막자리" value="${member.phone3}" /></td>
              </tr>
              <tr>
                <th scope="row">SMS 수신</th>
                <td><label for="radio3">
                    <input type="radio" name="sms" id="radio3" <c:if test="${member.sms eq 'Y'}">checked="checked" </c:if> value="Y"  />
                    수신</label>
                  &nbsp;
                  <label for="radio4">
                    <input  type="radio" name="sms" id="radio4" <c:if test="${member.sms eq 'N'}">checked="checked" </c:if> value="N" />
                    비수신</label></td>
              </tr>
              <tr>
                <th scope="row">주소(자택)</th>
                <td><p>
                <input type="hidden" name="zipcode"  id="zipcode"></input>
                    <input type="text" name="zipcode1" id="zipcode1" title="우편번호 앞자리" readonly="readonly"  value="${member.zipcode1}"/>
                    -
                    <input type="text" name="zipcode2" id="zipcode2" title="우편번호 뒷자리" readonly="readonly"  value="${member.zipcode2}" />
                    <a href="#"><img id="findZipCodeBtn" src="/resources/include/commonfile/image/member/btn_findpost.gif" alt="우편번호찾기"  /></a></p>
                  <p>
                    <input type="text" name="addr" id="addr" readonly="readonly" value="${member.addr}"  title="주소는 검색버튼을 통해서 입력" />
                  </p>
						<p>
                    <input type="text" name="addr2" id="addr2" value="${member.addr2}"  title="나머지 주소 입력" />
                  </p>
                  </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="pageSection">
          <h3><img src="/resources/include/commonfile/image/member/title_join04.gif" alt="선택 회원정보입력" /></h3>
        <p class="mb10"> </p>
          <table class="tbl01" summary="설문참여 여부등 선택적인 회원 정보를 입력합니다. " id="memop"  border="0" cellpadding="0" cellspacing="0" >
            <caption>
            선택회원 정보
            </caption>
            <tr>
              <th width="30%" scope="row">전자설문 참여</th>
              <td width="70%" class="ta_l"><label for="radio5">
                  <input type="radio" name="poll" id="radio5" <c:if test="${member.poll eq 'Y'}">checked="checked" </c:if>  value="Y"  />
                  동의함 </label>
                &nbsp;
                <label for="radio6">
                  <input  type="radio" name="poll" id="radio6" <c:if test="${member.poll eq 'N'}">checked="checked" </c:if>  value="N"  />
                  동의안함<br />
                  <br />
                </label>
                <p class="bul_bil">전자설문(종로 델파이시스템)은 인터넷이나 SMS를 통해 주요 정책사항을 주민에게 물어 주민의 의견을 반영하는 주민참여시스템입니다. 회원가입 시 제공하신 이메일과 휴대폰번호로 
                  주요사안에 대한 내용을 받아 직접 설문에 참여하실 수 있습니다. </p></td>
            </tr>
            <tr>
              <th scope="row">자택전화번호</th>
              <td class="ta_l">
              <input type="hidden" name="tel" id="tel"  />
				<select id="tel1Slct" name="tel1Slct" style="width: 80px;" title="자택전화번호 앞자리" >
					<option value="">선택</option>
					<c:forEach items="${phoneList }" var="phone">
						<option value="${phone.codeNm }"
							<c:if test="${member.tel1 eq phone.codeNm }">selected="selected"</c:if>
						>${phone.codeNm }</option>
					</c:forEach>
				</select>
				<input type="hidden" id="tel1" name="tel1" value="${member.tel1 }" />
                -
                <input type="text" name="tel2" id="tel2" style="ime-mode:disabled" value="${member.tel2}"  title="자택전화번호 중간자리" />
                -
                <input type="text" name="tel3" id="tel3" style="ime-mode:disabled" value="${member.tel3}" title="자택전화번호 마지막자리" /></td>
            </tr>
            <tr>
              <th scope="row">주소(회사)</th>
              <td class="ta_l"><p>
              <input type="hidden" name="compZip" id="compZip"  />
                  <input type="text" name="compZip1" id="compZip1" readonly="readonly" value="${member.compZip1}" title="우편번호 앞자리" />
                  -
                  <input type="text" name="compZip2" id="compZip2" readonly="readonly" value="${member.compZip2}" title="우편번호 뒷자리" />
                  <a href="#"><img id="findCompZipCodeBtn" src="/resources/include/commonfile/image/member/btn_findpost.gif" alt="우편번호찾기"  /></a></p>
                <p>
                  <input type="text" name="compAddr" id="compAddr" readonly="readonly" value="${member.compAddr}"  title="주소는 검색버튼을 통해서 입력" />
                </p>
					<p>	
                  <input type="text" name="compAddr2" id="compAddr2"  value="${member.compAddr2}"  title="주소는 검색버튼을 통해서 입력" />
                </p>
                </td>
            </tr>
          </table>
        </div>
<div class="pageSection">
          <h3><img src="/resources/include/commonfile/image/member/title_join04.gif" alt="기타정보" /></h3>
          <p class="mb10"> </p>
          <table class="tbl01" summary="설문참여 여부등 선택적인 회원 정보를 입력합니다. " id="memop"  border="0" cellpadding="0" cellspacing="0" >
            <caption>
            기타정보
            </caption>
            <tr>
              <th width="30%" scope="row">게시판 등록</th>
              <td width="70%" class="ta_l"><p> 게시글 : ${member.boardCnt} / 댓글 : ${member.replyCnt} </p>
              </td>
            </tr>
            <tr>
              <th scope="row">최근방문일</th>
              <td class="ta_l"> 총 방문수 : ${member.visitCnt} / 최종방문일 :
					${fn:substring(member.loginYmd,0,4)}-${fn:substring(member.loginYmd,4,6)}-${fn:substring(member.loginYmd,6,8)}
					${fn:substring(member.loginHms,0,2)}:${fn:substring(member.loginHms,2,4)}:${fn:substring(member.loginHms,4,6)}
              </td>
            </tr>
            <tr>
              <th scope="row">회원가입일</th>
              <td class="ta_l">
              ${fn:substring(member.signYmd,0,4)}-${fn:substring(member.signYmd,4,6)}-${fn:substring(member.signYmd,6,8)}
                </td>
            </tr>
            <tr>
              <th scope="row">회원탈퇴</th>
              <td class="ta_l"> <p>회원탈퇴를 원하시면 [회원탈퇴]를 클릭하세요.
              <a href="#"><img id="outBtn" src="/resources/include/commonfile/image/member/btn_out1.gif" alt="탈퇴신청"  /></a></p>
                </td>
            </tr>
          </table>
        </div>
        <p class="btn_farm2 mt20 mb20"> <a href="#"><img src="/resources/include/commonfile/image/member/btn_re.gif" id="joinBtn" alt="회원에 가입합니다." /></a>&nbsp;<a href="#"><img src="/resources/include/commonfile/image/member/btn_cancel.gif"alt="취소" /></a></p>
        <!-- minwon Top  -->
        <!-- real Contents -->
        
        <!--만족도 조사가 들어갈 영역 -->
        <jsp:include page="/front/satfact/${menuSeq }" />
        <!--만족도 조사가 들어갈 영역 -->
      </div>
    </div>
  </div>
</div>
<div id="footer">
  <jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(9,2,1,0);</script>
</body>
</html>