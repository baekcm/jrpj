<%@  page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/zipcode.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/zipcode.js"></script>
<script type="text/javascript">
	$(function(){
		formChange(1);
		
		$("#closeBtn").click(function(){
			window.close();
		})
		//도로명주소,지번,건물명
		$("input.BdNone").click(function(){
			$this = $(this);
			var idx = $("input[name=category]").index(this);
			formChange(parseInt(idx+1));
		});
		
		//검색클릭
		$(document).on("click","input[name=btnfind]",function(){
			sendsearch();
		})
		
		//SELECT BOX CHANGE
		$(document).on("change","#city,#county,#town",function(){
			sendcombochange($(this));
		})
	});
    
    function senduse(postcode, address, address_old) {
    	 $(opener.document).find("#${zip1}").val(postcode.substr(0,3));
    	 $(opener.document).find("#${zip2}").val(postcode.substr(4,3));
    	 $(opener.document).find("#${addr}").val(address);
        window.close();
    }
    
    function sendmove(value) {
        $("#curpage").val(value);
        sendsearch();
    }
</script>
</head>
<body>
    <form name="jform">
    	<input type="hidden" id="curpage" name="curpage" value="1" />
	    <div class="wrap">
	        <div class="titArea">
	            <span class="engT">REGION NUMBER</span> 
	            <span class="korT">우편번호 검색</span>
	        </div>
	        <div class="input_area">
	            <!--/검색체크 영역 시작/-->
	            <div class="searchArea">
	                <label><input type="radio" name="category" class="BdNone" value="doro" checked="checked" />도로명주소</label>
	                <label><input type="radio" name="category" class="BdNone" value="jibun"  />지번</label>
	                <label><input type="radio" name="category" class="BdNone" value="sangho" />건물명</label>
	            </div>
	            <!--/검색체크 영역 끝/-->
	            <div id="formLayer"></div>
	        </div>
	        
	        <div id="resultbox" class="post_titleArea" style="display:none">
	            <table summary="우편번호 목록 -번호,우편번호,주소 나타내는 표입니다" class="postTable">
	                <caption class="hidden">우편번호 목록</caption>
	                <colgroup>
	                    <col width="40px" />
	                    <col width="80px" />
	                    <col width="360px" />
	                </colgroup>
	                <thead>
	                <tr>
	                    <th scope="col">번호</th> 
	                    <th scope="col">우편번호</th>
	                    <th scope="col">주소</th>
	                </tr>
	                </thead>
	            </table>
	            <div id="formbox" class="post_listArea"></div>
	            <table style="480px">
	            	<tr>
	            		<td></td>
	            	</tr>
	            </table>
				<input type="button" class="btn_clos" id="closeBtn" value="닫기" />
	        </div>
	        
	    </div>
    </form>
</body>
</html>