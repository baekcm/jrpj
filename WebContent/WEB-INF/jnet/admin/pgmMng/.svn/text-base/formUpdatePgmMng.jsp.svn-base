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
		var week = $.trim($("#weekCdTd").text());
		var length = week.length;
		var weekNm = "";
		var arr = new Array("월","화","수","목","금","토","일");
		for(var i=0; i<length; i++) {
			if(week.charAt(i) == "1") {
				weekNm += arr[i]+',';
			}
		}
		weekNm = weekNm.substring(0,weekNm.length-1);
		$("#weekCdTd").text(weekNm);
		
		$("#searchTeacherBtn").click(function(){
			window.open("/admin/listTeacherMngPop","searchEmp",'width=740,height=644,left=0,top=0,scrollbars=no');
		});
		
		$("#updateBtn").click(function(){
			var sHTML = oEditors.getById["pgmIntro"].getIR();
			$("#pgmIntro").val(sHTML);
			if($.trim($("#pgmIntro").val()) == "") {
				alert("강좌소개를 입력하세요");
				return;
			}
			var sHTML2 = oEditors2.getById["pgmDtlCts"].getIR();
			$("#pgmDtlCts").val(sHTML2);
			if($.trim($("#pgmDtlCts").val()) == "") {
				alert("강좌세부내용을 입력하세요");
				return;
			}
			if($.trim($("#supply").val()) == "") {
				alert("개인준비물을 입력하세요");
				return;
			}
			var fileNm = $.trim($("#delegateImg").val().toLowerCase());
			var ext = fileNm.substring(fileNm.lastIndexOf(".")+1);
			if($.trim($("#delegateImg").val()) != "")	 {
				if(ext != "bmp" && ext != "jpg" &&  ext != "gif" && ext != "png")	 {
					alert("이미지파일을 등록하세요\n 이미지 확장자는 bmp,jpg,gif,png 등록가능합니다.");
					return false;
				}	
			}
			
			var f = confirm("프로그램 부가정보를 등록하시겠습니까?");
			if(f){
				$("#frm").submit();	
			} else {
				return;
			} 
		});
		
		$("#cancelBtn").click(function(){
			location.href= "/admin/listPgmMng?gseq=${gseq}&lseq=${lseq}";
		})
		
		$(document).on("click","input[name=tmpRemoveBtn]",function(){
			$(this).parent().prev().remove();
			$(this).parent().remove();
		})
		
		$("input[name=rmThumbBtn]").click(function(){
			 $this = $(this);
			 var f = confirm("해당 이미지를 정말 삭제하시겠습니까?");
			 if(f){
				 var imgSeq = $(this).attr("data");
				 //ajax 통신
				 $.ajax({
		           	type:"POST", 
		           	url: "/admin/removePgmImg",
		           	data : {"imgSeq" : imgSeq},
		           	dataType : "json",
		          	success: function(data){
		        	  if(data.flag == "Y"){
		        		  $("#fileTh").attr("rowspan","1");
		        		  $this.parent().parent().parent().parent().remove();
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
				<h3>프로그램 관리</h3>
				<p class="navi"></p>
			</div>
			<div class="contents">  
				<div class="boardWrap">
					<form action="/admin/updatePgmMng?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm" enctype="multipart/form-data">
						<input type="hidden" name="upId" value="${fn:trim(pgmParam.upId) }" />
						<input type="hidden" name="pgmCd" value="${fn:trim(outpgm[0].pgmCd )}" />
						<input type="hidden" name="realFileNm" value="${pgm.realFileNm}" />
						<input type="hidden" name="pgmSeq" value="${pgm.pgmSeq}" />
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="bbsTbl">
							<colgroup>
								<col width="150px" />
								<col width="740px" />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">
									카테고리명
								</th>
								<td class="bd01td">
									${fn:trim(outpgm[0].comNm4 )} > ${fn:trim(outpgm[0].comNm2 )} > ${fn:trim(outpgm[0].comNm1 )}
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									프로그램명
								</th>
								<td class="bd01td">
									${fn:trim(outpgm[0].pgmNm )}
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									요일
								</th>
								<td class="bd01td" id="weekCdTd">
									${fn:trim(outpgm[0].dtWeekCd )}
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									시간
								</th>
								<td class="bd01td">
								${fn:substring(outpgm[0].startT,0,2)}:${fn:substring(outpgm[0].startT,2,4)}
								~
								${fn:substring(outpgm[0].endT,0,2)}:${fn:substring(outpgm[0].endT,2,4)}
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									대상(회비)
								</th>
								<td class="bd01td">
									<c:if test="${outpgm != null && fn:length(outpgm) > 0 }">
										<c:forEach items="${outpgm }" var="list">
											<strong>${list.comNm3 }</strong>&nbsp;(<fmt:formatNumber value="${list.uPrice }" pattern="#,###"/>)<br/>
										</c:forEach>
									</c:if>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									강좌소개
								</th>
								<td class="bd01td">
									<textarea rows="5" cols="80" name="pgmIntro" id="pgmIntro" style="width:100%; height:100px; ">${fn:trim(pgm.pgmIntro)}</textarea>
									<script type="text/javascript">
											loadEditor("pgmIntro");
									</script>
								</td>
							</tr> 
							<tr>
								<th class="ta_l" scope="row">
									강좌세부내용
								</th>
								<td class="bd01td">
									<textarea rows="5" cols="80" name="pgmDtlCts" id="pgmDtlCts" style="width:100%; height:100px; ">${fn:trim(pgm.pgmDtlCts)}</textarea>
									<script type="text/javascript">
											loadEditor("pgmDtlCts","two");
									</script>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									개인준비물
								</th>
								<td class="bd01td">
									<input type="text" name="supply" id="supply"  style="width: 400px" value="${fn:trim(pgm.supply)}" />
								</td>
							</tr>
							<c:set var="rowspan" value="1" />
							<c:if test="${pgm.imgPath != null && pgm.imgPath != ''  }">
								<c:set var="rowspan" value="2" />
							</c:if>
							<tr>
								<th id="fileTh" class="ta_l" scope="row" rowspan="${rowspan }">
									대표이미지첨부
								</th>
								<td class="bd01td">
									<input type="file" name="delegateImg" id="delegateImg"  />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<c:if test="${pgm.imgPath != null && pgm.imgPath != ''  }">
										<div class="test" style="position:relative; top:0px; left:0px; width:100px; height:100px; overflow:hidden; float: left;"> 
										    <div style='position:absolute; top:0px; left:0px; z-index:1; '>
										    	<img name="thumbImg" src="${pgm.imgPath }${pgm.realFileNm}" style="cursor: pointer;"/>
										    </div> 
										    <div style='position:absolute; top:0px; left:74px; z-index:2;'>
										    	<input type="button" name="rmThumbBtn" data="${pgm.pgmImgSeq}" value="X"/>
										    </div> 
									    </div>
								    </c:if>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">
									<label for="bwriter">강사 등록</label>
									<input type="button" id="searchTeacherBtn" value="강사조회"/>
								</th>
								<td class="bd01td" id="tempData">
									&nbsp;
									<c:if test="${teacher != null && fn:length(teacher) > 0 }">
										<c:forEach items="${teacher }" var="list">
											<span>${list.teacherNm } 강사<input type="hidden" name="teacherSeqArr" value="${list.teacherSeq}"/></span>
											<span><input type="button" name="tmpRemoveBtn" value="X"/><br/></span>
										</c:forEach>
									</c:if>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button -->
					<span class="txtBtn_lightGray"><a href="#" id="updateBtn" >등록</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="cancelBtn" >취소</a></span> 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>