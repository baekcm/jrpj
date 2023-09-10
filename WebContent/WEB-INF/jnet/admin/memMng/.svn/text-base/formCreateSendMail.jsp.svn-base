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
		$(document).on("click","input[name=tmpRemoveBtn]",function(){
			$(this).parent().prev().remove();
			$(this).parent().remove();
		});
		$("#searchMemBtn").click(function(){
			window.open("/admin/listMemMailPop","searchMem",'width=740,height=644,left=0,top=0,scrollbars=no');
		});
		
		$("#sendBtn").click(function(){
			if($("#emailTitle").val() == "") {
				alert("제목을 입력하세요");
				return;
			}
			
			var sHTML = oEditors.getById["contents"].getIR();
			$("#contents").val(sHTML);
			
			if($("#contents").val() == "") {
				alert("내용을 입력하세요");
				return;
			}
			
			if($.trim($("#memList").html()) == "") {
				alert("메일내용을 받을 회원을 추가하세요");
				window.open("/admin/listMemMailPop","searchMem",'width=740,height=644,left=0,top=0,scrollbars=no');
				return;
			}
			$("#frm").submit();
		});
	});
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
				<h3>회원메일발송</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<form action="/admin/sendMemMail?gseq=${gseq}&lseq=${lseq}" method="post" name="frm" id="frm">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="ctsTbl">
							<colgroup>
								<col width="150px" />
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									보내는 사람
								</th> 
								<td class="bd01td">
									관리자
								</td>
							</tr>
							<tr>
								<th  class="ta_l" scope="row">
									메일 제목
								</th>
								<td class="bd01td"> 
									<input type="text" name="emailTitle" id="emailTitle" style="width: 600px;" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									메일내용
								</th>
								<td class="bd01td">
								  <textarea rows="10" name="emailContent" id="contents" cols="80" style="width:100%; height:300px; "></textarea>
								  <script type="text/javascript">
										loadEditor("contents");
									</script>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row" colspan="2">
									회원 메일 주소
									<input type="button" id="searchMemBtn" value="검색" />
								</th>
							</tr>
							<tr>
								<td id="memList" class="bd01td" colspan="2">
								</td>
							</tr>
						</table> 
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20">  
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#" id="sendBtn" >발송</a></span> &nbsp; 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>