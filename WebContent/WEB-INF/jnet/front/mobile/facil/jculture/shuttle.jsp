<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String pTitle="문화체육시설";
String sTitle="종로문화체육센터";
String sNo="3";
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
	<%@ include file="/resources/include/mobile/inc/submenu1.jsp" %>
	<%@ include file="/resources/include/mobile/inc/navi.jsp" %>
</div>
<div id="body"> 
<!-- tabMaker  -->
	<div class="ttabWrap">
		<ul id="ttab3">
			<li class="choiced"><a href="shuttle">1호차</a></li>
			<li><a href="shuttle02">2호차</a></li>
			<li><a href="shuttle03">3호차</a></li>
		</ul>
	</div>
	<!-- tabMaker  --> 
	<!--real Contents S-->
	<div class="pageSection">
		<ul class="guide">
			<li><strong>셔틀버스 노선 안내</strong>
				<ul>
					<li><strong>평일 </strong>: 08:10 / 09:10 / 10:10 / 11:10 / 12:10 / 14:10 / 15:10 / 16:10 / 17:10 /18:10
						<ul>
							<li>10시 ~ 15 :10분 차량 까지만 구기동 방향 운행 합니다.
								<ul>
									<li>※ 교통사정에 따라 도착시간이 지연 될 수 있으니 <strong>5분 일찍 나와서</strong> 기다려 주시기 바랍니다.<br />
										<strong>※ 점심시간 - 13:10 운행하지 않습니다. </strong><br />
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<li><strong>토요일 </strong>: 08:10 / 09:10 / 10:10 / 11:10 / 12:10</li>
					<li><strong>29인승 셔틀버스 기사 : 010-8010-9364</strong></li>
					
					<!-- 29인승 노선 관련 정보 시작 -->
					<li><strong>29인승 셔틀버스 노선도</strong>
						<ul>
							<li>10분 출발 => 45분 도착 </li>
							<li class="none"><img src="/resources/include/commonfile/image/content/jculture/bus_map01.gif" alt="29인승 셔틀 버스 노선도 ( 노선도의 상세 내용은 아래의 노선도 표를 참고)" /></li>
							<li class="none">
								<div class="tblWrap">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="셔틀의 출발위치 및 도착시간, 정류소 사진 보기를 정리한 표. " class="tbl01 tdCenter">
										<caption>
										29인승 셔틀버스 노선도
										</caption>
										<colgroup>
										<col style="width:180px;" />
										<col />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">출발위치</th>
												<th scope="col">도착시간(매시 분)</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>센터출발</td>
												<td>10</td>
											</tr>
											<tr>
												<td>용신카센터(대신고 건너편)</td>
												<td>12</td>
											</tr>
											<tr>
												<td>스페이스본(버스정류장)</td>
												<td>13</td>
											</tr>
											<tr>
												<td>경복궁역 3번출구(SK텔리콤 앞)</td>
												<td>15</td>
											</tr>
											<tr>
												<td>강남의원앞</td>
												<td>16</td>
											</tr>
											<tr>
												<td>청운동사무소(신교소방파출소 건너편)</td>
												<td>17</td>
											</tr>
											<tr>
												<td>경기슈퍼앞(자하문터널 앞)</td>
												<td>19</td>
											</tr>
											<tr>
												<td>세검약국(세검정약국)</td>
												<td>21</td>
											</tr>
											<tr>
												<td>신영아파트(육교앞 신영상가 건너편)</td>
												<td>23</td>
											</tr>
											<tr>
												<td>평창동 동물병원 앞(한빛문화재단 건너편)</td>
												<td>25</td>
											</tr>
											<tr>
												<td>구기동 산수부동산 앞(장애인 버스정류장 앞)</td>
												<td>27</td>
											</tr>
											<tr>
												<td>육교앞(신영상가)(세검정초등학교)</td>
												<td>29</td>
											</tr>
											<tr>
												<td>SK주유소(올리브 동물병원)</td>
												<td>32</td>
											</tr>
											<tr>
												<td>자하문 터널앞 정류장(경기슈퍼 건너편)</td>
												<td>34</td>
											</tr>
											<tr>
												<td>농학교앞</td>
												<td>36</td>
											</tr>
											<tr>
												<td>배화부동산 앞(농수산물 판매마트 옆)</td>
												<td>38</td>
											</tr>
											<tr>
												<td>사직동사무소 앞</td>
												<td>40</td>
											</tr>
											<tr>
												<td>센터도착</td>
												<td>45</td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>
						</ul>
					</li>
					<!-- 29인승 노선 관련 정보 끝 -->
				</ul>
			</li>
		</ul>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
