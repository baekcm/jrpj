<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String pTitle="문화체육시설";
String sTitle="올림픽기념국민생활관";
String sNo="1";
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
			<li><strong>셔틀버스 1호차 노선 안내</strong>
				<ul>
					<li><strong>평일</strong>: 08:05 / 09:10 / 10:10 / 11:10 / 12:10 / 14:10 / 15:10 / 16:10 / 17:10 /18:10<br />
					</li>
					<li><strong>토요일</strong>: 08:05 / 09:10 / 10:10 / 11:10 / 12:10</li>
					
					<!-- 1호차 노선 관련 정보 시작 -->
					<li><strong>1호차(종로,안국,삼청) 노선도</strong>
						<ul>
							<li class="none"><img src="/resources/include/commonfile/image/content/olympic/bus_map0805.gif" alt="1호차 셔틀 버스 노선도 ( 노선도의 상세 내용은 아래의 노선도 표를 참고)" /></li>
							<li class="none">
								<div class="tblWrap">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="셔틀의 출발위치 및 도착시간, 정류소 사진 보기를 정리한 표. " class="tbl01 ta_c">
										<caption>
										1호차(종로,안국,삼청) 노선도
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
												<td>혜화역 4번출구</td>
												<td>6</td>
											</tr>
											<tr>
												<td>서울대병원</td>
												<td>7</td>
											</tr>
											<tr>
												<td>이화로터리</td>
												<td>9</td>
											</tr>
											<tr>
												<td>원남동 우리은행</td>
												<td>10</td>
											</tr>
											<tr>
												<td>종로4가 웅진출판</td>
												<td>12</td>
											</tr>
											<tr>
												<td>종로3가역 1번출구</td>
												<td>13</td>
											</tr>
											<tr>
												<td>종각역 1번출구</td>
												<td>14</td>
											</tr>
											<tr>
												<td>교보빌딩</td>
												<td>15</td>
											</tr>
											<tr>
												<td>경복궁역 3번출구</td>
												<td>16</td>
											</tr>
											<tr>
												<td>효자동 강남의원</td>
												<td>17</td>
											</tr>
											<tr>
												<td>청운동사무소앞(효자할인마트)</td>
												<td>19</td>
											</tr>
											<tr>
												<td>서울국군병원 전문</td>
												<td>21</td>
											</tr>
											<tr>
												<td>재동초교 앞</td>
												<td>22</td>
											</tr>
											<tr>
												<td>전통병과 교육원(안국선원)</td>
												<td>23</td>
											</tr>
											<tr>
												<td>삼청공원 입구(명성마트)</td>
												<td>26</td>
											</tr>
											<tr>
												<td>성북동 버스종점</td>
												<td>32</td>
											</tr>
											<tr>
												<td>쌍다리 기사식당</td>
												<td>37</td>
											</tr>
									</table>
								</div>
							</li>
						</ul>
					</li>
					<!-- 1호차 노선 관련 정보 끝 --> 
					<!-- 2호차 노선 관련 정보 시작 --> 
					<!--<li class="mt20"><strong>1호차(종로,안국,삼청) 노선도</strong>
									<ul>
										<li class="none"><img src="/resources/include/commonfile/image/content/olympic/bus_map0910.gif" alt="1호차 셔틀 버스 노선도 ( 노선도의 상세 내용은 아래의 노선도 표를 참고)" /></li>
										<li class="none">
											<div class="tblWrap">
												<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="셔틀의 출발위치 및 도착시간, 정류소 사진 보기를 정리한 표. " class="tbl01 ta_c">
													<caption>
													1호차(종로,안국,삼청) 노선도
													</caption>
													<colgroup>
													<col style="width:230px;" />
													<col style="width:180px;" />
													<col />
													</colgroup>
													<thead>
													<tr>
														<th scope="col">출발위치</th>
														<th scope="col">도착시간(매시 분)</th>
														<th scope="col">정류소 사진 보기</th>
													</tr>
													</thead>
													<tbody>
													<tr>
														<td>혜화역 4번출구</td>
														<td>6</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-11.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>서울대병원</td>
														<td>7</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-12.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>이화로터리</td>
														<td>9</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-13.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>원남동 우리은행</td>
														<td>10</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-14.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>종로4가 웅진출판</td>
														<td>12</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-15.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>종로3가 1번출구</td>
														<td>13</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-16.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>종각역 1번출구</td>
														<td>14</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-17.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>교보빌딩</td>
														<td>15</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-18.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>경복궁역 3번출구</td>
														<td>16</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-19.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>효자동 강남의원</td>
														<td>17</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-20.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>청운동사무소앞(효자할인마트)</td>
														<td>19</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-22.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>서울국군병원 전문</td>
														<td>21</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-23.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>재동초교 앞</td>
														<td>22</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-25.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>전통병과 교육원(안국선원)</td>
														<td>23</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-26.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>삼청공원 입구(명성마트)</td>
														<td>26</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-27.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>성북동 버스종점</td>
														<td>32</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-30.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>쌍다리 기사식당</td>
														<td>37</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-31.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
												</table>
											</div>
										</li>
									</ul>
								</li>--> 
					<!-- 2호차 노선 관련 정보 끝 --> 
					<!-- 2호차 노선 관련 정보 시작 --> 
					<!--<li class="mt20"><strong>1호차(종로,안국,삼청) 노선도</strong>
									<ul>
										<li class="none"><img src="/resources/include/commonfile/image/content/olympic/bus_map1010.gif" alt="1호차 셔틀 버스 노선도 ( 노선도의 상세 내용은 아래의 노선도 표를 참고)" /></li>
										<li class="none">
											<div class="tblWrap">
												<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="셔틀의 출발위치 및 도착시간, 정류소 사진 보기를 정리한 표. " class="tbl01 ta_c">
													<caption>
													1호차(종로,안국,삼청) 노선도
													</caption>
													<colgroup>
													<col style="width:230px;" />
													<col style="width:180px;" />
													<col />
													</colgroup>
													<thead>
													<tr>
														<th scope="col">출발위치</th>
														<th scope="col">도착시간(매시 분)</th>
														<th scope="col">정류소 사진 보기</th>
													</tr>
													</thead>
													<tbody>
													<tr>
														<td>혜화역 4번출구</td>
														<td>6</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-11.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>서울대병원</td>
														<td>7</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-12.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>이화로터리</td>
														<td>9</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-13.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>원남동 우리은행</td>
														<td>10</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-14.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>종로4가 웅진출판</td>
														<td>12</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-15.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>종로3가 1번출구</td>
														<td>13</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-16.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>종각역 1번출구</td>
														<td>14</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-17.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>교보빌딩</td>
														<td>15</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-18.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>경복궁역 3번출구</td>
														<td>16</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-19.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>효자동 강남의원</td>
														<td>17</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-20.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>청운동사무소앞(효자할인마트)</td>
														<td>19</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-22.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>서울국군병원 전문</td>
														<td>21</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-23.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>재동초교 앞</td>
														<td>22</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-25.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>전통병과 교육원(안국선원)</td>
														<td>23</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-26.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>삼청공원 입구(명성마트)</td>
														<td>26</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-27.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>성북동 버스종점</td>
														<td>32</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-30.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
													<tr>
														<td>쌍다리 기사식당</td>
														<td>37</td>
														<td><a href="#none" onclick="javascript:window.open('shut1/1-31.htm','','width=530,height=320,top=300,left=500,scrollbars=no,resizable=no')" title="새 창 열림"><img src="/resources/include/commonfile/image/common/icon_picture.gif" alt="정류소 사진 보기" /></a></td>
													</tr>
												</table>
											</div>
										</li>
									</ul>
								</li>--> 
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
