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
	jQuery.validator.addMethod("pwdRegex", function(value, element, params) {
			return CehckPassWord(value);	
	});
	
	jQuery.validator.addMethod("rePwd", function(value, element, params) {
			if(value == $("#adminPwd").val()) {
				return true;
			}	 else {
				return false;
			}
	});
	
	jQuery.validator.addMethod("admAuth", function(value, element, params) {
		if(value == "FRONT"){
    		if($("input[name=menuSeqStrArr]").size() == 0) {
    			return false;
    		}	
    	}
		return true;
	});

 	var validator = $("#frm").validate({
	    rules: {
	    	admId: {
	    		required : true,
	    		remote: {
	    				type: "post", 
	    				url:"/admin/findDpAdmId"
	    				}
	    	},
	    	admPwd : {
	    		required : true,
	    		pwdRegex : true
	    	},
	    	adminRePwd : {
	    		required : true,
	    		rePwd : true
	    	},
	    	admNm : {
	    		required : true
	    	}, 
	    	admType : {
	    		required : true,
	    		admAuth : true
	    	}
	    },
	    messages: {
	    	admId: {
                required: "아이디는 필수입니다.",
                remote : jQuery.format("이미 존재하는 아이디입니다.")
            },
            admPwd : {
            	required : "비밀번호는 필수입니다.",
            	pwdRegex : "문자, 숫자, 특수문자의 조합으로 6~16자리로 입력해주세요."
            },
            adminRePwd : {
            	required : "비밀번호 재입력은 필수입니다.",
            	rePwd : "입력하신 비밀번호와 일치하지 않습니다."
            },
            admNm : {
            	required : "담당자 이름은 필수입니다."
            },
            admType : {
            	required  : "관리자/운영자 권한설정은 필수입니다.",
            	admAuth : "운영자 권한설정이 필요합니다"
            }
	    },
	    errorPlacement: function (error, element) {
	    	if(element.attr("name") == "admType") {
	    		error.insertAfter($("#errMsg"));
	    	}
	    	if(element.attr("name") == "admId") {
	    		error.insertAfter($("#adminId"));
	    	}
	    	if(element.attr("name") == "admPwd") {
	    		error.insertAfter($("#adminPwd"));
	    	}
	    	if(element.attr("name") == "adminRePwd") {
	    		error.insertAfter($("#adminRePwd"));
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
	
	//연락처 변경 - 지역번호
	$("#adminPhone1Slct").change(function(){
		if($("#admPhone1Slct").val() == "") {
			$("#adminPhone1").val("");
		} else {
			$("#adminPhone1").val($("#adminPhone1Slct").val());
		}
	})
	
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
	})
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
				<h3>하위관리자 등록</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">
				<form action="/admin/saveMgrMng?gseq=${gseq}&lseq=${lseq}" method="post" name="frm" id="frm">
				<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="menuTbl">
							<colgroup>
								<col width="120px" />
								<col width="150px" /> 
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									<label for="adminId">아이디</label>
								</th>
								<td  class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="text" id="adminId" name="admId"  />
										<input type="hidden" id="dpYn" name="dpYn"  value="N" />
									</span>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">비밀번호</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="password" id="adminPwd" name="admPwd"  />
									</span>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">비밀번호확인</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="password" id="adminRePwd" name="adminRePwd"  />
									</span>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">담당자이름</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="text" id="adminNm" name="admNm"  />
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
												<option value="${phone.codeNm }">${phone.codeNm }</option>
											</c:forEach>
										</select>
										<input type="hidden" id="adminPhone1" name="admPhone1" />
										-
										<input type="text" id="adminPhone2" name="admPhone2" />
										-
										<input type="text" id="adminPhone3" name="admPhone3" />
									</span>
								</td >
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">이메일</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<input type="text" id="adminEmail1" name="admEmail1" />@
										<input type="text" id="adminEmail2" name="admEmail2" readonly="readonly" />
										<select id="adminEmail2Slct" name="adminEmail2Slct" style="width: 120px;">
											<option value="">선택</option>
											<c:forEach items="${mailList }" var="mail">
												<option value="${mail.codeNm }">${mail.codeNm}</option>
											</c:forEach>
											<option value="self">직접입력</option>
										</select>
									</span>
								</td >
							</tr>
							<tr>
								<th class="ta_l" scope="row" rowspan="2">
									<label for="bwriter">관리자 권한</label>
								</th>
								<td class="bd01td" colspan="2">
									<span class="bd01td listx">
										<select id="adminAuth" name="admType">
											<option value="">선택</option>
											<option value="ADMIN">관리자</option>
											<option value="FRONT">운영자</option>
										</select>
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
									<span id="saleGbnTbl" style="display:none; "></span>
									<span id="addbtnTbl" style="display:none; ">
										<input id="addbtn" type="button" value="추가"/>
									</span>
									<input id="allAuthRemovebtn" type="button"  value="선택권한 전체삭제"/>
									<br/>
									<span id="errMsg"></span>
								</td >
							</tr>
							<tr>
								<!-- 메뉴별 권한 체크박스 -->
								<td class="bd01td" colspan="2" id="listChkTbl" style="display: none;"></td>
							</tr>
							<tr>
								<td class="bd01td" colspan="2" id="errMsg" style="display: none;"></td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">선택된권한</label>
								</th>
								<td class="bd01td" colspan="2"  id="tmpSaveData"></td>
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
														cursor: pointer;" type="submit" value="등록"/></span> &nbsp; 
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