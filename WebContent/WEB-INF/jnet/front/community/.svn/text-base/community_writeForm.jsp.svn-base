<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />

<script type="text/javascript">
//<![CDATA[

	$(function(){
		
		$("#insertBtn").click(function(){
			$("#mode").val('insert');
			if($("input[name='subject']").val()==""){
				alert("제목을 입력해주세요.");
				return false;
			}
			if($("#commCodeSeq").val()==""){
				alert("사업장을 선택해주세요.");
				return false;
			}
			if($("textarea[name='content']").val()==""){
				alert("내용을 입력해주세요");
				return false;
			}
			$("#frm").submit();
		});
		
		$("#updateBtn").click(function(){
			$("#mode").val('update');
			if($("input[name='subject']").val()==""){
				alert("제목을 입력해주세요.");
				return false;
			}
			if($("#commCodeSeq").val()==""){
				alert("사업장을 선택해주세요.");
				return false;
			}
			if($("textarea[name='content']").val()==""){
				alert("내용을 입력해주세요");
				return false;
			}
			
			 
			$("#frm").submit();
		});
		
	});

//]]>
</script>

</head>

<body>

<form action="/front/community/saveCommunityData" method="post" name="frm" id="frm" enctype="multipart/form-data">
<input type="hidden" name="boardSeq" id="boardSeq" value="${ boardSeq }" />
<input type="hidden" name="dataSeq" id="dataSeq" value="${ dataSeq }" />
<input type="hidden" name="mode" id="mode" />

<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
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
			<%@ include file="/resources/include/commonfile/inc/lnb_bottom.jsp" %>
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				<!-- real Contents -->
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
						<caption>
							사용자 자유게시판 작성
						</caption>
						<colgroup>
							<col width="120px" />
							<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row"><label for="btitle">제목</label></th>
							<td class="bd01td listx">
								<input name="subject" id="btitle" type="text" value="${ communityList[0].subject }" />
							</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="commCodeSeq">사업장 선택</label></th>
							<td class="bd01td listx">
							<select name="commCodeSeq" id="commCodeSeq" title="사업장 카테고리">
							<option value="">전체</option>
							<c:if test="${ facilList != null && fn:length(facilList) > 0 }">
								<c:forEach items="${ facilList }" var="list">
									<option value="${ list.commCodeSeq }" <c:if test="${ list.commCodeSeq eq communityList[0].commCodeSeq }">selected="selected"</c:if> >${list.codeNm }</option>
								</c:forEach>
							</c:if>
						</select>
							</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="bwriter">작성자</label></th>
							<td class="bd01td">
								<span class="bd01td listx">
									<c:choose>
										<c:when test="${ mode eq 'insert' }">
											${ userNm }
										</c:when>
										<c:otherwise>
											${ communityList[0].createNm }
										</c:otherwise>
									</c:choose>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2" scope="row" class="bd01tdC">
								<textarea cols="60" rows="30" title="내용입력" name="content">${ communityList[0].content }</textarea>
							</td>
						</tr>
						<!-- 
						<tr>
							<th class="ta_l" scope="row"><label for="file01">파일첨부</label></th>
							<td class="bd01td"><input name="file01" id="file01" type="file" /></td>
						</tr>
						-->
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20">
					<!-- Text Button -->
					<c:choose>
						<c:when test="${ mode eq 'insert' }">
							<span class="txtBtn_lightGray"><a href="#" id="insertBtn">작성</a></span> &nbsp;
						</c:when>
						<c:otherwise>
							<span class="txtBtn_lightGray"><a href="#" id="updateBtn">수정</a></span> &nbsp;
						</c:otherwise>
					</c:choose>
					<span class="txtBtn_lightGray"><a href="/front/community/6" >취소</a></span> 
					<!-- Text Button --> 
				</div>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
</form>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(4,3,0,0);</script>


</body>
</html>