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
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
<script type="text/javascript">
$(function(){
	<c:if test="${basMsg ne '' and basMsg ne null}">
		alert('${basMsg}');
		<c:if test="${basMsg ne null and basRes ne '0'}">
			history.go(-1);
		</c:if>
	</c:if>
	
	
	var totUprice = 0, totDcPrice = 0, totPayPrice = 0;
	$(".tblWrap").find("td[name='weekCdTd']").each(function(e){
		var week = $.trim($(this).text());
		var length = week.length;
		var weekNm = "";
		var arr = new Array("월","화","수","목","금","토","일");
		for(var i=0; i<length; i++) {
			if(week.charAt(i) == "1") {
				weekNm += arr[i]+',';
			}
		}
		weekNm = weekNm.substring(0,weekNm.length-1);
		$(this).text(weekNm);
	});
	var numUprice = 0, dcPrice = 0, payPrice = 0;		
	for(var i=1; i <= ${fn:length(listBasket)}; i ++) {
		var uPrice = $.trim($("#uPrice"+i).text()).replace(",",""); //단가
		var dcRate = $.trim($("#dcRate"+i).val()).substring(0, 3); //할인률
		numUprice = parseInt(uPrice, 10);
		var numDcRate = parseInt(dcRate, 10);
		
		dcPrice = Math.floor((numUprice * numDcRate /100) / 10) * 10; //할인금액
		payPrice = numUprice - dcPrice; //결제금액
		totUprice += numUprice;
		totDcPrice += dcPrice;
		totPayPrice += payPrice;
		$("#dcPrice"+i).text(dcPrice);
		$("#payPrice"+i).text( comma(payPrice)+"원");
	}
	$("a[name=detailPgm]").click(function(){
		var pgmCd = $(this).attr("pgmcd");
		var comCd3 = $(this).attr("comcd");
		var upId = $(this).attr("upid");
		var saleId = $(this).attr("salecomcd");
		var basId = $(this).attr("bascd");
		var yymm = 	$(this).attr("yymm");
		$("#pgmCd").val(pgmCd);
		$("#comCd3").val(comCd3);
		$("#upId").val(upId);
		$("#up_id").val(upId);
		$("#saleId").val(saleId);
		$("#basId").val(basId);
		$("#yymm").val(yymm);
		$("#pageFrm").attr("action","/front/formViewPgm").submit();
	});
	$("a[name=removeBasket]").click(function(){
		var upId = $(this).attr("upId");
		var pgmCd = $(this).attr("pgmCd");
		var yymm = 	$(this).attr("yymm");
		var seqNo = $(this).attr("seqNo");
		$("#upId").val(upId);
		$("#up_id").val(upId);
		$("#pgmCd").val(pgmCd);
		$("#yymm").val(yymm);
		$("#seqNo").val(seqNo);
		$("#pageFrm").attr("action","/front/mypage/removeBasket").submit();
	});
	{
		if("${fn:length(listBasket)}" == "0") {
			
		} else if("${fn:length(listBasket)}" == "1") {
			$("#totPgmNm").text($("#pgmName").text());
			$("#orderPgmNm").val($("#pgmName").text());
			$("#orderPgmCd").val($("#pgmCode").text());
		} else {
			$("#totPgmNm").text($("#pgmName").text() + "외 " + ${fn:length(listBasket)-1} + "건");
			$("#orderPgmNm").val($("#pgmName").text() + "외 " + ${fn:length(listBasket)-1} + "건");
			$("#orderPgmCd").val($("#pgmCode").text());
		}	
		$("#totUprice").text(comma(totUprice)+"원");
		$("#totDcPrice").text(totDcPrice);
		$("#totPayPrice").text(comma(totPayPrice)+"원");
		$("#orderAmount").val(totPayPrice);
		
	}
});

function doPayment() {
	var form = document.payForm;
	var msg = "결제를 진행하시겠습니까? 결제페이지로 이동합니다.";
	if(confirm(msg)) {
		if("${img11}".indexOf("_over") > -1 ) {
			form.upId.value="11";
			form.up_id.value="11";
		} else if("${img21}".indexOf("_over") > 0 ) {
			form.upId.value="21";
			form.up_id.value="21";
		} else if("${img41}".indexOf("_over") > 0 ) {
			form.upId.value="41";
			form.up_id.value="41";
		} 		
		form.submit();	
	}
}

function comma(n) {
    var reg = /(^[+-]?\d+)(\d{3})/;
    n += '';
    while (reg.test(n))
     n = n.replace(reg, '$1' + ',' + '$2');
    return n;
}

function goBasket(upId) {
	var form=document.pageFrm;
	form.upId.value=upId;
	form.action="/front/mypage/basketList";
	form.submit();
}
</script>	
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="pgmCd" id="pgmCd" />
	<input type="hidden" name="comCd3" id="comCd3" />
	<input type="hidden" name="upId" id="upId" />
	<input type="hidden" name="up_id" id="up_id" />
	<input type="hidden" name="saleId" id="saleId" />
	<input type="hidden" name="basId" id="basId" />
	<input type="hidden" id="yymm" name="yymm"  />
	<input type="hidden" name="seqNo" id="seqNo" />	
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
					<!-- Sports & culture list top Search --><!-- Sports & culture list top Search -->
					<div id="basketUpid">
						<a href="javascript:goBasket('11')"><img src="${ img11 }" border="0" align="absmiddle" /></a>
						<a href="javascript:goBasket('21')"><img src="${ img21 }" border="0" align="absmiddle" /></a>
						<a href="javascript:goBasket('41')"><img src="${ img41 }" border="0" align="absmiddle" /></a>
					</div>
					<div class="tblWrap mb30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="강좌명, 시간,요일, 대상, 단가, 할인적용, 할인금액, 결젝금액을 나타낸 표 " class="tbl01 tdCenter">
							<caption>
							신청강좌 결제(예정)목록
							</caption>
							<colgroup>
							<col style="width:90px" />
							<col />
							<col style="width:70px" />
							<col style="width:90px" />
							<col style="width:55px" />
							<col style="width:60px" />
							<col style="width:130px" />
							<col style="width:50px" />
							<col style="width:50px" />
							<col style="width:30px" />
							</colgroup>
							<tr>
								<th scope="col">사업장명</th>
								<th scope="col">프로그램명</th>
								<th scope="col">이용시간</th>
								<th scope="col">요일</th>
								<th scope="col">대상</th>
								<th scope="col">수강료</th>
								<th scope="col">할인적용</th>
								<th scope="col">할인금액</th>
								<th scope="col">결제금액</th>
								<th scope="col">삭제</th>
							</tr>
							<c:choose>
								<c:when test="${listBasket != null && fn:length(listBasket) > 0 }">
									<c:set var="seqNo" value="1" />
									<c:forEach items="${listBasket }" var="listBasket" >
									<tr>
										<td id="pgmName" style="display:none">${fn:trim(listBasket.pgm_nm)}</td>
										<td id="pgmCode" style="display:none">${fn:trim(listBasket.pgm_cd)}</td>
										<td>
										<c:if test="${ listUpId != null && fn:length(listUpId) > 0 }">
											<c:forEach items="${ listUpId }" var="list">
												<c:if test="${list.codeId eq fn:trim(listBasket.up_id) }">${list.codeNm}</c:if>
											</c:forEach>
										</c:if>
										</td>
										<td>
										  <%-- <a href="#" name="detailPgm" comcd="${listBasket.target_cd}"  pgmcd="${listBasket.pgm_cd}" salecomcd="${listBasket.sale_com_cd}" bascd="${listBasket.bas_cd}" upid="${listBasket.up_id}" yymm="${fn:substring(listBasket.start_dt, 0, 6)}">
										  </a> --%>
										  ${fn:trim(listBasket.pgm_nm)}
										</td>
										<td>
											${fn:substring(listBasket.start_t,0,2)}:${fn:substring(listBasket.start_t,2,4)}
													~
											${fn:substring(listBasket.end_t,0,2)}:${fn:substring(listBasket.end_t,2,4)}
										</td>
										<td name='weekCdTd'>${fn:trim(listBasket.dt_week_cd)}</td>
										<td>${fn:trim(listBasket.target)}</td>
										<td id="uPrice${seqNo}"><fmt:formatNumber value="${listBasket.u_price}" pattern="#,###"/>원</td>
										<td>
											<select name="dcRate${seqNo}" id="dcRate${seqNo}" title="할인적용">
										    	<option value="${listBasket.dc_cd}">${listBasket.dc_nm}</option>
											</select>	
										</td>
										<td name='dcPrice' id="dcPrice${seqNo}"></td>
										<td id='payPrice${seqNo}'></td>
										<td>
										<a href="#link" name="removeBasket" upId="${listBasket.up_id}" pgmCd="${listBasket.pgm_cd}" yymm="${fn:substring(listBasket.start_dt, 0, 6)}" seqNo="${listBasket.seq_no}">
											<img src="/resources/include/commonfile/image/board/btn_delete.gif"  alt="삭제하기" />
										</a></td>
									</tr>
									<c:set var="seqNo" value="${seqNo + 1}" />
									</c:forEach>
								</c:when>
								<c:otherwise>
								<tr><td colspan="10">데이터가 없습니다.</td></tr>
								</c:otherwise>
							</c:choose>		
						</table>
					</div>
					<c:if test="${listBasket != null && fn:length(listBasket) > 0 }"> 
					<div class="tblWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="품목,총액,할인금액,결제금액을 나타낸 표. " class="tbl01">
							<caption>
							결제표
							</caption>
							<tr>
								<th width="60px" scope="row">품목</th>
								<td id="totPgmNm"></td>
								<th width="60px" scope="row">총액</th>
								<td width="60px" id="totUprice"></td>
								<th width="60px" scope="row">할인금액</th>
								<td width="60px" id="totDcPrice"></td>
								<th width="60px" scope="row">결제금액</th>
								<td width="60px" id="totPayPrice"></td>
							</tr>
						</table>
					</div>
					<div class="btn_farm2 mt20 mb20"> 
						<!-- Text Button -->
							<span class="txtBtn_Gray"><a href="javascript:doPayment();" >결제하기</a></span>
						<!-- Text Button -->
					</div>
					<form name="payForm" method="post" action="/front/mypage/payment/orderForm">
						<input type="hidden" name="yymm" value="<%//=yymm%>" />
						<input type="hidden" name="upId" />
						<input type="hidden" name="up_id" />
						<input type="hidden" name="spayAmt" />
						<input type="hidden" name="sdcAmt" />
						<input type="hidden" name="pgmstr" />
						<input type="hidden" name="strpayAmt" />
						<input type="hidden" name="strdcAmt" />
						<input type="hidden" name="strdc_cd" />
						<input type="hidden" name="orderBasketCnt" id="orderBasketCnt" value="${fn:length(listBasket)}" />
						<input type="hidden" name="orderPgmNm" id="orderPgmNm" />
						<input type="hidden" name="orderPgmCd" id="orderPgmCd" />
						<input type="hidden" name="orderAmount" id="orderAmount" />
					</form>
					</c:if>
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











<script type="text/javascript">initMenu(9,1,6,0);</script>
</body>
</html>