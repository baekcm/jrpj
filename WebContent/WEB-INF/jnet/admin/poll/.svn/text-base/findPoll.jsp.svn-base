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
		//이미 설문중이 아니거나 내가 투표한 경우 모든 폼타입 disable
		$("input[type=radio]").attr("disabled","disabled");
		$("textarea").attr("disabled","disabled");
		var totAnswerCnt = $("#totAnswerCnt span").text();
		var anserCnt = 0;
		if(totAnswerCnt != '0') {
			$("td.slctAnserCnt").each(function(){
				anserCnt =parseInt($(this).attr("data"));
				var percentageVal = (anserCnt/totAnswerCnt) * 100;
				percentageVal = percentageVal.toFixed(2);
				$(this).find("span.percentageSpan").text(percentageVal);
				$(this).prev().find("img").css("width",percentageVal+"%");
			})	
		} else {
			$(this).find("span.percentageSpan").text("0");
		}
		$("a.popviewer").click(function(){
			var seq = $(this).attr("data");
			window.open("/admin/listPollViewer/etc/"+seq,"aaa","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no, width=610, height=350");
		});
		
		$("a.popviewer2").click(function(){
			var seq = $(this).attr("data");
			window.open("/admin/listPollViewer/shortAnswer/"+seq,"aaa","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no, width=610, height=350");
		});
		
		$("#listBtn").click(function(){
			location.href = "/admin/listPoll?gseq=${gseq}&lseq=${lseq}";
		});
		$("#editBtn").click(function(){
			$("#frm").attr("action","/admin/formUpdatePoll?gseq=${gseq}&lseq=${lseq}").submit();
		});
		$("#removeBtn").click(function(){
			var f = confirm("정말삭제하시겠습니까?");
			if(f){
				$("#frm").attr("action","/admin/removePoll?gseq=${gseq}&lseq=${lseq}").submit();	
			} else {
				return;
			}
		});
	});
</script>
</head>
<body>
<jsp:include page="/common/gnb.jsp" />
<form id="frm" method="post">
	<input type="hidden" name="pollSeq" value="${findPoll.pollSeq }" />
</form>

<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>설문조사 상세보기</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bd00view" summary="설문조사 제목, 기간, 상태, 투표수 문항 표시표">
					<caption>
					투표 상세보기
					</caption>
					<colgroup>
					<col width="80px" />
					<col width="193px" />
					<col width="90px" />
					<col width="90px" />
					<col width="60px" />
					<col  />
					</colgroup>
					<tr>
						<th class="bd01th" >제목</th>
						<td class="bd01td" colspan="5">${findPoll.subject}</td>
					</tr>
					<tr>
						<th class="bd01th" >설문기간</th>
						<td class="bd01td">
						${fn:substring(findPoll.stDtm,0,4)}.${fn:substring(findPoll.stDtm,4,6)}.${fn:substring(findPoll.stDtm,6,8)}
							~
						${fn:substring(findPoll.edDtm,0,4)}.${fn:substring(findPoll.edDtm,4,6)}.${fn:substring(findPoll.edDtm,6,8)}
						</td>
						<th class="bd01th" >진행상태</th>
						<td class="bd01td">
							<c:choose>
								<c:when test="${findPoll.pollStatusCd eq 'R' }">
									<span style="color:black;font-weight: bold;">${findPoll.pollStatus }</span>
								</c:when>
								<c:when test="${findPoll.pollStatusCd eq 'I' }">
									<span style="color:blue;font-weight: bold;">${findPoll.pollStatus }</span>
								</c:when>
								<c:when test="${findPoll.pollStatusCd eq 'C' }">
									<span style="color:red;font-weight: bold;">${findPoll.pollStatus }</span>
								</c:when>
							</c:choose>
							
						</td>
						<th class="bd01th" >투표수</th>
						<td class="bd01td" id="totAnswerCnt"><span>${findPoll.answerCnt}</span>명</td>
					</tr>
					<tr>
						<td colspan="6" scope="row" class="bd01tdC">
							${findPoll.contents }
							<p>&nbsp;</p>
							<c:if test="${listPollQuestion != null && fn:length(listPollQuestion) > 0 }">
								<c:set var="problemCnt" value="0" />
								<c:set var="tmpQnoType" value="" />
								<c:set var="problemType" value="" />
								<c:forEach items="${listPollQuestion }" var="listPollQuestion" varStatus="status">
									<c:if test="${status.index > 0 && tmpQnoType != null && listPollQuestion.qNoType eq null && problemType != '1' }">
										</table>
										<p>&nbsp;</p>
									</c:if>
									<c:choose>
										<c:when test="${listPollQuestion.problemType eq 0 }">
											<!-- 객관식이냐 -->
												<c:choose>
													<c:when test="${listPollQuestion.prntProblemSeq eq 0 }">
														<!-- 부모일 경우 -->
														<c:if test="${listPollQuestion.qNoType eq null}">
															<c:set var="tmpQnoType" value="${listPollQuestion.qNoType }" />
															<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="투표질문" class="pollbd">
																<colgroup>
																<col  />
																<col width="50%" />
																<col width="38%" />
																</colgroup>
																<c:set var="problemCnt" value="${problemCnt + 1 }" />
														</c:if>
														<tr>
															<th class="myProblemSeq" id="${listPollQuestion.problemSeq }" colspan="3" align="left" scope="col">
																${problemCnt }. ${listPollQuestion.problemContent }
																<input name="aShortAnswerArr" type="hidden" value=""/>
																<input name="problemSeqArr" type="hidden" value=""/>
																<textarea name="aEtcArr" style="display: none;"></textarea>
															</th>
														</tr>
													</c:when>
													<c:otherwise>
														<!-- 자식일 경우 -->
														<c:set var="tmpQnoType" value="${listPollQuestion.qNoType }" />
														<tr class="childTr">
															<td class="pollfb" align="center">
															<input type="radio" name="rdoproblemSeq${listPollQuestion.prntProblemSeq }" title="항목1선택"
																<c:if test="${listPollQuestion.qNoType eq '1' }">data="qNoType1"</c:if> value="${listPollQuestion.problemSeq }"/>
																${listPollQuestion.problemContent }
															</td>
															<td><img src="/resources/include/commonfile/image/board/bg_bar.gif" style="width: 0%" height="11px"/></td>
															<td class="pollfb2 slctAnserCnt" data="${listPollQuestion.answerCnt }">${listPollQuestion.answerCnt }명(<span class="percentageSpan"></span>%)
																<c:if test="${listPollQuestion.qNoType eq '1' }">
																	<a href="#" style="text-decoration:underline;font-weight: bold;" class="popviewer" data="${listPollQuestion.problemSeq }">(내용보기)</a>
																</c:if>
															</td>
														</tr>
														
													</c:otherwise>
												</c:choose>
										</c:when>
										<c:when test="${listPollQuestion.problemType eq 1 }">
											<c:set var="problemCnt" value="${problemCnt + 1 }" />
											<!-- 주관식이냐 / 자식구분 필요없음 -->
											<p class="fb">
												<input type="hidden" name="problemSeqArr" value="${listPollQuestion.problemSeq }" />
												<input type="hidden" name="aEtcArr" />
												${problemCnt}. ${listPollQuestion.problemContent }
												<c:if test="${listPollQuestion.problemType eq 1 }">
													<a href="#" style="text-decoration:underline;font-weight: bold;"  class="popviewer2" data="${listPollQuestion.problemSeq }">(내용보기)</a>
												</c:if>
												<textarea name="aShortAnswerArr" class="etc2"></textarea>
											</p>
											<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="투표질문" class="pollbd">
												<tr><td>&nbsp;</td></tr>
											</table>
										</c:when>
									</c:choose>
									<c:set var="problemType" value="${listPollQuestion.problemType  }" />
									<c:if test="${status.last }">
										</td></tr></table>
										<input type="hidden" name="pollSeq" value="${listPollQuestion.pollSeq }" />
									</c:if>
								</c:forEach>
							</c:if>
						</td>
					</tr>
				</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button -->
					<span class="txtBtn_lightGray"><a href="#" id="listBtn" >목록으로 가기</a></span> &nbsp;
					<c:if test="${findPoll.pollStatusCd ne 'I' }"> 
						<span class="txtBtn_lightGray"><a href="#" id="editBtn" >수정</a></span> &nbsp;
						<span class="txtBtn_lightGray"><a href="#" id="removeBtn" >삭제</a></span> &nbsp;
					</c:if> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>