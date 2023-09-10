<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<link rel="stylesheet" href="/resources/js/validation/css/cmxform.css" />
<script src="/resources/js/validation/dist/jquery.validate.js"></script>
<script type="text/javascript">
$(function(){
	<c:if test="${findAdminAuth.admType eq 'O' }">
		$("#menuGbnTbl").show();
	</c:if>
	
	jQuery.validator.addMethod("admAuth", function(value, element, params) {
		if(value == "운영자"){
			if($("input[name=menuSeqStrArr]").size() == 0) {
				return false;
			}	
		}
		return true;
	});
	
	var validator = $("#frm").validate({
	    rules: {
	    	admNm : {
	    		required : true
	    	}, 
	    	admTypeTmp : {
	    		admAuth : true
	    	}
	    },
	    messages: {
            admNm : {
            	required : "담당자 이름은 필수입니다."
            },
            admTypeTmp : {
            	admAuth : "운영자 권한설정이 필요합니다"
            }
	    },
	    errorPlacement: function (error, element) {
	    	if(element.attr("name") == "admTypeTmp") {
	    		$("#errMsg").html(error);
	    	}
	    	if(element.attr("name") == "admId") {
	    		error.insertAfter($("#adminId"));
	    	}
	    	if(element.attr("name") == "admNm") {
	    		error.insertAfter($("#adminNm"));
	    	}
	    },
	    submitHandler: function() {
	    	$("#frm").ajaxSubmit();
	    }
	});
	
	$(document).on("click","#allChk",function(){
		if($("#allChk").prop("checked")) {
			$("#listChkTbl input[type=checkbox]").prop("checked",true);
		} else {
			$("#listChkTbl input[type=checkbox]").prop("checked",false);	
		}
	})
	
	$("#allAuthRemovebtn").click(function(){
		if($.trim($("#tmpSaveData").html()) == "") {
			alert("삭제한 권한이 존재하지 않습니다.");
			return;
		} else {
			var f = confirm("모든 권한을 임시로 지우시겠습니까?");
			if(f){
				$("#tmpSaveData").empty();		
			} else {
				return;
			}	
		}
	});
	
	//취소버튼 클릭
	$("#cancelBtn").click(function(){
		var f = confirm("관리자 목록으로 되돌아가시겠습니까?");
		if(f){
			location.href="/admin/listMgrMng?gseq=${gseq}&lseq=${lseq}";	
		}
	});
	
	$("#pwdChangeBtn").click(function(){
		if($.trim($("#adminPwd").val()) == "") {
			alert("비밀번호를 입력해주세요");
			return;
		} else {
			if(!CehckPassWord($("#adminPwd").val())){
				alert("문자, 숫자, 특수문자의 조합으로 6~16자리로 입력해주세요.");
				return;
			}
			
			if($.trim($("#adminRePwd").val()) == "") {
				alert("비밀번호 확인을 입력해주세요");
				return;
			} else {
				if($.trim($("#adminRePwd").val()) != $.trim($("#adminPwd").val())) {
					alert("비밀번호와 비밀번호 확인값이 서로 일치하지 않습니다.	");
					return;
				} else {
					var f = confirm("비밀번호 변경을 하시겠습니까?");
					if(f){
						if(!CehckPassWord($("#adminPwd").val())){
							alert("문자, 숫자, 특수문자의 조합으로 6~16자리로 입력해주세요.");
							return;
						} else {
							$.ajax({
						           type:"POST", 
						           url: "/admin/updateAdmPwd",
						           data : {"admPwd" : $.trim($("#adminPwd").val()), "admSeq" : $.trim($("input[name=admSeq]").val()) },
						           dataType : "json",
						           success: function(data){
						        	  if(data.flag = "Y") {
						        		  alert("비밀번호 변경이 완료되었습니다.");
						        		  return;
						        	  }
						        	  else {
						        		  alert("에러발생:"+data.flag);
						        		  return;
						        	  }
						           }, 
						           error : function(request, status, error) {
									alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
								}
							});
						}
					} else {
						return;
					}
				}
			}
		}
	})
	
	//연락처 변경 - 지역번호
	$("#adminPhone1Slct").change(function(){
		if($("#adminPhone1Slct").val() == "") {
			$("#adminPhone1").val("");
		} else {
			$("#adminPhone1").val($("#adminPhone1Slct").val());
		}
	});
	
	//메일주소 변경
	$("#adminEmail2Slct").change(function(){
		if($("#adminEmail2Slct").val() == "") {
			$("#adminEmail2").val("");
		} else {
			if($("#adminEmail2Slct").val() == "self") {
				$("#adminEmail2").val("");
				$("#adminEmail2").prop("readonly",false);
				$("#adminEmail2").focus();
			} else {
				$("#adminEmail2").prop("readonly",true);
				$("#adminEmail2").val($("#adminEmail2Slct").val());	
			}
		}
	});
})
</script>
</head>
<body>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>하위관리자 수정</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">
				<form action="/admin/updateMgrMng?gseq=${gseq}&lseq=${lseq}" method="post" name="frm" id="frm"> 
					<div class="boardWrap">
						<input type="hidden" name="admSeq" value="${fn:trim(findAdminAuth.admSeq)}"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="menuTbl">
							<colgroup>
								<col width="120px" />
								<col width="150px" /> 
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">아이디</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="text" id="adminId" name="admId" readonly="readonly" value="${fn:trim(findAdminAuth.admId)}"  />
									</span>
								</td >
							</tr>
							
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">비밀번호</label>
								</th>
								<td class="bd01td">
									<span class="bd01td listx">
										<input type="password" id="adminPwd" name="admPwd"  />
									</span>
								</td >
								<td  class="bd01td">
									<input type="button" id="pwdChangeBtn" value="비밀번호 변경" />
									* 문자, 숫자, 특수문자의 조합으로 6~16자리로 입력
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">비밀번호확인</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="password" id="adminRePwd" />
									</span>
								</td>
							</tr>
							
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">담당자이름</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="text" id="adminNm" name="admNm" value="${fn:trim(findAdminAuth.admNm)}" />
									</span>
								</td >
							</tr>
							
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">연락처</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<select id="adminPhone1Slct" name="adminPhone1Slct" style="width: 80px;">
											<option value="">선택</option>
											<c:forEach items="${phoneList }" var="phone">
												<option value="${phone.codeNm }"
													<c:if test="${fn:trim(findAdminAuth.admPhone1 ) eq phone.codeNm}">selected="selected"</c:if>
												>${phone.codeNm }</option>
											</c:forEach>
										</select>
										<input type="hidden" id="adminPhone1" name="admPhone1" value="${fn:trim(findAdminAuth.admPhone1 )}" />-
										<input type="text" id="adminPhone2" name="admPhone2" value="${fn:trim(findAdminAuth.admPhone2 )}" maxlength="4" />-
										<input type="text" id="adminPhone3" name="admPhone3" value="${fn:trim(findAdminAuth.admPhone3 )}" maxlength="4" />
									</span>
								</td >
							</tr>
							
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">이메일</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
									<c:set var="readonly" value="" />
										<c:forEach items="${mailList }" var="mail">
											<c:if test="${fn:trim(findAdminAuth.admEmail2 ) eq mail.codeNm}">
												<c:set var="readonly" value="readonly='readonly'" /> 
											</c:if>
										</c:forEach>
										<input type="text" id="adminEmail1" name="admEmail1" value="${fn:trim(findAdminAuth.admEmail1 )}" />@
										<input type="text" id="adminEmail2" name="admEmail2" value="${fn:trim(findAdminAuth.admEmail2 )}"
											${readonly }/>
										<select id="adminEmail2Slct" name="adminEmail2Slct" style="width: 120px;">
											<option value="">선택</option>
											<c:set var="cnt" value="0" />
											<c:forEach items="${mailList }" var="mail">
												<option value="${mail.codeNm }"
													<c:if test="${fn:trim(findAdminAuth.admEmail2 ) eq mail.codeNm}">selected="selected"</c:if>
													<c:if test="${fn:trim(findAdminAuth.admEmail2 ) != '' && fn:trim(findAdminAuth.admEmail2 ) eq mail.codeNm}">
														<c:set var="cnt" value="${cnt+1 }" />		
													</c:if>
												>${mail.codeNm}</option>
											</c:forEach>
											<option value="self"
												<c:if test="${cnt eq 0 }">selected="selected"</c:if>
											>직접입력</option>
										</select>
									</span>
								</td >
							</tr>
							
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">관리자 권한</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<c:set var="type" value="" />
										<c:if test="${findAdminAuth.admType eq 'S' }">
											<c:set var="type" value="관리자" />
										</c:if>
										<c:if test="${findAdminAuth.admType eq 'O' }">
											<c:set var="type" value="운영자" />
										</c:if>
										<input readonly="readonly" type="text" name="admTypeTmp" value="${type }" />
										<input type="hidden" name="admType" id="admType" readonly="readonly" value="${findAdminAuth.admType }" />
									</span>
									<span id="menuGbnTbl" style="display:none; ">
										<select id="menuGbn" name="menuGbn">
											<option value="">선택</option>
											<option value="BBS">게시판</option> 
											<option value="PGM">프로그램</option>
											<option value="ACTS">컨텐츠</option>
											<option value="ACPT">민원관리</option>
										</select>
									</span>
									<span id="facilTbl" style="display:none; "></span>
									<span id="saleGbnTbl" style="display:none; ">
									</span>
									<span id="addbtnTbl" style="display:none; ">
										<input id="addbtn" type="button" value="추가"/>
									</span>
									<c:if test="${findAdminAuth.admType eq 'O' }">
										<input id="allAuthRemovebtn" type="button"  value="선택권한 전체삭제"/>
									</c:if>
									<br/>
									<span id="errMsg"></span>
								</td >
							</tr>
								<tr>
									<!-- 메뉴별 권한 체크박스 -->
									<td class="bd01td" colspan="3" id="listChkTbl" style="display: none;"></td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										<label for="bwriter">선택된권한</label>
									</th>
									<td class="bd01td" colspan="2"  id="tmpSaveData">
										<c:if test="${listAdminAuthMenu != null && fn:length(listAdminAuthMenu) > 0 }">
											<c:forEach items="${listAdminAuthMenu }" var="list">
												<c:if test="${list.pgmGbnCd != 'PGM' }">
													<span> ${list.slctFacilNm }  > ${list.menuNm }
													<c:choose>
														<c:when test="${list.menuType eq 'ACTS' }">
															(컨텐츠)
														</c:when>
														<c:when test="${list.menuType eq 'BBS' }">
															(게시판)
														</c:when>
													</c:choose>
													&nbsp;</span> 
													<span><input type="button" name="rmMenuBtn" value="X" />
													<input type="hidden" name="codeIdArr" value="${fn:trim(list.slctFacilId) }" />
													<input type="hidden" name="pgmGbnCdArr" value="${fn:trim(list.pgmGbnCd)}" />
													<input type="hidden" name="saleIdArr" value="${fn:trim(list.saleId)}" />
													<input type="hidden" name="menuSeqStrArr" value="${fn:trim(list.menuSeqStr)}" /><br/></span>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${listPgmAuth != null && fn:length(listPgmAuth) > 0 }">
											<c:forEach items="${listPgmAuth }" var="list">
													<span> ${list.comNm1 }  > ${list.comNm2 } > ${list.comNm3 } (프로그램)&nbsp;</span> 
													<span><input type="button" name="rmMenuBtn" value="X" />
													<input type="hidden" name="codeIdArr" value="${fn:trim(list.slctFacilId) }" />
													<input type="hidden" name="pgmGbnCdArr" value="${fn:trim(list.pgmGbnCd)}" />
													<input type="hidden" name="saleIdArr" value="${fn:trim(list.saleId)}" />
													<input type="hidden" name="menuSeqStrArr" value="${fn:trim(list.menuSeqStr)}" /><br/></span>
											</c:forEach>
										</c:if>
									</td>
								</tr>
						</table>
					</div>
					<div class="btn_farm2 mt20 mb20"> 
						<!-- Text Button --> 
						<span class="txtBtn_lightGray"><input style="color: #666;
														text-decoration: none;
														display: inline-block;
														padding: 0 15px;
														padding-top: 3px;
													 	*padding-top:0;
														font-weight: bold;
														text-align: center;
														line-height: 1.6;
														background: url(/resources/admin_include/commonfile/image/board/bg_btn_lightgray.png) 0 0 repeat-x;
														text-align: center;
														position: relative;
														display: inline-block;
														height: 20px;
														border: 1px solid #ccc;
														cursor: pointer;" type="submit" value="수정"/></span> &nbsp; 
						<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
						<!-- Text Button --> 
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>