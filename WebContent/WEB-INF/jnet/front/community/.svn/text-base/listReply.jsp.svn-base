<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(function(){

	});
</script>
<ul class="replyList" id="replyList">
	<c:choose>
		<c:when test="${ listReply != null && fn:length(listReply) > 0 }">
			<c:forEach items="${ listReply }" var="list">
				<li>
					<dl>
						<dt>${ list.createNm } ( ${ fn:substring(list.createYmd,0,4) }-${ fn:substring(list.createYmd,4,6) }-${ fn:substring(list.createYmd,6,8) })</dt>
						<dd>${ list.replyContent }</dd>
						<dd class="btnDel">
							<c:if test="${ userInfo.userId eq list.createId }">
								<img style="cursor: pointer;" src="/resources/include/commonfile/image/board/btn_delete.gif" alt="댓글 삭제하기" name="removeComment" data="${ list.dataSeq }" id="${ list.replySeq }" />
							</c:if>
						</dd>
					</dl>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
				<li>
					<dl>
						<dd>등록된 댓글이 존재하지 않습니다.</dd>
					</dl>
				</li>
		</c:otherwise>
	</c:choose>
</ul>

<c:if test="${listReply != null && fn:length(listReply) > 0 }">
	<div class="pgeAbs mt30"> 
		<p class="paging">${pageIndexList }</p>
	</div>
</c:if>