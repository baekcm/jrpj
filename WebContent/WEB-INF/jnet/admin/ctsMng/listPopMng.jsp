<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>
	<c:when test="${listPopMng != null && fn:length(listPopMng) > 0 }">
		<table width="100%">
		<c:forEach items="${listPopMng }" var="list" varStatus="status">
			<tr title="이 부분을 드래그하면  순서를 변경할 수 있습니다.">
				<td width="100%" >
					<table width="100%" border="0">
						<tr>
							<td style="margin-left: 10px;">
								<input type="hidden" name="ordinaryArr" value="${list.ordinary }"/>
								<img src="${list.filePath}${list.realFileNm}" />
							</td>
							<td>
								<input type="hidden" value="${list.popSeq }" name="popSeqArr" />
								<input type="text" value="${list.linkUrl }" name="ulinkUrlArr" />
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
								<input type="button" name="removeBtn" data="${list.popSeq }" value="완전삭제"/>
							</td>
						</tr>
						<tr>
							<td colspan="7">
								<textarea name="udescriptArr" cols="90" rows="5">${list.descript }</textarea>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</c:forEach>
		</table>	
	</c:when>
	<c:otherwise>
		<table width="100%">
		<tr>
			<td width="100%">
				등록된 팝업이 존재하지 않습니다.
			</td>
		</tr>
		</table>
	</c:otherwise>
</c:choose>
