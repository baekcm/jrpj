<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(function(){
		 $("input[name='updateBtn']").click(function(){
			var menuSeq = $(this).attr("data");
			var menuUrl = $(this).parent().parent().find("input[name='menuUrl']").val();
			$("#menuSeq").val(menuSeq);
			$("#menuUrl").val(menuUrl);
			
			$("#pageFrm").submit();
		});
	});
</script>
<div class="boardWrap">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
		<caption>
	자주 묻는 질문
	</caption>
	<colgroup>
	<col width="30px" />
	<col width="50px" />
	<col width="50px" />
	<col width="50px" />
	<col width="60px" />
	<col width="60px" />
	<col width="200px" />
	<col width="40px" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">메뉴번호</th>
			<th scope="col">메뉴명</th>
			<th scope="col">부모메뉴번호</th>
			<th scope="col">부모메뉴명</th>
			<th scope="col">메뉴레벨</th>
			<th scope="col">메뉴구분</th>
			<th scope="col">메뉴URL</th>
			<th scope="col">버튼</th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${list != null && fn:length(list) > 0 }">
			<c:forEach items="${list }" var="list">
				<tr>
					<td>
						${list.menuSeq }
					</td>
					<td>
						${list.menuNm }
					</td>
					<td>
						${list.prntMenuSeq }
					</td>
					<td>
						${list.prntMenuNm }
					</td>
					<td>
						${list.menuLvl}
					</td>
					<td>
						${list.pageGbnCd }
					</td>
					<td>
					<input type="text" name="menuUrl" size="50" value="${list.menuUrl }" />
					</td>
					<td>
					<input type="button" name="updateBtn" data="${list.menuSeq }" value="저장" />
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
					
