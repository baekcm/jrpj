<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,target-densitydpi=medium-dpi" />
<meta name='apple-mobile-web-app-capable' content='yes'>
<meta name='apple-mobile-web-app-status-bar-style' content='black'>
<script type="text/javascript">    
            window.addEventListener('load', function(){
            setTimeout(scrollTo, 0, 0, 1)
            },false);
</script>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>



<script type="text/javascript">
$(document).ready(function(e) {
	$('.tbl01').before('<div class="tblbefore"></div>');
	$('.imgTable').click(function(e) {
		var tmpPage=$(this).attr('src');
		window.open(tmpPage,'_blank');
	});
	
	$('.guide .none IMG').click(function(e) {
		var tmpPage2=$(this).attr('src');
		window.open(tmpPage2,'_blank');
	});
	
	$('.wideImg').css('width','100%');
	
	
});

function totalMenu() {
	if($('#totalMenu').val() == "4" || $('#totalMenu').val() == "9" || $('#totalMenu').val() == "10" || $('#totalMenu').val() == "8" ){
		goList($('#totalMenu').val());
	}
	else{
	window.location.href=$('#totalMenu').val();
	}
}

function goList(boardSeq){
	$("#frmBoardSeq").val(boardSeq);
	$("#boardFrm").attr("action", "/m/listNotice").submit();
}
</script>
<form method="post" name="boardFrm" id="boardFrm">
<input type="hidden" name="boardSeq" id="frmBoardSeq"/>
</form>