<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="topheader">
	<div id="indexColumn">
		<div id="siteMenu" class="siteMenu">
			<ul>
				<li>
					<a href="/" style="text-decoration:underline;font-weight: bold;" target="_blank">홈으로</a>
				</li>
				<li><b>${adminInfo.admNm }</b>님이 로그인 하셨습니다. </li>
				<li class="login"><a href="#" onclick="adminLogout();">로그아웃</a></li>
			</ul>
		</div>
		<h1 id="logo"><a href="/admin/formMain"><img src="/resources/admin_include/commonfile/image/common/logo.png" alt="종로구 시설관리공단" /></a></h1>
		<div id="indexNavi">
			<ul id="topmenu">
				<li id="gnb1" class="first"> 
					<a href="/admin/formMain">	
						메인 
					</a> 
				</li>
				<c:if test="${adminInfo.admAuthCode eq 'S' }">
					<c:if test="${gnb != null && fn:length(gnb) > 0 }">
						<c:forEach items="${gnb }" var="gnb">
							<li id="gnb2" >
								<a href="${gnb.menuUrl }?gseq=${gnb.menuSeq}">
									${gnb.menuNm }
								</a>
							</li>
						</c:forEach>
					</c:if>
				</c:if> 
				<c:if test="${adminInfo.admAuthCode eq 'O' }">
					<c:if test="${authInfo != null && fn:length(authInfo) > 0 }">
						<c:set var="bbsCnt" value="0" />	
						<c:set var="ctsCnt" value="0" />
						<c:set var="pgmCnt" value="0" />
						<c:set var="cptCnt" value="0" />
						<c:set var="ctsMainUrl" value="" />
						<c:set var="pgmMainUrl" value="" />
						<c:set var="bbsMainUrl" value="" />
						<c:set var="cptMainUrl" value="" />
						<c:forEach items="${authInfo }" var="list">
							<c:if test="${list.menuType eq 'BBS' }">
								<c:if test="${bbsCnt eq 0 }">
									<c:set var="bbsMainUrl" value="/admin/listBbsMng?gseq=3" />
								</c:if>
								<c:set var="bbsCnt" value="${bbsCnt+1 }" />
							</c:if>
							<c:if test="${list.menuType eq 'ACTS' }">
								<c:if test="${ctsCnt eq 0 }">
									<c:set var="ctsMainUrl"  value="${list.menuUrl }?gseq=4" />
								</c:if>								
								<c:set var="ctsCnt" value="${ctsCnt+1 }" />
							</c:if>
							<c:if test="${list.menuType eq 'ACPT' }">
								<c:if test="${cptCnt eq 0 }">
									<c:set var="cptMainUrl"  value="${list.menuUrl }?gseq=7" />
								</c:if>								
								<c:set var="cptCnt" value="${cptCnt+1 }" />
							</c:if>
						</c:forEach>
						<c:if test="${bbsCnt > 0 }">
							<li id="gnb2" >
								<a href="${bbsMainUrl }">
									게시판관리
								</a>
							</li>
						</c:if>
						<c:if test="${ctsCnt > 0 }">
							<li id="gnb2" >
								<a href="${ctsMainUrl }">
									컨텐츠관리
								</a>
							</li>
						</c:if>
						<c:if test="${cptCnt > 0 }">
							<li id="gnb2" >
								<a href="${cptMainUrl }">
									민원관리
								</a>
							</li>
						</c:if>
					</c:if>
					<c:if test="${pgmAuthInfo != null && fn:length(pgmAuthInfo) > 0 }">
						<li id="gnb2" >
							<a href="/admin/listPgmMng?gseq=5">
								프로그램관리
							</a>
						</li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</div>