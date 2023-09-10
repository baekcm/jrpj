<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String pTitle="주차시설";
String sTitle="공영주차장";
String sNo="2";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" wml:lang="ko">
<head>
<title><%=pTitle%>-종로구시설관리공단</title>
<link href="/resources/include/mobile/inc/css/msub.css" rel="stylesheet" type="text/css" />
<%@ include file="/resources/include/mobile/inc/header.jsp" %>
</head>

<body>
<div id="header">
	<%@ include file="/resources/include/mobile/inc/top.jsp" %>
	<%@ include file="/resources/include/mobile/inc/submenu2.jsp" %>
	<%@ include file="/resources/include/mobile/inc/navi.jsp" %>
</div>
<div id="body"> 
	<!--real Contents S-->
	<div class="pageSection">
		<ul class="guide mb15">
			<li><strong>시설현황 및 위치</strong>
				<ul>
					<li class="point_blue01">해당 공영 주차장명 및 위치(주소)를 클릭(click)하시면 주차구획 현황과 정확한 위치를 아실 수 있습니다. </li>
					<li><strong>영업시간 이후 주차장 무료</strong></li>
				</ul>
			</li>
		</ul>
		<div class="tblWrap">
			<table cellspacing="0" cellpadding="2" width="100%" summary=" 주차장 시설 명칭과 위치, 면수, 급지, 운영시간등을 안내 한 표" class="tbl01">
				<caption>
				시설현황 및 위치
				</caption>
				<thead>
					<tr align="center" bgcolor="#eae6fb">
						<th height="30" width="18%">주차장명</th>
						<th width="17%">위치</th>
						<th width="8%">면수</th>
						<th width="8%">급지</th>
						<th width="26%">운영시간</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_whamunb.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>광화문빌딩 앞 </strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_whamun.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>세종대로23길47<br />
							(당주동 145)</strong></a></td>
						<td>19</td>
						<td>1</td>
						<td><p>평 일: 10:00-22:00<br />
								토요일: 10:00-16:00 </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_3jonggak.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>종각 앞 </strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_jonggak.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>우정국로2길<br />
							(관철동 45-6)</strong></a></td>
						<td>13</td>
						<td>1</td>
						<td><p>평 일: 10:00-20:00<br />
								토요일: 10:00-16:00 </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_4wonser.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>원서공원 앞</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_wonser.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>창덕궁길<br />
							(원서동181-5)</strong></a></td>
						<td>15</td>
						<td>2</td>
						<td><p>평 일: 09:00-19:00<br />
								토요일: 09:00-15:00 </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_5taewha.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>태화관 앞</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_staewha.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>인사동5길 29앞<br />
							(인사동 194)</strong></a></td>
						<td>16</td>
						<td>1</td>
						<td><p>평 일: 10:00-20:00<br />
								토요일: 09:00-15:00 </p></td>
					</tr>
					<!--                      <tr align="center">                                                              <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">5</td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_6hankuk.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')"><b>한국통신공사 앞</b></a></td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><img src="http://www.ijongno.co.kr/img/info_park/picture.gif" width="45" height="37" border="0" usemap="#Map22MapMap3">                          <map name="Map22MapMap3">                            <area shape="rect" coords="-1,-1,47,38" href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/6hankuk.htm','','width=420,height=330,top=500,left=500,scrollbars=no,resizable=no')">                          </map></td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_hankuk.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')"><b>세종로 100</b></a></td>                                                              <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">23</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">1</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><p>평 일: 08:00-19:00<br>          토요일: 09:00-15:00 </p></td>                      </tr>                      -->
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_7topgol.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>탑골공원 앞</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_topgol.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>종로99<br />
							(종로2가38-1)</strong></a></td>
						<td>13</td>
						<td>1</td>
						<td><p>평 일: 10:00-22:00<br />
								토요일: 10:00-22:00<br />
								일요일: 10:00-18:00 </p></td>
					</tr>
					<!--                      <tr align="center">                                                <td height="55" class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">6</td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_8nakwon.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')"><b>낙원상가 옆</b></a> </td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><img src="http://www.ijongno.co.kr/img/info_park/picture.gif" width="45" height="37" border="0" usemap="#Map22MapMap5">                          <map name="Map22MapMap5">                            <area shape="rect" coords="-1,-1,47,38" href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/8nakwon.htm','','width=420,height=330,top=500,left=500,scrollbars=no,resizable=no')">                          </map></td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_nakwon.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')"><b>낙원동 283</b></a></td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">10</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">1</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><p>평 일: 09:00-19:00<br>          토요일: 09:00-15:00 </p></td>                      </tr>                      -->
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_9jongro3ga.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>종로3가역</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_jonono3ga.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>서순라길51 맞은편<br />
							(봉익동 36)</strong></a></td>
						<td>59</td>
						<td>1</td>
						<td><p>평 일: 10:00-20:00<br />
								토요일: 09:00-15:00 </p></td>
					</tr>
					<!--                      <tr align="center">                                                              <td height="56" class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">8</td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_10kyobo.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')"><b>교보빌딩 앞</b></a> </td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><img src="http://www.ijongno.co.kr/img/info_park/picture.gif" width="45" height="37" border="0" usemap="#Map22MapMap7">                          <map name="Map22MapMap7">                            <area shape="rect" coords="-1,-1,47,38" href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/kyoboa.htm','','width=420,height=330,top=500,left=500,scrollbars=no,resizable=no')">                          </map></td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_kyobo.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')"><b>세종로 100-1</b></a></td>                                                              <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">15</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">1</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><p>평 일: 09:00-19:00<br>          토요일: 09:00-15:00 </p></td>                      </tr>    					-->
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_samshung.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>삼청공원 앞</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_3chug.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>북촌로134-1<br />
							(삼청동 25-1)</strong></a></td>
						<td>17</td>
						<td>3</td>
						<td><p>평 일: 09:00-19:00<br />
								토요일: 09:00-15:00 </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_13serinsa.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>서인사 마당</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_serinsa.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>인사동11길23<br />
							(견지동 68-1)</strong></a></td>
						<td>45</td>
						<td>1</td>
						<td><p>08:00-22:00<br />
								(휴일없음) </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_14seoun.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>세운상가 밑</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_seoon.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>종로26길~28길<br />
							(장사동116-3)</strong></a></td>
						<td>34</td>
						<td>1</td>
						<td><p>평 일: 09:00-19:00<br />
								토요일: 09:00-15:00 </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park-hanmi.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>한미빌딩 앞</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_hanmi.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>종로9길<br />
							(인사동194-9)</strong></a></td>
						<td>10</td>
						<td>1</td>
						<td><p>평 일: 10:00-20:00<br />
								토요일: 09:00-15:00 </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_openyard.htm','','width=440,height=340,top=400,left=500,scrollbars=no,resizable=no')" href="#none"><strong>열린마당</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_open.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>중학동 111</strong></a></td>
						<td>13</td>
						<td>1</td>
						<td><p>평 일: 09:00-19:00<br />
								토요일: 09:00-15:00 </p></td>
					</tr>
					<!--                      <tr align="center">                        <td height="59" class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">2</td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_15dongmyo.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')"><b>동묘 앞</b></a></td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><img src="http://www.ijongno.co.kr/img/info_park/picture.gif" width="45" height="37"></td>                        <td class="style6" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><a href="#none" onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_dongmyo.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')"><b>숭인동 238-1</b></a></td>                                                              <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">29</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;">1</td>                        <td class="f5" style="border-width:1.2; border-color:rgb(204,102,0); border-style:solid;"><p>평 일: 09:00-19:00<br>          토요일: 09:00-15:00 </p></td>                      </tr>                      -->
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_16myunrang.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>명광교회 옆</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_myungrang.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>명륜동3가 12</strong></a></td>
						<td>9</td>
						<td>2</td>
						<td><p>24시간<br />
								(연중무휴) </p></td>
					</tr>
					<tr align="center">
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_gugidong.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>구기동 139</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_googidong.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>구기동 139 </strong></a></td>
						<td>34</td>
						<td>3</td>
						<td><p>평 일: 무료개방<br />
								토,일 및 공휴일: 08:00-18:00 </p></td>
					</tr>
					<tr align="center">
						<td height="56"><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/park_googidong-9.htm','','width=520,height=300,top=500,left=500,scrollbars=no,resizable=no')" href="#none"><strong>구기동 139-9</strong></a></td>
						<td><a onclick="javascript:window.open('http://www.ijongno.co.kr/html/sub/info_park/yak_googidong-9.htm','','width=630,height=450,top=200,left=300,scrollbars=no,resizable=no')" href="#none"><strong>구기동 139-9</strong></a></td>
						<td>37</td>
						<td>3</td>
						<td><p>평 일: 무료개방<br />
								토,일 및 공휴일: 08:00-18:00 </p></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
