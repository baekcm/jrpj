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
		$("#updateBtn").click(function(){
			var truefalse = true;
			$("input[name=acceptStYmdArr]").each(function(i){
				$this = $(this);
				if($.trim($this.val()) != "") {
					
					//시작일만 설정되어있을 경우
					if($("input[name=acceptEdYmdArr]:eq("+i+")").val() == "" && $("input[name=lastDayChkYnArr]:eq("+i+")").val() == "N") {
						alert($("input[name=codeNm]:eq("+i+")").val()+"에 시작일이 설정되어있고,\n마감일이 설정되어 있지않습니다.\n시작일을 제거하시거나 마감일을 입력해주세요");
						$("input[name=acceptEdYmdArr]:eq("+i+")").focus();
						truefalse = false;
						return false;
					}
					
					//마감일을 적게 설정했을 경우
					if($("input[name=lastDayChkYnArr]:eq("+i+")").val() == "N" && $this.val() > $("input[name=acceptEdYmdArr]:eq("+i+")").val()){
						alert($("input[name=codeNm]:eq("+i+")").val() + " 마감일이 시작일보다 적습니다.")	;
						truefalse = false;
						return false;
					}
					
					//마감일을 적게 설정했을 경우
					if($("input[name=lastDayChkYnArr]:eq("+i+")").val() == "N" && $("input[name=acceptEdYmdArr]:eq("+i+")").val() > $("input[name=maxDate]:eq("+i+")").val()){
						alert($("input[name=codeNm]:eq("+i+")").val() + " 마감일은 말일범위를 넘었습니다.")	;
						truefalse = false;
						return false;
					}
					
					if($("input[name=acceptEdYmdArr]:eq("+i+")").val() != "" && $("input[name=lastDayChkYnArr]:eq("+i+")").val() == "Y") {
						alert($("input[name=codeNm]:eq("+i+")").val() + " 마감일입력을 빼주시거나 체크를 풀어주셔야 합니다.")	;
						truefalse = false;
						return false;
					}
				} else {
					//마감일만 설정되어있을 경우
					if($("input[name=acceptEdYmdArr]:eq("+i+")").val() != "" || $("input[name=lastDayChkYnArr]:eq("+i+")").val() == "Y") {
						alert($("input[name=codeNm]:eq("+i+")").val()+"에 마감일이 설정되어있고,\n시작일이 설정되어 있지않습니다.\n마감일을 제거하시거나 시작일을 입력해주세요");
						$("input[name=acceptStYmdArr]:eq("+i+")").focus();
						truefalse = false;
						return false;
					}
				}
			})
			if(!truefalse) {
				return;
			}
			$("#frm").submit();	
		})
		$("input[name=lastDayChk]").click(function(){
			if($(this).prop("checked")){
				$(this).next().val("Y");
			} else {
				$(this).next().val("N");
			}
		});
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
				<h3>접수일 설정</h3>
				<p class="navi"></p>
			</div> 
			<div class="contents"> 
				<div class="boardWrap">
					<form action="/admin/updateAccept?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<colgroup>
								<col width="200px" />
								<col width="150px" />
								<col width="150px" />
								<col  />
							</colgroup>
							<tr style="height: 50px;">
								<th>사업장</th>
								<th>접수시작일</th>
								<th>접수마감일</th>
								<th>접수기간</th>
							</tr>
							<c:if test="${listAcceptDate != null && fn:length(listAcceptDate) > 0 }">
								<c:forEach items="${listAcceptDate }" var="list">
									<tr>
										<th>
											${list.codeNm }
											<input type="hidden" name="codeNm" value="${list.codeNm }" />
											<input type="hidden" name="upIdCodeArr" value="${list.upIdCode }" />
											<input type="hidden" name="acceptDateSeqArr" value="${list.acceptDateSeq }" />
										</th> 
										<td align="center"> 
											매달 : <input type="text" name="acceptStYmdArr" maxlength="2" value="${list.acceptStYmd }" style="width: 50px; ime-mode:disabled;" onKeyPress="NumObj(this);" />일
										</td>
										<td align="center">
											매달 <input type="text" name="acceptEdYmdArr" maxlength="2" value="${list.acceptEdYmd }" style="width: 50px; ime-mode:disabled;" onKeyPress="NumObj(this);"  />일
											<input type="checkbox" name="lastDayChk"
												<c:if test="${list.lastDayChkYn eq 'Y' }">checked="checked"</c:if>
											/> 말일
											<input type="hidden"  name="lastDayChkYnArr" value="${list.lastDayChkYn }" />
											<input type="hidden"  name="maxDate" value="${list.thisMaxDate }" />
										</td>
										<td align="center">
											<c:if test="${list.thisDateYmd != null && list.thisDateYmd != '' }">
												이번달 : ${list.thisDateYmd }
											</c:if>
										</td>
									</tr>	
								</c:forEach>
							</c:if>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >적용</a></span> &nbsp; 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>