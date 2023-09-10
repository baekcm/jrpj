<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="/resources/admin_include/commonfile/js/excanvas.js"></script><![endif]-->
<jsp:include page="/common/commoninc.jsp" />
<link rel="stylesheet" href="/resources/css/jquery-ui.css" type="text/css" media="all" />
<script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
<c:set var="tab" value="" />
<c:set var="title" value="" />
<c:if test="${flag eq 'site' }">
	<c:set var="tab" value="1" />
	<c:set var="title" value="접속통계" />
</c:if>
<c:if test="${flag eq 'member' }">
	<c:set var="tab" value="0" />
	<c:set var="title" value="회원가입통계" />
</c:if>
<script type="text/javascript">
	$(function(){
		$( "#stYmd" ).datepicker({
		    dateFormat: 'yy-mm-dd'
	 	});
		$( "#edYmd" ).datepicker({
		    dateFormat: 'yy-mm-dd'
	 	});
		$("div.ui-datepicker").hide();
		
		callChart(${tab},0);
		//하위탭통계
  		$("a.subTab").click(function(){
  			if($(this).parent().hasClass("choiced")) {
  				return;
  			}
  			var idx = $("a.subTab").index(this);
  			$("input[name=subTab]").val(idx);
  			$("a.subTab").parent().removeClass("choiced");
  			$("a.subTab:eq("+idx+")").parent().addClass("choiced");
  			
  			if(idx < 4) {
  				$("#stY").html("");
  				$("#stYmd").val("");
  				$("#edYmd").val("");
  				$("div.pageTopSearch").hide();
  				$("#yearSpn").html($.trim($("#year").val())+"년");
  				$("#monthSpn").html($.trim($("#month").val())+"월");
  				$("#weekSpn").html($.trim($("#week").val())+"주차");
  			}
  			
  			if(idx == 0) {
  				$("#monthSpn").hide();
  				$("#weekSpn").hide();
  				$("#yearSpn").hide();
  				$("#monthSearch").hide();
  				$("#yearSearch").hide();
  			}else if(idx == 1) {
  				$("#yearSpn").show();
  				$("#monthSpn").hide();
  				$("#weekSpn").hide();
  				$("#monthSearch").hide();
  				
  				var y = parseInt($("#year").val());
  				var my = y-5;
  				var py = y+5;
  				var tag = "";
  				for(var i=my; i<y; i++){
  					tag += "<option value="+i+">"+i+"년</option>";
  				}
  				tag += "<option value="+y+" selected='selected'>"+y+"년</option>";
  				for(var i=y+1; i<py; i++){
  					tag += "<option value="+i+">"+i+"년</option>";
  				}
  				$("select[name=stY]").html(tag);
  				$("#yearSearch").show();
  			} else if(idx == 2) {
  				$("#yearSpn").show();
  				$("#monthSpn").show();
  				$("#weekSpn").hide();
  				$("#monthSearch").show();
  				$("#yearSearch").hide();
  				
  				var y = parseInt($("#year").val());
  				var my = y-5;
  				var py = y+5;
  				var tag = "";
  				for(var i=my; i<y; i++){
  					tag += "<option value="+i+">"+i+"년</option>";
  				}
  				tag += "<option value="+y+" selected='selected'>"+y+"년</option>";
  				for(var i=y+1; i<py; i++){
  					tag += "<option value="+i+">"+i+"년</option>";
  				}
  				$("select[name=stY]").html(tag);
  				
  				var tmpMonth = "${month}";
  				if(tmpMonth.substring(0,1) == "0") {
  					tmpMonth = tmpMonth.substring(1);
  				}
  				$("#stM").val(tmpMonth);
  			} else if(idx == 3) {
  				$("#yearSpn").show();
  				$("#monthSpn").show();
  				$("#weekSpn").show();
  				$("#monthSearch").hide();
  				$("#yearSearch").hide();
  			}
  			callChart(${tab},idx);
  		});
		
		$(document).on("change","select[name=stY]",function(){
			var y = parseInt($(this).val());
			var my = y-5;
			var py = y+5;
			var tag = "";
			for(var i=my; i<y; i++){
				tag += "<option value="+i+">"+i+"년</option>";
			}
			tag += "<option value="+y+" selected='selected'>"+y+"년</option>";
			for(var i=y+1; i<py; i++){
				tag += "<option value="+i+">"+i+"년</option>";
			}
			$(this).html(tag);
		});
  		
		$("#searchBtn1").click(function(){
			if($.trim($("#stYmd").val()) == ""){
				alert("시작일을 선택하세요");
				return;
			}
			if($.trim($("#edYmd").val()) == ""){
				alert("종료일을 선택하세요");
				return;
			}
			var stYmd = $("#stYmd").val().replace(/-/gi, "");
			var edYmd = $("#edYmd").val().replace(/-/gi, "");
			
			if(stYmd == "" && edYmd != "") {
				alert("시작일과 종료일 모두 있거나 없어야 합니다.");
				return;
			}
			if(edYmd == "" && stYmd != "") {
				alert("시작일과 종료일 모두 있거나 없어야 합니다.");
				return;	
			}
			
			if(stYmd > edYmd) {
				alert("기간조건이 종료일보다 시작일이 더 클수 없습니다.");
				return;
			}
			$.ajax({
		           type:"POST", 
		           url: "/admin/formChart",
		           data : {"mainTab" : "${tab}", "subTab":"4", "stYmd":stYmd, "edYmd":edYmd},
		           success: function(data){
		        	   var st = $("#stYmd").val().replace(/-/gi, ".");
		        	   var ed = $("#edYmd").val().replace(/-/gi, ".");
		        	   $("#slctSpn").html(st+"~"+ed).show();
		        	   $("#chart1").empty();
			           eval(data);
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		});
		
		$("#searchBtn2").click(function(){
			var year = $("#searchBtn2").parent().find("select[name=stY] option:selected").val();
      	    var month = $("#stM").val();
      	    if(month.length == 1){
      	    	month = "0"+month;
      	    }
			$.ajax({
		           type:"POST", 
		           url: "/admin/formChart",
		           data : {"mainTab" : "${tab}", "subTab":"2", "sty":year,"stm":month},
		           success: function(data){
		        	  $("#yearSpn").html(year+"년");
		        	  $("#monthSpn").html(month+"월");
		        	  $("div.textBox1").show();
		        	  $("#chart1").empty();
		        	  $("#weekSpn").hide();
		        	  $("#slctSpn").hide();
		        	  eval(data);
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		});
		
		$("#searchBtn3").click(function(){
			var year = $("#searchBtn3").parent().find("select[name=stY] option:selected").val();
			$.ajax({
		           type:"POST", 
		           url: "/admin/formChart",
		           data : {"mainTab" : "${tab}", "subTab":"1", "sty":year},
		           success: function(data){
		        	  $("#yearSpn").html(year+"년");
		        	  $("div.textBox1").show();
		        	  $("#chart1").empty();
		        	  $("#monthSpn").hide();
		        	  $("#weekSpn").hide();
		        	  $("#slctSpn").hide();
		        	  eval(data);
		           }, 
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
			});
		});
		
		$("#excelBtn").click(function(){
			if($("input[name=subTab]").val() == "1") {
				$("input[name=sty]").val($("#yearSearch select[name=stY] option:selected").val());
				$("input[name=stm]").val("");
				$("input[name=stYmd]").val("");
				$("input[name=edYmd]").val("");
			} else if($("input[name=subTab]").val() == "2") {
				$("input[name=sty]").val($("#monthSearch select[name=stY] option:selected").val());
				$("input[name=stm]").val($("#monthSearch #stM").val());
				$("input[name=stYmd]").val("");
				$("input[name=edYmd]").val("");
			} else if($("input[name=subTab]").val() == "4"){
				if($.trim($("#stYmd").val()) == "" || $.trim($("#edYmd").val()) == "" || $.trim($("#chart1").html()) == "") {
					alert("기간 조회 후 다운가능합니다.");
					return;
				}
				
				var stYmd = $("#stYmd").val().replace(/-/gi, "");
				var edYmd = $("#edYmd").val().replace(/-/gi, "");
				
				$("input[name=sty]").val("");
				$("input[name=stm]").val("");
				$("input[name=stYmd]").val(stYmd);
				$("input[name=edYmd]").val(edYmd);
			}
			$("#pageFrm").attr("action","/admin/excelDownChart").submit();
		});
	});
</script>
<!-- Don't touch this! -->
<script type="text/javascript" src="/resources/admin_include/commonfile/js/jquery.jqplot.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/syntaxhighlighter/scripts/shBrushXml.js"></script>
<!-- Additional plugins go here -->
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="/resources/admin_include/commonfile/js/plugins/jqplot.pointLabels.js"></script>
<!-- End additional plugins -->
</head>
<body>
<form action="/admin/excelDownChart" name="pageFrm" id="pageFrm" method="post">
	<input type="hidden" name="mainTab" value="${tab }" />
	<input type="hidden" name="subTab" value="0" />
	<input type="hidden" name="sty" />
	<input type="hidden" name="stm" />
	<input type="hidden" name="stYmd" />
	<input type="hidden" name="edYmd" />
</form>
<input type="hidden" id="year" value="${year }"/>
<input type="hidden" id="month" value="${month } "/>
<input type="hidden" id="week" value="${week }"/>
<jsp:include page="/common/gnb.jsp" />
	<div id="middle">
		<div id="contbody">
			<div id="contleft">
				<h2></h2>
				<jsp:include page="/common/lnb.jsp" />
			</div>
			<div id="contentcore">
				<div class="naviandtitle">
					<h3>${title }</h3>
					<p class="navi"></p>
				</div>
				<div class="contents"> 
					<div class="pageSection">
							<div class="ttabWrap">
								<ul id="ttab3">
									<li class="choiced"> <a style="text-decoration: none;cursor: pointer;" id="yearTab" class="subTab"> 년도별 </a> </li>
									<li> <a style="text-decoration: none;cursor: pointer;" id="monthTab" class="subTab"> 월별 </a> </li>
									<li> <a style="text-decoration: none;cursor: pointer;" id="dayTab" class="subTab"> 일별 </a> </li>
									<li> <a style="text-decoration: none;cursor: pointer;" id="dateTab" class="subTab"> 요일별 </a> </li>
									<li> <a style="text-decoration: none;cursor: pointer;" id="searchTab" class="subTab"> 기간별 </a> </li>
								</ul> 
							</div>
							<div style="height: 20px;"></div> 
							<div style="text-align: center; font-size: 15px;font-weight: bold;" class="textBox1">
								 <span id="yearSpn" style="text-align: center;margin-top: 10px; font-size: 15px;font-weight: bold; display: none;">${year }년</span>
								 <span id="monthSpn" style="text-align: center;margin-top: 10px; font-size: 15px;font-weight: bold; display: none;">${month }월</span> 
								 <span id="weekSpn" style="text-align: center;margin-top: 10px; font-size: 15px;font-weight: bold; display: none;">${week }주차</span> 
								 <span id="slctSpn" style="text-align: center;margin-top: 10px; font-size: 15px;font-weight: bold; display: none;"></span>
							</div>
							<div class="pageTopSearch" id="slctSearch" style="display: none;">
								시작일 : &nbsp;<input type="text" id="stYmd" name="stYmd" style="width: 80px" readonly="readonly" />
								~ 
								종료일 : &nbsp;<input type="text" id="edYmd" name="edYmd" style="width: 80px" readonly="readonly" />
								<input type="image" alt="검색" id="searchBtn1" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
							</div>
							<div class="pageTopSearch" id="monthSearch" style="display: none;">
								<select name="stY"></select>
								<select id="stM">
									<c:forEach begin="1" end="12" varStatus="status">
										<option value="${status.count }"
											<c:if test="${month eq status.count }">selected="selected"</c:if>
										>${status.count }월</option>
									</c:forEach>
								</select>
								<input type="image" alt="검색" id="searchBtn2" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
							</div>
							<div class="pageTopSearch" id="yearSearch" style="display: none;">
								<select name="stY"></select>
								<input type="image" alt="검색" id="searchBtn3" src="/resources/admin_include/commonfile/image/common/btn_search.gif" />
							</div>
							<div id="chart1" style="height:300px;"></div>
							<div class="btn_farm2 mt20 mb20" style="text-align: right;">
								<span class="txtBtn_lightGray"><a href="#" id="excelBtn" >엑셀다운로드</a></span> &nbsp;
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>