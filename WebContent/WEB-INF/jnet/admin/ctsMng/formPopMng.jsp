<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<link rel="stylesheet" href="/resources/js/themes/base/jquery.ui.all.css">
<script src="/resources/js/ui/jquery.ui.core.js"></script>
<script src="/resources/js/ui/jquery.ui.widget.js"></script>
<script src="/resources/js/ui/jquery.ui.position.js"></script>
<script src="/resources/js/ui/jquery.ui.tooltip.js"></script>
<link rel="stylesheet" href="/resources/css/demos.css">
<script type="text/javascript" src="/resources/js/jquery.tablednd.js"></script>
<script type="text/javascript">
	$(function(){
		var cs = $("div.contents > div.ttabWrap > ul#ttab3").find("li:eq(${t1})").addClass("choiced");
		<c:choose>
			<c:when test="${t1 == 0  && adminInfo.admAuthCode eq 'S' }">
				<c:if test="${t2 == 0 }">
					listPage(null, "POPUP");
				</c:if>
				<c:if test="${t2 == 1  }">
					listPage(null, "BANNER");
				</c:if>
			</c:when>
			<c:otherwise>
					var cs = $("div.contents > div.ttabWrap > ul#ttab3").find("li.choiced > a").attr("data");
					listPage(cs, "POPUP");
			</c:otherwise>
		</c:choose>
		
		//시설별 탭버튼 클릭(최상단 탭이므로 default POPUP임)
		$("a.tabBtn").click(function(){
			var idx = $("a.tabBtn").index(this);
			$("#t1").val(idx);
			$("#t2").val(0);
			var commCodeSeq = $(this).attr("data");
			
			$("a.tabBtn").parent().removeClass("choiced");
			$(this).parent().addClass("choiced");
			
			$("a.subtabBtn > span").removeClass("point");
			$("a.subtabBtn:eq(0) > span").addClass("point");
			
			
			<c:choose>
				<c:when test="${adminInfo.admAuthCode eq 'S' }">
					if(idx == 0) {
						$("#bannerzone").show();
						listPage(null, "POPUP");
					} else {
						$("#bannerzone").hide();
						listPage(commCodeSeq, "POPUP");
					}
				</c:when>
				<c:otherwise>
					listPage(commCodeSeq, "POPUP");
				</c:otherwise>
			</c:choose>
		})
		
		//SUBTAB은 메인을 제외한 나머지는 POPUP
		$("a.subtabBtn").click(function(){
			var idx = $("a.subtabBtn").index(this);
			$("#t2").val(idx);
			$("a.subtabBtn > span").removeClass("point");
			$(this).find("span").addClass("point");
			
			var btnCnt = $("a.subtabBtn").size();
			var commCodeSeq = null;
			
			$("a.tabBtn").each(function(i){
				$this = $(this);
				if($this.parent().hasClass("choiced")){
					commCodeSeq = $this.attr("data");
				}
			})
			
			if(btnCnt == 1) {
				listPage(commCodeSeq, "POPUP");
			} else if(btnCnt == 2) {
				//선택탭의 index가 0이냐 1이냐
				if($("a.subtabBtn:eq(0) > span").hasClass("point")){
					listPage(null, "POPUP");
				} else if($("a.subtabBtn:eq(1) > span").hasClass("point")){
					listPage(null, "BANNER");
				} 
			}
		})
		
		
		//추가버튼 클릭
		$("#popAddBtn").click(function(){
			var tag = ' <table width="100%" class="bd00view" border=0"><colgroup><col width="150px" /><col /></colgroup><tr>';
				tag += '	<th class="ta_l" scope="row">';
				tag += '		배너/팝업존 파일';
				tag += '	</th>';
				tag += '	<td class="bd01td">';
				tag += '		<input type="file" name="popFileArr" style="height:18px;" />';
				tag += '	</td></tr>';
				tag += '	<tr><th class="ta_l" scope="row">';
				tag += '		링크주소';
				tag += '	</th>';
				tag += '	<td style="text-align:left; margin-left:30px;">';
				tag += '		&nbsp;&nbsp;<input type="text" name="linkUrlArr" style="width:200px;height:18px;" />';
				tag += '	</td></tr>';
				tag += '	<tr><th class="ta_l" scope="row">';
				tag += '		링크위치';
				tag += '	</th>';
				tag += '	<td style="text-align:left; margin-left:30px;">&nbsp;&nbsp;';
				tag += '		<select name="linkTgtArr">';
				tag += '			<option value="_blank">새창</option>';
				tag += '			<option value="_self">기존창</option>';
				tag += '		</select>';
				tag += '	</td></tr>';
				tag += '<tr>';
				tag += '<th style="text-align:left;" colspan="2">';
				tag += '&nbsp;&nbsp;설&nbsp;&nbsp;&nbsp;&nbsp;명';
				tag += '</th>';
				tag += '</tr>';
				tag += '<tr>';
				tag += '<td colspan="2">';
				tag += '<textarea name="descriptArr" cols="90" rows="5"></textarea>';
				tag += '</td>';
				tag += '</tr>';
				tag += '	<tr><td class="bd01td" colspan="2" style="text-align:right;">';
				tag += '		<input type="button" name="popRmBtn" value="취소" />';
				tag += '	</td></tr>';
				tag += '</table>';
				
				$("#tmpTbl").append(tag);
				
		})
		
		//저장버튼 클릭(일괄처리)
		$("#popSaveBtn").click(function(){
			
			var flag = true;
			var nonIdx = 0;
			
			// 이미지 등록(필수)
			if($("input[name=popFileArr]").size() > 0){
				$("input[name=popFileArr]").each(function(){
					var fileNm = $.trim($(this).val().toLowerCase());
					var ext = fileNm.substring(fileNm.lastIndexOf(".")+1);
					if($.trim($(this).val()) == "")	 {
						alert("이미지를 등록하세요");
						flag = false;
						return false;
					}
					
					if(ext != "bmp" && ext != "jpg" &&  ext != "gif" && ext != "png")	 {
						alert("이미지를 등록하세요\n 이미지 확장자는 bmp,jpg,gif,png 등록가능합니다.");
						flag = false;
						return false;
					}
				})
			}
			
			if(!flag) {
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
			
			// 부가설명 등록 (필수)
			$("textarea[name=descriptArr]").each(function(){
				if($.trim($(this).val()) == "") {
					alert("신규등록하려는 부가설명을 입력하세요");
					flag = false;
					return false;
				}
			});
			
			if(!flag) {
				return;
			}	
			
			
			$("textarea[name=udescriptArr]").each(function(){
				if($.trim($(this).val()) == "") {
					alert("부가설명을 입력하세요");
					flag = false;
					return false;
				}
			});
			
			if(!flag) {
				return;
			}			

			
			var popGbnCd = "";		
			if($("#popupzone > a > span").attr("class") == "point"){
				popGbnCd = "POPUP";
			}
			if($("#bannerzone > a > span").attr("class") == "point"){
				popGbnCd = "BANNER";
			}
			$("#popGbnCd").val(popGbnCd);
			
			var commCodeSeq = $("div.contents > div.ttabWrap > ul#ttab3").find("li.choiced > a").attr("data");
			if(commCodeSeq != undefined) {
				$("#commCodeSeq").val(commCodeSeq);	
			} else {
				$("#commCodeSeq").val(null);
			}
			$("#frm").attr("action","/admin/savePopMng?gseq=${gseq }&lseq=${lseq}").submit();
		});
		
		$("#changeBtn").click(function(){
			var f = confirm("정렬순서를 변경하시겠습니까? 신규등록되는 팝업은 적용되지 않습니다.");
			if(f){
				$("#listTbl input[name=ordinaryArr]").each(function(i){
					$(this).val(i+1);
				});
				$("#frm").attr("action","/admin/updatePopOrdinary?gseq=${gseq }&lseq=${lseq}").submit();
			} else {
				return;
			}
		});
		
		$(document).on("click","input[name=popRmBtn]",function(){
			var f = confirm("정말 취소하시겠습니까?");
			if(f){
				$(this).parent().parent().parent().remove();
			} else {
				return;
			}
		});
		
		$(document).on("click","input[name=removeBtn]",function(){
			$this = $(this);
			var f = confirm("정말 삭제하시겠습니까?");
			if(f){
				$.ajax({
			           type:"POST", 
			           url: "/admin/removePopMngByPopSeq",
			           dataType : "JSON",
			           data : {"popSeq":$this.attr("data")},
			           success: function(data){
			        	   if(data.flag="Y") {
			        		   alert("파일이 삭제되었습니다.");
			        		    var popGbnCd = "";		
				       			if($("#popupzone > a > span").attr("class") == "point"){
				       				popGbnCd = "POPUP";
				       			}
				       			if($("#bannerzone > a > span").attr("class") == "point"){
				       				popGbnCd = "BANNER";
				       			}
				       			
				       			var commCodeSeq = $("div.contents > div.ttabWrap > ul#ttab3").find("li.choiced > a").attr("data");
				    			if(commCodeSeq != undefined) {
				    				listPage(commCodeSeq, popGbnCd);
				    			} else {
				    				listPage(null, popGbnCd);
				    			}
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
	});
	
	//AJAX 팝업 목록 조회
	function listPage(commCodeSeq, popGbnCd){
		$.ajax({
	           type:"POST", 
	           url: "/admin/listPopMng",
	           data : {"commCodeSeq" : commCodeSeq, "popGbnCd" : popGbnCd },
	           success: function(data){
	        	   $("#listTbl").html(data);
	        	   $("#listTbl > table").tableDnD({
	        		   onDragClass: "dragTR"
	        	   });
	        	   $( document ).tooltip({ 
	        		   track: true
	        	   });
	        	   $("input[type=text]").css("height","18px");
	           }, 
	           error : function(request, status, error) {
				alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
			}
		});
	}
</script>
<style type="text/css">
	.dragTR{
		background-color:  #FAED7D;
	}
</style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
<jsp:include page="/common/gnb.jsp" />
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<jsp:include page="/common/lnb.jsp" />
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3>팝업관리</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">
				<div class="ttabWrap">
					<ul id="ttab3">
						<c:if test="${adminInfo.admAuthCode eq 'S' }">
							<li >
								<a style="text-decoration: none;" href="#" class="tabBtn">
									메인
								</a>
							</li>
						</c:if>
						<c:if test="${listFacil != null && fn:length(listFacil) > 0 }">
							<c:forEach var="list" items="${listFacil }" varStatus="status">
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
											<c:if test="${authList.slctFacilId eq  list.codeId && authList.menuNm eq '팝업관리'}">
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
				<div class="ttabWrap">
					<ul id="ttab4">
						<li  id="popupzone">
							<a style="text-decoration: none;" href="#" class="subtabBtn">
								<c:set var="cls" value="" />
								<c:if test="${t2 == 0 }">
									<c:set var="cls" value="point" />
								</c:if>
								<span class="${cls }">팝업존</span>
							</a>
						</li>
						<c:if test="${adminInfo.admAuthCode eq 'S' }">
							<c:set var="cls" value="" />
							<li <c:if test="${t1 > 0 }"> style="display:none;" </c:if> id="bannerzone">
							 <c:if test="${t2 == 1 }">
									<c:set var="cls" value="point" />
								</c:if>
								<a style="text-decoration: none;" href="#" class="subtabBtn">
									<span class="${cls }">배너존</span>
								</a>
							</li>
						</c:if>
					</ul>
				</div>
				<div style="padding-top: 20px;"></div>
				<div class="pageSection">
					<div class="boardWrap">
						<form method="post" id="frm" name="frm" action="/admin/savePopMng?gseq=${gseq }&lseq=${lseq}" enctype="multipart/form-data">
						 	<input type="hidden" name="t1" id="t1" value="${t1 }" />
							<input type="hidden" name="t2" id="t2" value="${t2 }" />
							<input type="hidden" name="popGbnCd" id="popGbnCd" />
							<input type="hidden" name="commCodeSeq" id="commCodeSeq" /> 
							<table align="center"  style="margin-top: -30px;" width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
								<colgroup>
									<col />
									<col width="140px" />
									<col width="100px" />
									<col width="80px" />
									<col width="80px" />
									<col width="80px" />
									<col width="120px" />
								</colgroup>
								<tr>
									<th scope="col">이미지</th>
									<th scope="col">URL</th>
									<th scope="col">사용여부</th>
									<th scope="col">링크구분</th>
									<th scope="col">수정자</th>
									<th scope="col">수정일</th>
									<th scope="col">
										<input type="button" id="popAddBtn" value="추가" />
										<input type="button" id="popSaveBtn" value="저장" />
										<input type="button" id="changeBtn" value="순  서  변  경" />
									</th>
								</tr>
								<tr>
									<th scope="col" colspan="7">이미지설명</th>
								</tr>
								<tr>
									<td colspan="7" width="100%" style="border-bottom-width: 0px; border-bottom-color: white;" id="tmpTbl">
									</td>
								</tr>
								<tr>
									<td colspan="7" width="100%" style="border-bottom-width: 0px; border-bottom-color: white;" id="listTbl"></td> 
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