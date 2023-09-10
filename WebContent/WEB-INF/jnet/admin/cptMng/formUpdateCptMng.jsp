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
		$("#showYnChk").click(function(){
			if($("#showYnChk").prop("checked")) {
				$("input[name=showYn]").val("Y");
			} else {
				$("input[name=showYn]").val("N");
			}
		})
		$("#updateBtn").click(function(){
			if($("#statusCd").val() =="") {
				alert("처리현황을 선택해주세요");
				return;
			}
			
			var ff = confirm("민원처리를 적용하시겠습니까?");
			if(ff){
				var sHTML = oEditors.getById["content"].getIR();
				$("#content").val(sHTML);
				if($.trim($("#statusCd").val()) == "03") {
					if($("#content").val() == ""){
						alert("답변내용을 입력하세요");
						return;
					}
					
					if($("#happyId").val() == ""){
						alert("해피콜을 선택하세요");
						return;
					}
					<c:if test="${minwon.resGbnCd != null && (minwon.resGbnCd  eq '3')}">
						var f = confirm("답변완료일경우 메일발송까지 동시처리됩니다.");
						if(f){
							$("#frm").submit();
						}else {
							return;
						}
					</c:if>
				}
				$("#frm").submit();	
			} else {
				return;
			}
			
		});
		$("#cancelBtn").click(function(){
			location.href="/admin/listCptMng?gseq=${gseq}&lseq=${lseq}";
		})
	})
</script>
</head>
<body>
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>민원답변</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">  
				<div class="boardWrap">
					<form action="/admin/updateCptMng?gseq=${gseq}&lseq=${lseq}" method="post" name="frm" id="frm">
						<input type="hidden" name="qSeq" value="${minwon.qSeq }" />
						<input type="hidden" name="aSeq" value="${minwon.aSeq }" />
						<input type="hidden" name="resGbnCd" value="${minwon.resGbnCd }" />
						<input type="hidden" name="showYn" value="${minwon.showYn }" />
						<c:if test="${minwon.email1 != null && minwon.email1 != '' }">
							<input type="hidden" name="email1" value="${minwon.email1 }" />
							<input type="hidden" name="email2" value="${minwon.email2 }" />
						</c:if>
						
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="bbsTbl">
							<colgroup>
								<col width="150px" />
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									이름
								</th>
								<td class="bd01td">
									${minwon.qNm }
									(<c:if test="${minwon.qSex eq '1' }">
										남
									</c:if>
									<c:if test="${minwon.qSex eq '2' }">
										여
									</c:if>
									- ${minwon.qBirth }세)
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									연락처
								</th>
								<td class="bd01td">
									<c:if test="${minwon.phone1 != null && minwon.phone1 != '' }">
										${minwon.phone1 } - ${minwon.phone2 } - ${minwon.phone3 }
									</c:if>&nbsp;
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									주소
								</th>
								<td class="bd01td">
									<c:if test="${minwon.dftAddr != null && minwon.dftAddr != '' }">
										${minwon.dftAddr } &nbsp; ${minwon.dtlAddr }
									</c:if>&nbsp;
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									이메일
								</th>
								<td class="bd01td">
									<c:if test="${minwon.email1 != null && minwon.email1 != '' }">
										${minwon.email1 }@${minwon.email2 }
									</c:if>&nbsp;
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									사업장
								</th>
								<td class="bd01td">
								
									<select name="upId">
										<c:if test="${upList != null && fn:length(upList) > 0 }">
											<c:forEach items="${upList }" var="list">
												<option value="${list.commCodeSeq }"
													<c:if test="${minwon.upId eq list.commCodeSeq }">selected="selected"</c:if>
												>${list.codeNm }</option>
											</c:forEach>
										</c:if>
									</select>
									<input type="hidden" name="upCommSeq" value="${minwon.upCommSeq }" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									분야
								</th>
								<td class="bd01td">
									<select name="areaId">
										<c:if test="${areaList != null && fn:length(areaList) > 0 }">
											<c:forEach items="${areaList }" var="list">
												<option value="${list.commCodeSeq }"
													<c:if test="${minwon.areaId eq list.commCodeSeq }">selected="selected"</c:if>
												>${list.codeNm }</option>
											</c:forEach>
										</c:if>
									</select>
									<input type="hidden" name="areaCommSeq" value="${minwon.areaCommSeq }" />
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									접수일
								</th>
								<td class="bd01td">
									${fn:substring(minwon.qCreateYmd,0,4)}.${fn:substring(minwon.qCreateYmd,4,6)}.${fn:substring(minwon.qCreateYmd,6,8)}
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									제목
								</th>
								<td class="bd01td">
									${minwon.qSubject }
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									내용
								</th>
								<td class="bd01td">
									${minwon.qContent }
								</td>
							</tr>
							
							<tr>
								<th class="ta_l" scope="row">
									담당자
								</th>
								<td class="bd01td">
									<c:choose>
										<c:when test="${minwon.aId != null && minwon.aId != '' }">
											${minwon.aNm }(${minwon.aId })
										</c:when>
										<c:otherwise>
											${adminInfo.admNm }(${adminInfo.admId })	
										</c:otherwise>
									</c:choose>
									
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									답변내용
								</th>
								<td class="bd01td">
									<textarea rows="10" name="aContent" id="content" cols="100">${minwon.aContent }</textarea>
									<script type="text/javascript">
										loadEditor("content");
									</script>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									답변일
								</th>
								<td class="bd01td">
									<c:if test="${minwon.aCreateYmd != null && minwon.aCreateYmd != '' }">
										${fn:substring(minwon.aCreateYmd,0,4)}.${fn:substring(minwon.aCreateYmd,4,6)}.${fn:substring(minwon.aCreateYmd,6,8)}
									</c:if>&nbsp;
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									처리현황
								</th>
								<td class="bd01td"> 
									<select name="statusCd" id="statusCd">
										<option value="">선택</option>
										<option value="01"
											<c:if test="${minwon.statusCd eq '01' }">selected="selected"</c:if>
										>접수대기</option>
										<option value="02"
											<c:if test="${minwon.statusCd eq '02' }">selected="selected"</c:if>
										>접수중</option>
										<option value="03"
											<c:if test="${minwon.statusCd eq '03' }">selected="selected"</c:if>
										>답변중</option>
										<option value="04"
											<c:if test="${minwon.statusCd eq '04' }">selected="selected"</c:if>
										>답변완료</option>
									</select>
									<input type="hidden" name="happyCommSeq" value="${minwon.happyCommSeq }" />
									(사업장 민원담당자가 처리합니다)
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									해피콜
								</th>
								<td class="bd01td">
									<select name="happyId" id="happyId"
										<c:if test="${adminInfo.admAuthCode ne 'S' }">
											disabled="disabled"
										</c:if>
									>
										<c:if test="${hpcList != null && fn:length(hpcList) > 0 }">
											<option value="">선택</option>
											<c:forEach items="${hpcList }" var="list">
												<option value="${list.commCodeSeq }"
													<c:if test="${minwon.happyId eq list.commCodeSeq }">selected="selected"</c:if>
												>${list.codeNm }</option>
											</c:forEach>
										</c:if>
									</select>
									<c:if test="${adminInfo.admAuthCode eq 'S' }">
										<input type="hidden" name="happyCommSeq" value="${minwon.happyCommSeq }" />
									</c:if>
									(총괄 민원담당자가 처리합니다)
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									공개여부
								</th>
								<td class="bd01td">
									<input type="checkbox" id="showYnChk" 
										<c:if test="${minwon.showYn eq 'Y' }">checked="checked"</c:if>
									/>
								</td>
							</tr>
								<tr>
									<th class="ta_l" scope="row">
										만족도평가
									</th>
									<td class="bd01td">
										<c:choose>
											<c:when test="${minwon.score eq '1'}">
												매우불만족
											</c:when>
											<c:when test="${minwon.score eq '2'}">
												불만족
											</c:when>
											<c:when test="${minwon.score eq '3'}">
												보통
											</c:when>
											<c:when test="${minwon.score eq '4'}">
												만족
											</c:when>
											<c:when test="${minwon.score eq '5'}">
												매우만족
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										민원인평가설명
									</th>
									<td class="bd01td">
										<c:if test="${minwon.assess != null && minwon.assess != '' }">
											${minwon.assess }
										</c:if>&nbsp;
									</td>
								</tr>	
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button -->
					<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >적용</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>