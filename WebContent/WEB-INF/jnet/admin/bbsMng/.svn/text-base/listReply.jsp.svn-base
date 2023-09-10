<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
		<colgroup>
			<col width="400px;" />
			<col width="100px;" />
			<col width="100px;" />
		</colgroup>
		<c:choose>
			<c:when test="${listReply != null && fn:length(listReply) > 0 }">
				<c:forEach items="${listReply }" var="list" >
					<tr>
						<td style="text-align: left; border-top: 1px solid #d7d7d7;">
							${list.replyContent }
						</td>
						<td style="border-top: 1px solid #d7d7d7;">
							${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)}
						</td>
						<td style="border-top: 1px solid #d7d7d7;">
							${list.createNm }
							<input type="button" name="removeReply" data="${list.dataSeq }" id="${list.replySeq }" value="x" />
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="2">등록된 댓글이 존재하지 않습니다.</td>
			</tr>
			</c:otherwise>
		</c:choose>
</table>
<c:if test="${listReply != null && fn:length(listReply) > 0 }">
	<div class="pgeAbs mt30"> 
		<p class="paging">${pageIndexList }</p>
	</div>
</c:if>
