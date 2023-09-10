<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String pTitle="문화체육시설";
String sTitle="종로구민회관";
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
	<%@ include file="/resources/include/mobile/inc/submenu1.jsp" %>
	<%@ include file="/resources/include/mobile/inc/navi.jsp" %>
</div>
<div id="body">
<!-- tabMaker  -->
	<div class="ttabWrap">
		<ul id="ttab3">
			<li class="choiced"><a href="shuttle">1호차</a></li>
			<li><a href="shuttle02">2호차</a></li>
		</ul>
	</div>
	<!-- tabMaker  --> 
	<!--real Contents S-->
	<div class="pageSection">
		<ul class="guide">
			<li><strong>셔틀버스 노선 안내</strong>
				<ul>
					<li><strong>평일</strong>: 08:10 / 09:10 / 10:10 / 11:10 / 12:10 / 14:10 / 15:10 / 16:10 / 17:10 /18:10<br />
						＊13시는 기사점심시간으로 운행하지 않습니다.</li>
					<li><strong>토요일</strong>: 08:10 / 09:10 / 10:10 / 11:10 / 12:10 <br />
						＊일요일과 공휴일은 운행하지 않습니다 </li>
					<li>정거장 별 자세한 문의는 셔틀버스 기사분과 사무실 (02-3672-2530~1 : 담당자 김 태 형)로 연락 주시기 바랍니다.<br />
						*교통사정에 따라 도착시간이 지연될 수 있으니 5분 일찍 나와서 기다려주시기 바랍니다. </li>
					<!-- 1호차 노선 관련 정보 시작 -->
					<li><strong>1호차 노선도</strong>
						<ul>
							<li class="none"><img src="/resources/include/commonfile/image/content/gumin/sut_line1.gif"  alt="1호차 셔틀 버스 노선도 ( 노선도의 상세 내용은 아래의 노선도 표를 참고)" /></li>
							<li class="none">
								<div class="tblWrap">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="셔틀의 출발위치 및 도착시간, 정류소 사진 보기를 정리한 표" class="tbl01">
										<caption>
										1호차 노선도
										</caption>
										<colgroup>
										<col style="width:180px;" />
										<col />
										</colgroup>
										<tbody>
											<tr>
												<th scope="col">출발위치</th>
												<th scope="col">도착시간(매시 분)</th>
											</tr>
											<tr>
												<td>숭인우체국 앞</td>
												<td><strong>11</strong></td>
											</tr>
											<tr>
												<td>쌍용아파트 1단지앞</td>
												<td><strong>12</strong></td>
											</tr>
											<tr>
												<td>아남삼거리</td>
												<td><strong>13</strong></td>
											</tr>
											<tr>
												<td>동부 센트레빌 후문 건너편</td>
												<td><strong>14</strong></td>
											</tr>
											<tr>
												<td>쌍용아파트 2단지 건너편</td>
												<td><strong>15</strong></td>
											</tr>
											<tr>
												<td>낙산 삼거리</td>
												<td><strong>16</strong></td>
											</tr>
											<tr>
												<td>대우 푸르지오 후문앞</td>
												<td><strong>17</strong></td>
											</tr>
											<tr>
												<td>대우 푸르지오 정문앞</td>
												<td><strong>18</strong></td>
											</tr>
											<tr>
												<td>한성대입구(현대가든빌라 건너편)</td>
												<td><strong>19</strong></td>
											</tr>
											<tr>
												<td>성북세무서 앞</td>
												<td><strong>20</strong></td>
											</tr>
											<tr>
												<td>사거리 대영빌딩 앞<br />
													(치킨매니아 앞 성북경찰서 건너편)</td>
												<td><strong>22</strong></td>
											</tr>
											<tr>
												<td>세븐일레븐 편의점 앞</td>
												<td><strong>23</strong></td>
											</tr>
											<tr>
												<td>현대 I PARK 정문앞</td>
												<td><strong>25</strong></td>
											</tr>
											<tr>
												<td>동신 초등학교</td>
												<td><strong>26</strong></td>
											</tr>
											<tr>
												<td>아남공업사 건너편</td>
												<td><strong>27</strong></td>
											</tr>
											<tr>
												<td>낙산 삼거리</td>
												<td><strong>30</strong></td>
											</tr>
											<tr>
												<td>쌍용아파트 2단지 상가앞</td>
												<td><strong>31</strong></td>
											</tr>
											<tr>
												<td>대우 푸르지오 후문앞</td>
												<td><strong>32</strong></td>
											</tr>
											<tr>
												<td>현대홈타운</td>
												<td><strong>33</strong></td>
											</tr>
											<tr>
												<td>동부센트러빌 후문</td>
												<td><strong>34</strong></td>
											</tr>
											<tr>
												<td>아남 삼거리</td>
												<td><strong>35</strong></td>
											</tr>
											<tr>
												<td>쌍용아파트 1단지 정문앞</td>
												<td><strong>36</strong></td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>
						</ul>
					</li>
					<!-- 1호차 노선 관련 정보 끝 -->
				</ul>
			</li>
		</ul>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
