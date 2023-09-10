<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:choose>
	<c:when test="${listOneNotiMng != null && fn:length(listOneNotiMng) > 0 }">
		<c:forEach items="${listOneNotiMng }" var="list" varStatus="status">
			<table  class="bd00 bd00Bbs" width="100%" border="0" cellspacing="0" cellpadding="0" >
				<colgroup>
					<col width="40px" />
					<col />
					<col width="120px" />
					<col width="80x" />
					<col width="60px" />
					<col width="60px" />
					<col width="80px" />
					<col width="100px" />
				</colgroup>
				<tr>
					<td>
						<input type="radio" name="showYn" value="${list.oneNotiSeq }" 
							<c:if test="${list.showYn eq 'Y' }">checked="checked"</c:if>
						 />
					</td>
					<td>
						<input type="text" value="${list.title }" name="utitleArr" style="width: 250px" />
					</td>
					<td>
						<input type="hidden" value="${list.oneNotiSeq }" name="oneNotiSeqArr" />
						<input type="text" value="${list.linkUrl }" name="ulinkUrlArr" style="width: 100px" />
					</td>
					<td>
						<select name="rmYnArr">
							<option value="N"
								<c:if test="${list.rmYn eq 'N' }">selected="selected"</c:if>	
							>사용</option>
							<option value="Y"
								<c:if test="${list.rmYn eq 'Y' }">selected="selected"</c:if>
							>사용안함</option>
						</select>
					</td>
					<td>
						<select name="ulinkTgtArr">
							<option value="_blank"
								<c:if test="${list.linkTgt eq '_blank' }">selected="selected"</c:if>	
							>새창</option>
							<option value="_self"
								<c:if test="${list.linkTgt eq '_self' }">selected="selected"</c:if>
							>기존창</option>
						</select>
					</td>
					<td>
						${list.modiId }
					</td>
					<td>
						${fn:substring(list.modiYmd,0,4)}-${fn:substring(list.modiYmd,4,6)}-${fn:substring(list.modiYmd,6,8)}
						${fn:substring(list.modiHms,0,2)}:${fn:substring(list.modiHms,2,4)}:${fn:substring(list.modiHms,4,6)}
					</td>
					<td>
						<input type="button" name="removeBtn" data="${list.oneNotiSeq }" value="완전삭제"/>
					</td>
				</tr>
			</table>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<table  class="bd00 bd00Bbs" width="100%">
			<tr>
				<td width="100%" colspan="8">
					등록된 한줄알리미가 존재하지 않습니다.
				</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>
