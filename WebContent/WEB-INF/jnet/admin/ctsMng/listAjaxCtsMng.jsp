<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<colgroup>
	<col width="40px" />
	<col />
	<col width="100px" />
	<col width="80px" />
	<col width="80px" />
	<col width="100px" />
	<col width="60px" />
</colgroup>
<tr>
	<th scope="col">번호</th>
	<th scope="col">메뉴카테고리</th>
	<th scope="col">메뉴명</th>
	<th scope="col">담당자</th>
	<th scope="col">연락처</th>
	<th scope="col">수정일</th>
	<th scope="col">관리</th>
</tr>
<c:choose>
	<c:when test="${listCtsMng != null && fn:length(listCtsMng) > 0 }">
		<c:forEach items="${listCtsMng }" var="list">
			<tr>
				<td>
					${list.listNo }
				</td>
				<td style="margin-left: 10px;text-align: left;">
					<c:if test="${list.treeNm3 != null }">
						${list.treeNm3 } >
					</c:if>
					<c:if test="${list.treeNm2 != null }">
						${list.treeNm2} >
					</c:if>
					<c:if test="${list.treeNm1 != null }">
						${list.treeNm1}
					</c:if>
				</td>
				<td>
					${list.menuNm }&nbsp;
				</td>
				<td>
					${list.empNm }&nbsp;
				</td>
				<td>
					${list.empPhoneNumber }&nbsp;
				</td>
				<td>
					<c:choose>
						<c:when test="${list.modiYmd != null && list.modiYmd != '' }">
							${fn:substring(list.modiYmd,0,4)}-${fn:substring(list.modiYmd,4,6)}-${fn:substring(list.modiYmd,6,8)}
						</c:when>
						<c:otherwise>
							&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<input type="button" data="${list.menuSeq }" value="관리" name="mngBtn" />
				</td>
			</tr>
		</c:forEach>
		<input type="hidden" id="cnt" value="${fn:length(listCtsMng) }" />
		<input type="hidden" id="pagingTag" value="${pageIndexList }"	/>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="7" align="center">등록된 메뉴가 존재하지 않습니다. 메뉴먼저 등록해주세요.</td>
		</tr>
	</c:otherwise>
</c:choose>
