<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<script type="text/javascript" src="/resources/js/jquery-ui.js"></script> 
<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/jquery-ui.css"> 
<style type="text/css">.ui-datepicker-calendar { display: none !important; }</style>
<script type="text/javascript">	
	$(function(){
		mergeRowSpan("mergeTbl",1,"pgm");
		
		$("table.bd00Bbs").show();
		
		$('#expiryDate').datepicker( { 
			changeMonth: true,
		    changeYear: true,
		    showButtonPanel: true,
		    dateFormat: 'MM yy',
		    onClose: function(dateText, inst) {
		        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		        var monthNo = parseInt(month) + 1;
		        if(monthNo < 10){
		        	monthNo = "0"+monthNo;
		        }
		        $("#expiryDate").val(year+"년"+monthNo+"월");
		        $("#yymm").val(year+""+monthNo);
		    }
		});
		
		$("div.ui-datepicker").hide();
		
		$("input[name=editBtn]").click(function(){
			var pgmCd = $(this).attr("data");
			$("input[name=pgmCd]").val(pgmCd);
			$("#pageFrm").attr("action","/admin/formUpdatePgmMng?gseq=${gseq}&lseq=${lseq}").submit();
		}); 
		
		$("#searchBtn").click(function(){
			if($("#upIdSlct").val() == "") {
				alert("사업장을 선택해주세요");
				return;
			}
			$("#pageFrm > #upId").val($("#upIdSlct").val());
			$("#pageFrm > #saleId").val($("#saleIdSlct").val());
			$("#pageFrm > #basId").val($("#basIdSlct").val());
			$("#pageFrm > #timeCd").val($("#timeCdSlct").val());
			$("#pageFrm > #pgmCd").val("");
			$("#pageFrm > #pageNum").val("1");
			$("#pageFrm").attr("action","/admin/listPgmMng?gseq=${gseq}&lseq=${lseq}").submit();
		});
		
		$("#upIdSlct").change(function(){
			$.ajax({
		           type:"POST", 
		           url: "/admin/listSaleIdByUpId",
		           data : {"upId" : $("#upIdSlct").val()},
		           dataType : "json",
		           success: function(data){
			        	   if(data != undefined && data.listSaleIdByUpId != null && data.listSaleIdByUpId != ''){
			        		   if(data.flag == "Y") {
			        			   var slctTag = "";
			        			   	  <c:if test="${adminInfo.admAuthCode eq 'S' }">
					  		   	      	slctTag+="<option value=''>전체</option>";
					  		   	      </c:if>
					  		   	    $.each(data.listSaleIdByUpId,function(idx,val){
					  	 	   				 slctTag+="<option value='"+val.id+"'>"+val.nm+"</option>";
					  		   	    });
						  		    $("#saleIdSlct").html(slctTag);
						  		    
						  		  <c:if test="${adminInfo.admAuthCode eq 'O' }">
									$.ajax({
								           type:"POST", 
								           url:"/admin/listBasIdBySaleId",
								           data : {"upId" :  $("#upIdSlct").val() ,"saleId" : $("#saleIdSlct").val()},
								           dataType : "json",
								           success: function(data){
									        	   if(data != undefined && data.listBasIdBySaleId != null && data.listBasIdBySaleId != ''){
									        		   var slctTag = "";
										  		   	    $.each(data.listBasIdBySaleId,function(idx,val){
										  	 	   				 slctTag+="<option value='"+val.id+"'>"+val.nm+"</option>";
										  		   	    });
											  		    $("#basIdSlct").html(slctTag);
									        	   }
								           }, 
								           error : function(request, status, error) {
											alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
										}
									}); 
								  </c:if>
								
			        		   } else {
			        			   alert("에러::"+data.flag);
			        		   }
			        	   }
		        	   $("#basIdSlct option").each(function(){
		        		   if($(this).val() != "") {
		        			   $(this).remove(); 
		        		   }
		        	   });
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			}); 
		});
		$("#saleIdSlct").change(function(){
			$.ajax({
		           type:"POST", 
		           url: "/admin/listBasIdBySaleId",
		           data : {"upId" :  $("#upIdSlct").val() ,"saleId" : $("#saleIdSlct").val()},
		           dataType : "json",
		           success: function(data){
			        	   if(data != undefined && data.listBasIdBySaleId != null && data.listBasIdBySaleId != ''){
			        		   var slctTag = "";
				        		  <c:if test="${adminInfo.admAuthCode eq 'S' }">
				  		   	      	slctTag+="<option value=''>전체</option>";
				  		   	     </c:if>
				  		   	    $.each(data.listBasIdBySaleId,function(idx,val){
				  	 	   				 slctTag+="<option value='"+val.id+"'>"+val.nm+"</option>";
				  		   	    });
					  		    $("#basIdSlct").html(slctTag);
			        	   }
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			}); 
		});
		
		$("#excelBtn").click(function(){
			$("#pageFrm").attr("action","/admin/excelDownPgmMng").submit();
		});
		
		$("a[name=detailPgm]").click(function(){
			var pgmCd = $(this).attr("data");
			var comCd3 = $(this).attr("id");
			$("input[name=pgmCd]").val(pgmCd);
			$("#comCd3").val(comCd3);
			$("#detailFrm").attr("action","/front/formViewPgm/${upId}/${saleId}").submit();
		});
	});
	function setPage(pageNo){
		$("#pageNum").val(pageNo);
		$("input[name=pgmCd]").val("");
		$("#pageFrm").attr("action","/admin/listPgmMng?gseq=${gseq}&lseq=${lseq}").submit();
	}
</script>
</head>
<body>

<form method="post" name="detailFrm" id="detailFrm" target="_blank">
	<input type="hidden" name="pgmCd" id="pgmCd" />
	<input type="hidden" name="comCd3" id="comCd3" />
	<input type="hidden" name="timeCd" id="timeCd" value="${timeCd }" />
	<input type="hidden" name="basId" id="basId" value="${basId }" />
	<input type="hidden" id="yymm" name="yymm" value="${yymm }"  />
</form>

<form method="post" name="pageFrm" id="pageFrm">
	<input type="hidden" name="pageNum" id="pageNum" value="${pageNum }" />
	<input type="hidden" name="upId" id="upId" value="${upId }" />
	<input type="hidden" name="saleId" id="saleId" value="${saleId }" />
	<input type="hidden" name="basId" id="basId" value="${basId }" />
	<input type="hidden" name="pgmCd" id="pgmCd"  />
	<input type="hidden" name="timeCd" id="timeCd" value="${timeCd }" />
	<input type="hidden" id="yymm" name="yymm" value="${yymm }"  />
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
				<h3>프로그램 리스트</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="pageSection">
					<div class="pageTopSearch">
						<select id="upIdSlct" style="width: 150px">
							<c:if test="${upList != null && fn:length(upList) > 0 }">
								<c:forEach items="${upList }" var="list">
									<option value="${list.codeId }"
										<c:if test="${list.codeId eq upId }">selected="selected"</c:if>
									>${list.codeNm }</option>	
								</c:forEach>
							</c:if>
						</select>
						<select id="saleIdSlct" style="width: 120px">
								<c:if test="${adminInfo.admAuthCode eq 'S' }">
								<option value="">전체</option>
								</c:if>
								<c:if test="${saleList != null && fn:length(saleList) > 0 }">
									<c:forEach items="${saleList }" var="list">
										<option value="${list.codeId }"
											<c:if test="${list.codeId eq saleId }">selected="selected"</c:if>
										>${list.codeNm }</option>	
									</c:forEach>
								</c:if>
						</select>
						<select id="basIdSlct" style="width: 100px">
								<c:if test="${adminInfo.admAuthCode eq 'S' }">
								<option value="">전체</option>
								</c:if>
								<c:if test="${basList != null && fn:length(basList) > 0 }">
									<c:forEach items="${basList }" var="list">
										<option value="${list.codeId }"
											<c:if test="${list.codeId eq basId }">selected="selected"</c:if>
										>${list.codeNm }</option>	
									</c:forEach>
								</c:if>
						</select> 
						<select id="timeCdSlct">
							<option value="">전체</option>
							<option value="1"
							 	<c:if test="${timeCd eq '1' }">selected="selected"</c:if>
							>새벽(06~09)</option>
							<option value="2"
								<c:if test="${timeCd eq '2' }">selected="selected"</c:if>
							>오전(09~12)</option>
							<option value="3"
								<c:if test="${timeCd eq '3' }">selected="selected"</c:if>								
							>오후(12~18)</option>
							<option value="4"
								<c:if test="${timeCd eq '4' }">selected="selected"</c:if>
							>저녁(18~종료)</option>
						</select>
						<input name="cc_expiryDate" readonly="readonly" style="width: 80px;" type="text" id="expiryDate" class="date-picker" value="${fn:substring(yymm,0,4)}년${fn:substring(yymm,4,6)}월"  />
						
						<input type="image" alt="검색" id="searchBtn" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
					</div>
					<div class="boardWrap">
							<table id="mergeTbl" width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" style="display: none;" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
								<colgroup>
									<col width="40px" />
									<col /> 
									<col width="200px" />
									<col width="100px" />
									<col width="100px" />
									<col width="100px" />
									<col width="50px" />
								</colgroup>
								<thead> 
								<tr>
									<th scope="col">번호</th>
									<th scope="col">프로그램그룹</th>
									<th scope="col">프로그램명</th>
									<th scope="col">시간</th>
									<th scope="col">대상</th>
									<th scope="col">수강료</th>
									<th scope="col">관리</th>
								</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${listPgmMng != null && fn:length(listPgmMng) > 0 }">
												<c:forEach items="${listPgmMng }" var="list">
												<tr>
													<td style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;">
														${list.listNo }
													</td>
													<td rowspan="1" class="rowSpnTd1" data="${list.pgmCd }" style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;">
														${list.comNm4 } > ${list.comNm2 } > ${list.comNm1 }
													</td>
													<td rowspan="1" class="rowSpnTd2" data="${list.pgmCd }" style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;">
														<a href="#" style="text-decoration:underline;font-weight: bold;" name="detailPgm" id="${list.comCd3 }"  data="${list.pgmCd }">
														${list.pgmNm }
														</a>
													</td>
													<td rowspan="1" class="rowSpnTd3"  data="${list.pgmCd }" style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;">
													${fn:substring(list.startT,0,2)}:${fn:substring(list.startT,2,4)}
													~
													${fn:substring(list.endT,0,2)}:${fn:substring(list.endT,2,4)}
													</td>
													<td rowspan="1" style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;">
													${fn:trim(list.comNm3 )}
													</td>
													<td rowspan="1" style="border-right-color: #d7d7d7;border-right-width: 1px;border-right-style: solid;">
														<fmt:formatNumber value="${list.uPrice }" pattern="#,###"/> 원
													</td>
													<td rowspan="1" class="rowSpnTd4" data="${list.pgmCd }">
														<input type="button" data="${list.pgmCd }" name="editBtn" value="관리" />
													</td>
												</tr>
												</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6" align="center">결과가 존재하지 않습니다</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<c:if test="${listPgmMng != null && fn:length(listPgmMng) > 0 }">
							<!-- board paging --> 
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