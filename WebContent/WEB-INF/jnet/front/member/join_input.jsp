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
<script type="text/javascript">
	$(function(){
		$("#phone2").numeric();
		$("#phone3").numeric();
		$("#tel2").numeric();
		$("#tel3").numeric();
		$("#joinBtn").click(function(){
			if($.trim($("#userId").val()) == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			if(5 > $.trim($("#userId").val()).length || $.trim($("#userId").val()).length > 14){
				alert("아이디는 5자이상 14자이하입니다.");
				return;
			}
			if($.trim($("#duplicateFlag").val()) == ""){
				alert("아이디 중복확인이 필요합니다.");
				return;
			}
			
			if($.trim($("#userPw").val()) == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
			
			if($.trim($("#userPw2").val()) == "") {
				alert("비밀번호 확인을 입력하세요");
				return;
			}
			
			if($.trim($("#userPw").val()) != $.trim($("#userPw2").val())) {
				alert("비밀번호와 비밀번호확인 입력번호가 다릅니다.");
				return;
			}

			var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			var number = "1234567890";
			var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
			var sChar_Count = 0;
			var alphaCheck = false;
			var numberCheck = false;
			var pwdLength = $.trim($("#userPw").val()).length;
				
			if(8 <= pwdLength && pwdLength <= 20){
				
				for(var i=0; i<pwdLength; i++){
					if(sChar.indexOf($("#userPw").val().charAt(i)) != -1){
						sChar_Count++;
					}
					if(alpha.indexOf($("#userPw").val().charAt(i)) != -1){
						alphaCheck = true;
					}
					if(number.indexOf($("#userPw").val().charAt(i)) != -1){
						numberCheck = true;
					}
				}
				
				if(alphaCheck != true){
					alert("비밀번호에 영문을 포함하여 입력해 주세요");
					return false;
				}		
				if(numberCheck != true){
					alert("비밀번호에 숫자를 포함하여 입력해 주세요");
					return false;
				}		
				if(sChar_Count < 1){
					alert("비밀번호에 특수문자를 포함하여 입력해 주세요");
					return false;
				}
						
				if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){			
					alert("비밀번호는 8~20자리이내 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요");
					$("#userPw").val("");
					$("#userPw2").val("");
					$("#userPw").focus();
					return false;
				}
			}else{
				
				alert("비밀번호는 8~20 자리이내 입니다");
				$("#userPw").val("");
				$("#userPw2").val("");
				$("#userPw").focus();
				return false;
			}
			
			if($.trim($("#email").val()) == "" || $.trim($("#email1").val()) == "") {
				alert("이메일을 입력하세요");
				return;
			}else{
				$("#email").val($.trim($("#email").val())+"@"+$.trim($("#email1").val()));
			}
			if($.trim($("#location").val()) == "00") {
				alert("수강장소를 선택하세요.");
				return;
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
		
		$("#duplicateBtn").click(function(){
			if($.trim($("#userId").val()) == "") {
				alert("아이디를 입력하세요");
				return;
			}
			if(5 > $.trim($("#userId").val()).length || $.trim($("#userId").val()).length > 14){
				alert("아이디는 5자이상 14자이하입니다.");
				return;
			}
			/**
			 * ajax 중복체크
			 */
			 $.ajax({
		            type:"POST",
		            url: "/front/findMemberIdDup",
		            dataType : "json",
		            data:  {"userId" : $("#userId").val()},
		            success: function(data){
		            	//중복값 존재
		            	if(data.duplicateCnt != "0" ) {
		            		$("#duplicateFlag").val("");
		            		alert("사용할 수 없는 아이디입니다.");
		            		return;
		            	//존재안함
						} else {
							//중복체크 완료
							$("#duplicateFlag").val("Y");
							alert("등록가능한 아이디입니다.");
						}              
		            },
		            error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
		      });
		});
		$("#findZipCodeBtn").click(function(){
			
			window.open("/resources/popup/search_address_pop.jsp","addr_pop","width=496,height=650,scrollbars=no");
		});
		$("#findCompZipCodeBtn").click(function(){
			
			window.open("/resources/popup/search_address_pop.jsp?category=doro&comp=comp","addr_pop","width=496,height=650,scrollbars=no");
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
      	<form method="post" name="memberFrm" id="memberFrm" action="/front/saveMember" >
      	
        <!-- real Contents -->
        <div class="mtop mb15"><img src="/resources/include/commonfile/image/member/mtop04.gif" alt="01.회원유형선택, 02.약관동의, 03.본인인증, 04.회원정보입력(현재단계), 05.회원가입완료" /></div>
        <div class="pageSection mb30" style="background:url(/resources/include/commonfile/image/board/bg_tbl.gif) 0 100% repeat-x; padding-bottom:7px; overflow:hidden">
          <!-- minwon Top  -->
          <div class="pageMinwonTop mb10">
            <p>모든 항목은 필수 입력입니다. 정확히 입력하시면 더욱 편리하게 이용하실 수 있습니다.</p>
          </div>
          <div class="boardWrap2">
            <table border="0" cellpadding="0" cellspacing="0" summary="회원 가입에 필요한 정보 입력을 받기 위한 표. " class="tbl01 tblLeft" id="memjoin">
              <caption>
              회원정보입력
              </caption>
              <tr>
                <th width="18%" scope="row"><label for="userId">아이디</label></th>
                <td width="82%"><input type="text" name="userId" id="userId" style="ime-mode:disabled"  />
                <input type="hidden" id="duplicateFlag" value="" />
                  <a href="#"><img id="duplicateBtn" src="/resources/include/commonfile/image/member/btn_dupli.gif" alt="중복확인" width="50" height="18" /></a></td>
              </tr>
              <tr>
                <th scope="row"><label for="userPw">비밀번호</label></th>
                <td><input type="password" name="userPw" id="userPw" /> * 8~20자리 영문,숫자,특수문자(3종류)를 혼합하여 입력해 주세요</td>
              </tr>
              <tr>
                <th scope="row"><label for="userPw2">비밀번호 확인</label></th>
                <td><input type="password" name="userPw2" id="userPw2" /> * 위의 비밀번호를 한번 더 입력해 주세요</td>
              </tr>
              <tr>
                <th scope="row">성명</th>
                <td>${sName}<input type="hidden" name="userNm" id="userNm" value="${sName}" />
                <input type="hidden" name="userDi" id="userDi" value="${sDupInfo}" /> 
                <input type="hidden" name="sex" id="sex" value="${sGenderCode}" /> 
                <input type="hidden" name="adult" id="adult" value="${adult}" />
                <input type="hidden" name="vNumber" id="vNumber" value="${vNumber}" />  
                <input type="hidden" name="userNo" id="userNo" value="${userNo}" />  
                 
                </td>
              </tr>
              <tr>
                <th scope="row">생년월일</th>
                <td>${sYY}년 ${sMM}월 ${sDD}일 <input type="hidden" name="birthday" id="birthday" value="${sBirthday}" /></td>
              </tr>
              <tr>
                <th scope="row"><label for="email">이메일</label></th>
                <td>
	                <input type="text" name="email" id="email"  />@										
	                <input type="text" id="email1" name="email1" readonly="readonly" />
					<select id="emailSlct" name="emailSlct" style="width: 120px;" title="이메일 도메인 선택">
						<option value="">선택</option>
						<c:forEach items="${mailList }" var="mail">
							<option value="${mail.codeNm }">${mail.codeNm}</option>
						</c:forEach>
						<option value="self">직접입력</option>
					</select>
                </td>
              </tr>
              <tr>
                <th scope="row">이메일 수신</th>
                <td><label for="radio">
                    <input type="radio" name="emailYn" id="radio" checked="checked" value="Y"  />
                    수신</label>
                  &nbsp;
                  <label for="radio2">
                    <input  type="radio" name="emailYn" id="radio2" value="N" />
                    비수신</label>
                    </td>
              </tr>
              <tr>
                <th scope="row"><label for="phone1">휴대폰 번호</label></th>
                <td>
                <input type="hidden" name="phone"  id="phone"></input>
				<select id="phone1Slct" name="phone1Slct" style="width: 80px;" title="휴대폰 앞자리">
				<option value="">선택</option>
				<c:forEach items="${mobileList }" var="mobile">
					<option value="${mobile.codeNm }">${mobile.codeNm }</option>
				</c:forEach>
				</select>
                  <input type="hidden" name="phone1" id="phone1" />
                  -
                  <input type="text" name="phone2" id="phone2" style="ime-mode:disabled"  title="휴대폰 중간자리" />
                  -
                  <input type="text" name="phone3" id="phone3" style="ime-mode:disabled" title="휴대폰 마지막자리" /></td>
              </tr>
              <tr>
                <th scope="row">SMS 수신</th>
                <td><label for="radio3">
                    <input type="radio" name="sms" id="radio3" checked="checked" value="Y"  />
                    수신</label>
                  &nbsp;
                  <label for="radio4">
                    <input  type="radio" name="sms"id="radio4" value="N" />
                    비수신</label></td>
              </tr>
            <tr>
              <th scope="row"><label for="location">수강장소선택</label></th>
              <td class="ta_l">
                <select name="location" id="location" title="수강장소">
                <option value="00">==========선택==========</option>
                <option value="11">올림픽기념국민생활관</option>
                <option value="21">종로구민회관</option>
                <option value="31">동부여성문화센터</option>
                <option value="32">청소년문화센터</option>
                <option value="33">삼청테니스장</option>
                <option value="41">종로문화체육센터</option>
                  </select>
              
              
              </td>
            </tr>
              <tr>
                <th scope="row">주소(자택)</th>
                <td><p>
                <input type="hidden" name="zipcode"  id="zipcode"></input>
                    <input type="text" name="zipcode1" id="zipcode1" readonly="readonly" title="우편번호 앞자리" />
                    -
                    <input type="text" name="zipcode2" id="zipcode2" readonly="readonly" title="우편번호 뒷자리" />
                    <a href="#"><img id="findZipCodeBtn" src="/resources/include/commonfile/image/member/btn_findpost.gif" alt="우편번호찾기"  /></a></p>
                  <p>
                    <input type="text" name="addr" id="addr" readonly="readonly"  title="주소는 검색버튼을 통해서 입력" />
                  </p><p>
                    <input type="text" name="addr2" id="addr2"  title="나머지 주소 입력" />
                  </p>
                  </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="pageSection">
          <h3><img src="/resources/include/commonfile/image/member/title_join04.gif" alt="선택 회원정보입력" /></h3>
          <p class="mb10">※ 가입하신 오프라인회원 성명, 생년월일을 입력하시고 [회원번호 찾기]를 클릭하세요.</p>
          <table class="tbl01" summary="설문참여 여부등 선택적인 회원 정보를 입력합니다. " id="memop"  border="0" cellpadding="0" cellspacing="0" >
            <caption>
            선택회원 정보입력
            </caption>
            <tr>
              <th width="30%" scope="row">전자설문 참여</th>
              <td width="70%" class="ta_l"><label for="radio5">
                  <input type="radio" name="poll" id="radio5"  value="Y"  />
                  동의함 </label>
                &nbsp;
                <label for="radio6">
                  <input  type="radio" name="poll" id="radio6" checked="checked" value="N"  />
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
				<select id="tel1Slct" name="tel1Slct" style="width: 80px;" title="자택전화번호 앞자리">
					<option value="">선택</option>
					<c:forEach items="${phoneList }" var="phone">
						<option value="${phone.codeNm }">${phone.codeNm }</option>
					</c:forEach>
				</select>
                <input type="hidden" name="tel1" id="tel1" />
                -
                <input type="text" name="tel2" id="tel2" style="ime-mode:disabled" title="자택전화번호 중간자리" />
                -
                <input type="text" name="tel3" id="tel3" style="ime-mode:disabled" title="자택전화번호 마지막자리" /></td>
            </tr>
            <tr>
              <th scope="row">주소(회사)</th>
              <td class="ta_l"><p>
              <input type="hidden" name="compZip" id="compZip"  />
                  <input type="text" name="compZip1" id="compZip1" readonly="readonly" title="우편번호 앞자리" />
                  -
                  <input type="text" name="compZip2" id="compZip2" readonly="readonly" title="우편번호 뒷자리" />
                  <a href="#"><img id="findCompZipCodeBtn" src="/resources/include/commonfile/image/member/btn_findpost.gif" alt="우편번호찾기"  /></a></p>
                <p>
                  <input type="text" name="compAddr" id="compAddr" readonly="readonly"  title="주소는 검색버튼을 통해서 입력" />
                </p>
                <p>
                  <input type="text" name="compAddr2" id="compAddr2"  title="나머지 주소 입력" />
                </p>
                </td>
            </tr>
          </table>
        </div>
        <p class="btn_farm2 mt20 mb20"> <a href="#"><img src="/resources/include/commonfile/image/member/btn_joincom.gif" id="joinBtn" alt="회원에 가입합니다." /></a>&nbsp;<a href="#"><img src="/resources/include/commonfile/image/member/btn_cancel.gif"alt="취소" /></a></p>
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
<script type="text/javascript">initMenu(8,2,0,0);</script>
</body>
</html>