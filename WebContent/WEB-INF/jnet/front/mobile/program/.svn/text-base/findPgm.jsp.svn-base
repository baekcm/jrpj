<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>프로그램안내-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/msub.css" rel="stylesheet" type="text/css" />
<%@ include file="/resources/include/mobile/inc/header.jsp" %>
</head>

<body>
<div id="header">
	<jsp:include page="/resources/include/mobile/inc/top.jsp" />
	<ul id="submenu1" class="submenu">
		<c:if test="${listFacil != null && fn:length(listFacil) > 0 }">
			<c:forEach items="${listFacil }" var="list">
				<li>
					<a href="/m/program/index/${list.codeId}" name="upNm" 
						<c:if test="${upId eq list.codeId }">class="on"</c:if>
					>
						${list.codeNm }
					</a>
				</li>	
			</c:forEach>
		</c:if>
	</ul>
	<div id="headNavi">
		<div class="prev">
			<a href="javascript:history.go(-1);" onclick="history.go(-1);"><img src="/resources/include/mobile/image/btn_prev.png" width="25" height="24" alt="이전으로" /></a>
		</div>
		<div class="title">프로그램안내</div>
		<div class="home">
			<a href="/m/index"><img src="/resources/include/mobile/image/btn_home.png" width="25" height="24" alt="홈으로" /></a>
		</div>
	</div>
	<p id="navi"> 
		<a href="/m/index"><img src="/resources/include/mobile/image/icon_home.png" height="12" alt="홈으로" /></a> 
		&gt; 프로그램안내
	 	&gt; <span id="catNm"></span>
	</p>
</div>
<div id="body"> 
	
	<!-- real Contents -->
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
						<p><img width="145px" height="145px" src="${pgm.imgPath }${pgm.realFileNm }" alt="" /></p>
					</c:when>
					<c:otherwise>
						<p><img width="145px" height="145px" src="/resources/include/commonfile/image/common/no_img.gif" alt="이미지 없음" /></p>
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
					<p><strong>장소</strong>: ${fn:trim(outpgm[0].comNm5 )} </p>
				</li>
				<li>
					<p><strong>수강료</strong> : 
					<c:if test="${outpgm != null && fn:length(outpgm) > 0 }">
						<c:forEach items="${outpgm }" var="list">
							<c:if test="${fn:length(outpgm) > 1 }">
							&nbsp;|
							</c:if>
							&nbsp;${list.comNm3 }&nbsp;<fmt:formatNumber value="${list.uPrice }" pattern="#,###"/>원
						</c:forEach>
					</c:if></p>
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
									<p><img width="120px" height="120px" src="${list.imgPath }${list.realFileNm }" alt="${list.teacherNm }" /></p>
								</c:when>
								<c:otherwise>
									<p><img width="120px" height="120px" src="/resources/include/commonfile/image/common/no_img.gif" alt="이미지 없음" /></p>
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
					<li class="none" style="margin-left:-20px">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="강좌의 소개와 내용과 준비물에 대한 안내표. " class="tbl01">
							<caption>
							강좌안내
							</caption>
							<colgroup>
							<col style="width:23%" />
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
	<!-- real Contents --> 
</div>
<jsp:include page="/resources/include/mobile/inc/bottom.jsp" />
</body>
</html>
