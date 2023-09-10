<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript">
$(function(){
	$("#updateBtn").click(function(){
		$("#email").val($.trim($("#email1").val())+"@"+$.trim($("#email2").val()));
		$("#phone").val($.trim($("#phone1").val())+"-"+$.trim($("#phone2").val())+"-"+$.trim($("#phone3").val()));
		$("#zipcode").val($.trim($("#zipcode1").val())+$.trim($("#zipcode2").val()));
		$("#tel").val($.trim($("#tel1").val())+"-"+$.trim($("#tel2").val())+"-"+$.trim($("#tel3").val()));
		$("#compZip").val($.trim($("#compZip1").val())+$.trim($("#compZip2").val()));
		$("#frm").submit();
	});
	
	$("#cancelBtn").click(function(){
		location.href="/admin/listMemMng?gseq=${gseq}&lseq=${lseq}";
	});
	
	$("img[name=jusoSearchBtn]").click(function(){
		window.open("","address","width=496,height=550,scrollbars=no");
		var zip1 = $(this).parent().find("input[type=text]:eq(0)").attr("id");
		var zip2 = $(this).parent().find("input[type=text]:eq(1)").attr("id");
		var addr = $(this).parent().next().find("input[type=text]").attr("id");
		$("#popFrm").find("input[name=zip1]").val(zip1);
		$("#popFrm").find("input[name=zip2]").val(zip2);
		$("#popFrm").find("input[name=addr]").val(addr);
		$("#popFrm").attr("target","address").submit();
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
	$("#email2Slct").change(function(){
		if($("#email2Slct").val() == "") {
			$("#email2").val("");
		} else {
			if($("#email2Slct").val() == "self") {
				$("#email2").val("");
				$("#email2").prop("readonly",false);
				$("#email2").focus();
			} else {
				$("#email2").prop("readonly",true);
				$("#email2").val($("#email2Slct").val());	
			}
		}
	});
	
	//비밀번호초기화
	$("#resetPwdBtn").click(function(){
		var f = confirm("${member.userNm }님의 비밀번호를 초기화 하시겠습니까?");
		if(f){
			$.ajax({
		           type:"POST", 
		           url: "/admin/updateFormatUserPwd",
		           data : {"userId" : "${member.userId }"},
		           dataType : "json",
		           success: function(data){
		        	   if(data.flag == "Y") {
		        		   alert("초기화가 완료되었습니다.");
		        	   } else {
		        		   alert("비밀번호 초기화 도중 오류발생:"+data.flag);
		        	   }
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		} else {
			return;
		}
	});
})
</script>
</head>
<body>
<form id="popFrm" action="/formZipcode" method="post">
	<input type="hidden" name="zip1"/>
	<input type="hidden" name="zip2"/>
	<input type="hidden" name="addr"/>
</form>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>회원정보 상세조회</h3>
				<p class="navi"></p>
			</div>
			<form action="/admin/updateMemMng?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm">
				<input type="hidden" name="userSeq" value="${member.userSeq }" />
				<div class="contents">
					<br/>
					<div class="pgTop mb10">
						<h3 class="pTitle">회원정보</h3>
					</div> 
					<div class="boardWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="bbsTbl">
								<colgroup>
									<col width="150px" />
									<col />
								</colgroup>
								<tr>
									<th class="ta_l" scope="row">
										아이디
									</th>
									<td class="bd01td">
										${member.userId }
										<input type="hidden" name="userId" value="${member.userId }" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										비밀번호
									</th>
									<td class="bd01td">
										<input type="button" id="resetPwdBtn" value="비밀번호초기화" />
									</td>
								</tr> 
								<tr>
									<th class="ta_l" scope="row">
										회원이름
									</th>
									<td class="bd01td">
										${member.userNm }
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										이메일
									</th>
									<td class="bd01td">
										<input type="text" id="email1" name="email1" value="${fn:split(member.email,'@')[0] }" />
										@ 
										<input type="text" id="email2" name="email2" value="${fn:split(member.email,'@')[1] }" />
											<c:set var="cnt" value="0" />
										<select id="email2Slct" name="email2Slct" style="width: 120px;">
											<option value="">선택</option>
											<c:forEach items="${mailList }" var="mail">
												<option value="${mail.codeNm }"
													<c:if test="${fn:split(member.email,'@')[1] eq mail.codeNm }">selected="selected"</c:if>
													<c:if test="${fn:trim(findAdminAuth.admEmail2 ) != '' && fn:trim(findAdminAuth.admEmail2 ) eq mail.codeNm}">
														<c:set var="cnt" value="${cnt+1 }" />		
													</c:if>
												>${mail.codeNm}</option>
											</c:forEach>
											<option value="self"
												<c:if test="${cnt eq 0 }">selected="selected"</c:if>
											>직접입력</option>
										</select>
										<input type="hidden" name="email" id="email" value="${member.email }" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										메일수신
									</th>
									<td class="bd01td">
										<input type="radio" name="emailYn" value="N" 
											<c:if test="${member.emailYn eq 'N' }">checked="checked"</c:if>
										 />아니오
										<input type="radio" name="emailYn" value="Y"
											<c:if test="${member.emailYn eq 'Y' }">checked="checked"</c:if>
										 />예
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										휴대폰번호
									</th>
									<td class="bd01td">
										<select id="phone1Slct" name="phone1Slct" style="width: 80px;">
											<option value="">선택</option>
											<c:forEach items="${mobileList }" var="mobile">
												<option value="${mobile.codeNm }"
													<c:if test="${fn:split(member.phone,'-')[0] eq mobile.codeNm }">selected="selected"</c:if>
												>${mobile.codeNm }</option>
											</c:forEach>
										</select>
										<input type="hidden" id="phone1" name="phone1" value="${fn:split(member.phone,'-')[0] }" />
										- <input type="text" id="phone2" name="phone2" value="${fn:split(member.phone,'-')[1] }" />
										- <input type="text" id="phone3" name="phone3" value="${fn:split(member.phone,'-')[2] }" />
										<input type="hidden" id="phone" name="phone" value="${member.phone}" />
									</td> 
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										주소
									</th>
									<td class="bd01td">
										<p>
						                  <input readonly="readonly" type="text" name="zipcode1" id="zipcode1" title="우편번호 앞자리" value="${fn:substring(member.zipcode,0,3)}" />
						                  -
						                  <input readonly="readonly" type="text" name="zipcode2" id="zipcode2" title="우편번호 뒷자리" value="${fn:substring(member.zipcode,3,6)}" />
						                  <input type="hidden" name="zipcode" id="zipcode" value="${member.zipcode}" />
						                  
						                  <img name="jusoSearchBtn" src="/resources/include/commonfile/image/member/btn_findpost.gif" alt="우편번호찾기" style="cursor:pointer; "  />
						                </p>
						                <p>
						                  <input readonly="readonly" type="text" name="addr" id="addr"  title="주소는 검색버튼을 통해서 입력" style="width: 400px;" value="${member.addr }" />
						                </p>
						                <p>
						                  <input type="text" name="addr2" id="addr2"  title="나머지 주소 입력" style="width: 400px;" value="${member.addr2 }" />
						                </p>
									</td>
								</tr>
							</table>
					</div>
					
					<br/>
					<div class="pgTop mb10">
						<h3 class="pTitle">회원정보</h3>
					</div>
					<div class="boardWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="bbsTbl">
								<colgroup>
									<col width="150px" />
									<col />
								</colgroup>
								<tr>
									<th class="ta_l" scope="row">
										회사전화
									</th>
									<td class="bd01td">
										<select id="tel1Slct" name="tel1Slct" style="width: 80px;">
											<option value="">선택</option>
											<c:forEach items="${phoneList }" var="phone">
												<option value="${phone.codeNm }"
													<c:if test="${fn:split(member.tel,'-')[0] eq phone.codeNm }">selected="selected"</c:if>
												>${phone.codeNm }</option>
											</c:forEach>
										</select>
										<input type="hidden" id="tel1" name="tel1" value="${fn:split(member.tel,'-')[0] }" />
										- <input type="text" id="tel2" name="tel2" value="${fn:split(member.tel,'-')[1]} " />
										- <input type="text" id="tel3" name="tel3" value="${fn:split(member.tel,'-')[2]}" />
										<input type="hidden" id="tel" name="tel" value="${member.tel}" />
									</td>
								</tr>
								<tr>
					              <th class="ta_l" scope="row">회사주소</th>
					              <td class="bd01td">
					              	<p>
					                  <input readonly="readonly" type="text" name="compZip1" id="compZip1" title="우편번호 앞자리" value="${fn:substring(member.compZip,0,3)}" />
					                  -
					                  <input readonly="readonly" type="text" name="compZip2" id="compZip2" title="우편번호 뒷자리"  value="${fn:substring(member.compZip,3,6)}" />
					                  <input type="hidden" name="compZip" id="compZip" value="${member.compZip}" />
					                  
					                  <img name="jusoSearchBtn" src="/resources/include/commonfile/image/member/btn_findpost.gif" alt="우편번호찾기"  style="cursor:pointer; "/>
					                </p>
					                <p>
					                  <input readonly="readonly" type="text" name="compAddr" id="compAddr"  title="주소는 검색버튼을 통해서 입력" style="width: 400px;" value="${member.compAddr }" />
					                </p>
					                <p>
					                  <input type="text" name="compAddr2" id="compAddr2"  title="나머지 주소 입력" style="width: 400px;" value="${member.compAddr2 }" />
					                </p>
					              </td>
					            </tr>
							</table>
					</div>
					<br/>
					<div class="pgTop mb10">
						<h3 class="pTitle">회원정보</h3>
					</div>
					<div class="boardWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="bbsTbl">
								<colgroup>
									<col width="150px" />
									<col />
								</colgroup>
								<tr>
									<th class="ta_l" scope="row">
										접속횟수
									</th>
									<td class="bd01td">
										<c:choose>
											<c:when test="${member.visitCnt != null && member.visitCnt > 0 }">
												${member.visitCnt }	
											</c:when>
											<c:otherwise>
												0
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
					              <th class="ta_l" scope="row">가입일</th>
					              <td class="bd01td">
					              	${fn:substring(member.signYmd,0,4)}년${fn:substring(member.signYmd,4,6)}월${fn:substring(member.signYmd,6,8)}일
					              </td>
					            </tr>
					            <tr>
					              <th class="ta_l" scope="row">최근접속일</th>
					              <td class="bd01td">
					              	${fn:substring(member.loginYmd,0,4)}년${fn:substring(member.loginYmd,4,6)}월${fn:substring(member.loginYmd,6,8)}일
					              	${fn:substring(member.loginHms,0,2)}시${fn:substring(member.loginHms,2,4)}분${fn:substring(member.loginHms,4,6)}초
					              </td>
					            </tr>
					            <tr>
					              <th class="ta_l" scope="row">게시건수</th>
					              <td class="bd01td">
					              	 ${bbsCnt } 건
					              </td>
					            </tr>
					            <tr>
					              <th class="ta_l" scope="row">댓글수</th>
					              <td class="bd01td">
					              	 ${replyCnt} 건
					              </td>
					            </tr>
							</table>
					</div>
					<div class="btn_farm2 mt20 mb20"> 
						<!-- Text Button --> 
						<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >수정</a></span> &nbsp;
						<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >목록으로</a></span> 
						<!-- Text Button --> 
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>