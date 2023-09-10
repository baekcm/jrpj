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
			});
		</c:if>
		
		 <c:if test="${bbs[0].boardType eq 'GALL'  }">
			 $("img[name=thumbImg]").click(function(){
				 window.open($(this).attr("src").replace("thumb_",""),'','width=600,height=400,top=500,left=400,scrollbars=no,resizable=no');
			 });
		 </c:if>
		$("#updateBtn").click(function(){
			$("#frm").submit();
		});
		
		$("#cancelBtn").click(function(){
			location.href="/admin/listBbsData/${bbs[0].menuSeq}/${bbs[0].boardSeq}?gseq=${gseq}&lseq=${lseq}";
		});
	});
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
					<form action="/admin/formUpdateBbsData?gseq=${gseq}&lseq=${lseq }" method="post" name="frm" id="frm" enctype="multipart/form-data">
						<input type="hidden" name="boardSeq" value="${fn:trim(bbs[0].boardSeq)}"/>
						<input type="hidden" name="dataSeq" value="${fn:trim(bbs[0].dataSeq)}"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
							<colgroup>
							<col width="120px" />
							<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row"><label for="btitle">제목</label></th>
								<td class="bd01td listx">${fn:trim(bbs[0].subject) }</td>
							</tr>
							<c:if test="${bbs[0].catCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="save">사업장</label></th>
									<td class="bd01td">
										<c:if test="${upList != null && fn:length(upList) > 0 }">
											<c:forEach items="${upList }" var="list">
													<c:if test="${bbs[0].commCodeSeq eq  list.commCodeSeq}">${list.codeNm }</c:if>
											</c:forEach>
										</c:if>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].grpCatCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="save">카테고리</label></th>
									<td class="bd01td">
										<c:if test="${bbs[0].catGbnCd eq '00' }">시설물대관</c:if>
										<c:if test="${bbs[0].catGbnCd eq '01' }">시설이용</c:if>
										<c:if test="${bbs[0].catGbnCd eq '02' }">운영</c:if>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].pgmCatCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="save">프로그램 카테고리</label></th>
									<td class="bd01td">
										<c:if test="${saleList != null && fn:length(saleList) > 0 }">
											<c:forEach items="${saleList }" var="list">
												<c:if test="${list.codeId eq bbs[0].pgmCatGbnCd }">${list.codeNm }</c:if>
											</c:forEach>
										</c:if>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].boardType eq 'NEWS'}">
							<tr>
								<th class="ta_l" scope="row"><label for="btitle">URL링크</label></th>
								<td class="bd01td listx">${bbs[0].urlNm }</td>
							</tr>
							</c:if>
							<c:if test="${bbs[0].boardType eq 'FREE' }">
								<tr>
									<th class="ta_l" scope="row"><label for="blostDate">장소</label></th>
									<td class="bd01td">
										${bbs[0].freePlace }
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row"><label for="blostPlace">일시</label></th>
									<td class="bd01td">
										${bbs[0].freeDtm }	
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row"><label for="save">강사</label></th>
									<td class="bd01td">
										<c:if test="${bbsTeacherResult != null && fn:length(bbsTeacherResult) > 0 }">
											<c:forEach items="${bbsTeacherResult}" var="teacherList" varStatus="status2">
												<b>${teacherList.teacherNm }</b> 강사
												<c:if test="${!status2.last }">
													<br/>
												</c:if>
											</c:forEach>
										</c:if>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs[0].boardType eq 'LOSE' }">
							<tr>
								<th class="ta_l" scope="row"><label for="blostDate">습득 및 분실일</label></th>
								<td class="bd01td"><span class="bd01td listx">
										${fn:substring(bbs[0].learnYmd,0,4)}-${fn:substring(bbs[0].learnYmd,4,6)}-${fn:substring(bbs[0].learnYmd,6,8)}
									</span></td>
							</tr>
							<tr>
								<th class="ta_l" scope="row"><label for="blostPlace">습득 및 분실 장소</label></th>
								<td class="bd01td"><span class="bd01td listx">
									${bbs[0].learnArea }
									</span></td>
							</tr>
							<tr>
								<th class="ta_l" scope="row"><label for="save">보관 유무</label></th>
								<td class="bd01td">
									<c:if test="${bbs[0].learnStoreYn eq 'Y' }">보관중</c:if>
									<c:if test="${bbs[0].learnStoreYn eq 'N' }">찾아감</c:if>
								</td>
							</tr>
							</c:if>
								<tr>
									<td colspan="2" scope="row" class="bd01tdC">
										<c:if test="${bbs[0].boardType eq 'LOSE' || bbs[0].boardType eq 'FREE'}">
											<c:if test="${bbs[0].realFileNm != null && bbs[0].realFileNm != ''}">
												<p>
													<img src="${bbs[0].filePath }${bbs[0].realFileNm}"  width="257" height="198" alt="${ fn:trim(bbs[0].subject) }" />
												</p>
											</c:if>
										</c:if>
										${fn:trim(bbs[0].content) }
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
													    </div>
													</c:if>		
												</c:forEach>
											</c:if>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="bd01td" colspan="2">
											<%-- <c:if test="${bbs[0].fileSeq != null && bbs[0].fileSeq > 0 }">
												<c:set var="abc" value="${fn:toLowerCase(bbs[0].orgnlFileNm)}" />
												<c:forTokens var="token" items="${abc }" delims="." varStatus="status">
													<c:if test="${status.last }">
														<c:choose>
															<c:when test="${token eq 'hwp' }">
																<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_han.gif" alt="${bbs[0].orgnlFileNm }" />
															</c:when>
															<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_excel.gif" alt="${bbs[0].orgnlFileNm }" />
															</c:when>
															<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																<img style="cursor: pointer;" src="/resources/admin_include/commonfile/image/board/b_ic_gif.gif" alt="${bbs[0].orgnlFileNm }" />	
															</c:when>
															<c:when test="${token eq 'pdf'}">
																<img style="cursor: pointer;width: 23px;height: 23px;" src="/resources/admin_include/commonfile/image/board/b_ic_pdf.png" alt="${bbs[0].orgnlFileNm }" />	
															</c:when>
															<c:when test="${token eq 'ppt' }">
																<img style="cursor: pointer;width: 16px;height: 16px;" src="/resources/admin_include/commonfile/image/board/b_ic_ppt.png" alt="${bbs[0].orgnlFileNm }" />
															</c:when>
															<c:otherwise>
																<img style="cursor: pointer;width: 20px;height: 20px;" src="/resources/admin_include/commonfile/image/board/b_ic_notype.png" alt="${bbs[0].orgnlFileNm }" />
															</c:otherwise>
														</c:choose>
													</c:if>
										        </c:forTokens>
										        <a id="${bbs[0].fileSeq }" name="fileDown" href="#">${bbs[0].orgnlFileNm}</a>
											</c:if> --%>
											<!-- <tr>
												<td colspan="2"> -->
													<c:if test="${bbs != null && fn:length(bbs) > 0 }">
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
													</c:if>
												<!-- </td>
											</tr> -->
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
		    		<c:choose>
		    			<c:when test="${adminInfo.admAuthCode eq 'S' }">
		    				<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >수정하기</a></span> &nbsp;	
		    			</c:when>
		    			<c:when test="${adminInfo.admAuthCode eq 'O' }">
		    				<c:forEach items="${authInfo }" var="list">
								<c:if test="${list.menuSeq eq fn:trim(bbs[0].menuSeq) && list.slctFacilId eq fn:trim(bbs[0].codeId) }">
									<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >수정하기</a></span> &nbsp;
								</c:if>	
		    				</c:forEach>	
		    			</c:when>
		    		</c:choose>
					<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >목록으로</a></span> 
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