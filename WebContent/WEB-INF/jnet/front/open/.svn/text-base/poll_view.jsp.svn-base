<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
<script type="text/javascript">
	$(function(){
		<c:if test="${findPoll.pollStatus != '설문중' || findPoll.myPollCnt > 0}">
			//이미 설문중이 아니거나 내가 투표한 경우 모든 폼타입 disable
			$("input[type=radio]").attr("disabled","disabled");
			$("textarea").attr("disabled","disabled");
		</c:if>
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
		

		
	});
	
	function savePoll(){
		/*//향후 로그인여부 적용방식에 따라 달라질 수 있음
		if("${userInfo.userId}" == ""){
			alert("로그인후 투표하실수 있습니다.");
			return false;
		}
		*/
		var truefalse = true;
		//객관식일 경우.
		$("th.myProblemSeq").each(function(){
			if($("input[name=rdoproblemSeq"+$(this).attr("id")+"]:checked").size() == 0) {
				alert("객관식은 모두 선택해야 합니다.");
				truefalse = false;
				return false;
			}
		});
		if(!truefalse) {
			return;
		}
		
					
		$("input[name^=rdoproblemSeq]:checked").each(function(){
			if($(this).attr("data") != undefined) {
				if($.trim($(this).parent().parent().next().find("td textarea").text()) == "") {
					alert("기타사항은 내용을 입력해주셔야 합니다.");
					truefalse = false;
					return false;
				} else {
					$(this).parent().parent().parent().find("tr:eq(0) th.myProblemSeq textarea").text($.trim($(this).parent().parent().next().find("td textarea").text()));
					$(this).parent().parent().parent().find("tr:eq(0) th.myProblemSeq input[name=problemSeqArr]").val($(this).val());
				}
			} else {
				$(this).parent().parent().parent().find("tr:eq(0) th.myProblemSeq input[name=problemSeqArr]").val($(this).val());
				$(this).parent().parent().parent().find("tr:eq(0) th.myProblemSeq textarea").text("");
			}
		});
		
		if(!truefalse) {
			return;
		}
		$("textarea[name^=aShortAnswerArr]").each(function(){
			if($.trim($(this).val()) == ""){
				alert("주관식에 내용을 입력해주세요");
				$(this).focus();
				truefalse = false;
				return false;
			}	
		});
		
		if(!truefalse) {
			return;
		}
		
		var f = confirm("설문 참여하시겠습니까?");
		if(f){
			$("#frm").submit();				
		} else {
			return;
		}
	}
</script>
</head>

<body>
<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
<div id="topheader">
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>
<div id="topVisual">
	<div id="visual"><img src="/resources/include/commonfile/image/visual/visual01.jpg" alt="눈과 귀를 열고 고객만족 1등 공기업을 만들기위해 최선을 다하겠습니다." /> </div>
</div>
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<div class="lnbBody">
				<ul id="lnb" class="lnbul">
					<li></li>
				</ul>
			</div>
			<!--lnb Bottom Icon Area -->
			<%@ include file="/resources/include/commonfile/inc/lnb_bottom.jsp" %>
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				
				<!-- real Contents -->
				<div class="boardWrap">
<!-- poll View -->
			<form action="/front/savePoll" method="post" name="frm" id="frm">
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
						<td class="bd01td">${findPoll.stDtm} ~ ${findPoll.edDtm}</td>
						<th class="bd01th" >진행상태</th>
						<td class="bd01td">${findPoll.pollStatus }</td>
						<th class="bd01th" >투표수</th>
						<td class="bd01td" id="totAnswerCnt"><span>${findPoll.answerCnt}</span>명</td>
					</tr>
					<tr>
						<td colspan="6" scope="row" class="bd01tdC">
						${findPoll.contents}
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
															<col width="21%" />
															<col width="61%" />
															<col width="18%" />
															</colgroup>
															<c:set var="problemCnt" value="${problemCnt + 1 }" />
													</c:if>
													<tr>
														<th class="myProblemSeq" id="${listPollQuestion.problemSeq }" colspan="3" align="left" scope="col">
															${problemCnt }. ${listPollQuestion.problemContent }
															<input name="aShortAnswerArr" type="hidden" value=""/>
															<input name="problemSeqArr" type="hidden" value="${listPollQuestion.problemSeq }"/>
															<textarea name="aEtcArr" style="display: none;"></textarea>
														</th>
													</tr>
												</c:when>
												<c:otherwise>
													<!-- 자식일 경우 -->
													<c:set var="tmpQnoType" value="${listPollQuestion.qNoType }" />
													<tr class="childTr">
														<td width="21%" class="pollfb">
														<input type="radio" name="rdoproblemSeq${listPollQuestion.prntProblemSeq }" title="항목1선택"
															<c:if test="${listPollQuestion.qNoType eq '1' }">data="qNoType1"</c:if> value="${listPollQuestion.problemSeq }"/>
															${listPollQuestion.problemContent }
														</td>
														<td width="61%"><img src="/resources/include/commonfile/image/board/bg_bar.gif" style="width: 0%" height="11px"/></td>
														<td width="18%" class="pollfb2 slctAnserCnt" data="${listPollQuestion.answerCnt }">${listPollQuestion.answerCnt }명(<span class="percentageSpan"></span>%)</td>
													</tr>
													<c:if test="${listPollQuestion.qNoType eq '1' }">
														<tr>
															<td colspan="3" class="pollfb"><textarea name="etcArr" class="etc1"></textarea></td>
														</tr>
													</c:if>
												</c:otherwise>
											</c:choose>
									</c:when>
									<c:when test="${listPollQuestion.problemType eq 1 }">
										<c:set var="problemCnt" value="${problemCnt + 1 }" />
										<!-- 주관식이냐 / 자식구분 필요없음 -->
										<p class="fb">
											<input type="hidden" name="problemSeqArr" value="${listPollQuestion.problemSeq }" />
											<input type="hidden" name="aEtcArr" />
											${problemCnt}. ${listPollQuestion.problemContent }<br />
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
			</form>
			<div class="btn_farm mb20 mb20"> 
				<c:if test="${findPoll.pollStatus eq '설문중' && findPoll.myPollCnt eq 0 }">
				<input name="" type="submit" class="submit" value="설문참여" onclick="savePoll();"/>//${findPoll.myPollCnt }
				<input name="" type="submit" class="submit" value="취소" onclick="javascript:window.location.href='/front/listPoll'"/>
				</c:if>
			</div>
			<!-- poll View --> 
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="/front/listPoll" >목록으로</a></span> 
					<!-- Text Button --> 
				</div>
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(4,2,0,0);</script>
</body>
</html>