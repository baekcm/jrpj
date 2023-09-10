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
	$("#saveBtn").click(function(){
		if($.trim($("#teacherNm").val()) == "") {
			alert("강사이름을 입력하세요");
			return;
		}
		/* if($.trim($("#teacherPhone1").val()) == "" || $.trim($("#teacherPhone2").val()) == "" || $.trim($("#teacherPhone3").val()) == "") {
			alert("연락처를 입력하세요");
			return;
		}
		if($.trim($("#teacherEmail1").val()) == "" || $.trim($("#teacherEmail2").val()) == "") {
			alert("메일을 입력하세요");
			return;
		}
		if($.trim($("#zipcode1").val()) == "" || $.trim($("#zipcode2").val()) == "" || $.trim($("#teacherDftAddr").val()) == "") {
			alert("주소를 선택하세요");
			
			window.open("","address","width=496,height=550,scrollbars=no");
			var zip1 = $(this).parent().find("input[type=text]:eq(0)").attr("id");
			var zip2 = $(this).parent().find("input[type=text]:eq(1)").attr("id");
			var addr = $(this).parent().next().find("input[type=text]").attr("id");
			$("#popFrm").find("input[name=zip1]").val(zip1);
			$("#popFrm").find("input[name=zip2]").val(zip2);
			$("#popFrm").find("input[name=addr]").val(addr);
			$("#popFrm").attr("target","address").submit();
			
			return;
		}
		
		if($.trim($("#teacherDtlAddr").val()) == "") {
			alert("상세주소를 입력하세요");
			return;
		} */
		
		var sHTML = oEditors.getById["teacherHistory"].getIR();
		$("#teacherHistory").val(sHTML);
		
		if($.trim($("#teacherHistory").val()) == "") {
			alert("주요이력을 입력하세요");
			return;
		}
		
		var fileNm = $.trim($("#teacherImg").val().toLowerCase());
		var ext = fileNm.substring(fileNm.lastIndexOf(".")+1);
		if($.trim($("#teacherImg").val()) != "")	 {
			if(ext != "bmp" && ext != "jpg" &&  ext != "gif" && ext != "png")	 {
				alert("이미지파일을 등록하세요\n 이미지 확장자는 bmp,jpg,gif,png 등록가능합니다.");
				return false;
			}	
		}
		
		$("#frm").submit();		
	})
	$("#cancelBtn").click(function(){
		location.href="/admin/listTeacherMng?gseq=${gseq}&lseq=${lseq}";
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
				<h3>강사 등록</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<form action="/admin/saveTeacherMng?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm" enctype="multipart/form-data">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="teacherTbl">
							<colgroup>
								<col width="150px" />
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									강사이름
								</th> 
								<td class="bd01td">
									<input type="text" name="teacherNm" id="teacherNm" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									연락처
								</th> 
								<td class="bd01td">
									<input type="text" name="teacherPhone1" id="teacherPhone1" />
									- <input type="text" name="teacherPhone2" id="teacherPhone2" />
									- <input type="text" name="teacherPhone3" id="teacherPhone3" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									이메일
								</th> 
								<td class="bd01td">
									<input type="text" name="teacherEmail1" id="teacherEmail1" />
									@ <input type="text" name="teacherEmail2"  id="teacherEmail2"/>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									주소
								</th> 
								<td class="bd01td">
									<p>
					                  <input readonly="readonly" type="text" name="zipcode1" id="zipcode1" title="우편번호 앞자리"  />
					                  -
					                  <input readonly="readonly" type="text" name="zipcode2" id="zipcode2" title="우편번호 뒷자리"  />
					                  <img name="jusoSearchBtn" src="/resources/include/commonfile/image/member/btn_findpost.gif" alt="우편번호찾기" style="cursor:pointer; "  />
					                </p>
					                <p>
					                  <input readonly="readonly" type="text" name="teacherDftAddr" id="teacherDftAddr"  title="주소는 검색버튼을 통해서 입력" style="width: 400px;"  />
					                </p>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									상세주소
								</th> 
								<td class="bd01td">
									<input type="text" name="teacherDtlAddr" id="teacherDtlAddr" style="width: 250px;" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									주요이력
								</th> 
								<td class="bd01td">
									<textarea rows="10" cols="80" name="teacherHistory" id="teacherHistory" style="width:100%; height:100px; "></textarea>
									<script type="text/javascript">
											loadEditor("teacherHistory");
									</script>
								</td> 
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									사진첨부
								</th> 
								<td class="bd01td">
									<input type="file" name="teacherImg" accept=".gif,.jpeg,.jpg,.png" id="teacherImg" />
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#" id="saveBtn" >등록</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>