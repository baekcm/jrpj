<%@  page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%
String target = request.getParameter("category");
String comp = request.getParameter("comp");

String res	=	"";

if( (target != null) && (!"null".equals(target)) ){
	res	=	target;
	
	res	=	res.replaceAll("&", "&amp;");
	res	=	res.replaceAll(">", "&gt;");
	res	=	res.replaceAll("<", "&lt;");
	res	=	res.replaceAll("'", "&#39;");
	res	=	res.replaceAll("\"", "&quot;");
	if(res.toLowerCase().indexOf("script") >=0){
		res	=	res.replaceAll("script", "hscript");	
	}
	
}

	String value = res;
	if(res == null || res.equals(""))
		value = "doro";
	 
	 String category   =value;	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="No-Cache" />
    <meta http-equiv="Pragma" content="No-Cache" />
    <!-- <title>에버러닝 관리자::</title> -->
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
    <style type="text/css"> 
    body{margin:0; padding:0; font-family:Dotum, Gulim; font-size:12px; line-height:140%; color:#666; word-wrap:break-word;word-break:break-all;}
    table {border-collapse:collapse;}
    ul,ol{list-style:none; margin:0; padding:0; }
    input, select {font:normal 12px/12px dotum; vertical-align:middle; }
    .BgNone {background:none !important;}
    .BdNone {border:none !important;}
    .hidden {position:absolute; top:0; left:0; overflow:hidden;text-indent:-9999px; margin-top:-10000px;}
    caption, legend {position:absolute; top:0; left:0; overflow:hidden;text-indent:-9999px; *height:0; line-height:0; }
    .inputText {border:solid 1px #ccc; }
    .MAL0 {margin-left:0px !important;}
    .MAL5 {margin-left:5px !important;}
    .MAL10 {margin-left:10px !important;}
    .MAL15 {margin-left:15px !important;}

    /* 강조색 */
    .emp1 {color:#306cbc !important;} /* 파란색 */
    .emp2 {color:#0b8e68 !important;} /* 녹색 */
    .emp3 {color:#157e98 !important;} /* 진청색 */
    .emp4 {color:#5c6dac !important;} /* 파보중간 */
    .emp5 {color:#408839 !important;} /* 연한녹색 */
    .emp6 {color:#000000 !important;} /* 검정 */
    .emp7 {color:#ab2424 !important;} /* 빨간 */
    .emp8 {color:#cb6f1d !important;} /* 연한오렌지 */
    .emp9 {color:#ff6000 !important;} /* 오렌지 */

    /*페이지 css*/
    .wrap { width:500px;  }
    .titArea {height:80px; background: url(/resources/popup/pic_top_address.jpg) 0 0 repeat-x; 
    margin-bottom:10px;}
    .titArea .engT {margin-left:20px; padding-top:10px; font:bold 12px/18px dotum; color:#fff;display:block;}
    .titArea .korT {margin-left:20px; font:bold 30px/40px dotum; color:#fff;display:block;}
    .input_area .searchArea {font:bold 14px/30px dotum; color:#0F5CB0; text-align:center; border-top:solid 1px #ddd;  border-bottom:solid 1px #ddd; }
    .input_area .infoArea {font:normal 11px/18px dotum; margin:10px;}
    .input_area .regiArea {background:#efefef; padding:10px;text-align:center;}
    .input_area .regiArea label{font:bold 12px/18px dotum;}
    .btn {font:bold 11px/12px dotum; height:18px; background:#0F5CB0; color:#fff; }
    .btn_close {font:bold 11px/16px dotum; height:20px; padding:0px 30px; background:#04436A; color:#fff; }
    .btnArea {text-align:center; margin:20px 0px;}
    .post_titleArea {margin:15px 0 0 8px; padding:0px 8px 0px 0px; width:472px; height:270px; border-top:#82c61d 2px solid; background:#fff; font:normal 11px/16px dotum; text-align: center;}
    .post_listArea {margin-bottom:10px; padding:0px; width:480px; height:25px; overflow:auto; overflow-x:hidden; background:#fff; font:normal 11px/16px dotum; border-bottom:solid 1px #ccc;}
    .postTable {margin:0; width:480px; display:block; }
    .formarea { width: 440px; margin-bottom: 5px; margin-right: 15px; display:inline-block; }
    .formarea li { height: 20px; }
    .formarea li .title { display:inline-block; width: 60px; text-align: right; }
    .formarea li.first { float: left; }
    .formarea li.second { float: right; }

    .postTable thead {}
    .postTable thead th {height:30px; color:#666; background:#ddd; border-bottom:solid 1px #ccc;}
    .postTable tbody td {text-align:center; padding:5px 1px; border-bottom:solid 1px #dddddd; line-height:150%;}
    .postTable tbody td.addList { text-align:left; padding-left:10px; }
    .postTable tbody td.noData {height:100px; background:none; width:480px;}
    .postInputTable {margin:0; width:480px; display:block; }
    .postInputTable tbody th {height:30px; color:#666; background:#ddd; border-top:solid 1px #ccc; border-bottom:solid 1px #ccc;}
    .postInputTable tbody td {padding:5px 1px 4px 4px; border-top:solid 1px #dddddd; border-bottom:solid 1px #dddddd;}
    .pagingTable { margin:0; width:480px; }
    </style>
    <script type="text/javascript">
    //<![CDATA
    var xmlHttp;
    var toobj;

    function isExceptArea(code)
    {
        //areaCode = new Array("41280", "41190", "41130", "41110", "41270", "41170", "41460", "47110", "45110", "43110", "43130");
        var areaCode = new Array("고양시", "부천시", "성남시", "수원시", "안산시", "안양시", "용인시", "포항시", "전주시", "청주시","천안시");
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

    function createXMLHttpRequest()
    {
        if(xmlHttp != null)
        {
            xmlHttp.Abort();
            delete xmlHttp;
            xmlHttp = null;
        }

        if (window.ActiveXObject)
        {
           xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        } 
        else if (window.XMLHttpRequest)
        {
           xmlHttp = new XMLHttpRequest();
        }
    }

    function sendXMLHttpRequest(url, callback)
    {
        createXMLHttpRequest();

        xmlHttp.onreadystatechange = callback;
        xmlHttp.open("GET", url, true);
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xmlHttp.send(null);
    }

    function deleteXMLHttpRequest()
    {
        delete xmlHttp;
        xmlHttp = null;
    }

    function sendcombochange(combo)
    {
        var form1 = document.jform;

        if(combo.value == "")
            return;

        if(form1.category[0].checked)
        {
            switch(combo.name)
            {
                case "city":
                    toobj = form1.county;
                    if(combo.value == "36")
                    {
                        toobj.disabled = true;
                        toobj.length = 1;
                    }
                    else
                    {
                        if(toobj.disabled)
                            toobj.disabled = false;
                        toobj.length = 1;
                        var url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(combo.value));

                        sendXMLHttpRequest(url, sendcomboreadystatechange);
                    }
                    break;
            }
        }
        else if(form1.category[1].checked)
        {
            switch(combo.name)
            {
                case "city":
                    toobj = form1.county;
                    var url = "";
                    if(combo.value == "36")
                    {
                        toobj.disabled = true;
                        toobj.length = 1;
                        toobj = form1.town;
                        toobj.length = 1;
                        form1.ri.length = 1;
                        url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(combo.value));
                    }
                    else
                    {
                        if(toobj.disabled)
                            toobj.disabled = false;
                        toobj.length = 1;
                        form1.town.length = 1;
                        form1.ri.length = 1;
                        url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(combo.value));
                    }

                    sendXMLHttpRequest(url, sendcomboreadystatechange);
                    break;
                case "county":
                    toobj = form1.town;
                    toobj.length = 1;
                    form1.ri.length = 1;
                    var url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(form1.city.value + combo.value));

                    sendXMLHttpRequest(url, sendcomboreadystatechange);
                    break;
                case "town":
                    toobj = form1.ri;
                    toobj.length = 1;
                    form1.ri.length = 1;
                    var url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(form1.city.value + form1.county.value + combo.value));

                    sendXMLHttpRequest(url, sendcomboreadystatechange);
                    break;
            }
        }
        else if(form1.category[2].checked)
        {
            switch(combo.name)
            {
                case "city":
                    toobj = form1.county;
                    var url = "";
                    if(combo.value == "36")
                    {
                        toobj.disabled = true;
                        toobj.length = 1;
                        toobj = form1.town;
                        toobj.length = 1;
                        url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(combo.value));
                    }
                    else
                    {
                        if(toobj.disabled)
                            toobj.disabled = false;
                        toobj.length = 1;
                        form1.town.length = 1;
                        url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(combo.value));
                   }

                    sendXMLHttpRequest(url, sendcomboreadystatechange);
                    break;
                case "county":
                    toobj = form1.town;
                    toobj.length = 1;
                    var url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/getAreaCode.do?" + escape("from=" + encodeURI(combo.name) + "&to=" + encodeURI(toobj.name) + "&valFrom=" + encodeURI(form1.city.value + combo.value));

                    sendXMLHttpRequest(url, sendcomboreadystatechange);
                    break;
            }
        }
    }

    function sendcomboreadystatechange()
    {
        if(xmlHttp.readyState == 4)
        {
            if(xmlHttp.status == 200)
            {
                var names = xmlHttp.responseXML.getElementsByTagName("name");
                var values = xmlHttp.responseXML.getElementsByTagName("value");
                //  리스트 수만큼 option을 달아준다
                for(var i = 0; i < values.length; i++)
                {
                    if(isExceptArea(names[i].firstChild.nodeValue))
                    {
                        continue;
                    }
                    else
                    {
                        var option = new Option(names[i].firstChild.nodeValue, values[i].firstChild.nodeValue);
                        option.title = names[i].firstChild.nodeValue;
                        toobj.options.add(option);
                    }
                }

                if(names.length == "0" && toobj.name != "ri")
                {
                    alert('네트워크가 원활하지 않습니다.\n\n다시선택하여 주시기를 바립니다.');
                    return;
                }

                deleteXMLHttpRequest();
            }
        }
    }

    function sendsearch()
    {
        var form1 = document.jform;
        if(form1.category[0].checked)
        {
            form1.doroname.value = form1.doroname.value.replace(' ', '');
            if(form1.city.value == "")
            {
                alert("시도를 선택하여 주십시오.");
                form1.city.focus();
                return;
            }
            if(form1.county.value == "")
            {
                alert("시군구를 선택하여 주십시오.");
                form1.county.focus();
                return;
            }
            if(form1.doroname.value == "")
            {
                alert("도로명을 입력하여 주십시오.");
                form1.doroname.focus();
                return;
            }
            if(form1.bldgno1.value != "")
            {
                if(IsNotAddressNumber(form1.bldgno1.value))
                {
                    alert("건물번호를 숫자로만 입력하십시오.");
                    form1.bldgno1.focus();
                    return;
                }
            }
            if(form1.bldgno2.value != "")
            {
                if(IsNotAddressNumber(form1.bldgno2.value))
                {
                    alert("건물번호를 숫자로만 입력하십시오.");
                    form1.bldgno2.focus();
                    return;
                }
            }

            var cityname = form1.city.options[form1.city.selectedIndex].text;
            var countyname = form1.county.options[form1.county.selectedIndex].text;

            var url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/link/search.do" + escape("?extend=true&mode=road_search&searchType=location_newaddr&topTab=1&engineCtpNm=" + encodeURI(cityname) + "&engineSigNm=" + encodeURI(countyname) + "&engineRdNm=" + encodeURI(trim(form1.doroname.value)) + "&engineBdMaSn=" + encodeURI(form1.bldgno1.value) + "&engineBdSbSn=" + encodeURI(form1.bldgno2.value) + "&currentPage=" + encodeURI(form1.curpage.value));

            sendXMLHttpRequest(url, sendsearchreadystatechange);
            
            
            $("#formbox").empty();
            document.getElementById("formbox").style.height = "170px";
            $("#formbox").html("<center><img src='/resources/include/commonfile/image/ajax-loader.gif'></center>");
        }
        else if(form1.category[1].checked)
        {
            if(form1.city.value == "")
            {
                alert("시도를 선택하여 주십시오.");
                form1.city.focus();
                return;
            }
            if(form1.county.value == "")
            {
                alert("시군구를 선택하여 주십시오.");
                form1.county.focus();
                return;
            }

            var cityname = form1.city.options[form1.city.selectedIndex].text;
            var countyname = form1.county.options[form1.county.selectedIndex].text;
            var townname = (form1.town.value == "") ? "" : form1.town.options[form1.town.selectedIndex].text;
            var riname = (form1.ri.value == "") ? "" : form1.ri.options[form1.ri.selectedIndex].text;
            var issan = (form1.san.checked) ? "1" : "0";

            var url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/link/search.do?" + escape("extend=false&mode=jibun_search&searchType=location_jibun&topTab=1&engineCtpNm=" + encodeURI(cityname) + "&engineSigNm=" + encodeURI(countyname) + "&engineEmdNm=" + encodeURI(townname) + "&engineLiNm=" + encodeURI(riname) + "&engineBdMaSn=" + encodeURI(form1.bunji1.value) + "&engineBdSbSn=" + encodeURI(form1.bunji2.value) + "&engineMtYn=" + encodeURI(issan) + "&currentPage=" + encodeURI(form1.curpage.value));

            sendXMLHttpRequest(url, sendsearchreadystatechange);
        }
        else if(form1.category[2].checked)
        {
            form1.bldgname.value = form1.bldgname.value.replace(' ', '');
            if(form1.city.value == "")
            {
                alert("시도를 선택하여 주십시오.");
                form1.city.focus();
                return;
            }
            if(form1.county.value == "")
            {
                alert("시군구를 선택하여 주십시오.");
                form1.county.focus();
                return;
            }
            if(form1.bldgname.value == "")
            {
                alert("건물명을 입력하여 주십시오.");
                form1.bldgname.focus();
                return;
            }

            var cityname = form1.city.options[form1.city.selectedIndex].text;
            var countyname = form1.county.options[form1.county.selectedIndex].text;
            var townname = (form1.town.value == "") ? "" : form1.town.options[form1.town.selectedIndex].text;

            var url = "search_address_pop_xmlhttp.jsp?url=http://www.juso.go.kr/link/search.do?" + escape("extend=true&mode=road_search&searchType=location_buld&topTab=1&engineCtpNm=" + encodeURI(cityname) + "&engineSigNm=" + encodeURI(countyname) + "&engineEmdNm=" + encodeURI(townname) + "&engineBdNm=" + encodeURI(trim(form1.bldgname.value)) + "&currentPage=" + encodeURI(form1.curpage.value));

            sendXMLHttpRequest(url, sendsearchreadystatechange);
        }
    }

    function sendsearchreadystatechange()
    {
        var form1 = document.jform;
        var resultdata = "";
        document.getElementById("resultbox").style.display = "block";

        if(xmlHttp.readyState == 4)
        {
            if(xmlHttp.status == 200)
            {
                var siNm = xmlHttp.responseXML.getElementsByTagName('siNm');
                var sggNm = xmlHttp.responseXML.getElementsByTagName('sggNm');
                var emdNm = xmlHttp.responseXML.getElementsByTagName('emdNm');
                var liNm = xmlHttp.responseXML.getElementsByTagName('liNm');
                var rn = xmlHttp.responseXML.getElementsByTagName('rn');
                var rnCd = xmlHttp.responseXML.getElementsByTagName('rnCd');
                var buldMnnm = xmlHttp.responseXML.getElementsByTagName('buldMnnm');
                var buldSlno = xmlHttp.responseXML.getElementsByTagName('buldSlno');
                var lnbrMnnm = xmlHttp.responseXML.getElementsByTagName('lnbrMnnm');
                var lnbrSlno = xmlHttp.responseXML.getElementsByTagName('lnbrSlno');
                var udrtYn = xmlHttp.responseXML.getElementsByTagName('udrtYn');
                var mtYn = xmlHttp.responseXML.getElementsByTagName('mtYn');
                var bdNm = xmlHttp.responseXML.getElementsByTagName('bdNm');
                var bdKd = xmlHttp.responseXML.getElementsByTagName('bdkd');
                var zipCl = xmlHttp.responseXML.getElementsByTagName('zipCl');
                var intCurrentPage = xmlHttp.responseXML.getElementsByTagName('intCurrentPage');
                var intCountPerPage = xmlHttp.responseXML.getElementsByTagName('intCountPerPage');
                var totalCount = xmlHttp.responseXML.getElementsByTagName('totalCount');

                var setDetailJuso = "";

                if(siNm.length=="0")
                {
                    document.getElementById("formbox").style.height = "25px";
                    resultdata = "<span>검색된 결과가 없습니다.</span>";
                }
                else
                {
                    resultdata = "<table summary=\"우편번호 목록 -번호,우편번호,주소 나타내는 표입니다\" class=\"postTable\">\n";
                    resultdata += "    <caption class=\"hidden\">우편번호 목록</caption>\n";
                    resultdata += "    <colgroup>\n";
                    resultdata += "        <col width=\"40px\" />\n";
                    resultdata += "        <col width=\"80px\" />\n";
                    resultdata += "        <col width=\"360px\" />\n";
                    resultdata += "    </colgroup>\n";
                    resultdata += "    <tbody>\n";

                    for(var i = 0; i < sggNm.length; i++)
                    {
                        var tempLnbr = "";
                        var tempBuld = "";
                        var jibun = "";
                        var newaddr = "";
                        var zip = "";

                        if(lnbrSlno[i].firstChild.nodeValue != "0")
                        {
                            tempLnbr=lnbrMnnm[i].firstChild.nodeValue + "-" + lnbrSlno[i].firstChild.nodeValue;
                        }
                        else
                        {
                            tempLnbr=lnbrMnnm[i].firstChild.nodeValue;
                        }
                        if(buldSlno[i].firstChild.nodeValue != "0")
                        {
                            tempBuld=buldMnnm[i].firstChild.nodeValue + "-" + buldSlno[i].firstChild.nodeValue;
                        }
                        else
                        {
                            tempBuld=buldMnnm[i].firstChild.nodeValue;
                        }

                        if(siNm[i].firstChild.nodeValue == "세종특별자치시")
                        {
                            var temp = bdKd[i].firstChild.nodeValue;
                            if(temp.substring(0,2) == "02" && bdNm[i].childNodes.length != "0")
                                setDetailJuso = "(" + bdNm[i].firstChild.nodeValue + ")";
                            if(liNm[i].childNodes.length == "0")
                            {
                                newaddr = siNm[i].firstChild.nodeValue + " " + rn[i].firstChild.nodeValue + " " + tempBuld;
                                jibun = siNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + tempLnbr;
                            }
                            else
                            {
                                newaddr = siNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + rn[i].firstChild.nodeValue + ' ' + tempBuld;
                                jibun = siNm[i].firstChild.nodeValue + ' ' + emdNm[i].firstChild.nodeValue + " " + liNm[i].firstChild.nodeValue + ' ' + tempLnbr;
                            }
                        }
                        else
                        {
                            if(liNm[i].childNodes.length == '0')
                            {
                                var temp=bdKd[i].firstChild.nodeValue;
                                if(temp.substring(0,2) == "02" && bdNm[i].childNodes.length != "0")
                                    setDetailJuso = "(" + emdNm[i].firstChild.nodeValue + "，" + bdNm[i].firstChild.nodeValue + ")";
                                else
                                    setDetailJuso = "(" + emdNm[i].firstChild.nodeValue + ")";
                                newaddr = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + rn[i].firstChild.nodeValue + " " + tempBuld;
                                jibun = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + tempLnbr;
                            }
                            else
                            {
                                var temp=bdKd[i].firstChild.nodeValue;
                                if(temp.substring(0,2) == "02" && bdNm[i].childNodes.length != "0")
                                    setDetailJuso = "(" + bdNm[i].firstChild.nodeValue + ")";
                                newaddr = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " "  + rn[i].firstChild.nodeValue + " " + tempBuld;
                                jibun = siNm[i].firstChild.nodeValue + " " + sggNm[i].firstChild.nodeValue + " " + emdNm[i].firstChild.nodeValue + " " + liNm[i].firstChild.nodeValue + " " + tempLnbr;
                            }
                        }

                        if(bdNm[i].childNodes.length!="0")
                            jibun += " " + bdNm[i].firstChild.nodeValue;

                        if(zipCl[i].childNodes.length=="0")
                        {
                            zip = "-";
                        }
                        else
                        {
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

                    if(siNm.length>0)
                    {
                        resultdata += sendpaging(form1.curpage.value, parseInt(totalCount[0].firstChild.nodeValue), parseInt(intCountPerPage[0].firstChild.nodeValue), 10);
                    }

                    document.getElementById("formbox").style.height = "170px";
                }
                
                document.getElementById("formbox").innerHTML = resultdata;
                
                deleteXMLHttpRequest();
            }
        }
        else if(xmlHttp.readyState == 2||xmlHttp.readyState == 3)
        {
            resultdata = "<span style=\"color:#0000FF\">처리중입니다.</span>";
        }
    }

    function sendpaging(curpage, totalcount, pagesize, blocksize)
    {
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

        for(var i = 1; i <= blocksize && curblock <= pagecount; i++)
        {
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

    function sendmove(value)
    {
        var form1 = document.jform;
        form1.curpage.value = value;
        sendsearch();
    }

    function senduse(postcode, address, address_old)
    {
    		<%
    		if("comp".equals(comp)){
    		%>
	        $(opener.document).find("input[name=compZip1]").val(postcode.substr(0,3));
	        $(opener.document).find("input[name=compZip2]").val(postcode.substr(4,3));
	        $(opener.document).find("input[name=compAddr]").val(address);
	        <%
    		}else{
	        %>
	        $(opener.document).find("input[name=zipcode1]").val(postcode.substr(0,3));
	        $(opener.document).find("input[name=zipcode2]").val(postcode.substr(4,3));
	        $(opener.document).find("input[name=addr]").val(address);
	        <%
    		}
	        %>
        window.close();
    }

    function sendcategory(radio)
    {
        window.location.href = "search_address_pop.jsp?category=" + radio.value + "&comp=<%=comp%>";
    }

    // 지번입력 패턴체크
    function IsNotAddressNumber(strvalue)
    {
        if (!strvalue.match(/^\d+-?\d*$/))
        {
            return true;
        }
        return false;
    }

    function sendkeydown()
    {
        if(event.keyCode == 13){
            sendsearch();
        }
    }

    function trim(str)
    {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
    //]]>
    </script>
</head>
<body>
    <form name="jform">
    <input type="hidden" name="curpage" value="1" />

    <div class="wrap">

        <div class="titArea">
            
        </div>

            
        <div class="input_area">
            
            <!--/검색체크 영역 시작/-->
            <div class="searchArea">
                <label><input type="radio" name="category" class="BdNone" value="doro" <%if(category.equals("doro")){%>checked="checked"<%}%> onclick="javascript:sendcategory(this)" />도로명주소</label>
                <label><input type="radio" name="category" class="BdNone" value="jibun" <%if(category.equals("jibun")){%>checked="checked"<%}%> onclick="javascript:sendcategory(this)" />지번</label>
                <label><input type="radio" name="category" class="BdNone" value="sangho" <%if(category.equals("sangho")){%>checked="checked"<%}%> onclick="javascript:sendcategory(this)" />건물명</label>
            </div>
            <!--/검색체크 영역 끝/-->
            <!--/도로명 검색설명-입력 영역 시작/-->
            <%
            if(category.equals("doro")){
            %>
            <div class="infoArea">
                <div>
                    <strong>* 도로명으로 검색합니다.</strong><br />
                    <span class="MAL10">예) 서울특별시 강동구 양재대로112길 57</span><br />
                </div>
                <div class="emp3">
                    ※ 자세한 표기법은(<a href="http://juso.go.kr" target="_blank" title="도로명주소안내홈페이지">도로명주소안내홈페이지</a>)를 참조하세요.
                </div>
            </div>
            
            <div class="regiArea">
                <div>
                <ul class="formarea">
                    <li class="first">
                        <label class="title" for="city">시도</label>
                        <select name="city" style="width:150px;" onchange="javascript:sendcombochange(this);" >
                            <option value="">선택</option>
                            <option value="11" title="서울특별시" >서울특별시</option>
                            <option value="42" title="강원도" >강원도</option>
                            <option value="41" title="경기도">경기도</option>
                            <option value="48" title="경상남도" >경상남도</option>
                            <option value="47" title="경상북도" >경상북도</option>
                            <option value="46" title="전라남도" >전라남도</option>
                            <option value="45" title="전라북도" >전라북도</option>
                            <option value="44" title="충청남도" >충청남도</option>
                            <option value="43" title="충청북도" >충청북도</option>
                            <option value="29" title="광주광역시" >광주광역시</option>
                            <option value="27" title="대구광역시" >대구광역시</option>
                            <option value="30" title="대전광역시" >대전광역시</option>
                            <option value="26" title="부산광역시" >부산광역시</option>
                            <option value="31" title="울산광역시" >울산광역시</option>
                            <option value="28" title="인천광역시" >인천광역시</option>
                            <option value="36" title="세종특별자치시" >세종특별자치시</option>
                            <option value="50" title="제주특별자치도" >제주특별자치도</option>
                        </select>
                    </li>
                    <li class="second">
                        <label class="title" for="county">시군구</label>
                        <select name="county" style="width:150px;">
                            <option value="">선택</option>
                        </select>
                    </li>
                    <li class="first">
                        <label class="title" for="doro">도로명</label>
                        <input type="text" name="doroname" maxlength="20" style="width:146px; ime-mode:active" class="inputText" onkeydown="javascript:sendkeydown();" />
                    </li>
                    <li class="second">
                        <label class="title" for="bldg">건물번호</label>
                        <input type="text" name="bldgno1" maxlength="10" style="width:64px; ime-mode:active" class="inputText" onkeydown="javascript:sendkeydown();" /> -
                        <input type="text" name="bldgno2" maxlength="10" style="width:64px; ime-mode:active" class="inputText" onkeydown="javascript:sendkeydown();" />
                    </li>
                </ul>
                <input type="button" name="btnfind" value="검색" class="btn" onclick="javascript:sendsearch();" />
                </div>
            </div>
            <!--/도로명 검색설명-입력 영역 끝/-->
            <%
            }else if(category.equals("jibun")){
            %>
            <!--/지번 검색설명-입력 영역 시작/-->
            <div class="infoArea">
                <div>
                    <strong>* 지번으로 검색합니다.</strong><br />
                    <span class="MAL10">예) 서울특별시 송파구 잠실동 27-12</span><br />
                </div>
                <div class="emp3">
                    ※ 자세한 표기법은(<a href="http://juso.go.kr" target="_blank" title="도로명주소안내홈페이지">도로명주소안내홈페이지</a>)를 참조하세요.
                </div>
            </div>
            
            <div class="regiArea">
                <ul class="formarea">
                    <li class="first">
                        <label class="title" for="city">시도</label>
                        <select name="city" style="width:150px;" onchange="javascript:sendcombochange(this);" >
                            <option value="">선택</option>
                            <option value="11" title="서울특별시" >서울특별시</option>
                            <option value="42" title="강원도" >강원도</option>
                            <option value="41" title="경기도">경기도</option>
                            <option value="48" title="경상남도" >경상남도</option>
                            <option value="47" title="경상북도" >경상북도</option>
                            <option value="46" title="전라남도" >전라남도</option>
                            <option value="45" title="전라북도" >전라북도</option>
                            <option value="44" title="충청남도" >충청남도</option>
                            <option value="43" title="충청북도" >충청북도</option>
                            <option value="29" title="광주광역시" >광주광역시</option>
                            <option value="27" title="대구광역시" >대구광역시</option>
                            <option value="30" title="대전광역시" >대전광역시</option>
                            <option value="26" title="부산광역시" >부산광역시</option>
                            <option value="31" title="울산광역시" >울산광역시</option>
                            <option value="28" title="인천광역시" >인천광역시</option>
                            <option value="36" title="세종특별자치시" >세종특별자치시</option>
                            <option value="50" title="제주특별자치도" >제주특별자치도</option>
                        </select>
                    </li>
                    <li class="second">
                        <label class="title" for="county">시군구</label>
                        <select name="county" style="width:150px;" onchange="javascript:sendcombochange(this);">
                            <option value="">선택</option>
                        </select>
                    </li>
                    <li class="first">
                        <label class="title" for="town">읍면동</label>
                        <select name="town" style="width:150px;" onchange="javascript:sendcombochange(this);">
                            <option value="">선택</option>
                        </select>
                    </li>
                    <li class="second">
                        <label class="title" for="ri">리</label>
                        <select name="ri" style="width:111px;">
                            <option value="">선택</option>
                        </select>
                        <input type="checkbox" name="san" value="" /><label for="san">산</label>
                    </li>
                    <li class="first">
                        <label class="title" for="bunji1">번지</label>
                        <input type="text" name="bunji1" maxlength="10" style="width:64px; ime-mode:active" class="inputText" onkeydown="javascript:sendkeydown();" /> -
                        <input type="text" name="bunji2" maxlength="10" style="width:64px; ime-mode:active" class="inputText" onkeydown="javascript:sendkeydown();" />
                    </li>
                </ul>
                <input type="button" name="btnfind" value="검색" class="btn" onclick="javascript:sendsearch();" />
            </div>
            <!--/지번 검색설명-입력 영역 끝/-->
            <%
            }else if(category.equals("sangho")){
            %>
            <!--/상호 검색설명-입력 영역 시작/-->
            <div class="infoArea">
                <div>
                    <strong>* 건물명으로 검색합니다.</strong><br />
                    <span class="MAL10">예) 서울특별시 송파구 잠실동 35 트리지움아파트</span><br />
                </div>
                <div class="emp3">
                    ※ 자세한 표기법은(<a href="http://juso.go.kr" target="_blank" title="도로명주소안내홈페이지">도로명주소안내홈페이지</a>)를 참조하세요.
                </div>
            </div>
            
            <div class="regiArea">
                <ul class="formarea">
                    <li class="first">
                        <label class="title" for="city">시도</label>
                        <select name="city" style="width:150px;" onchange="javascript:sendcombochange(this);" >
                            <option value="">선택</option>
                            <option value="11" title="서울특별시" >서울특별시</option>
                            <option value="42" title="강원도" >강원도</option>
                            <option value="41" title="경기도">경기도</option>
                            <option value="48" title="경상남도" >경상남도</option>
                            <option value="47" title="경상북도" >경상북도</option>
                            <option value="46" title="전라남도" >전라남도</option>
                            <option value="45" title="전라북도" >전라북도</option>
                            <option value="44" title="충청남도" >충청남도</option>
                            <option value="43" title="충청북도" >충청북도</option>
                            <option value="29" title="광주광역시" >광주광역시</option>
                            <option value="27" title="대구광역시" >대구광역시</option>
                            <option value="30" title="대전광역시" >대전광역시</option>
                            <option value="26" title="부산광역시" >부산광역시</option>
                            <option value="31" title="울산광역시" >울산광역시</option>
                            <option value="28" title="인천광역시" >인천광역시</option>
                            <option value="36" title="세종특별자치시" >세종특별자치시</option>
                            <option value="50" title="제주특별자치도" >제주특별자치도</option>
                        </select>
                    </li>
                    <li class="second">
                        <label class="title" for="county">시군구</label>
                        <select name="county" style="width:150px;" onchange="javascript:sendcombochange(this);">
                            <option value="">선택</option>
                        </select>
                    </li>
                    <li class="first">
                        <label class="title" for="town">읍면동</label>
                        <select name="town" style="width:150px;" onchange="javascript:sendcombochange(this);">
                            <option value="">선택</option>
                        </select>
                    </li>
                    <li class="second">
                        <label class="title" for="bldgname">건물명</label>
                        <input type="text" name="bldgname" maxlength="20" style="width:146px; ime-mode:active" class="inputText" onkeydown="javascript:sendkeydown();" />
                        <input type="text" name="bldgname1" style="display:none" />
                    </li>
                </ul>
                <input type="button" name="btnfind" value="검색" class="btn" onclick="javascript:sendsearch();" />
            </div>
            <!--/상호 검색설명-입력 영역 끝/-->
            <%
            }
            %>
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
            <div id="formbox" class="post_listArea">
            </div>
        </div>

        <div class="btnArea">
            <input type="button" class="btn_clos" value="닫기" onclick="window.close()" />
        </div>
    </div>
    </form>
</body>
</html>