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
		$("#cancelBtn").click(function(){
			location.href="/admin/listEmpMng?gseq=${gseq }&lseq=${lseq}";
		});
		
		var validator = $("#frm").validate({
		    rules: {
		    	empNo : {
		    		required : true
		    	},
		    	empNm : {
		    		required : true
		    	},
		    	empDept : {
		    		required : true
		    	},
		    	empPart : {
		    		required : true
		    	},
		    	empPosition : {
		    		required : true
		    	},
		    	empJob : {
		    		required : true
		    	}
		    },
		    messages: {
		    	empNo: {
	                required: "사번을 입력하세요"
	            },
	            empNm: {
	                required: "이름을 입력하세요"
	            },
	            empDept: {
	                required: "부서를 입력하세요"
	            },
	            empPart: {
	                required: "파트를 입력하세요"
	            },
	            empPosition: {
	                required: "직위를 입력하세요"
	            },
	            empJob: {
	                required: "직무를 입력하세요"
	            }
		    },
		    submitHandler: function() {
		    	$("#frm").ajaxSubmit();
		    }
		});
		
		//연락처 변경 - 휴대전화
		$("#adminMobile1Slct").change(function(){
			if($("#adminMobile1Slct").val() == "") {
				$("#empMobile1").val("");
			} else {
				$("#empMobile1").val($("#adminMobile1Slct").val());
			}
		})
		
		//연락처 변경 - 회사전화
		$("#adminPhone1Slct").change(function(){
			if($("#adminPhone1Slct").val() == "") {
				$("#empPhone1").val("");
			} else {
				$("#empPhone1").val($("#adminPhone1Slct").val());
			}
		})
		
		//메일주소 변경
		$("#adminEmail2Slct").change(function(){
			if($("#adminEmail2Slct").val() == "") {
				$("#empEmail2").val("");
			} else {
				if($("#adminEmail2Slct").val() == "self") {
					$("#empEmail2").val("");
					$("#empEmail2").prop("readonly",false);
					$("#empEmail2").focus();
				} else {
					$("#empEmail2").prop("readonly",true);
					$("#empEmail2").val($("#adminEmail2Slct").val());	
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
				<h3>조직 수정</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">
				<form action="/admin/updateEmpMng?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm"> 
					<div class="boardWrap">
						<input type="hidden" name="empSeq" value="${fn:trim(findEmpMng.empSeq )}"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="empTbl">
						<colgroup>
								<col width="150px" />
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									사번
								</th> 
								<td class="bd01td">
									<input type="text" name="empNo" id="empNo" value="${fn:trim(findEmpMng.empNo )}"  />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									이름
								</th> 
								<td class="bd01td">
									<input type="text" name="empNm" id="empNm" value="${fn:trim(findEmpMng.empNm )}" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									부서
								</th> 
								<td class="bd01td">
									<input type="text" name="empDept" id="empDept" value="${fn:trim(findEmpMng.empDept )}" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									파트
								</th> 
								<td class="bd01td">
									<input type="text" name="empPart" id="empPart" value="${fn:trim(findEmpMng.empPart )}" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									직위
								</th> 
								<td class="bd01td">
									<input type="text" name="empPosition" id="empPosition" value="${fn:trim(findEmpMng.empPosition )}" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									직무
								</th> 
								<td class="bd01td">
									<input style="width: 300px;" type="text" name="empJob" id="empJob" value="${fn:trim(findEmpMng.empJob )}" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									휴대전화
								</th> 
								<td class="bd01td">
									<select id="adminMobile1Slct" name="adminMobile1Slct" style="width: 80px;">
										<option value="">선택</option>
										<c:forEach items="${mobileList }" var="phone">
											<option value="${phone.codeNm }">${phone.codeNm }</option>
										</c:forEach>
									</select>
									<input type="hidden" name="empMobile1" id="empMobile1" value="${fn:trim(findEmpMng.empMobile1 )}" />
									- <input type="text" name="empMobile2" id="empMobile2" value="${fn:trim(findEmpMng.empMobile2 )}" />
									- <input type="text" name="empMobile3" id="empMobile3" value="${fn:trim(findEmpMng.empMobile3 )}" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									이메일
								</th> 
								<td class="bd01td">
									<c:set var="readonly" value="" />
									<c:forEach items="${mailList }" var="mail">
											<c:if test="${fn:trim(findEmpMng.empEmail2 ) eq mail.codeNm}"> 
												<c:set var="readonly" value="readonly='readonly'" />
											</c:if>
									</c:forEach>
									<input type="text" name="empEmail1" id="empEmail1" value="${fn:trim(findEmpMng.empEmail1 )}" />
									@ <input type="text" name="empEmail2" id="empEmail2" value="${fn:trim(findEmpMng.empEmail2 )}"
										${readonly }/>
									<select id="adminEmail2Slct" name="adminEmail2Slct" style="width: 120px;">
										<c:set var="cnt" value="0" />
										<option value="">선택</option>
										<option value="ijongno.co.kr"
											<c:if test="${findEmpMng.empEmail2 eq  'ijongno.co.kr'}">selected="selected"</c:if>
										>ijongno.co.kr</option>
										<c:forEach items="${mailList }" var="mail">
											<option value="${mail.codeNm }"
												<c:if test="${mail.codeNm eq  findEmpMng.empEmail2}">selected="selected"</c:if>
												<c:if test="${fn:trim(findAdminAuth.admEmail2 ) != '' && fn:trim(findAdminAuth.admEmail2 ) eq mail.codeNm}">
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
								<th class="ta_l" scope="row">
									회사전화
								</th> 
								<td class="bd01td">
									<select id="adminPhone1Slct" name="adminPhone1Slct" style="width: 80px;">
										<option value="">선택</option>
										<c:forEach items="${phoneList }" var="phone">
											<option value="${phone.codeNm }"
												<c:if test="${phone.codeNm eq  findEmpMng.empPhone1}">selected="selected"</c:if>
											>${phone.codeNm }</option>
										</c:forEach>
									</select>
									<input type="hidden" name="empPhone1" id="empPhone1" value="${fn:trim(findEmpMng.empPhone1 )}" />
									- <input type="text" name="empPhone2" id="empPhone2" value="${fn:trim(findEmpMng.empPhone2 )}" />
									- <input type="text" name="empPhone3" id="empPhone3" value="${fn:trim(findEmpMng.empPhone3 )}" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									근무여부
								</th> 
								<td class="bd01td">
									<select name="empOutYn">
										<option value="0"
											<c:if test="${findEmpMng.empOutYn eq '0' }">selected="selected"</c:if>	
										>재직중</option>
										<option value="2"
											<c:if test="${findEmpMng.empOutYn eq '2' }">selected="selected"</c:if>	
										>휴직중</option>
										<option value="1"
											<c:if test="${findEmpMng.empOutYn eq '1' }">selected="selected"</c:if>
										>퇴직</option>
									</select>
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