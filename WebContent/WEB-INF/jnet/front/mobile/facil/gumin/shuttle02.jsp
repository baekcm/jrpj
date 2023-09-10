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
			<li><a href="shuttle">1호차</a></li>
			<li class="choiced"><a href="shuttle02">2호차</a></li>
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
					
					<!-- 2호차 노선 관련 정보 시작 -->
					<li><strong>2호차 노선도</strong>
						<ul>
							<li class="none"><img src="/resources/include/commonfile/image/content/gumin/sut_line2.gif"  alt="2호차 셔틀 버스 노선도 ( 노선도의 상세 내용은 아래의 노선도 표를 참고)" /></li>
							<li class="none">
								<div class="tblWrap">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="셔틀의 출발위치 및 도착시간, 정류소 사진 보기를 정리한 표" class="tbl01 tdCenter">
										<caption>
										2호차 노선도
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
												<td>아남삼거리<span class="point_red01">(17~18시만 정차)</span></td>
												<td><strong>12</strong></td>
											</tr>
											<tr>
												<td>보문역 3번출구 앞</td>
												<td><strong>13</strong></td>
											</tr>
											<tr>
												<td>성북경찰서 앞</td>
												<td><strong>14</strong></td>
											</tr>
											<tr>
												<td>SK 브로드밴드</td>
												<td><strong>15</strong></td>
											</tr>
											<tr>
												<td>키즈컬리지 앞</td>
												<td><strong>16</strong></td>
											</tr>
											<tr>
												<td>안암교회 건너편(GS편의점)</td>
												<td><strong>17</strong></td>
											</tr>
											<tr>
												<td>SK 주유소앞</td>
												<td><strong>22</strong></td>
											</tr>
											<tr>
												<td>동대문세무서 건너편<br />
													(SK텔레콤 대리점 앞)</td>
												<td><strong>23</strong></td>
											</tr>
											<tr>
												<td>신설동역 5번 출구</td>
												<td><strong>25</strong></td>
											</tr>
											<tr>
												<td>중앙 정형외과앞</td>
												<td><strong>26</strong></td>
											</tr>
											<tr>
												<td>동부시립병원 맞은편 김밥천국앞</td>
												<td><strong>27</strong></td>
											</tr>
											<tr>
												<td>신동아아파트 건너편<br />
													(기아카서비스센타 앞)</td>
												<td><strong>28</strong></td>
											</tr>
											<tr>
												<td>청계9가 대성스카이렉스 기업은행앞(08,10,11,12시만 정차)</td>
												<td><strong>29</strong></td>
											</tr>
											<tr>
												<td>청계8가 대성스카이렉스 앞</td>
												<td><strong>31</strong></td>
											</tr>
											<tr>
												<td>한 피부과의원<span class="point_red01">(14,15,16,18시 정차)</span></td>
												<td><strong>37</strong></td>
											</tr>
											<tr>
												<td>숭인아파트 상가앞<span class="point_red01">(08,10,11,12시 정차)</span></td>
												<td><strong>37</strong></td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>
						</ul>
					</li>
					<!-- 2호차 노선 관련 정보 끝 -->
				</ul>
			</li>
		</ul>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
