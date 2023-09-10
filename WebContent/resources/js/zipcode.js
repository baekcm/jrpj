var xmlHttp;
var toobj;
var areaCode = new Array("고양시", "부천시", "성남시", "수원시", "안산시", "안양시", "용인시", "포항시", "전주시", "청주시","천안시");

function sendpaging(curpage, totalcount, pagesize, blocksize){
    var returndata = "";

    var curblock =  Math.floor((curpage - 1) / blocksize) * blocksize + 1;
    var pagecount = Math.floor((totalcount - 1) / pagesize) + 1;

    returndata = "<table class=\"pagingTable\">\n"; 
    returndata += "    <tr>\n"; 
    returndata += "        <td>\n";

    if(curpage == 1)
        returndata += "[처음] ";
    else
        returndata += "<a href=\"javascript:sendmove(1)\">[처음]</a> ";

    if(curblock == 1)
        returndata += "[이전 " + blocksize + "개] ";
    else
        returndata += "<a href=\"javascript:sendmove(" + (curblock - blocksize) + ")\">[이전 " + blocksize + "개]</a> ";

    for(var i = 1; i <= blocksize && curblock <= pagecount; i++){
        if(curblock == curpage)
            returndata += "<span style=\"#FF0000\">" + curblock + "</span> ";
        else
            returndata += "<a href=\"javascript:sendmove(" + curblock + ")\">" + curblock + "</a> ";
        if(i < blocksize && curblock < pagecount)
            returndata += ": ";
        ++curblock;
    }

    if(curblock < pagecount)
        returndata += "<a href=\"javascript:sendmove(" + curblock + ")\">[다음 " + blocksize + "개]</a> ";
    else
        returndata += "[다음 " + blocksize + "개] ";

    if(curpage < pagecount)
        returndata += "<a href=\"javascript:sendmove(" + pagecount + ")\">[마지막]</a>\n";
    else
        returndata += "[마지막]\n";

    returndata += "        </td>\n"; 
    returndata += "    </tr>\n"; 
    returndata += "</table>\n"; 

    return returndata; 
}
//지번입력 패턴체크
function IsNotAddressNumber(strvalue)
{
    if (!strvalue.match(/^\d+-?\d*$/))
    {
        return true;
    }
    return false;
}

function formChange(idx) {
	$.ajax({
        type:"POST", 
        url: "/formZipcodeByIdx",
        data : {"listNo" : idx},
        success: function(data){
     		$("#formLayer").html(data);
        }, 
        error : function(request, status, error) {
			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
		}
	});
}

function sendsearchreadystatechange(data) {
    var resultdata = "";
    var setDetailJuso = "";
    
    var siNm = $(data).find("results").find("siNm");
    var sggNm = $(data).find("results").find("sggNm");
    var emdNm = $(data).find("results").find("emdNm");
    var liNm = $(data).find("results").find("liNm");
    var rn = $(data).find("results").find("rn");
    var rnCd = $(data).find("results").find("rnCd");
    var buldMnnm = $(data).find("results").find("buldMnnm");
    var buldSlno = $(data).find("results").find("buldSlno");
    var lnbrMnnm = $(data).find("results").find("lnbrMnnm");
    var lnbrSlno = $(data).find("results").find("lnbrSlno");
    var udrtYn = $(data).find("results").find("udrtYn");
    var mtYn = $(data).find("results").find("mtYn");
    var bdNm =$(data).find("results").find("bdNm");
    var bdKd = $(data).find("results").find("bdkd");
    var zipCl = $(data).find("results").find("zipCl");
    var intCurrentPage = $(data).find("results").find("intCurrentPage");
    var intCountPerPage = $(data).find("results").find("intCountPerPage");
    var totalCount = $(data).find("results").find("totalCount");
    
    if(siNm.length==0){
    	$("#formbox").css("height","25px");
        resultdata = "<span>검색된 결과가 없습니다.</span>";
    }else{
        resultdata = "<table summary=\"우편번호 목록 -번호,우편번호,주소 나타내는 표입니다\" class=\"postTable\">\n";
        resultdata += "    <caption class=\"hidden\">우편번호 목록</caption>\n";
        resultdata += "    <colgroup>\n";
        resultdata += "        <col width=\"40px\" />\n";
        resultdata += "        <col width=\"80px\" />\n";
        resultdata += "        <col width=\"360px\" />\n";
        resultdata += "    </colgroup>\n";
        resultdata += "    <tbody>\n";

        for(var i = 0; i < sggNm.length; i++) {
            var tempLnbr = "";
            var tempBuld = "";
            var jibun = "";
            var newaddr = "";
            var zip = "";

            if(lnbrSlno[i].firstChild.nodeValue != "0"){
                tempLnbr=lnbrMnnm[i].firstChild.nodeValue + "-" + lnbrSlno[i].firstChild.nodeValue;
            }else{
                tempLnbr=lnbrMnnm[i].firstChild.nodeValue;
            }
            if(buldSlno[i].firstChild.nodeValue != "0"){
                tempBuld=buldMnnm[i].firstChild.nodeValue + "-" + buldSlno[i].firstChild.nodeValue;
            }else{
                tempBuld=buldMnnm[i].firstChild.nodeValue;
            }

            if(siNm[i].firstChild.nodeValue == "세종특별자치시"){
                var temp = bdKd[i].firstChild.nodeValue;
                if(temp.substring(0,2) == "02" && bdNm[i].childNodes.length != "0")	setDetailJuso = "(" + bdNm[i].firstChild.nodeValue + ")";
                if(liNm[i].childNodes.length == "0"){
                    newaddr = siNm[i].firstChild.nodeValue + " " + rn[i].firstChild.nodeValue + " " + tempBuld;
                    jibun = siNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + tempLnbr;
                }else{
                    newaddr = siNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + rn[i].firstChild.nodeValue + ' ' + tempBuld;
                    jibun = siNm[i].firstChild.nodeValue + ' ' + emdNm[i].firstChild.nodeValue + " " + liNm[i].firstChild.nodeValue + ' ' + tempLnbr;
                }
            }else{
                if(liNm[i].childNodes.length == '0'){
                    var temp=bdKd[i].firstChild.nodeValue;
                    if(temp.substring(0,2) == "02" && bdNm[i].childNodes.length != "0")	setDetailJuso = "(" + emdNm[i].firstChild.nodeValue + "，" + bdNm[i].firstChild.nodeValue + ")";
                    else	setDetailJuso = "(" + emdNm[i].firstChild.nodeValue + ")";
                    newaddr = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + rn[i].firstChild.nodeValue + " " + tempBuld;
                    jibun = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + tempLnbr;
                }else{
                    var temp=bdKd[i].firstChild.nodeValue;
                    if(temp.substring(0,2) == "02" && bdNm[i].childNodes.length != "0")
                        setDetailJuso = "(" + bdNm[i].firstChild.nodeValue + ")";
                    newaddr = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " "  + rn[i].firstChild.nodeValue + " " + tempBuld;
                    jibun = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + liNm[i].firstChild.nodeValue + " " + tempLnbr;
                }
            }

            if(bdNm[i].childNodes.length!="0")	jibun += " " + bdNm[i].firstChild.nodeValue;

            if(zipCl[i].childNodes.length=="0"){
                zip = "-";
            }else{
                zip = zipCl[i].firstChild.nodeValue;
            }

            resultdata += "    <tr>\n";
            resultdata += "        <td>" + (i + 1) + "</td>\n";
            resultdata += "        <td><a href=\"javascript:senduse('" + zip + "','" + newaddr + "','" + jibun + "')\">" + zip + "</a></td>\n";
            resultdata += "        <td class=\'addList\'>[지번] " + jibun + "<br />[도로] " + newaddr + "</td>\n";
            resultdata += "    </tr>\n";
        }

        resultdata += "    </tbody>\n";
        resultdata += "</table>\n";

        if(siNm.length>0)   resultdata += sendpaging($("#curpage").val(), parseInt(totalCount[0].firstChild.nodeValue), parseInt(intCountPerPage[0].firstChild.nodeValue), 10);
        $("#formbox").css("height","170px");
    }
    $("#formbox").html(resultdata);
}

function sendsearch(){
	$("input[name=category]").each(function(i){
		if($(this).prop("checked")){
			if(i == 0) {
				if($("#city").val() == ""){
					alert("시도를 선택하여 주십시오.");
					$("#city").focus();
					return;
				}
				if($("#county").val() == ""){
					alert("시군구를 선택하여 주십시오.");
					$("#county").focus();
					return;
				}
				if($.trim($("#doroname").val()) == ""){
					alert("도로명을 입력하여 주십시오.");
					$("#doroname").focus();
					return;
				}
				if($("#bldgno1").val() != ""){
					if(IsNotAddressNumber($("#bldgno1").val())) {
    					alert("건물번호를 숫자로만 입력하십시오.");
    					$("#bldgno1").focus();
    					return;
					}
				}
				if($("#bldgno2").val() != ""){
					if(IsNotAddressNumber($("#bldgno2").val())) {
    					alert("건물번호를 숫자로만 입력하십시오.");
    					$("#bldgno2").focus();
    					return;
					}
				}

	           var cityname = $("#city option:selected").text();
	           var countyname = $("#county option:selected").text();
	           var url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/link/search.do" + escape("?extend=true&mode=road_search&searchType=location_newaddr&topTab=1&engineCtpNm=" + encodeURI(cityname) + "&engineSigNm=" + encodeURI(countyname) + "&engineRdNm=" + encodeURI($.trim($("#doroname").val())) + "&engineBdMaSn=" + encodeURI($("#bldgno1").val()) + "&engineBdSbSn=" + encodeURI($("#bldgno2").val()) + "&currentPage=" + encodeURI($("#curpage").val()));
	           
	           $("#resultbox").show();
		            $("#formbox").html('<span style=\"color:#0000FF\">처리중입니다.</span>');
	           
	           $.ajax({
  	               type:"POST", 
  	               url: url,
  	               success: sendsearchreadystatechange, 
  	               error : function(request, status, error) {
  	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
  	       		   }
   		       })
			} else if(i == 1) {
				if($("#city").val() == ""){
					alert("시도를 선택하여 주십시오.");
					$("#city").focus();
					return;
				}
				if($("#county").val() == ""){
					alert("시군구를 선택하여 주십시오.");
					$("#county").focus();
					return;
				}

		            var cityname = $("#city option:selected").text();
		            var countyname = $("#county option:selected").text();
		            var townname = ($("#town").val() == "") ? "" : $("#town option:selected").text();
		            var riname = ($("#ri").val() == "") ? "" : $("#ri option:selected").text();
		            var issan = ($("#san").prop("checked")) ? "1" : "0";
		            var url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/link/search.do?" + escape("extend=false&mode=jibun_search&searchType=location_jibun&topTab=1&engineCtpNm=" + encodeURI(cityname) + "&engineSigNm=" + encodeURI(countyname) + "&engineEmdNm=" + encodeURI(townname) + "&engineLiNm=" + encodeURI(riname) + "&engineBdMaSn=" + encodeURI($("#bunji1").val()) + "&engineBdSbSn=" + encodeURI($("#bunji2").val()) + "&engineMtYn=" + encodeURI(issan) + "&currentPage=" + encodeURI($("#curpage").val()));
		      
		            $("#resultbox").show();
		            $("#formbox").html('<span style=\"color:#0000FF\">처리중입니다.</span>');
		      
   		   		$.ajax({
	  	               type:"POST", 
	  	               url: url,
	  	               success: sendsearchreadystatechange, 
	  	               error : function(request, status, error) {
	  	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
	  	       		   }
	   		     })
			} else {

				if($("#city").val() == ""){
					alert("시도를 선택하여 주십시오.");
					$("#city").focus();
					return;
				}
				if($("#county").val() == ""){
					
					alert("시군구를 선택하여 주십시오.");
					$("#county").focus();
					return;
				}
				if($.trim($("#bldgname").val()) == ""){
					 alert("건물명을 입력하여 주십시오.");
					$("#bldgname").focus();
					return;
				}

	            var cityname = $("#city option:selected").text();
	            var countyname = $("#county option:selected").text();
	            var townname = ($("#town").val() == "") ? "" : $("#town option:selected").text();
	            var url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/link/search.do?" + escape("extend=true&mode=road_search&searchType=location_buld&topTab=1&engineCtpNm=" + encodeURI(cityname) + "&engineSigNm=" + encodeURI(countyname) + "&engineEmdNm=" + encodeURI(townname) + "&engineBdNm=" + encodeURI($.trim($("#bldgname").val())) + "&currentPage=" + encodeURI($("#curpage").val()));
	            
	            $("#resultbox").show();
		            $("#formbox").html('<span style=\"color:#0000FF\">처리중입니다.</span>');
		            
	            $.ajax({
	  	               type:"POST", 
	  	               url: url,
	  	               success: sendsearchreadystatechange, 
	  	               error : function(request, status, error) {
	  	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
	  	       		   }
	   		   })
			}
		}
	})
}


function sendkeydown()
{
    if(event.keyCode == 13){
        sendsearch();
    }
}

function isExceptArea(code) {
    for(var i=0; i<areaCode.length; i++)
    {
        element = areaCode[i];
        if(element == code)
        {
            return true;
        }
    }
    return false;
}

function sendcombochange(obj) {
    var form1 = document.jform;
    if(obj.val() == "") return;
    if($("input[name=category]:eq(0)").prop("checked")) {
        switch(obj.attr("id")) {
            case "city":
                toobj = form1.county;
                if(obj.val() == "36") {
                    toobj.disabled = true;
                    toobj.length = 1;
                }else{
                    if(toobj.disabled)	toobj.disabled = false;
                    toobj.length = 1;
                    var url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(obj.val()));
                    $.ajax({
       	               type:"POST", 
       	               url: url,
       	               success: sendcomboreadystatechange, 
       	               error : function(request, status, error) {
       	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
       	       		   }
        		    })
                }
                break;
        }
    }else if($("input[name=category]:eq(1)").prop("checked")) {
        switch(obj.attr("id"))
        {
            case "city":
                toobj = form1.county;
                var url = "";
                if(obj.val() == "36") {
                    toobj.disabled = true;
                    toobj.length = 1;
                    toobj = form1.town;
                    toobj.length = 1;
                    form1.ri.length = 1;
                    url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(obj.val()));
                } else {
                    if(toobj.disabled) toobj.disabled = false;
                    toobj.length = 1;
                    form1.town.length = 1;
                    form1.ri.length = 1;
                    url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(obj.val()));
                }

                $.ajax({
    	               type:"POST", 
    	               url: url,
    	               success: sendcomboreadystatechange, 
    	               error : function(request, status, error) {
    	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
    	       		   }
     		    })
                break;
            case "county":
                toobj = form1.town;
                toobj.length = 1;
                form1.ri.length = 1;
                var url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI($("#city").val() + obj.val()));

                $.ajax({
 	               type:"POST", 
 	               url: url,
 	               success: sendcomboreadystatechange, 
 	               error : function(request, status, error) {
 	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
 	       		   }
  		    	})
                break;
            case "town":
                toobj = form1.ri;
                toobj.length = 1;
                form1.ri.length = 1;
                var url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI($("#city").val() + $("#county").val() + obj.val()));

                $.ajax({
 	               type:"POST", 
 	               url: url,
 	               success: sendcomboreadystatechange, 
 	               error : function(request, status, error) {
 	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
 	       		   }
  		    	})
                break;
        }
    } else if($("input[name=category]:eq(2)").prop("checked")) {
        switch(obj.attr("id")) {
            case "city":
                toobj = form1.county;
                var url = "";
                if(obj.val() == "36") {
                    toobj.disabled = true;
                    toobj.length = 1;
                    toobj = form1.town;
                    toobj.length = 1;
                    url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(obj.val()));
                } else {
                    if(toobj.disabled)
                        toobj.disabled = false;
                    toobj.length = 1;
                    form1.town.length = 1;
                    url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(obj.val()));
               }
                $.ajax({
  	               type:"POST", 
  	               url: url,
  	               success: sendcomboreadystatechange, 
  	               error : function(request, status, error) {
  	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
  	       		   }
   		    	})
                break;
            case "county":
                toobj = form1.town;
                toobj.length = 1;
                var url = "/resources/popup/search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(obj.attr("name")) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI($("#city").val() + obj.val()));

                $.ajax({
  	               type:"POST", 
  	               url: url,
  	               success: sendcomboreadystatechange, 
  	               error : function(request, status, error) {
  	       			alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
  	       		   }
   		    	})
                break;
        }
    } 
}

function sendcomboreadystatechange(data)
{
    var names =  $(data).find("name");
    var values = $(data).find("value");
    //  리스트 수만큼 option을 달아준다
    for(var i = 0; i < values.length; i++){
        if(isExceptArea(names[i].firstChild.nodeValue))  continue;
        else {
            var option = new Option(names[i].firstChild.nodeValue, values[i].firstChild.nodeValue);
            option.title = names[i].firstChild.nodeValue;
            toobj.options.add(option);
        }
    }

    if(names.length == "0" && toobj.name != "ri") {
        alert('네트워크가 원활하지 않습니다.\n\n다시선택하여 주시기를 바립니다.');
        return;
    }
}