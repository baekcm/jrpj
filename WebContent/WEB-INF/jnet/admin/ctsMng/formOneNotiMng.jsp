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
		$("div.contents > div.ttabWrap > ul#ttab3").find("li:eq(${t1})").addClass("choiced");
		var cs = $("div.contents > div.ttabWrap > ul#ttab3").find("li.choiced > a").attr("data");
		$("#commCodeSeq").val(cs);
		listPage(cs);
		
		/* <c:choose>
			<c:when test="${t1 == 0  && adminInfo.admAuthCode eq 'S' }">
					$("#commCodeSeq").val("0");
					listPage(null);
			</c:when>
			<c:otherwise>
					var cs = $("div.contents > div.ttabWrap > ul#ttab3").find("li.choiced > a").attr("data");
					$("#commCodeSeq").val(cs);
					listPage(cs);
			</c:otherwise>
		</c:choose> */
		
		
		$("a.tabBtn").click(function(){
			var idx = $("a.tabBtn").index(this);
			$("#t1").val(idx);
			var commCodeSeq = $(this).attr("data");
			
			$("a.tabBtn").parent().removeClass("choiced");
			$(this).parent().addClass("choiced");
			if(commCodeSeq == undefined) {
				commCodeSeq = 0;
			}
			$("#commCodeSeq").val(commCodeSeq);
			
			listPage(commCodeSeq);
		})
		
		$("#oneNotiAddBtn").click(function(){
			var tag = ' <table width="100%" class="bd00view"><colgroup><col width="80px" /><col /></colgroup><tr>';
			tag += '	<th class="ta_l" scope="row">'
			tag += '		알리미내용';
			tag += '	</th>';
			tag += '	<td class="bd01td">';
			tag += '		<input type="text" name="titleArr" style="width:300px;height:18px;" />';
			tag += '	</td></tr>';
			tag += '	<tr><th class="ta_l" scope="row">';
			tag += '		링크주소 ';
			tag += '	</th>';
			tag += '	<td class="bd01td">';
			tag += '		<input type="text" name="linkUrlArr" style="height:18px;" />';
			tag += '	</td></tr>';
			tag += '	<tr><th class="ta_l" scope="row">';
			tag += '		링크위치';
			tag += '	</th>';
			tag += '	<td class="bd01td">';
			tag += '		<select name="linkTgtArr">';
			tag += '			<option value="_blank">새창</option>';
			tag += '			<option value="_self">기존창</option>';
			tag += '		</select>';
			tag += '	</td></tr>';
			tag += '	<tr><td class="bd01td" colspan="2" style="text-align:right;"> ';
			tag += '		<input type="button" name="oneNotiRmBtn" value="취소" />';
			tag += '	</td></tr>';
			tag += '</table>';
			
			$("#tmpTbl").append(tag);
			
		});
		
		$(document).on("click","input[name=oneNotiRmBtn]",function(){
			var f = confirm("정말 취소하시겠습니까?");
			if(f){
				$(this).parent().parent().parent().remove();
			} else {
				return;
			}
		});
		
		$("#oneNotiSaveBtn").click(function(){
			var flag = true;
			//알리미내용 등록 (필수)
 			if($("input[name=titleArr]").size() > 0) {
				$("input[name=titleArr]").each(function(i){
					if($.trim($(this).val()) == "") {
						alert("알리미내용을 입력하세요");
						flag = false;
						nonIdx = i;
						return false;
					}
				});	
			}
			
			if(!flag) {
				$("input[name=titleArr]:eq("+nonIdx+")").focus();
				return;
			} 
			
			//링크주소 등록 (필수)
 			if($("input[name=linkUrlArr]").size() > 0) {
				$("input[name=linkUrlArr]").each(function(i){
					if($.trim($(this).val()) == "") {
						alert("URL을 입력하세요");
						flag = false;
						nonIdx = i;
						return false;
					}
				});	
			}
			
			if(!flag) {
				$("input[name=linkUrlArr]:eq("+nonIdx+")").focus();
				return;
			} 
			
			//알리미내용 등록 (필수)
 			if($("input[name=utitleArr]").size() > 0) {
				$("input[name=utitleArr]").each(function(i){
					if($.trim($(this).val()) == "") {
						alert("알리미내용을 입력하세요");
						flag = false;
						nonIdx = i;
						return false;
					}
				});	
			}
			
			if(!flag) {
				$("input[name=utitleArr]:eq("+nonIdx+")").focus();
				return;
			} 
			
			//링크주소 등록 (필수)
 			if($("input[name=ulinkUrlArr]").size() > 0) {
				$("input[name=ulinkUrlArr]").each(function(i){
					if($.trim($(this).val()) == "") {
						alert("URL을 입력하세요");
						flag = false;
						nonIdx = i;
						return false;
					}
				});	
			}
			
			if(!flag) {
				$("input[name=ulinkUrlArr]:eq("+nonIdx+")").focus();
				return;
			} 
			
			$("#frm").attr("action","/admin/saveOneNotiMng?gseq=${gseq }&lseq=${lseq}").submit();
		});
		
		$(document).on("click","input[name=showYn]",function(){
			var f = confirm("선택 문구를 대표문구로 설정하시겠습니까?");
			if(f){
				var commCodeSeq = $("#commCodeSeq").val();
			 	var oneNotiSeq = $(this).val();
				$.ajax({
			           type:"POST", 
			           url: "/admin/updateShowOneNoti",
			           data : {"commCodeSeq" : commCodeSeq, "oneNotiSeq" : oneNotiSeq },
			           dataType : "json",
			           success: function(data){
			        	   if(data.flag == "Y") {
			        		   alert("정상적으로 변경되었습니다.");
			        		   return;
			        	   } else {
			        		   alert("에러발생했습니다.");
			        		   return;
			        	   }
			           }, 
			           error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
				});
				
			 
			} else {
				return;
			}
		})
		
		$(document).on("click","input[name=removeBtn]",function(){
			$this = $(this);
			var f = confirm("정말 삭제하시겠습니까?");
			if(f){
				$.ajax({
			           type:"POST", 
			           url: "/admin/removeOneNotiMngByOneNotiSeq",
			           dataType : "JSON",
			           data : {"oneNotiSeq":$this.attr("data")},
			           success: function(data){
			        	   if(data.flag="Y") {
			        		   alert("파일이 삭제되었습니다.");
			        		   $this.parent().parent().parent().remove();
			        	   }else {
			        		   alert("에러발생\n에러내용:"+data.flag);
			        	   }
			           }, 
			           error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
				});
			} else {
				return;
			}
		});
	})
	
	function listPage(commCodeSeq){
		$.ajax({
	           type:"POST", 
	           url: "/admin/listOneNotiMng",
	           data : {"commCodeSeq" : commCodeSeq},
	           success: function(data){
	        	   $("#listTbl").html(data);
	        	   $("input[type=text]").css("height","18px");
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
	}
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
				<h3>알리미</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">
				<div class="ttabWrap">
					<ul id="ttab3">
						<%-- <c:if test="${adminInfo.admAuthCode eq 'S' }">
							<li>
								<a style="text-decoration: none;" href="#" class="tabBtn">
									메인
								</a>
							</li>
						</c:if> --%>
						<c:if test="${listFacil != null && fn:length(listFacil) > 0 }">
							<c:forEach items="${listFacil }" var="list">
								<c:if test="${adminInfo.admAuthCode eq 'S'}">
									<li>
										<a id="${list.codeId }" data="${list.commCodeSeq }" style="text-decoration: none;" href="#" class="tabBtn">
											${list.codeNm }
										</a>
									</li>
								</c:if>
								<c:if test="${adminInfo.admAuthCode eq 'O'}">
									<c:if test="${authInfo != null && fn:length(authInfo) > 0 }">
										<c:forEach items="${authInfo }" var="authList">
											<c:if test="${authList.slctFacilId eq  list.codeId && authList.menuNm eq '알리미'}">
												<li>
													<a id="${list.codeId }" data="${list.commCodeSeq }" style="text-decoration: none;" href="#" class="tabBtn">
														${list.codeNm }
													</a>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<div style="padding-top: 20px;"></div>
				<div class="pageSection">
					<div class="boardWrap">
						<form method="post" id="frm" name="frm">
						 	<input type="hidden" name="t1" id="t1" value="${t1 }" />
							<input type="hidden" name="commCodeSeq" id="commCodeSeq" /> 
							<table align="center" style="margin-top: -30px;" width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
								<colgroup>
									<col width="40px" />
									<col />
									<col width="120px" />
									<col width="80x" />
									<col width="60px" />
									<col width="60px" />
									<col width="80px" />
									<col width="100px" />
								</colgroup>
								<tr>
									<th scope="col">공개</th>
									<th scope="col">알리미내용</th>
									<th scope="col">URL</th>
									<th scope="col">사용여부</th>
									<th scope="col">링크구분</th>
									<th scope="col">수정자</th>
									<th scope="col">수정일</th>
									<th scope="col">
										<input type="button" id="oneNotiAddBtn" value="추가" />
										<input type="button" id="oneNotiSaveBtn" value="저장" />
									</th>
								</tr>
								<tr>
									<td colspan="8" width="100%" style="border-bottom-width: 0px; border-bottom-color: white;" id="tmpTbl"></td>
								</tr>
								<tr>
									<td colspan="8" width="100%" style="border-bottom-width: 0px; border-bottom-color: white;" id="listTbl"></td>
								</tr>
							</table>
						</form> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>