<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<script type="text/javascript">
$(function(){
	<c:if test="${cancelMsg != null && cancelMsg != ''}">
		alert("${cancelMsg}");
	</c:if>
})

function addFrontZero(inValue, totLen) {
  var result = '';
  inValue = inValue.toString();

  if (inValue.length < totLen) {
   for (var i = 0; i < totLen - inValue.length; i++)
      result += '0';
    }
    result += inValue;
  return result;
}

function _goCancel (up_id, tno, RecpNo, PgmName, issue_dt, gbn, cancel_yn){
	var d = new Date();
	var year = d.getFullYear();
	var month = (d.getMonth() + 1);
	var date = d.getDate();
	var hour = d.getHours();
	var minute = d.getMinutes();
	var second = d.getSeconds();
	var strMonth = "";
	var strDate = "";
	if(month < 10) {
		strMonth = "0"+month;
	} else {
		strMonth = month;
	}
	if(date < 10) {
		strDate = "0"+date;
	} else {
		strDate = date;
	}
	
	var fullDate = year +""+ strMonth +""+ strDate;
	var fullDateTime = fullDate + addFrontZero(hour, 2) + addFrontZero(minute, 2) + addFrontZero(second, 2)+"";
	<c:if test="${listAcceptDate != null && fn:length(listAcceptDate)> 0}">
		<c:forEach items="${listAcceptDate }" var="list">
			<c:if test="${list.acceptStYmd != null && list.acceptStYmd != '' }">
				if(up_id == "${list.upIdCode}") {
					var stYmd = "${list.acceptStYmd }";
					var edYmd = "${list.acceptEdYmd }";
					if(stYmd <= fullDate && edYmd >= fullDate && fullDateTime < '${ endDateTime }' ) {
					} else {
						alert("접수신청 기간에만 환불신청이 가능합니다.");
						return;
					}
				}
			</c:if>
		</c:forEach>
	</c:if>
	
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
				$("#dltfrm").attr("action","/front/mypage/payment/paymentCancel").submit();
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
			$("#dltfrm").attr("action","/front/mypage/payment/paymentCancel").submit();
		} else {
			return;
		}
	}
}
function setPage(pageNo) {
	$("#pageNum").val(pageNo);
	$("#pageFrm").submit();
}
</script>
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
</head>

<body>
<form name="pageFrm" id="pageFrm" method="post" action="/front/mypage/paymentList">
	<input type="hidden" name="pageNum" id="pageNum" />
</form>
<form name="dltfrm" id="dltfrm" method="post" action="#">
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
				<div class="top_info">
					<p class="infom">매월 말일까지 환불신청이 가능하며 전액으로 카드취소됩니다.</p>
					<p class="infom"> 매월 말일 이후에는 방문 환불만 가능합니다.</p>
				</div>
				<div class="pageSection"> 
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbl01 tdCenter" summary="번호,센터명,영수번호,강좌명,결제방법,결제일,결제금액,취소요청으로 이루어진 표">
							<caption>
							결제 내역
							</caption>
							<colgroup>
							<col width="40px" />
							<col width="130px" />
							<col width="110px" />
							<col />
							<col width="80px" />
							<col width="90px" />
							<col width="70px" />
							<col width="80px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">센터명</th>
									<th scope="col">영수번호</th>
									<th scope="col">강좌명</th>
									<th scope="col">결제방법</th>
									<th scope="col">결제일</th>
									<th scope="col">결제금액</th>
									<th scope="col">취소요청</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${listPayMng != null && fn:length(listPayMng) > 0 }">
										<c:forEach items="${listPayMng }" var="list">
											<tr>
												<td>${list.listNo }</td>
												<td class="rowSpnTd1"  data="${list.recpNo }">
												<c:if test="${upList != null && fn:length(upList) > 0 }">
													<c:forEach items="${upList }" var="upList">
														<c:if test="${list.upId eq upList.codeId }">${upList.codeNm }</c:if>
													</c:forEach>
												</c:if>
												</td>
												<td class="rowSpnTd2"  data="${list.recpNo }">${list.recpNo }</td>
												<td>
													<c:choose>
														<c:when test="${list.cnt eq '0' }">
															${fn:trim(list.pgmNm)}	
														</c:when>
														<c:otherwise>
															${fn:trim(list.pgmNm)}<%--  외 ${list.cnt } 건 --%>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="rowSpnTd3"  data="${list.recpNo }">${list.cardNm }</td>
												<td class="rowSpnTd4"  data="${list.recpNo }">${fn:substring(list.issueDt,0,4)}-${fn:substring(list.issueDt,4,6)}-${fn:substring(list.issueDt,6,8)}</td>
												<td class="rowSpnTd5" data="${list.recpNo }"><fmt:formatNumber value="${list.amt }" pattern="#,###"/></td>
												<td class="rowSpnTd6" data="${list.recpNo }">
													<c:choose>
														<c:when test="${list.state eq '0' }">
															<a style="cursor: pointer;" onclick="_goCancel('${list.upId }', '${list.tno}', '${list.recpNo }', '${list.pgmNm }', '${list.issueDt }', '0', '${list.cancelYn }');">
																<input  type="button" value="취소"/>
															</a>
														</c:when>
														<c:when test="${list.state eq '1' }">
															<c:choose>
																<c:when test="${list.cancelYn eq 'Y'  }">
																	<a style="cursor: pointer;" onclick="_goCancel('${list.upId }', '${list.tno}', '${list.recpNo }', '${list.pgmNm }', '${list.issueDt }', '1', '${list.cancelYn }');">
																		<input  type="button" value="취소대기"/>
																	</a>
																</c:when>
																<c:when test="${list.tag eq '3' }">
																	환불완료
																</c:when>
																<c:otherwise>
																	환불대기
																</c:otherwise>
															</c:choose>
														</c:when>
														<c:when test="${list.state eq '2' }">
															취소완료
														</c:when>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="8">결제내역이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- board paging -->
					<c:if  test="${listPayMng != null && fn:length(listPayMng) > 0 }">
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
<script type="text/javascript">initMenu(9,1,4,0);</script>
</body>
</html>