<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<link rel="stylesheet" href="/resources/css/jquery-ui.css" type="text/css" media="all" />
<style type="text/css">
	.overImg{ border-color: red;border-style: solid;border-width: 2px; }
</style>
<script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$("input[name=formatBtn]").click(function(){
			$(this).parent().prev().find("input").val("");
		});
		$("input[name=mngBtn]").click(function(){
			var qSeq = $(this).attr("data");
			$("#qSeq").val(qSeq); 
			$("#pageFrm").attr("action","/admin/formUpdateCptMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
		
		$( "#qStCreateYmdTxt" ).datepicker({
		    dateFormat: 'yy-mm-dd'
	 	});
		$( "#qEdCreateYmdTxt" ).datepicker({
		    dateFormat: 'yy-mm-dd'
	 	});
		
		$("div.ui-datepicker").hide();
		
		$("#excelBtn").click(function(){
			$("#pageFrm").attr("action","/admin/excelDownCptMng").submit();
		});
		
		$("#searchBtn").click(function(){
			var qStDtm = $("#qStCreateYmdTxt").val().replace(/-/gi, "");
			var qEdDtm = $("#qEdCreateYmdTxt").val().replace(/-/gi, "");
			
			if(qStDtm == "" && qEdDtm != "") {
				alert("시작일과 종료일 모두 있거나 없어야 합니다.");
				return;
			}
			if(qEdDtm == "" && qStDtm != "") {
				alert("시작일과 종료일 모두 있거나 없어야 합니다.");
				return;	
			}
			
			if(qStDtm > qEdDtm) {
				alert("접수기간조건이 종료일보다 시작일이 더 클수 없습니다.");
				return;
			}
			
			$("#qStCreateYmd").val(qStDtm);
			$("#qEdCreateYmd").val(qEdDtm);
			$("#dateCnt").val($("#dateCntSlct").val());
			$("#upId").val($("#upIdSlct").val());
			$("#areaId").val($("#areaIdSlct").val());
			$("#satisId").val($("#satisIdSlct").val());
			$("#happyId").val($("#happyIdSlct").val());
			$("#qAge").val($("#qAgeSlct").val());
			$("#qSex").val($("#qSexSlct").val());
			$("#qSeq").val("");
			$("#statusCd").val($("#statucCdSlct").val());
			$("#pageFrm").attr("action","/admin/listCptMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
	});
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("#qSeq").val(""); 
		$("#pageFrm").attr("action","/admin/listCptMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>
<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" />
	<input type="hidden" name="qSeq" id="qSeq" />
	<input type="hidden" name="qStCreateYmd" id="qStCreateYmd" value="${qStCreateYmd }" />
	<input type="hidden" name="qEdCreateYmd" id="qEdCreateYmd" value="${qEdCreateYmd }" />
	<input type="hidden" name="upId" id="upId" value="${upId }" />
	<input type="hidden" name="areaId" id="areaId" value="${areaId }" />
	<input type="hidden" name="satisId" id="satisId" value="${satisId }" />
	<input type="hidden" name="happyId" id="happyId" value="${happyId }" />
	<input type="hidden" name="qAge" id="qAge" value="${qAge }" />
	<input type="hidden" name="dateCnt" id="dateCnt" value="${dateCnt }" />
	<input type="hidden" name="qSex" id="qSex" value="${qSex }" />
	<input type="hidden" name="statusCd" id="statusCd" value="${statusCd }" />
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
				<h3>민원 관리</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div style="margin-bottom: 10px;">
						<table width="100%" border="0">
							<tr>
								<td align="right" style="width: 80px;">
									사업장 :		
								</td>
								<td style="width: 80px;">
									<c:if test="${adminInfo.admAuthCode eq 'S' }">
										<select id="upIdSlct" style="width: 80px">
											<option value="">전체</option>
											<c:if test="${upList != null && fn:length(upList) > 0 }">
												<c:forEach items="${upList }" var="list">
													<option value="${list.codeId }"
														<c:if test="${upId eq list.codeId }">selected="selected"</c:if>
													>${list.codeNm }</option>
												</c:forEach>
											</c:if>
										</select>	
									</c:if> 
									<c:if test="${adminInfo.admAuthCode eq 'O' }">
										<select id="upIdSlct" style="width: 80px">
											<option value="">전체</option>
											<c:if test="${upList != null && fn:length(upList) > 0 }">
												<c:forEach items="${upList }" var="list">
													<c:forEach items="${authInfo }" var="authlist">
														<c:if test="${authlist.menuType eq 'ACPT' && authlist.slctFacilId eq  list.codeId}">
															<option value="${list.codeId }"
																<c:if test="${upId eq list.codeId }">selected="selected"</c:if>
															>${list.codeNm }</option>
														</c:if>
													</c:forEach>
												</c:forEach>
											</c:if>
										</select>	
									</c:if>
								</td>
								<td align="right" style="width: 50px;">
									분야 :		
								</td>
								<td style="width: 80px;">
									<select id="areaIdSlct" style="width: 80px">
										<option value="">전체</option>
										<c:if test="${areaList != null && fn:length(areaList) > 0 }">
											<c:forEach items="${areaList }" var="list">
												<option value="${list.codeId }"
													<c:if test="${areaId eq list.codeId }">selected="selected"</c:if>
												>${list.codeNm }</option>
											</c:forEach>
										</c:if>
									</select>		
								</td> 
								<td align="right" style="width: 80px;">
									연령대 :		
								</td>
								<td style="width: 80px;">
									<c:set var="cnt" value="" />
									<select id="qAgeSlct" style="width: 80px" >
										<option value="">전체</option>
										<c:forEach begin="1" end="6" varStatus="status">
											<c:set var="cnt">${status.count }0</c:set>
											<option value="${cnt }"
												<c:if test="${cnt eq qAge}">selected="selected"</c:if>
											>${cnt }대<c:if test="${status.last }">이상</c:if></option>
										</c:forEach>
									</select>
								</td>
								<td align="right" style="width: 80px;">
									처리상태 :		
								</td>
								<td style="width: 80px;">
									<select id="statucCdSlct" style="width: 80px">
										<option value="">전체</option>
										<option value="01"
											<c:if test="${statusCd eq '01'}">
												selected="selected"
											</c:if>
										>접수대기</option>
										<option value="02"
											<c:if test="${statusCd eq '02'}">
												selected="selected"
											</c:if>
										>접수중</option>
										<option value="03"
											<c:if test="${statusCd eq '03'}">
												selected="selected"
											</c:if>
										>답변중</option>
										<option value="04"
											<c:if test="${statusCd eq '04'}">
												selected="selected"
											</c:if>
										>답변완료</option>
									</select>	
								</td>
								<td rowspan="3">
									<input type="button" value="검색" id="searchBtn" style="width: 70px;height: 70px; margin-left: 50px;" />
								</td>
							</tr>
							<tr>
								<td align="right">
									성별 :		
								</td>
								<td>
									<select id="qSexSlct" style="width: 80px">
										<option value="">전체</option>
										<option value="1"
											<c:if test="${qSex eq '1'}">selected="selected"</c:if>
										>남</option>
										<option value="2"
											<c:if test="${qSex eq '2'}">selected="selected"</c:if>
										>여</option>
									</select>		
								</td>
								<td align="right">
									만족도 :		
								</td>
								<td>
								
									<select name="satisIdSlct" id="satisIdSlct" style="width: 80px">
										<option value="">전체</option>
										<option value="1" <c:if test="${satisId eq '1' }">selected="selected"</c:if>>매우불만족</option>
										<option value="2" <c:if test="${satisId eq '2' }">selected="selected"</c:if>>불만족</option>
										<option value="3" <c:if test="${satisId eq '3' }">selected="selected"</c:if>>보통</option>
										<option value="4" <c:if test="${satisId eq '4' }">selected="selected"</c:if>>만족</option>
										<option value="5" <c:if test="${satisId eq '5' }">selected="selected"</c:if>>매우만족</option>
									</select> 
								</td>
								<td align="right">
									해피콜 : 
								</td>
								<td>
									<select name="happyIdSlct" id="happyIdSlct" style="width: 80px">
										<c:if test="${hpcList != null && fn:length(hpcList) > 0 }">
										<option value="">전체</option>
											<c:forEach items="${hpcList }" var="list">
												<option value="${list.commCodeSeq }"
													<c:if test="${happyId eq list.commCodeSeq }">selected="selected"</c:if>
												>${list.codeNm }</option>
											</c:forEach>
										</c:if>
									</select>	
								</td>
								<td align="right">
									처리기일별 :		
								</td>
								<td>
									<select name="dateCntSlct" id="dateCntSlct">
										<option value="">전체</option>
										<option value="0"
											<c:if test="${dateCnt eq 0 }">selected="selected"</c:if>
										>당일</option>
										<option value="1"
											<c:if test="${dateCnt eq 1 }">selected="selected"</c:if>
										>1일</option>
										<option value="2"
											<c:if test="${dateCnt eq 2 }">selected="selected"</c:if>
										>2일</option>
										<option value="3"
											<c:if test="${dateCnt eq 3 }">selected="selected"</c:if>
										>3일</option>
										<option value="4"
											<c:if test="${dateCnt eq 4 }">selected="selected"</c:if>
										>4일이상</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">
									접수기간 :		
								</td>
								<td colspan="7">
									<c:choose>
										<c:when test="${qStCreateYmd != null && qStCreateYmd ne '' }">
											<input type="text" id="qStCreateYmdTxt" style="width: 80px" readonly="readonly" value="${fn:substring(qStCreateYmd,0,4)}-${fn:substring(qStCreateYmd,4,6)}-${fn:substring(qStCreateYmd,6,8)}"/>	
										</c:when>
										<c:otherwise>
											<input type="text" id="qStCreateYmdTxt" style="width: 80px" readonly="readonly" />
										</c:otherwise>
									</c:choose>
									~
									<c:choose>
										<c:when test="${qEdCreateYmd != null && qEdCreateYmd ne '' }">
											<input type="text" id="qEdCreateYmdTxt" style="width: 80px" readonly="readonly" value="${fn:substring(qEdCreateYmd,0,4)}-${fn:substring(qEdCreateYmd,4,6)}-${fn:substring(qEdCreateYmd,6,8)}"/>	
										</c:when>
										<c:otherwise>
											<input type="text" id="qEdCreateYmdTxt" style="width: 80px" readonly="readonly" />
										</c:otherwise>
									</c:choose>
									<input type="button" value="초기화" name="formatBtn" />
								</td>
							</tr>
						</table>
					</div>
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="30px" />
								<col width="120px" />
								<col width="70px" />
								<col width="70px" />
								<col width="80px" />
								<col  />
								<col width="100px" />
								<col width="60px" />
								<col width="60px" />
								<col width="60px" />
								<col width="60px" />
								<col width="60px" />
							</colgroup>
							<thead> 
								<tr>
									<th scope="col">번호</th>
									<th scope="col">사업장</th>
									<th scope="col">분야</th>
									<th scope="col">이름</th>
									<th scope="col">접수일</th>
									<th scope="col">민원제목</th>
									<th scope="col">답변일</th>
									<th scope="col">처리기일</th>
									<th scope="col">만족도</th>
									<th scope="col">해피콜</th>
									<th scope="col">처리상태</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${listCptMng != null && fn:length(listCptMng) > 0 }">
									<c:forEach items="${listCptMng }" var="list">
										<tr>
											<td>
												${list.listNo }
											</td>
												
											<td>
												${list.upNm }
											</td>
											<td>
												${list.areaNm }
											</td>
											<td>
												${list.qNm }
											</td>
											<td>
												${fn:substring(list.qCreateYmd,0,4)}.${fn:substring(list.qCreateYmd,4,6)}.${fn:substring(list.qCreateYmd,6,8)}
											</td>
											<td>
												${list.subject }
											</td>
											<td>
												<c:choose>
													<c:when test="${list.aCreateYmd != null && list.aCreateYmd != '' }">
														${fn:substring(list.aCreateYmd,0,4)}.${fn:substring(list.aCreateYmd,4,6)}.${fn:substring(list.aCreateYmd,6,8)}
													</c:when>
													<c:otherwise>
														-
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${list.dateCnt != null}">
														<c:choose>
															<c:when test="${list.dateCnt eq 0 }">
																당일
															</c:when>
															<c:otherwise>
																${list.dateCnt }일
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														-
													</c:otherwise>
												</c:choose>
												&nbsp;
											</td>
											<td>
												<c:if test="${list.score eq '1'}">
													매우불만족
												</c:if>
												<c:if test="${list.score eq '2'}">
													불만족
												</c:if>
												<c:if test="${list.score eq '3'}">
													보통
												</c:if>
												<c:if test="${list.score eq '4'}">
													만족
												</c:if>
												<c:if test="${list.score eq '5'}">
													매우만족
												</c:if>
												<c:if test="${list.score eq '0'}">
													-
												</c:if>
											</td>
											<td>
												<c:choose>
													<c:when test="${list.happyNm != null && list.happyNm != '' }">
														${list.happyNm }	
													</c:when>
													<c:otherwise>
														-
													</c:otherwise>
												</c:choose>
												
											</td>
											<td>
												<c:if test="${list.statusCd eq '01'}">
													접수대기
												</c:if>
												<c:if test="${list.statusCd eq '02'}">
													접수중
												</c:if>
												<c:if test="${list.statusCd eq '03'}">
													답변중
												</c:if>
												<c:if test="${list.statusCd eq '04'}">
													답변완료
												</c:if>
											</td>
											<td>
												<input type="button" name="mngBtn" data="${list.qSeq }" value="관리" />
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="12">등록된 민원이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							
						</table>
					</div>
					<!-- board paging -->
					<c:if test="${listCptMng != null && fn:length(listCptMng) > 0 }"> 
						<div class="pgeAbs mt30"> 
							<p class="paging">${pageIndexList }</p>
						</div>
						<div class="btn_farm2 mt20 mb20" style="text-align: right;">
								<span class="txtBtn_lightGray"><a href="#" id="excelBtn" >엑셀다운로드</a></span> &nbsp;
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>