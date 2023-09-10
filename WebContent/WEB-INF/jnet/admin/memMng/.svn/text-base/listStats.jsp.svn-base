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
		$("#frm").submit();
	});
	
	$("#cancelBtn").click(function(){
		location.href="/admin/listMemMng?gseq=${gseq}&lseq=${lseq}";
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
				<h3>회원정보 수정</h3>
				<p class="navi"></p>
			</div>
			<form action="/admin/updateMemMng?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm">
				<div class="contents">
					<br/>
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
										<input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										비밀번호
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										비밀번호확인
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										회원이름
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										이메일
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" />
										@ <input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										메일수신
									</th>
									<td class="bd01td">
										<input type="radio" name="aaa" checked="checked" />아니오
										<input type="radio" name="aaa" />예
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										휴대폰번호
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" />
										- <input type="text" id="boardNm" name="boardNm" value="" />
										- <input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										주소
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" /><br/>
										<input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
							</table>
					</div>
					
					<br/>
					<div class="boardWrap">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="bbsTbl">
								<colgroup>
									<col width="150px" />
									<col />
								</colgroup>
								<tr>
									<th class="ta_l" scope="row">
										자택전화
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" />
										- <input type="text" id="boardNm" name="boardNm" value="" />
										- <input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										회사주소
									</th>
									<td class="bd01td">
										<input type="text" id="boardNm" name="boardNm" value="" /><br/>
										<input type="text" id="boardNm" name="boardNm" value="" />
									</td>
								</tr>
							</table>
					</div>
					
					
					<!-- <div class="btn_farm2 mt20 mb20"> 
						Text Button 
						<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >수정</a></span> &nbsp; 
						<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
						Text Button 
					</div> -->
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>