<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String pTitle="문화체육시설";
String sTitle="청소년문화센터";
String sNo="5";
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
	<!--real Contents S--> 
	<!-- page내 소섹션 스타일1 구분 단위 시작 -->
	<div class="pageSection">
		<ul class="guide">
			<li> <strong>대관 접수안내</strong>
				<ul>
					<li><strong>대관 접수 시 담당 (송민선, 임동옥)과 상담 후 대관료 납부완료 하시면 사용 가능하십니다 .</strong>
						<ul>
							<li>사용료는 대관일 7일전까지 납부완료 </li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- page내 소섹션 스타일1 구분 단위 끝 --> 
	<!-- page내 소섹션 스타일2 구분 단위 시작 -->
	<div class="pageSection mt30">
		<ul class="guide">
			<li> <strong>대관료 안내</strong>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="시설별 사용목적,사용시간,대관료,기준인원,비고로 이루어진 표" class="tbl01 ta_c mt10">
					<caption>
					대관료 안내
					</caption>
					<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">시설명</th>
							<th scope="col">대상</th>
							<th scope="col">사용시간</th>
							<th scope="col">대관료(기준액)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="2">체조장</td>
							<td>청소년</td>
							<td>1시간</td>
							<td>5,500</td>
						</tr>
						<tr>
							<td>일 반</td>
							<td>1시간</td>
							<td>22,000</td>
						</tr>
					</tbody>
				</table>
		</ul>
	</div>
	<!-- page내 소섹션 스타일2 구분 단위 끝 --> 
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
