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
<script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){ 
		 $( "#stDtm" ).datepicker({
				    dateFormat: 'yy-mm-dd'
		 });
		 $( "#edDtm" ).datepicker({
			    dateFormat: 'yy-mm-dd'
		 });
		 $("div.ui-datepicker").hide();
		 
		//질문추가 버튼 클릭
		$("#problemBtn").click(function(){
			var problemTag = "";
			problemTag += '<tr class="problemNo">';  
			problemTag += '	<th  class="ta_l" scope="row">';
			problemTag += '		질문';
			problemTag += ' </th>';
			problemTag += ' <td class="bd01td">';
			problemTag += ' 	<input type="text" size="40" name="problemContentArr" style="height: 18px" />';
			problemTag += ' 	<input type="hidden" name="questionCntArr" />';
			problemTag += '		<select name="problemTypeArr">';
			problemTag += '			<option value="">선택</option>';
			problemTag += '			<option value="0">객관식</option>';
			problemTag += '			<option value="1">주관식</option>';
			problemTag += '		</select>';
			problemTag += '		<span class="problemSpan" style="display:none;">문항수 : <input type="text" name="questionNo" size="2" style="height: 18px" />';
			problemTag += '		<input type="button" class="applyBtn" value="적용" /></span>';
			problemTag += '		<input type="button" class="removeBtn" value="삭제" />';
			problemTag += '</td>';
			problemTag += '</tr>';
			problemTag += '<tr>'; 
			problemTag += '		<td colspan="2">';
			problemTag += '			<table class="questionTbl bd00view" width="100%" border="0" cellspacing="0" cellpadding="0"></table>';
			problemTag += '		</td>';
			problemTag += '</tr>';
			$(this).parent().parent().parent().append(problemTag);
		});
		
		//삭제버튼 클릭
		$(document).on("click","input[type='button'].removeBtn",function(){
			$this = $(this);
			$this.parent().parent().next("tr").remove();
			$this.parent().parent().remove();
		});
		
		//문제유형 선택
		$(document).on("change","select[name=problemTypeArr]",function(){
			$this = $(this);
			if($this.find("option:selected").val() == "0") {
				$this.parent().find("span.problemSpan").show();	
			}
			if($this.find("option:selected").val() == "1") {
				$this.parent().find("span.problemSpan").hide();
				//신규추가 - 2014.02.19
				if($this.parent().parent().next().find("table.questionTbl tr.ctsTr").size() > 0) {
					var f = confirm("주관식으로 바꾸실경우 기존 객관식 내용들은 모두 초기화 됩니다.");
					if(f){
						$this.parent().parent().next().find("table.questionTbl").empty();
						$this.parent().find("span.problemSpan input[name=questionNo]").val("");
					} else {
						return;
					}
				}
			}
		});
		
		//적용버튼 클릭(해당수만큼 등록가능)
		$(document).on("click","input[type='button'].applyBtn",function(){
			$this = $(this);
			var appendCnt = parseInt($this.parent().find("input[name=questionNo]").val());
			
			var questionTag = ""; 
			questionTag +='<colgroup>';
			questionTag +='<col width="150px" />';
			questionTag +='<col />';
			questionTag +='</colgroup>';
			for(var i=0; i<appendCnt; i++) {
				//신규추가 ctsTr 클래스명 등록 - 2014.02.19
				questionTag +='<tr class="ctsTr">';
				questionTag +='		<th  class="ta_l" scope="row">';
				questionTag +='			내용';
				questionTag +='		</th>';
				questionTag +='		<td class="bd01td">';
				questionTag +='			<input type="text" name="qContentArr" style="width:500px;height: 18px" />';
				questionTag +='			<select name="qNoTypeArr">';
				questionTag +='				<option value="0">선택</option>';
				questionTag +='				<option value="1">기타</option>';
				questionTag +='			</select>';
				questionTag +='			<input type="button" class="rmBtn" value="삭제" />';
				questionTag +='		</td>';
				questionTag +='</tr>';	
			}
			$this.parent().parent().parent().next().find("td table.questionTbl").html(questionTag);
		});
		
		//삭제버튼 클릭
		$(document).on("click","input[type='button'].rmBtn",function(){
			$this = $(this);
			//신규추가 문항수 카운트 적용 - 2014.02.19 
			var cnt = $this.parent().parent().parent().parent().parent().parent().prev().find("input[name=questionNo]").val();
			$this.parent().parent().parent().parent().parent().parent().prev().find("input[name=questionNo]").val(parseInt(cnt)-1);
			$this.parent().parent().remove();
		});
		
		//목록 버튼 클릭
		$("#listBtn").click(function(){
			location.href = "/admin/listPoll?gseq=${gseq}&lseq=${lseq}";
		});
		
		//저장버튼 클릭
		$("#saveBtn").click(function(){
			//신규추가 validation 체크 시작 - 2014.02.19
			if($("#subject").val() == ""){
				alert("제목을 입력하세요");
				return;
			}
			
			var sHTML = oEditors.getById["contents"].getIR();
			if($.trim(sHTML) == "") {
				alert("설문 내용을 입력하세요");
				return;
			}
			
			$("#contents").val(sHTML);
			
			if($("#stDtm").val() == ""){
				alert("시작일을 입력하세요");
				return;
			}
			if($("#edDtm").val() == ""){
				alert("종료일을 입력하세요");
				return;
			}
			//시작일이 종료일보다 이후일 경우
			if($("#stDtm").val() > $("#edDtm").val()) {
				alert("시작일이 종료일이전이어야 합니다");
				return;
			}
			//질문들이 존재안하고 제목,저장여부,신청기간만 작성하고 등록버튼 클릭시 임시저장 (하지만 저장 select 되어있을경우)
			if($("#useYn").val() == "Y"){
				if($("tr.problemNo").size() == 0) {
					var f = confirm("질문이 존재하지않습니다.임시저장하시겠습니까?");
					if(f){
						$("#useYn").val("R");
					} else {
						return;
					}
				}	
			}
			
			//질문추가 버튼 클릭을 하고나서 의 validation
			if($("tr.problemNo").size() > 0) {
				var truefalse = true;
				$("tr.problemNo").each(function(){
					$this = $(this);
					if($.trim($this.find("input[name=problemContentArr]").val()) == ""){
						//질문입력을 안했을 경우
						alert("질문을 입력하세요");
						truefalse = false;
						return false;
					}
					
					if($this.find("select[name=problemTypeArr] option:selected").val() == "") {
						//객관식/주관식 선택을 안했을 경우
						alert("객관식/주관식 선택해주세요");
						truefalse = false;
						return false;
					} else if($this.find("select[name=problemTypeArr] option:selected").val() == "0"){
						//문제유형이 객관식일 경우
						if($.trim($this.find("input[name=questionNo]").val()) == ""){
							//질문문항수가 비어있을경우
							alert("문항수를 입력 후 적용해주세요");
							truefalse = false;
							return false;
						} else {
							if($this.next().find("table.questionTbl tr.ctsTr").size() == 0) {
								//내용 tr 0개일시 (적용버튼 클릭안함)
								alert("질문의 적용버튼을 클릭하여 내용을 설정해주세요");
								truefalse = false;
								return false;
							} else {
								//문항수가 0개보다 클경우 내용값이 들어있는지 체크
								$this.next().find("table.questionTbl tr.ctsTr input[name=qContentArr]").each(function(){
									if($(this).val() == "") {
										alert("질문에 대한 내용을 입력하세요");
										truefalse = false;
										return false;
									}
								});
								if(!truefalse) {
									return false;
								}
							}
						}
					}
				});
				if(!truefalse) {
					return;
				}
			}
			
			//신규추가 ctsTr 클래스명 등록 끝 - 2014.02.19
			
			$("table.questionTbl").each(function(i){
				$(this).parent().parent().prev().find("td input[name=questionCntArr]").val($(this).find("tr").size());
			});
			$("#stDtm").val($("#stDtm").val().replace(/-/gi, ""));
			$("#edDtm").val($("#edDtm").val().replace(/-/gi, ""));
			$("#frm").submit();
		});
	});
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
				<h3>설문조사 등록</h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<div class="boardWrap">
                	<form action="/admin/savePoll?gseq=${gseq }&lseq=${lseq}" method="post" name="frm" id="frm">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view" id="ctsTbl">
							<colgroup>
								<col width="150px" />
								<col />
							</colgroup>
							<tr>
								<th class="ta_l" scope="row">제목</th>
								<td class="bd01td">
									<input type="text" size="60" name="subject" id="subject" style="height: 18px" />
								</td>
							</tr> 
							<tr>
								<td colspan="2" scope="row" class="bd01tdC">
									<textarea name="contents" id="contents" cols="60" rows="30" title="내용입력" style="width:100%; height:300px; "></textarea>
									<script type="text/javascript">
										loadEditor("contents");
									</script>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">저장여부</th>
								<td class="bd01td">
									<select id="useYn" name="useYn">
										<option value="Y">저장</option>
										<option value="R">임시저장</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="ta_l" scope="row">신청기간</th>
								<td class="bd01td">
									<input type="text" size="10" name="stDtm" id="stDtm" readonly="readonly" style="height: 18px" />
									~
									<input type="text" size="10" name="edDtm" id="edDtm" readonly="readonly" style="height: 18px" />
									<input type="button" id="problemBtn" value="질문추가" />
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button -->
					<span class="txtBtn_lightGray"><a href="#" id="listBtn" >목록으로 가기</a></span> &nbsp; 
					<span class="txtBtn_lightGray"><a href="#" id="saveBtn" >등록</a></span> &nbsp; 
					<!-- Text Button --> 
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>