<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(function(){
		 $(".findBtn").click(function(){
			var qSeq = $(this).attr("data");
			var aflag = $(this).attr("aflag");
			var show = $(this).attr("show");
			var userId = $(this).attr("userId");
			$("#qSeq").val(qSeq);
			if(show =="N" && "${userInfo.userId}" !=  userId){
				alert("비공개는 본인만 확인가능합니다.");
				return false;
			}else{
				if((aflag == "01" || aflag == "02") && "${userInfo.userId}" ==  userId){
					$("#pageFrm").attr("action","/front/formUpdateMinwon");
				}
				$("#pageFrm").submit();
			} 
		});
	});
</script>
<div class="boardWrap">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,등록일,시설명,구분,제목,작성자,공개구분,처리여부,조회수">
		<caption>
	자주 묻는 질문
	</caption>
	<colgroup>
	<col width="40px" />
	<col width="140px" />
	<col />
	<col width="60px" />
	<col width="60px" />
	<col width="60px" />
	<col width="120px" />
	<col width="60px" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">시설명</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">공개구분</th>
			<th scope="col">처리여부</th>
			<th scope="col">등록일</th>
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
						${list.upNm }
					</td>
					<td>
					<a href="#" class="findBtn" data="${list.qSeq }" show="${list.showYn}" aflag="${list.statusCd }" userId="${list.qIdDi }">
						${list.subject }
					</a>
					</td>
					<td>
					
							${ fn:substring(fn:trim(list.qNm), 0, 1) }○○

					</td>
					<td>
						<c:if test="${list.showYn =='Y' }">공개</c:if>
						<c:if test="${list.showYn =='N' }">비공개</c:if>
					</td>
					<td>
						<c:if test="${list.statusCd eq '01'}">
							접수대기
						</c:if>
						<c:if test="${list.statusCd eq '02' }">
							접수중
						</c:if>
						<c:if test="${list.statusCd eq '03' }">
							답변중
						</c:if>
						<c:if test="${list.statusCd eq '04' }">
							답변완료
						</c:if>
					</td>
					<td>
						${fn:substring(list.qCreateYmd,0,4)}-${fn:substring(list.qCreateYmd,4,6)}-${fn:substring(list.qCreateYmd,6,8)}
					</td>
					<td>
						${list.hitnum}
					</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="8">등록된 글이 존재하지 않습니다.</td>
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
					
