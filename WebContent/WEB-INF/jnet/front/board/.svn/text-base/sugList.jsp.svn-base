<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript">
	$(function(){
		 $(".findBtn").click(function(){
			var sugSeq = $(this).attr("data");
			var use = $(this).attr("use");
			var userId = $(this).attr("userId");
			if(use =="N" && "${userInfo.userId}" !=  userId){
				alert("비공개는 본인만 확인가능합니다.");
				return false;
			}else{
				$("#suggestSeq").val(sugSeq); 
				$("#pageFrm").submit();
			}
			
		});
	});
</script>
<div class="boardWrap">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,등록일,구분,제안제목,제안인,공개여부,처리여부,조회수">
		<caption>
	고객 제안
	</caption>
	<colgroup>
	<col width="40px" />
	<col width="120px" />
	<col />
	<col width="60px" />
	<col width="60px" />
	<col width="60px" />
	<col width="60px" />
	<%-- <col width="60px" /> --%>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">등록일</th>
			<th scope="col">제안제목</th>
			<th scope="col">제안인</th>
			<th scope="col">공개여부</th>
			<th scope="col">처리여부</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${listParm != null && fn:length(listParm) > 0 }">
			<c:forEach items="${listParm }" var="list">
				<tr>
					<td>
						${list.listNo }
					</td>
					<td>
						${fn:substring(list.createYmd,0,4)}-${fn:substring(list.createYmd,4,6)}-${fn:substring(list.createYmd,6,8)}
					</td>
	<%-- 				<td>
							<c:if test="${list.suggestGbnCd =='1' }">공단직원</c:if>
							<c:if test="${list.suggestGbnCd =='2' }">주민제안</c:if>
					</td> --%>
					<td >
					<a href="#" class="findBtn" use="${list.useYn}" data="${list.suggestSeq }" userId="${list.createId }" >
						${list.subject }
						</a>
					</td>
					<td>
						${list.userNm }
					</td>
					<td>
							<c:if test="${list.useYn =='Y' }">공개</c:if>
							<c:if test="${list.useYn =='N' }">비공개</c:if>
					</td>
					<td>
							<c:if test="${list.statusCd =='R' }">접수중</c:if>
							<c:if test="${list.statusCd =='I' }">처리중</c:if>
							<c:if test="${list.statusCd =='C' }">완료</c:if>
					</td>
					<td>
						${list.hitnum }
					</td>
						
					
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="7">등록된 글이 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
		</tbody>
	</table>
	</div>
					<c:if test="${listParm != null && fn:length(listParm) > 0 }"> 
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>