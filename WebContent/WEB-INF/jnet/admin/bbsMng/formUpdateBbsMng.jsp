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
	$("select[name=menuSeqSlct]").change(function(){
		$("#menuSeq").val($(this).val());
	});
	
	$("#searchEmpBtn").click(function(){
		window.open("/admin/listEmpMngPop","searchEmp",'width=740,height=644,left=0,top=0,scrollbars=no');
	});
	$("#cancelBtn").click(function(){
		location.href="/admin/listBbsMng?gseq=${gseq}&lseq=${lseq}";
	});
	
	$("#updateBtn").click(function(){
		if($("#boardType").val() == "") {
			alert("게시판 타입을 선택하세요");
			return;
		}
		if($("#memberYn").val() == "") {
			alert("등록권한여부를 선택하세요");
			return;
		}
		if($("#empNm").val() == "") {
			alert("담당자정보를 선택하세요");
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
				<h3>게시판 수정</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<form action="/admin/updateBbsMng?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm">
						<input type="hidden" name="menuSeq" id="menuSeq" value="${bbs.menuSeq }" />
						<input type="hidden" name="empSeq" id="empSeq" value="${bbs.empSeq }" />
						<input type="hidden" name="boardSeq" id="boardSeq" value="${bbs.boardSeq }" />
						<input type="hidden" name="boardNm" value="${fn:trim(bbs.menuNm) }" />
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="bbsTbl">
							<colgroup>
								<col width="150px" />
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									게시판 메뉴명
								</th> 
								<td class="bd01td">
									${fn:trim(bbs.menuNm) }
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									게시판 타입
								</th>
								<td class="bd01td">
									<select name="boardType" id="boardType">
										<option value="">선택</option>
										<c:forEach items="${listTypeCd }" var="list">
											<option value="${list.value }"
												<c:if test="${bbs.boardType eq list.value }">selected="selected="</c:if>
											>${list.name }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									사업장 카테고리
								</th>
								<td class="bd01td">
									<select name="catCdYn" id="catCdYn">
											<option value="N" 
											<c:if test="${bbs.catCdYn eq 'N' }">selected="selected="</c:if>
											>
											미사용	
											</option>
											<option value="Y" 
											<c:if test="${bbs.catCdYn eq 'Y' }">selected="selected="</c:if>
											>
											사용
											</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									분류 카테고리
								</th>
								<td class="bd01td">
									<select name="grpCatCdYn" id="grpCatCdYn">
											<option value="N" 
											<c:if test="${bbs.grpCatCdYn eq 'N' }">selected="selected="</c:if>
											>
											미사용	
											</option>
											<option value="Y" 
											<c:if test="${bbs.grpCatCdYn eq 'Y' }">selected="selected="</c:if>
											>
											사용
											</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									프로그램 카테고리
								</th>
								<td class="bd01td">
									<select name="pgmCatCdYn" id="pgmCatCdYn">
											<option value="N" 
											<c:if test="${bbs.pgmCatCdYn eq 'N' }">selected="selected="</c:if>
											>
											미사용	
											</option>
											<option value="Y" 
											<c:if test="${bbs.pgmCatCdYn eq 'Y' }">selected="selected="</c:if>
											>
											사용
											</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									등록권한여부
								</th>
								<td class="bd01td">
									<select name="memberYn" id="memberYn">
										<option value="">선택</option>
										<option value="A"
											<c:if test="${bbs.memberYn eq 'A' }">selected="selected="</c:if>
										>관리자전용</option>
										<option value="Y"
											<c:if test="${bbs.memberYn eq 'Y' }">selected="selected="</c:if>	
										>회원만등록가능</option>
										<option value="N"
											<c:if test="${bbs.memberYn eq 'N' }">selected="selected="</c:if>
										>비회원등록가능</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									게시판 설명 
								</th>
								<td class="bd01td">
									<input type="text" id="boardExplain" name="boardExplain" style="width: 600px;" value="${bbs.boardExplain }" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									담당자 정보
								</th>
								<td class="bd01td">
								  <input type="text" id="empNm" readonly="readonly" value="${bbs.empNm }" /> 
								  <input type="button" id="searchEmpBtn" value="담당자검색"/><br/>
								  (연락처:
								  <span id="tmpPhoneNumber">
								  	${fn:trim(bbs.empPhoneNumber )}
								  </span>
								  )
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
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