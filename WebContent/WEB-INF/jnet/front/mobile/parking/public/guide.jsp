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
			<li><strong>주차적용요금 안내</strong>
				<ul>
					<li class="none">
						<table cellspacing="0" cellpadding="0" summary="급지 구분에 따른 주차요금과 할인 안내 표" class="tbl01 mb10">
							<caption>
							주차적용요금 안내
							</caption>
							<colgroup>
							<col style="width:9%;" />
							<col style="width:13%;" />
							<col style="width:15%;" />
							<col style="width:43%;" />
							<col />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">10분 요금 </th>
									<th scope="col">1시간 요금 </th>
									<th scope="col">할인안내</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1급지</td>
									<td>1,000원</td>
									<td>6,000원</td>
									<td class="ta_l" rowspan="5"><ul class="guide">
											<li style="background:none;padding:0">
												<ul>
													<li style="background:none;padding:0" class="mt00">
														<ul>
															<li class="point_green02">장애인 및 국가유공자 할인 : 80%</li>
															<li class="point_green02">경차할인 : 50%</li>
															<li class="point_green02">저공해차량할인 : 50%할인</li>
															<li class="point_green02">다자녀할인 : 30% (2자녀) 50% (3자녀 이상)</li>
															<li class="point_green02">65세이상 종로거주자 :   30%</li>
															<li class="point_green02">성실납세자 : 교부일로부터 1년면제 (성실납세증 표지부착차량)</li>
															<li class="point_green02">5.18유공 : 50%할인 (1시간초과시)</li>
															<li class="point_green02">요일제할인 : 30% (1급지 제외)</li>
														</ul>
													</li>
												</ul>
											</li>
										</ul></td>
									<td class="ta_l" rowspan="5"><ul class="guide">
											<li style="background:none;padding:0">
												<ul>
													<li style="background:none;padding:0"  class="mt00">월정기권
														<ul>
															<li>1급지:250,000원</li>
															<li>2급지:180,000원</li>
															<li>3급지:100,000원</li>
														</ul>
													</li>
												</ul>
											</li>
										</ul></td>
								</tr>
								<tr>
									<td>2급지</td>
									<td>500원</td>
									<td>3,000원</td>
								</tr>
								<tr>
									<td>3급지</td>
									<td>300원</td>
									<td>1,800원</td>
								</tr>
								<tr>
									<td>4급지</td>
									<td>200원</td>
									<td>1,200원</td>
								</tr>
								<tr>
									<td>5급지</td>
									<td>100원</td>
									<td>600원</td>
								</tr>
							</tbody>
						</table>
					</li>
					<li>운영시간외 주차된 시간은 주차요금을 부과 할 수 없으며, 또한 주차요금을 부과하지 않습니다. </li>
					<li> 감면대상 차량의 경우 수납전에 본인이 미리 제출한 경우에만 해당됩니다. </li>
					<li> 공영주차장내 지정받은 허가차량 외에는 무단 무료주차를 금합니다.</li>
					<li> 중복할인 시 높은 할인율로 하나만 적용됩니다. </li>
				</ul>
			</li>
		</ul>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
