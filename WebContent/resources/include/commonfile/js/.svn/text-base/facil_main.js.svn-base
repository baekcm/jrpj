$(function(){
	
	$(".tblWrap").find("td[name='weekCdTd']").each(function(e){
		var week = $.trim($(this).text());
		var length = week.length;
		var weekNm = "";
		var arr = new Array("월","화","수","목","금","토","일");
		for(var i=0; i<length; i++) {
			if(week.charAt(i) == "1") {
				weekNm += arr[i]+',';
			}
		}
		weekNm = weekNm.substring(0,weekNm.length-1);
		$(this).text(weekNm);
	});	
	
	$(function(){
		$(".noitceBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,4);
		});
		$(".tenderBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,9);
		});
		$(".recBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,10);
		});
		$(".lecBtn").click(function(){
			var dataSeq = $(this).attr("data");
			var com = $(this).attr("com");
			goBoard(dataSeq,com,8);
		});	
	});
	$("a[name=detailPgm]").click(function(){
		var pgmCd = $(this).find("input[name=pgmCd]").val();
		var comCd3 = $(this).find("input[name=detailPgm]").val();
		var onCnt = $(this).find("input[name=onCnt]").val();
		var offCnt = $(this).find("input[name=offCnt]").val();
		var saleId = $(this).find("input[name=saleId]").val();
		var upId = $(this).find("input[name=upId]").val();
		
		$("#pgmCd").val(pgmCd);
		$("#comCd3").val(comCd3);
		$("#onlineAcceptCnt").val(onCnt);
		$("#offlineAcceptCnt").val(offCnt);
		$("#pageFrm").attr("action","/front/formViewPgm/"+upId+"/"+saleId).submit();
	});
});
function goBoard(dataSeq ,com,boardSeq){
	$("#dataSeq").val(dataSeq);
	$("#commCodeSeq").val(com);
	$("#boardSeq").val(boardSeq);
	$("#pageFrm").attr("action","/front/notice/notice_view").submit();
}
function moreBoard(boardSeq,com){
	//$("#commCodeSeq").val(com);
	$("#pageFrm").attr("action","/front/notice/"+boardSeq+"/"+com).submit();
}
function morePhoto(boardSeq,com){
	//$("#commCodeSeq").val(com);
	$("#pageFrm").attr("action","/front/notice/"+boardSeq+"/"+com).submit();
}

function goBannerInfo(dataSeq ,boardSeq){
	$("#dataSeq").val(dataSeq);
	$("#boardSeq").val(boardSeq);
	$("#pageFrm").attr("action","/front/notice/notice_view").submit();
}
