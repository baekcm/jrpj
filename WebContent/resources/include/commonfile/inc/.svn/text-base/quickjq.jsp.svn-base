<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div id="quickMenu" class="quickArea" style="height:510px;width:70px">
  <ul class="quickul">
    <li class="first"><img src="/spclib/image/quick/title_quickl.gif" width="60" height="20" alt="QUICK" /></li>
    <li class="qmenu"><a href="/intro/index.jsp"><img src="/spclib/image/quick/btn01.gif" width="50" height="18" alt="인트로" /></a></li>
	<li class="qmenu"><a href="/spglib/index.jsp"><img src="/spclib/image/quick/btn02.gif" alt="거마도서관" /></a></li>
    <li class="qmenu"><a href="/spclib/index.jsp"><img src="/spclib/image/quick/btn03.gif" alt="송파어린이도서관" /></a></li>
    <li class="qmenu"><a href="/sp1lib/index.jsp"><img src="/spclib/image/quick/btn04.gif" alt="소나무언덕1호" /></a></li>
    <li class="qmenu"><a href="/sp2lib/index.jsp"><img src="/spclib/image/quick/btn05.gif" alt="소나무언덕2호" /></a></li>
    <li class="qmenu"><a href="/sp3lib/index.jsp"><img src="/spclib/image/quick/btn06.gif" alt="소나무언덕3호" /></a></li>
    <li class="qmenu"><a href="/sp4lib/index.jsp"><img src="/spclib/image/quick/btn07.gif" alt="소나무언덕4호" /></a></li>    
    <li class="qmenu"><a href="/spelib/index.jsp"><img src="/spclib/image/quick/btn08.gif" alt="송파어린이영어" /></a></li>
    <li class="qmenu"><a href="/spmlib/index.jsp"><img src="/spclib/image/quick/btn09.gif" alt="소나무언덕잠실본동" /></a></li>
  </ul>
  <div class="quickB"></div>
</div>
<script type="text/javascript">
var customLeft = (document.documentElement.clientWidth-990)/2+990+30;
$("div.quickArea").css("top","190px");
$("div.quickArea").css("left",customLeft+"px");

$(document).ready(function(){

var	initTop=190;
var initLeft =990;
var cT = $("div.quickArea").offset().top;
var cL = $("div.quickArea").offset().left;

$(window).scroll(function() {
var position = $(window).scrollTop();
var limit =  document.body.clientHeight - 800;
if(position > limit) position = limit;
var customLeft = (document.documentElement.clientWidth-initLeft)/2+initLeft+30;

//if(position<110) { $("div.quickArea").animate({"top":cT+"px","left":customLeft +"px"},10); }else{
	
$("div.quickArea").animate({"top":position+initTop+"px","left":customLeft +"px"},0);
//}
});

$(window).resize(function() {
var position = $(window).scrollTop();
var limit =  document.body.clientHeight - 800;
if(position > limit) position = limit;
var customLeft = (document.documentElement.clientWidth-initLeft)/2+initLeft+10;
$("div.quickArea").animate({"top":position+initTop+"px","left":customLeft +"px"},0);
});
});
</script>