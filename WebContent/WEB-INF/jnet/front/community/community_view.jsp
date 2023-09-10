<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />

<script type="text/javascript">
//<![CDATA[
    $(function(){
    	
    	
		getReplyList("");
		
		//댓글등록버튼 클릭
		$("#commentBtn").click(function(){
			if($.trim($("#replyContent").val()) == "") {
				alert("댓글내용을 입력하세요");
				return;
			}else {
				$.ajax({
			           type:"POST", 
			           url: "/front/saveReply",
			           data : {"replyContent" : $.trim($("#replyContent").val()),"dataSeq" : "${fn:trim(dataSeq)}"},
			           success: function(data){ 
			        	   $("#replyContent").val("").focus();
			        	  $("#replyList").html(data);
			           }, 
			           error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
				});
			}
		})
		
		$(document).on("click","img[name=removeComment]",function(){
			var replySeq = $(this).attr("id");
			var dataSeq = $(this).attr("data");
			var f = confirm("정말 댓글을 삭제하시겠습니까?");
			if(f){
				$.ajax({
			           type:"POST", 
			           url: "/front/removeReply",
			           data : {"replySeq" : replySeq,"dataSeq" : dataSeq},
			           success: function(data){ 
			        	  $("#replyList").html(data);
			           }, 
			           error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
				});
			} else {
				return;
			}
		});
		
		$("#updateBtn").click(function(){
			$("#mode").val('update');
			$("#frm").attr("action", "/front/community/community_writeForm").submit();
		});
		
		$("#deleteBtn").click(function(){
			
			if(confirm("삭제를 완료하시겠습니까?")){
				$("#mode").val('delete');
				$("#frm").attr("action", "/front/community/removeCommunityData").submit();
	        }
	        else{
	            return;
	        }

		});
		
    });
    
    function removeCommentData(dataSeq, replySeq)
    {
    	if(confirm("댓글 삭제를 완료하시겠습니까?")){
			$("#frm").attr("action", "/front/community/removeCommunityData").submit();
        }
        else{
            return;
        }
    }
    
	function setPage(pageNo){
		getReplyList(pageNo);
	}
	
	function getReplyList(pageNo){
		$.ajax({
	           type:"POST", 
	           url: "/front/listReply",
	           data : {"dataSeq" : "${fn:trim(dataSeq)}", "pageNum":pageNo},
	           success: function(data){ 
	        	  $("#replyList").html(data);
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
	}

//]]>
</script>

</head>

<body>

<form method="post" name="frm" id="frm">

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
			<jsp:include page="/resources/include/commonfile/inc/lnb_bottom.jsp" />
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

				<input type="hidden" name="boardSeq" id="boardSeq" value="${ boardSeq }" />
				<input type="hidden" name="dataSeq" id="dataSeq" value="${ dataSeq }" />
				<input type="hidden" name="mode" id="mode" />
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자를 포함한 게시물 상세보기의 표" class="bd00view">
						<caption>
							게시물 내용 상세보기
						</caption>
						<colgroup>
							<col width="120px" />
							<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row">제목</th>
							<td class="bd01td listx">${ fn:trim(communityList[0].subject) }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">사업장</th>
							<td class="bd01td listx">
										<c:if test="${facilList != null && fn:length(facilList) > 0 }">
											<c:forEach items="${facilList }" var="list">
													<c:if test="${communityList[0].commCodeSeq eq  list.commCodeSeq}">${list.codeNm }</c:if>
											</c:forEach>
										</c:if>
							</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">작성자</th>
							<td class="bd01td">
							${ fn:trim(communityList[0].createNm)}
							</td>
						</tr>
						<tr>
							<td colspan="2" scope="row" class="bd01tdC">${ fn:trim(communityList[0].content) }</td>
						</tr>
					</table>
				</div>
				
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="/front/community/${communityList[0].boardSeq}" >목록으로</a></span>
					
					<!-- 작성자인 경우에만 수정 버튼 활성화 -->
					<c:if test="${ fn:trim(communityList[0].createNm eq userNm) }">	
						<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >수정하기</a></span>
						<span class="txtBtn_lightGray"><a href="#" id="deleteBtn" >삭제하기</a></span>
					</c:if>
					<!-- Text Button -->
				</div>
				<c:choose>
					<c:when test="${userInfo.userId ne '' and userInfo.userId ne null }">
						<div class="replyInput mb30">
							<div class="fl">
								<textarea name="replyContent" id=replyContent cols="65" rows="5" title="댓글 내용 입력하기"></textarea>
							</div>
							<div class="fr">
								<!-- <p style="text-align:right">0 /100</p> -->
								<p> <a href="#" id="commentBtn" name="commentBtn"><img src="/resources/include/commonfile/image/board/btn_reply.gif" width="60" height="42" alt="댓글등록" /></a> </p>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="replyInput mb30">
							<div class="fl">
								<textarea name="replyContent" id=replyContent cols="65" readonly="readonly" rows="5" title="댓글 내용 입력하기">로그인후 사용하실수있습니다.</textarea>
							</div>
							
						</div>
					</c:otherwise>
				</c:choose>
				<div id="replyList"></div>
				
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
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(4,3,0,0);</script>


</body>
</html>