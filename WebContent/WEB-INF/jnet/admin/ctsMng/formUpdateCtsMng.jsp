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
			var sHTML = oEditors.getById["contents"].getIR();
			$("#contents").val(sHTML);
			if($.trim($("#contents").val()) == "") {
				alert("내용을 입력하세요");
				return;
			}
			if($.trim($("#empNm").val()) == "") {
				alert("담당자를 선택하세요");
				return;
			}
			$("#frm").submit();
		});
		$("#previewBtn").click(function(){
			window.open("","pre","");
			var sHTML = oEditors.getById["contents"].getIR();
			$("#previewHtml").val(sHTML);
			$("#preFrm").attr("target","pre").submit();
		})
		$("#cancelBtn").click(function(){
			location.href="/admin/listCtsMng?gseq=${gseq}&lseq=${lseq}";
		});
		
		$("#searchEmpBtn").click(function(){
			window.open("/admin/listEmpMngPop","searchEmp",'width=740,height=644,left=0,top=0,scrollbars=no');
		});
	})

	
</script>
</head>
<body>
<form action="/preview" id="preFrm" method="post" style="display: none;">
	<textarea rows="10" cols="10" id="previewHtml" name="previewHtml"></textarea>
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
				<h3>컨텐츠 수정</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<form action="/admin/updateCtsMng?gseq=${gseq}&lseq=${lseq}" method="post" name="frm" id="frm">
						<input type="hidden" name="menuSeq" value="${fn:trim(cts.menuSeq)}"/>
						<input type="hidden" name="empSeq" id="empSeq" value="${fn:trim(cts.empSeq)}"/>
						<input type="hidden" name="ctsSeq" value="${fn:trim(cts.ctsSeq)}"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="ctsTbl">
							<colgroup>
								<col width="150px" />
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									컨텐츠 위치 카테고리
								</th>
								<td class="bd01td">
									<c:if test="${cts.treeNm3 != null }">
										${cts.treeNm3 } >
									</c:if>
									<c:if test="${cts.treeNm2 != null }">
										${cts.treeNm2} >
									</c:if>
									<c:if test="${cts.treeNm1 != null }">
										${cts.treeNm1}
									</c:if>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									컨텐츠 입력 메뉴
								</th> 
								<td class="bd01td">
									${fn:trim(cts.menuNm) }
								</td>
							</tr>
							<tr>
								<th  class="ta_l" scope="row">
									컨텐츠 내용
								</th>
								<td class="bd01td">
									<textarea rows="10" name="contents" id="contents" cols="80" style="width:100%; height:300px; ">${fn:trim(cts.contents) }</textarea>
									<script type="text/javascript">
										loadEditor("contents");
									</script>
								</td>
							</tr> 
							<tr>
								<th class="ta_l" scope="row">
									담당자 정보
								</th>
								<td class="bd01td">
								  <input type="text" id="empNm" readonly="readonly" value="${fn:trim(cts.empNm)}"/> 
								  <input type="button" id="searchEmpBtn" value="담당자검색"/><br/>
								  (연락처:
								  <span id="tmpPhoneNumber">
								  	${fn:trim(cts.empPhoneNumber )}
								  </span>
								  )
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									수정일
								</th>
								<td class="bd01td">
									<c:if test="${fn:trim(cts.modiYmd ) != ''}">
											${fn:substring(cts.modiYmd,0,4)}-${fn:substring(cts.modiYmd,4,6)}-${fn:substring(cts.modiYmd,6,8)}
											${fn:substring(cts.modiHms,0,2)}:${fn:substring(cts.modiHms,2,4)}:${fn:substring(cts.modiHms,4,6)}
									</c:if>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button -->
					<span class="txtBtn_lightGray"><a href="#" id="previewBtn" >미리보기</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >수정</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>