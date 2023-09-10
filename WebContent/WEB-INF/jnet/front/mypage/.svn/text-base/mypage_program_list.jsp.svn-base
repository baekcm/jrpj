<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function _goCancel (up_id, tno, RecpNo, PgmName, issue_dt, gbn, cancel_yn){
	var f = document.dltfrm;
	var str, restr;

	$("#dltfrm").find("#upId").val(up_id);
	$("#dltfrm").find("#tno").val(tno);
	$("#dltfrm").find("#recpNo").val(RecpNo);
	$("#dltfrm").find("#pgmNm").val(PgmName);
	$("#dltfrm").find("#issueDt").val(issue_dt);

	if (cancel_yn == "N"){
		if (gbn == '0'){
			$("#dltfrm").find("#gbn").val("delete");
			str = "환불요청 하시겠습니까?\n";
		}else{
			$("#dltfrm").find("#gbn").val("cancel");
			str = "환불요청을 취소하시겠습니까?\n";
		}
		var bool = confirm(str);
		if (bool){
			var restr = prompt("환불 사유를 입력해 주십시오.", "")
			if (!(restr == null || restr == "")){
				$("#dltfrm").find("#reason").val(restr);
				$("#dltfrm").find("#cancelYn").val("N");
				$("#dltfrm").attr("target","delframe");
				//$("#dltfrm").attr("action","").submit();
				//f.action = "CancelReq.asp";
				//f.submit();
				
				alert("submit!!");
			}
		} else {
			return;
		}
	}else {
		if (gbn == '0') {
			$("#dltfrm").find("#gbn").val("delete");
			str = "카드 결제건에 대해 취소요청 하시겠습니까?\n";
		}else{
			$("#dltfrm").find("#gbn").val("cancel");
			str = "카드 결제 취소요청을 취소하시겠습니까?\n";
		}
		var bool = confirm(str);
		if (bool) {
			$("#dltfrm").find("#reason").val("신용카드 당일 거래 취소 요청");
			$("#dltfrm").find("#cancelYn").val("Y");
			$("#dltfrm").attr("target","delframe");
			//$("#dltfrm").attr("action","").submit();
			//f.action = "CancelReq.asp";
			//f.submit();
			
			alert("submit!!");
		} else {
			return;
		}
	}
}
</script>
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
</head>

<body>
<form name="dltfrm" id="dltfrm" method="post">
	<input type="hidden" name="upId" id="upId" />
	<input type="hidden" name="tno" id="tno" />
	<input type="hidden" name="recpNo" id="recpNo" />
	<input type="hidden" name="pgmNm" id="pgmNm" />
	<input type="hidden" name="issueDt" id="issueDt" />
	<input type="hidden" name="cancelYn" id="cancelYn" />
	<input type="hidden" name="reason" id="reason" />
	<input type="hidden" name="gbn" id="gbn"/>
</form>
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
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<!--
					<div class="pageTopSearch">
						<form name="pgtSearch" method="post" action="../facil/gumin/반드시 기입">
							<select name="pgtFacil" id="pgtFacil" title="시설명 선택">
								<option>시설관리공단</option>
								<option>올림픽기념국민생활관</option>
								<option>종로구민회관</option>
								<option>종로문화체육센터</option>
								<option>동부여성문화센터</option>
								<option>청소년문화센터</option>
								<option>삼청테니스장</option>
							</select>
							<select name="kwdtype" id="kwdtype" title="검색방법 선택" class="schSel">
								<option>제목</option>
								<option>내용</option>
							</select>
							<input type="text" name="schKwd" id="schKwd" title="검색어 입력" class="schKwd"  style="width:200px;" />
							<input type="image" alt="검색" id="pgtschBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
						</form>
					</div>
					-->
					<!-- Sports & culture list top Search -->
					
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,센터명,강좌명,접수일,시작일,종료일,강습료로 이루어진 표">
							<caption>
							수강 내역
							</caption>
							<colgroup>
							<col width="40px" />
							<col width="90px" />
							<col />
							<col width="90px" />
							<col width="90px" />
							<col width="90px" />
							<col width="90px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">센터명</th>
									<th scope="col">강좌명</th>
									<th scope="col">접수일</th>
									<th scope="col">시작일</th>
									<th scope="col">종료일</th>
									<th scope="col">강습료</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${listPgm != null && fn:length(listPgm) > 0 }">
										<c:forEach items="${listPgm }" var="list">
											<tr>
												<td>${list.listNo }</td>
												<td>
												<c:if test="${upList != null && fn:length(upList) > 0 }">
													<c:forEach items="${upList }" var="upList">
														<c:if test="${list.upId eq upList.codeId }">${upList.codeNm }</c:if>
													</c:forEach>
												</c:if>
												</td>
												<td>${list.pgmNm }</td>
												<td>${fn:substring(list.startT,0,4)}-${fn:substring(list.startT,4,6)}-${fn:substring(list.startT,6,8)}</td>
												<td>${fn:substring(list.endT,0,4)}-${fn:substring(list.endT,4,6)}-${fn:substring(list.endT,6,8)}</td>
												<td>${fn:substring(list.issueDt,0,4)}-${fn:substring(list.issueDt,4,6)}-${fn:substring(list.issueDt,6,8)}</td>
												<td><fmt:formatNumber value="${list.amt }" pattern="#,###"/></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">수강내역이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- board paging -->
					<c:if  test="${listPgm != null && fn:length(listPgm) > 0 }">
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					<!-- board paging --> 
				</div>
				
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%--@ include file="/resources/include/commonfile/inc/poll.jsp" --%>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(9,1,3,0);</script>
</body>
</html>
