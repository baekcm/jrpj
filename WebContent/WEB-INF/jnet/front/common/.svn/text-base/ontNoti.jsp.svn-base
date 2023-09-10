<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<!-- <div id="TopNews">
		<p><a href="#link">[회관] 재밌는 오페라 이야기 - 금관악기 연주회 안내 글 줄임 표시 여부 테스트를 위해 길게 늘여 쓰기</a></p>
	</div> -->
	<c:choose>
	<c:when test="${listNotiMng != null && fn:length(listNotiMng) > 0  }">
	<div id="TopNews">
		<p><a href="http://${listNotiMng[0].linkUrl }" target="${listNotiMng[0].linkTgt }"	>
		${listNotiMng[0].title }</a></p>
	</div>
	</c:when>
	<c:otherwise>
	<div id="TopNews">
		<p>등록된 한줄 알림이 없습니다.</p>
	</div>
	</c:otherwise>
	</c:choose>
	
