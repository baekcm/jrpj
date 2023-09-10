<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/common/commoninc.jsp" />
<c:if test="${bbs.boardType eq 'LOSE' }">
<link rel="stylesheet" href="/resources/css/jquery-ui.css" type="text/css" media="all" />
<script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
</c:if>
<script type="text/javascript">
	$(function(){
		<c:if test="${bbs.boardNm eq '개인레슨안내' || bbs.boardNm eq '무료체험강좌' || bbs.boardNm eq '분실물습득안내'}">
			$("#commCodeSeq option").each(function(){
				if($.trim($(this).text()) == "종로구시설관리공단" || $.trim($(this).text()) == "주차사업" || $.trim($(this).text()) == "공공시설") {
					$(this).remove();
				}
			})
		</c:if>
		<c:if test="${bbs.boardType eq 'FREE' }">
		
		$("#searchTeacherBtn").click(function(){
			window.open("/admin/listTeacherMngPop","searchEmp",'width=740,height=644,left=0,top=0,scrollbars=no');
		});
		$(document).on("click","input[name=tmpRemoveBtn]",function(){
			$(this).parent().prev().remove();
			$(this).parent().remove();
		})
		</c:if>
		<c:if test="${bbs.boardType eq 'LOSE' }">
			 $( "#learnYmdTmp" ).datepicker({
				    dateFormat: 'yy-mm-dd'
			 });
			 $("div.ui-datepicker").hide();
		 </c:if>
			 $("#fileAddBtn").click(function(){
				 if($("#tmpFile input[type=file]").size() == 7) {
					 alert("최대 7개까지 등록가능합니다.");
					 return;
				 } else {
					 var tag = '<input name="boardFileList" type="file" /><input type="button" name="fileRmBtn" value="X"/><br/>';
					 $("#tmpFile").append(tag);	 
				 }
			 });
			 $(document).on("click","input[name=fileRmBtn]",function(){
				 $(this).prev().remove();
				 $(this).next().remove();
				 $(this).remove();
			 });
		$("#saveBtn").click(function(){
			<c:if test="${bbs.boardType eq 'LOSE' }">
				var arr = $.trim($( "#learnYmdTmp" ).val()).split("-");
				$("#learnYmd" ).val(arr[0]+arr[1]+arr[2])
			</c:if>
				
			<c:if test="${bbs.boardType eq 'GALL' || bbs.boardType eq 'LOSE' || bbs.boardType eq 'FREE' }">
				var flag = true;
				
				if($("input[name=boardFileList]").size() > 0){
					$("input[name=boardFileList]").each(function(){
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
			</c:if>
			
			
			<c:if test="${bbs.catCdYn eq 'Y' }">
				if($("#commCodeSeq").val() == "") {
					alert("사업장을 선택하세요");
					return;
				}
			</c:if>
			<c:if test="${bbs.grpCatCdYn eq 'Y' }">
				if($("#catGbnCd").val() == "") {
					alert("카테고리를 선택하세요");
					return;
				}
			</c:if>
			<c:if test="${bbs.pgmCatCdYn eq 'Y' }">
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
			location.href="/admin/listBbsData/${menuSeq}/${boardSeq}?gseq=${gseq}&lseq=${lseq}";
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
				<h3>[
				<c:if test="${bbs.boardType eq 'NOTI'}">
				공지형
				</c:if>
				<c:if test="${bbs.boardType eq 'NEWS'}">
				뉴스형
				</c:if>
				<c:if test="${bbs.boardType eq 'GALL'}">
				갤러리형
				</c:if>
				<c:if test="${bbs.boardType eq 'COMM'}">
				커뮤니티형
				</c:if>
				<c:if test="${bbs.boardType eq 'FREE'}">
				무료체험강좌형
				</c:if>
				<c:if test="${bbs.boardType eq 'LOSE'}">
				분실물습득형
				</c:if>
				] &nbsp;${bbs.boardNm }</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
					<form action="/admin/saveBbsData?gseq=${gseq}&lseq=${lseq }" method="post" name="frm" id="frm" enctype="multipart/form-data">
						<input type="hidden" name="boardType" value="${fn:trim(bbs.boardType) }" />
						<input type="hidden" name="boardSeq" value="${fn:trim(boardSeq)}"/>
						<input type="hidden" name="menuSeq" value="${fn:trim(menuSeq)}"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
							<colgroup>
							<col width="120px" />
							<col />
							</colgroup>
							<tr> 
								<th class="ta_l" scope="row"><label for="btitle">제목</label></th>
								<td class="bd01td listx"><input name="subject" id="subject" type="text" style="width: 400px" /></td>
							</tr>
							<c:if test="${bbs.catCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="commCodeSeq">사업장 선택</label></th>
									<td class="bd01td">
										<select name="commCodeSeq" id="commCodeSeq">
											<option value="">선택</option>
											<c:if test="${upList != null && fn:length(upList) > 0 }">
												<c:forEach items="${upList }" var="list">
													<option value="${list.commCodeSeq }">${list.codeNm }</option>	
												</c:forEach>
											</c:if>
										</select>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs.grpCatCdYn eq 'Y' }">
								<tr>
									<th class="ta_l" scope="row"><label for="catGbnCd">카테고리 선택</label></th>
									<td class="bd01td">
										<select name="catGbnCd" id="catGbnCd">
											<option value="">선택</option>
											<option value="00">시설물대관</option>
											<option value="01">시설이용</option>
											<option value="02">운영</option>
										</select>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs.pgmCatCdYn eq 'Y' }"> 
								<tr>
									<th class="ta_l" scope="row"><label for="pgmCatGbnCd">프로그램 카테고리</label></th>
									<td class="bd01td">
										<select name="pgmCatGbnCd" id="pgmCatGbnCd">
											<option value="">선택</option>
											<c:if test="${saleList != null && fn:length(saleList) > 0 }">
												<c:forEach items="${saleList }" var="list">
													<option value="${list.codeId }">${list.codeNm }</option>	
												</c:forEach>
											</c:if>
										</select>
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs.boardType eq 'FREE'}">
								<tr>
									<th class="ta_l" scope="row">
										장소
									</th>
									<td class="bd01td">
										<input name="freePlace" id="freePlace" type="text" style="width: 400px" />
									</td>
								</tr>
								<tr>
									<th class="ta_l" scope="row">
										일시
									</th>
									<td class="bd01td">
										<input name="freeDtm" id="freeDtm" type="text" style="width: 400px" />	
									</td>
								</tr>
							</c:if>
							<c:if test="${bbs.boardType eq 'NEWS'}">
							<tr>
								<th class="ta_l" scope="row"><label for="btitle">URL링크</label></th>
								<td class="bd01td listx"><input name="urlNm" id="urlNm" type="text" /></td>
							</tr>
							</c:if>
							<c:if test="${bbs.boardType eq 'LOSE' }">
							<tr>
								<th class="ta_l" scope="row"><label for="blostDate">습득 및 분실일</label></th>
								<td class="bd01td"><span class="bd01td listx">
									<input name="learnYmdTmp" id="learnYmdTmp" readonly="readonly" type="text" />
									<input name="learnYmd" id="learnYmd" type="hidden" />
									</span></td>
							</tr>
							<tr>
								<th class="ta_l" scope="row"><label for="blostPlace">습득 및 분실 장소</label></th>
								<td class="bd01td"><span class="bd01td listx">
									<input name="learnArea" id="learnArea" type="text" />
									</span></td>
							</tr>
							<tr>
								<th class="ta_l" scope="row"><label for="save">보관 유무</label></th>
								<td class="bd01td"><select name="learnStoreYn" id="learnStoreYn">
										<option value="Y">보관중</option>
										<option value="N">찾아감</option>
									</select></td>
							</tr>
							</c:if>
								<tr>
									<td colspan="2" scope="row" class="bd01tdC">
										<textarea name="content" id="content" cols="60" rows="30" title="내용입력" style="width:100%; height:300px; "></textarea>
										<script type="text/javascript">
											loadEditor("content");
										</script>
									</td>
								</tr>
							<c:choose>
								<c:when test="${bbs.boardType eq 'GALL' }">
									<tr>
										 <th class="ta_l" scope="row" valign="top">
											<label for="file01">이미지파일첨부</label>
											<input type="button" id="fileAddBtn" value="추가"/>
										</th>
										<td class="bd01td" id="tmpFile"></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th class="ta_l" scope="row" valign="top">
											<label for="file01">
												<c:if test="${bbs.boardType eq 'LOSE' || bbs.boardType eq 'FREE'  }">
													이미지
												</c:if>
											파일첨부</label>
											<input type="button" id="fileAddBtn" value="추가"/>
										</th>
										<td class="bd01td" id="tmpFile"></td>
										<!-- <td class="bd01td">
											<input name="boardFileList" type="file" />
										</td> -->
									</tr>
								</c:otherwise>
							</c:choose>
							<c:if test="${bbs.boardType eq 'FREE'}">
								<tr>
									<th class="ta_l" scope="row">
										<input type="button" id="searchTeacherBtn" value="강사조회"/>
									</th>
									<td class="bd01td" id="tempData"></td>
								</tr>
							</c:if>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="#" id="saveBtn" >등록</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>