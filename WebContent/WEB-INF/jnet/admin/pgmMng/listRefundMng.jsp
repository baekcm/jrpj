<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript">
$(function(){
	/* var summary = "";
	$("table.bd00Bbs tr:eq(0) th").each(function(){
		summary += $.trim($(this).text()) + ",";
	});
	summary = summary.substring(0,summary.length-1);
	$("table.bd00Bbs").attr("summary",summary); */
	
	$("#commCodeSeq").change(function(){
		//사업장
		/* $("#upId").val($("#commCodeSeq").val()); */
		$("#dateGbnCd").val($("#commCodeSeq").val());
		$("#pageFrm").attr("action","/admin/listRefundMng?gseq=${gseq}&lseq=${lseq}").submit();
	});
	<c:if test="${dateGbnCd eq 'B' }">
	$("input[name=reasonBtn]").click(function(){
		$("tr.reasonTr").hide();
		$(this).parent().parent().next().show();
	});
	</c:if>
	
	$("input[name=cancelBtn]").click(function(){
		$this = $(this);
		$("#refundFrm").find("#reason").val($.trim($this.parent().parent().next().find("td").text()));
		$("#refundFrm").find("#upId").val($this.parent().find("input[name=upId]").val());
		$("#refundFrm").find("#recpNo").val($this.parent().find("input[name=recpNo]").val());
		$("#refundFrm").find("#tno").val($this.parent().find("input[name=tno]").val());
		$("#refundFrm").find("#memNo").val($this.parent().find("input[name=memNo]").val());
		window.open("","refundpop","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no, width=610, height=350");
		$("#refundFrm").attr("target","refundpop").submit();
	});
});
 function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#pageFrm").attr("action","/admin/listRefundMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="refundFrm" id="refundFrm" action="/admin/formRefundPop">
	<input type="hidden" name="upId" id="upId"/>
	<input type="hidden" name="reason" id="reason"/>
	<input type="hidden" name="recpNo" id="recpNo"/>
	<input type="hidden" name="tno" id="tno"/>
	<input type="hidden" name="memNo" id="memNo"/>
	<input type="hidden" name="dateGbnCd" value="${dateGbnCd }"  />
	<input type="hidden" name="lseq" value="${lseq }"  />
	<input type="hidden" name="gseq" value="${gseq }"  />
</form>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" id="dateGbnCd" name="dateGbnCd" value="${dateGbnCd }"  />
</form>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>결제 리스트</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						당일취소 : 
						<select name="commCodeSeq" id="commCodeSeq">
							<option value="C"
								<c:if test="${dateGbnCd eq 'C' }">selected="selected"</c:if>
							>당일결제승인취소</option>
							<option value="B"
								<c:if test="${dateGbnCd eq 'B' }">selected="selected"</c:if>
							>온라인환불요청</option>
						</select>
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="40px" />
								<col width="80px" />
								<col width="120px" />
								<col width="140px" />
								<col width="70px" />
								<col width="70px" />
								<c:if test="${dateGbnCd eq 'B' }">
								<col width="70px" />
								<col width="60px" />
								</c:if>
								<col />
							</colgroup>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">사업장</th>
								<th scope="col">프로그램명</th>
								<th scope="col">금액</th>
								<th scope="col">결제일</th>
								<c:if test="${dateGbnCd eq 'B' }">
								<th scope="col">환불요청일</th>
								<th scope="col">환불사유</th>
								</c:if>
								<th scope="col">취소처리</th>
							</tr>
							<c:choose>
								<c:when test="${listRefundMng != null && fn:length(listRefundMng) > 0 }">
									<c:forEach items="${listRefundMng }" var="list">
										<tr>
											<td>
												${list.listNo }
											</td>
											<td>
												${list.memNm }
											</td>
											<td>
												<c:if test="${upList != null && fn:length(upList) > 0 }">
													<c:forEach items="${upList }" var="upList">
														<c:if test="${upList.codeId eq list.upId  }">
														${upList.codeNm }
														</c:if>
													</c:forEach>
												</c:if>
											</td>
											<td>
												${list.pgmNm }
												<c:if test="${list.cnt > 0 }">
													외 ${list.cnt }건
												</c:if>
											</td>
											<td>
												<fmt:formatNumber value="${list.amt }" pattern="#,###"/>원
											</td>
											<td>
												${fn:substring(list.issueDt,0,4)}-${fn:substring(list.issueDt,4,6)}-${fn:substring(list.issueDt,6,8)}
											</td>
											<c:if test="${dateGbnCd eq 'B' }">
												<td>
													${list.fEnterDt }
												</td>
												<td>
													<input type="button" value="사유보기" name="reasonBtn" />
												</td>
											</c:if>
											<td>
												<input type="button" value="취소" name="cancelBtn" />
												<input type="hidden" name="upId" value="${list.upId }" />
												<input type="hidden" name="recpNo" value="${list.recpNo }" />
												<input type="hidden" name="tno" value="${list.tno}" />
												<input type="hidden" name="memNo" value="${list.memNo }" />
											</td>
										</tr>
										<c:if test="${dateGbnCd eq 'B' }">
											<tr class="reasonTr" style="display: none;">
												<td colspan="9" style="text-align: left;background:rgb(248, 248, 256);">
													${list.reason }
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:set var="colSpan" value="7" />
									<c:if test="${dateGbnCd eq 'B' }">
										<c:set var="colSpan" value="9" />
									</c:if>
									<tr>
										<td colspan="${colSpan }" align="center">환불요청목록이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							
						</table>
					</div>
					<!-- board paging --> 
					<c:if  test="${listRefundMng != null && fn:length(listRefundMng) > 0 }">
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>