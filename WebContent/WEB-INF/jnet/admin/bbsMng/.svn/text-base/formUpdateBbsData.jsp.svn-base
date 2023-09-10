<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<c:if test="${bbs[0].boardType eq 'LOSE' }">
	<link rel="stylesheet" href="/resources/css/jquery-ui.css" type="text/css" media="all" />
	<style type="text/css">
		.overImg{ border-color: red;border-style: solid;border-width: 2px; }
	</style>
	<script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
</c:if>

<script type="text/javascript">
	$(function(){
		<c:if test="${bbs[0].boardType eq 'FREE' }">
		$("#commCodeSeq option").each(function(){
			if($.trim($(this).text()) == "종로구시설관리공단" || $.trim($(this).text()) == "주차사업" || $.trim($(this).text()) == "공공시설") {
				$(this).remove();
			}
		});
		$("#searchTeacherBtn").click(function(){
			window.open("/admin/listTeacherMngPop","searchEmp",'width=740,height=644,left=0,top=0,scrollbars=no');
		});
		$(document).on("click","input[name=tmpRemoveBtn]",function(){
			$(this).parent().prev().remove();
			$(this).parent().remove();
		});
		</c:if>
		$("a[name=fileDown]").click(function(){
			var fileSeq = $(this).attr("id");
			$("#fileSeq").val(fileSeq);
			$("#downFrm").submit();
		});
		<c:if test="${bbs[0].boardType eq 'COMM' }">
			//ajax onload시 댓글목록조회
			getReplyList("");
			
			//댓글등록버튼 클릭
			$("#replyBtn").click(function(){
				if($.trim($("#replyContent").val()) == "") {
					alert("댓글내용을 입력하세요");
					return;
				}else {
					$.ajax({
				           type:"POST", 
				           url: "/admin/saveReply",
				           data : {"replyContent" : $.trim($("#replyContent").val()),"dataSeq" : "${fn:trim(bbs[0].dataSeq)}"},
				           success: function(data){ 
				        	   $("#replyContent").val("").focus();
				        	  $("#replyList").html(data);
				           }, 
				           error : function(request, status, error) {
							alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
						}
					});
				}
			});
			
			$(document).on("click","input[name=removeReply]",function(){
				var replySeq = $(this).attr("id");
				var dataSeq = $(this).attr("data");
				var f = confirm("정말 댓글을 삭제하시겠습니까?");
				if(f){
					$.ajax({
				           type:"POST", 
				           url: "/admin/removeReply",
				           data : {"replySeq" : replySeq,"dataSeq" : dataSeq},
				           success: function(data){ 
				        	  $("#replyList").html(data);
				           }, 
				           error : function(request, status, error) {
							alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
						}
					});
				} else {
					return;
				}
				
			})
		</c:if>
		<c:if test="${bbs[0].boardType eq 'LOSE' }">
			 $( "#learnYmdTmp" ).datepicker({
				    dateFormat: 'yy-mm-dd'
			 });
			 $("div.ui-datepicker").hide();
		 </c:if>
			 $("#fileAddBtn").click(function(){
				 var addSize = $("img[name=thumbImg]").size();
				 var fileSize = $("#tmpFile input[type=file]").size();
				 var thpSize = fileSize + addSize;
				 var tmpSize = 7 - addSize;
				 if(addSize ==  0) {
					 if($("#tmpFile input[type=file]").size() == 7) {
						 alert("최대 7개까지 등록가능합니다.");
						 return;
					 } else {
						 var tag = '<input name="boardFileList" type="file" /><input type="button" name="fileRmBtn" value="X"/><br/>';
						 $("#tmpFile").append(tag);	 
					 }
				 } else {
					 if(thpSize == 7) {
						 alert("기존 등록되있는 파일이 존재하여 최대 "+tmpSize+"개까지 등록가능합니다.");
						 return;
					 } else {
						 var tag = '<input name="boardFileList" type="file" /><input type="button" name="fileRmBtn" value="X"/><br/>';
						 $("#tmpFile").append(tag);	 
					 }
				 }
				 
			 });
			 $(document).on("click","input[name=fileRmBtn]",function(){
				 $(this).prev().remove();
				 $(this).next().remove();
				 $(this).remove();
			 });
		 
		 <c:if test="${bbs[0].boardType eq 'LOSE' || bbs[0].boardType eq 'FREE' || bbs[0].boardType eq 'GALL' }">
			 $("input[name=rmThumbBtn]").click(function(){
				 $this = $(this);
				 var f = confirm("해당 이미지를 정말 삭제하시겠습니까?");
				 if(f){
					 var fileSeq = $(this).attr("id");
					 //ajax 통신
					 $.ajax({
			           	type:"POST", 
			           	url: "/admin/removeGallImg",
			           	data : {"fileSeq" : fileSeq},
			           	dataType : "json",
			          	success: function(data){
			        	  if(data.flag == "Y"){
			        		  $this.parent().parent().remove();
			        	  } else {
			        		  alert("에러발생:"+data.flag);
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
			 });
			 
			 $("img[name=thumbImg]").click(function(){
				 window.open($(this).attr("src").replace("thumb_",""),'','width=600,height=400,top=500,left=400,scrollbars=no,resizable=no');
			 });
		 </c:if>
		 
		$("#updateBtn").click(function(){
			<c:if test="${bbs[0].boardType eq 'LOSE'}">
				var arr = $.trim($( "#learnYmdTmp" ).val()).split("-");
				$("#learnYmd" ).val(arr[0]+arr[1]+arr[2]);
			</c:if>
			
			<c:if test="${bbs[0].catCdYn != null && bbs[0].catCdYn eq 'Y' }">
				if($("#commCodeSeq").val() == "") {
					alert("사업장을 선택하세요");
					return;
				}
			</c:if>
			<c:if test="${bbs[0].grpCatCdYn != null && bbs[0].grpCatCdYn eq 'Y' }">
				if($("#catGbnCd").val() == "") {
					alert("카테고리를 선택하세요");
					return;
				}
			</c:if>
			<c:if test="${bbs[0].pgmCatCdYn != null && bbs[0].pgmCatCdYn eq 'Y' }">
				if($("#pgmCatGbnCd").val() == "") {
					alert("프로그램 카테고리를 선택하세요");
					return;
				}
			</c:if>
			var sHTML = oEditors.getById["content"].getIR();
			$("#content").val(sHTML);
			$("#frm").submit();
		});
		
		
		
		$("#cancelBtn").click(function(){
			location.href="/admin/listBbsData/${bbs[0].menuSeq}/${bbs[0].boardSeq}?gseq=${gseq}&lseq=${lseq}";
		});
	})
	<c:if test="${bbs[0].boardType eq 'COMM' }">
		function setPage(pageNo){
			getReplyList(pageNo);
		}
		
		function getReplyList(pageNo){
			$.ajax({
		           type:"POST", 
		           url: "/admin/listReply",
		           data : {"dataSeq" : "${fn:trim(bbs[0].dataSeq)}", "pageNum":pageNo},
		           success: function(data){ 
		        	  $("#replyList").html(data);
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		}
	</c:if>
</script>
</head>
<body>
<form method="post" name="downFrm" id="downFrm" action="/admin/downBbsFile">
	<input type="hidden" name="fileSeq" id="fileSeq" />
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
				<h3>[
				<c:if test="${bbs[0].boardType eq 'NOTI'}">
				공지형
				</c:if>
				<c:if test="${bbs[0].boardType eq 'NEWS'}">
				뉴스형
				</c:if>
				<c:if test="${bbs[0].boardType eq 'GALL'}">
				갤러리형
				</c:if>
				<c:if test="${bbs[0].boardType eq 'COMM'}">
				커뮤니티형
				</c:if>
				<c:if test="${bbs[0].boardType eq 'FREE'}">
				무료체험강좌형
				</c:if>
				<c:if test="${bbs[0].boardType eq 'LOSE'}">
				분실물습득형
				</c:if>
				] &nbsp;${bbs[0].boardNm }</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<form action="/admin/updateBbsData?gseq=${gseq}&lseq=${lseq }" method="post" name="frm" id="frm" enctype="multipart/form-data">
						<input type="hidden" name="boardType" value="${fn:trim(bbs[0].boardType) }" />
						<input type="hidden" name="boardSeq" value="${fn:trim(bbs[0].boardSeq)}"/>
						<input type="hidden" name="dataSeq" value="${fn:trim(bbs[0].dataSeq)}"/>
						<input type="hidden" name="menuSeq" value="${fn:trim(bbs[0].menuSeq)}"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
							<colgroup>
							<col width="120px" />
							<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row"><label for="btitle">제목</label></th>
								<td class="bd01td listx"><input name="subject" id="subject" type="text" value="${fn:trim(bbs[0].subject) }" style="width: 400px" /></td>
							</tr>
							<c:if test="${bbs[0].catCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="commCodeSeq">사업장 선택</label></th>
									<td class="bd01td">
										<select name="commCodeSeq" id="commCodeSeq">
											<option value="">선택</option>
											<c:if test="${upList != null && fn:length(upList) > 0 }">
												<c:forEach items="${upList }" var="list">
													<option value="${list.commCodeSeq }"
														<c:if test="${bbs[0].commCodeSeq eq  list.commCodeSeq}">selected="selected"</c:if>
													>${list.codeNm }</option>	
												</c:forEach>
											</c:if>
										</select>
										
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].grpCatCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="catGbnCd">카테고리 선택</label></th>
									<td class="bd01td">
										<select name="catGbnCd" id="catGbnCd">
											<option value="">선택</option>
											<option value="00"
												<c:if test="${bbs[0].catGbnCd eq '00' }">selected="selected"</c:if>
											>시설물대관</option>
											<option value="01"
												<c:if test="${bbs[0].catGbnCd eq '01' }">selected="selected"</c:if>
											>시설이용</option>
											<option value="02"
												<c:if test="${bbs[0].catGbnCd eq '02' }">selected="selected"</c:if>
											>운영</option>
										</select>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].pgmCatCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="pgmCatGbnCd">프로그램 카테고리 선택</label></th>
									<td class="bd01td">
										<select name="pgmCatGbnCd" id="pgmCatGbnCd">
											<option value="">선택</option>
											<c:if test="${saleList != null && fn:length(saleList) > 0 }">
												<c:forEach items="${saleList }" var="list">
													<option value="${list.codeId }"
														<c:if test="${list.codeId eq bbs[0].pgmCatGbnCd }">selected="selected""</c:if>
													>${list.codeNm }</option>	
												</c:forEach>
											</c:if>
										</select>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].boardType eq 'FREE'}">
								<tr>
									<th class="ta_l" scope="row">
										장소
									</th>
									<td class="bd01td">
										<input name="freePlace" id="freePlace" type="text" style="width: 400px" value="${bbs[0].freePlace }" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										일시
									</th>
									<td class="bd01td">
										<input name="freeDtm" id="freeDtm" type="text" style="width: 400px" value="${bbs[0].freeDtm }" />	
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].boardType eq 'NEWS'}">
							<tr>
								<th class="ta_l" scope="row"><label for="btitle">URL링크</label></th>
								<td class="bd01td listx"><input name="urlNm" id="urlNm" type="text" value="${bbs[0].urlNm }" /></td>
							</tr>
							</c:if>
							<c:if test="${bbs[0].boardType eq 'LOSE' }">
							<tr>
								<th class="ta_l" scope="row"><label for="blostDate">습득 및 분실일</label></th>
								<td class="bd01td"><span class="bd01td listx">
									<input name="learnYmdTmp" id="learnYmdTmp" readonly="readonly" type="text" value="${fn:substring(bbs[0].learnYmd,0,4)}-${fn:substring(bbs[0].learnYmd,4,6)}-${fn:substring(bbs[0].learnYmd,6,8)}" />
									<input name="learnYmd" id="learnYmd" type="hidden" value="${bbs[0].learnYmd }" />
									</span></td>
							</tr>
							<tr>
								<th class="ta_l" scope="row"><label for="blostPlace">습득 및 분실 장소</label></th>
								<td class="bd01td"><span class="bd01td listx">
									<input name="learnArea" id="learnArea" type="text" value="${bbs[0].learnArea }" style="width: 400px" />
									</span></td>
							</tr>
							<tr>
								<th class="ta_l" scope="row"><label for="save">보관 유무</label></th>
								<td class="bd01td"><select name="learnStoreYn" id="learnStoreYn">
										<option value="Y"
											<c:if test="${bbs[0].learnStoreYn eq 'Y' }">selected="selected"</c:if>
										>보관중</option>
										<option value="N"
											<c:if test="${bbs[0].learnStoreYn eq 'N' }">selected="selected"</c:if>
										>찾아감</option>
									</select></td>
							</tr>
							</c:if>
								<tr>
									<td colspan="2" scope="row" class="bd01tdC">
										<textarea name="content" id="content" cols="60" rows="30" title="내용입력" style="width:100%; height:300px; ">${fn:trim(bbs[0].content) }</textarea>
										<script type="text/javascript">
											loadEditor("content");
										</script>
									</td> 
								</tr>
							<c:choose>
								<c:when test="${bbs[0].boardType eq 'GALL' }">
									<tr>
										<td colspan="2">
											<c:if test="${bbs != null && fn:length(bbs) > 0 }">
												<c:forEach items="${bbs }" var="list">
													<c:if test="${list.thumbYn eq 'Y' }">
													<div class="test" style="position:relative; top:0px; left:0px; width:100px; height:100px; overflow:hidden; float: left;"> 
													    <div style='position:absolute; top:0px; left:0px; z-index:1; '>
													    	<img name="thumbImg" src="${list.filePath }${list.realFileNm}" style="cursor: pointer;"/>
													    </div> 
													    <div style='position:absolute; top:0px; left:74px; z-index:2;'>
													    	<input type="button" name="rmThumbBtn" id="${list.fileSeq }" value="X"/>
													    </div> 
												    </div>
													</c:if>		
												</c:forEach>
											</c:if>
										</td>
									</tr>
									<tr>
										<th class="ta_l" scope="row" valign="top">
											<label for="file01">이미지파일첨부</label>
											<input type="button" id="fileAddBtn" value="추가"/>
										</th>
										<td class="bd01td" id="tmpFile"></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:set var="rowspan" value="1" />
									<c:if test="${bbs[0].boardType eq 'LOSE' || bbs[0].boardType eq 'FREE' }">
										<c:forEach items="${bbs }" var="list">
											<c:if test="${list.thumbYn eq 'Y' }">
												<c:set var="rowspan" value="2" />
											</c:if>		
										</c:forEach>
									</c:if>
									<c:if test="${bbs[0].boardType eq 'LOSE' || bbs[0].boardType eq 'FREE' }">
										<tr>
											<td colspan="2">
												<c:forEach items="${bbs }" var="list">
													<c:if test="${list.thumbYn eq 'Y' }">
														<div class="test" style="position:relative; top:0px; left:0px; width:100px; height:100px; overflow:hidden; float: left;"> 
														    <div style='position:absolute; top:0px; left:0px; z-index:1; '>
														    	<img name="thumbImg" src="${list.filePath }${list.realFileNm}" style="cursor: pointer;"/>
														    </div> 
														    <div style='position:absolute; top:0px; left:74px; z-index:2;'>
														    	<input type="button" name="rmThumbBtn" id="${list.fileSeq }" value="X"/>
														    </div> 
													    </div>
													</c:if>		
												</c:forEach>
											</td>
										</tr>
									</c:if>
									<c:if test="${bbs[0].boardType ne 'LOSE' && bbs[0].boardType ne 'FREE' && bbs[0].boardType ne 'GALL'}">
										<c:if test="${bbs != null && fn:length(bbs) > 0 }">
											<tr>
												<td class="bd01td" colspan="2">
													<c:forEach items="${bbs }" var="list">
														<c:if test="${list.thumbYn eq 'N' }">
															<c:set var="abc" value="${fn:toLowerCase(list.orgnlFileNm)}" />
															<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
																<c:if test="${status.last }">
																	<c:choose>
																		<c:when test="${token eq 'hwp' }">
																			<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="${list.orgnlFileNm }" />
																		</c:when>
																		<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																			<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="${list.orgnlFileNm }" />
																		</c:when>
																		<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																			<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="${list.orgnlFileNm }" />	
																		</c:when>
																		<c:when test="${token eq 'pdf'}">
																			<img style="cursor: pointer;width: 23px;height: 23px;" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="${list.orgnlFileNm }" />	
																		</c:when>
																		<c:when test="${token eq 'ppt' }">
																			<img style="cursor: pointer;width: 16px;height: 16px;" src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="${list.orgnlFileNm }" />
																		</c:when>
																		<c:otherwise>
																			<img style="cursor: pointer;width: 20px;height: 20px;" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="${list.orgnlFileNm }" />
																		</c:otherwise>
																	</c:choose>
																</c:if>
													        </c:forTokens>
													        <a id="${list.fileSeq }" name="fileDown" href="#">${list.orgnlFileNm}</a>
												        </c:if>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:if>
									<tr>
										<th class="ta_l" scope="row" valign="top">
											<label for="file01">
												<c:if test="${bbs[0].boardType eq 'LOSE' || bbs[0].boardType eq 'FREE' }">
													이미지
												</c:if>
											파일첨부</label>
											<input type="button" id="fileAddBtn" value="추가"/>
										</th>
										<td class="bd01td" id="tmpFile">&nbsp;</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<c:if test="${bbs[0].boardType eq 'FREE'}">
								<tr>
									<th class="ta_l" scope="row">
										<input type="button" id="searchTeacherBtn" value="강사조회"/>
									</th>
									<td class="bd01td" id="tempData">
										<c:if test="${bbsTeacherResult != null && fn:length(bbsTeacherResult) > 0 }">
											<c:forEach items="${bbsTeacherResult }" var="list">
												<span>${list.teacherNm } 강사<input type="hidden" name="teacherSeqArr" value="${list.teacherSeq}"/></span>
												<span><input type="button" name="tmpRemoveBtn" value="X"/><br/></span>
											</c:forEach>
										</c:if>
									</td>
								</tr>
							</c:if>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >수정</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
					<!-- Text Button --> 
				</div>
				<c:if test="${bbs[0].boardType eq 'COMM' }">
					<div id="replyWrite">
						<textarea rows="3" cols="105" name="replyContent" id="replyContent"></textarea>
						<input type="button" id="replyBtn" value="등록" style="height: 45px; width:45px; margin-bottom: 30px;"/>
					</div>
					<div id="replyList"></div>
				</c:if>
			</div>
		</div>
	</div>
</div>

</body>
</html>