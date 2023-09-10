<%@page import="com.jnet.util.CommonUtil"%>
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
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
<script language="javascript" src="/resources/XecureObject/xecureweb.js"></script>
<script language="javascript">
	PrintObjectTag();
</script>
<script type="text/javascript">
	function addBasket() {
		var form1 = document.frm;
		form1.action = "/front/mypage/addBasket";
		form1.submit();
	}
</script>
</head>
<body>
<form name='xecure'><input type="hidden" name='p'></form>
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
				<%
				if(CommonUtil.getSystemProperties("os.name").indexOf("Linux") > -1) { //윈도우와 unix의 경우 파라미터 갯수가 다르다.
		        	System.out.println("client linux ---------------> " );
	        	%>

				<form  action="#" method="post" name="frm" id="frm" enctype="multipart/form-data" onSubmit="return XecureSubmit(this);">		      	
	        	<%
				}else{
					System.out.println("client window ---------------> " );
				%>
		      	<form  action="#" method="post" name="frm" id="frm" enctype="multipart/form-data">
	        	<%
				}
				%>
				
						<input type="hidden" name="pgmCd" value="${fn:trim(outpgm[0].pgmCd )}" />
						<input type="hidden" name="pgmSeq" value="${pgm.pgmSeq}" />
				<div class="pageSection"> 
					<!-- Sports & culture view top Search -->
					<div class="pageTopTitle">
						<dl>
							<dt>강좌명</dt>
							<dd>${fn:trim(outpgm[0].pgmNm )}</dd>
						</dl>
					</div>
					<!-- Sports & culture view top Search -->
					<div class="partSection bg_instructor">
						<div class="image3">
								<c:choose>
									<c:when test="${pgm.imgPath != null && pgm.imgPath != ''  }">
										<p><img src="${pgm.imgPath }${pgm.realFileNm }" alt="제목을 alt값으로" /></p>
									</c:when>
									<c:otherwise>
										<p><img src="/resources/include/commonfile/image/common/no_img.gif" alt="이미지 없음" /></p>
									</c:otherwise>
								</c:choose>
						</div>
						<ul class="guide2 wd_sports">
							<li>
								<p><strong>시간</strong> :
								${fn:substring(outpgm[0].startT,0,2)}:${fn:substring(outpgm[0].startT,2,4)}
								~
								${fn:substring(outpgm[0].endT,0,2)}:${fn:substring(outpgm[0].endT,2,4)} 
								</p>
							</li>
							<li>
								<p><strong>장소</strong>: ${fn:trim(outpgm[0].comNm5 )}  </p>
							</li>
							<li>
								<p><strong>수강료</strong>:
									<c:if test="${outpgm != null && fn:length(outpgm) > 0 }">
										<c:forEach items="${outpgm }" var="list">
											<c:if test="${fn:length(outpgm) > 1 }">
											&nbsp;|
											</c:if>
											&nbsp;${list.comNm3 }&nbsp;<fmt:formatNumber value="${list.uPrice }" pattern="#,###"/>원
										</c:forEach>
									</c:if>
								 </p>
							</li>
							<!-- <li>
								<p><strong>정원</strong>: 80명 (40명)</p>
							</li>
							<li>
								<p><strong>비고</strong> : 재수강 신청은 2013.08.16 ~ 2013.08.26일 까지입니다.</p>
							</li> -->
						</ul>
						<c:if test="${teacher != null && fn:length(teacher) > 0 }">
							<c:forEach items="${teacher }" var="list">
							<div class="partSection partInSection">
								<div class="image3">
								<c:choose>
									<c:when test="${list.imgPath != null && list.imgPath != ''  }">
										<p><img src="${list.imgPath }${list.realFileNm }" alt="${list.teacherNm }" /></p>
									</c:when>
									<c:otherwise>
										<p><img src="/resources/include/commonfile/image/common/no_img.gif" alt="이미지 없음" /></p>
									</c:otherwise>
								</c:choose>
									
								</div>
								<ul class="guide2 wd_instructor">
									<li>
										<p><strong>강사명</strong> : ${list.teacherNm }</p>
									</li>
									<li class="none">
										<dl>
											<dt><strong>주요경력</strong> :</dt>
											<dd>
											${list.teacherHistory }
											</dd>
										</dl>
									</li>
								</ul>
							</div>
							</c:forEach>
						</c:if>
						
					</div>
				</div>
				<div class="pageSection mb30">
					<ul class="guide">
						<li><strong>강좌안내</strong>
							<ul>
								<li class="none">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="강좌의 소개와 내용과 준비물에 대한 안내표. " class="tbl01">
										<caption>
										강좌안내
										</caption>
										<colgroup>
										<col style="width:180px;" />
										<col  />
										</colgroup>
										<tr>
											<th scope="row">강좌 소개</th>
											<td>${fn:trim(pgm.pgmIntro)}</td>
										</tr>
										<tr>
											<th scope="row">강좌세부내용</th>
											<td>${fn:trim(pgm.pgmDtlCts)}</td>
										</tr>
										<tr>
											<th scope="row">개인준비물</th>
											<td>${fn:trim(pgm.supply)}</td>
										</tr>
									</table>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				
				<div class="btn_farm2">
					<!-- 올림픽기념생활관, 종로구민회관, 종로문화체육센터 만 수강신청을 할 수 있도록 한다. -->
					<c:if test="${upId eq '11' || upId eq '21' || upId eq '41'}">
					<a href="javascript:${scriptStr}"><img src="/resources/include/commonfile/image/board/btn_check.gif" alt="결제하기" /></a>
					</c:if>
				</div>
				<input type="hidden" name="gbn" id="gbn" value="insert" />
				<input type="hidden" name="upId" id="upId" value="${fn:trim(outpgm[0].upId)}" />
				<input type="hidden" name="yymm" id="yymm" value="${fn:trim(yymm)}" />
				<input type="hidden" name="targetCd" id="targetCd" value="${fn:trim(outpgm[0].targetCd)}" />
				<input type="hidden" name="saleComCd" id="saleComCd" value="${fn:trim(outpgm[0].saleComCd)}" />
				<input type="hidden" name="basCd" id="basCd" value="${fn:trim(outpgm[0].basCd)}" />
				</form>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%-- <jsp:include page="/front/satfact/${menuSeq }" /> --%>
				
<div class="pollWrap">
	<div class="poll">
		<p class="text">이 페이지의 내용과 편의성에 만족하십니까?</p>
		<ul>
			<li>
				<label for="satisr5">
					<input name="satisr" id="satisr5" type="radio" value="" />매우만족</label>
			</li>
			<li>
				<label for="satisr4">
					<input name="satisr" id="satisr4" type="radio" value="" />만족</label>
			</li>
			<li>
				<label for="satisr3">
					<input name="satisr" id="satisr3" type="radio" value="" />보통</label>
			</li>
			<li>
				<label for="satisr2">
					<input name="satisr" id="satisr2" type="radio" value="" />불만족</label>
			</li>
			<li>
				<label for="satisr1">
					<input name="satisr" id="satisr1" type="radio" value="" />매우불만족</label>
			</li>
		</ul>
	</div>
	<div class="btn"><a href="#link"><img src="/resources/include/commonfile/image/common/btn_regist.png" alt="등록" onclick="alert('만족도 참여에 감사드립니다.')" /></a></div>
	<c:if test="${upId eq '11' }">
		<c:set var="dept" value="생활관팀" />
		<c:set var="tel" value="02-745-6701" />
	</c:if>
	<c:if test="${upId eq '21' }">
		<c:set var="dept" value="구민회관팀" />
		<c:set var="tel" value="02-3672-2530" />
	</c:if>
	<c:if test="${upId eq '41' }">
		<c:set var="dept" value="문화체육센터팀" />
		<c:set var="tel" value="02-732-9392" />
	</c:if>
	<c:if test="${upId eq '31' }">
		<c:set var="dept" value="구민회관팀" />
		<c:set var="tel" value="02-3675-5861" />
	</c:if>
	<c:if test="${upId eq '32' }">
		<c:set var="dept" value="생활관팀" />
		<c:set var="tel" value="02-3675-1318" />
	</c:if>
	<c:if test="${upId eq '33' }">
		<c:set var="dept" value="문화체육센터팀" />
		<c:set var="tel" value="02-2148-4068" />
	</c:if>
	<ul class="satis">
		<li>
			<dl>
				<dt>컨텐츠 관리부서 :</dt>
				<dd>${dept }</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>연락처</dt>
				<dd>${tel }</dd>
			</dl>
		</li>
		<li class="fr">
			<dl>
				<dt>최종수정일:</dt>
				<dd>2013-12-11</dd>
			</dl>
		</li>
	</ul>
</div>
				
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(1,${upId=="11"?"1":upId=="21"?"2":upId=="41"?"3":upId=="32"?"5":upId=="33"?"6":4 },2, ${saleId=="01"?"1":saleId=="02"?"2":3 } );</script>
</body>
</html>