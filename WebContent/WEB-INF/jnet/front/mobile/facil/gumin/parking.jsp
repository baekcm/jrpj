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
	<!--real Contents S-->
	<div class="pageSection">
		<ul class="guide">
			<li><strong>주차장 이용시간안내</strong>
				<ul>
					<li><strong>평일(월-금)</strong>
						<ul>
							<li> 06:00~22:00</li>
						</ul>
					</li>
					<li>
						<p class="point_blue01"><strong>토요일</strong></p>
						<ul>
							<li> 06:00~20:00</li>
						</ul>
					</li>
					<li>
						<p class="point_red02"><strong>일요일</strong></p>
						<ul>
							<li> 09:00~20:00</li>
						</ul>
					</li>
					<li>
						<p class="point_red02"><strong>공휴일</strong></p>
						<ul>
							<li><strong>미운영</strong></li>
						</ul>
					</li>
				</ul>
			</li>
			<li><strong>주차장 이용안내</strong>
				<ul>
					<li><strong>회원은 3시간 무료이용</strong> (주차권 발급후 안내데스크에 회원증과 같이 제출하여 확인도장 받아야 함)</li>
					<li>
						<p class="point_blue01">차량자율요일제 시행으로 자율요일제 스티커 부착 차량만이 이용 가능 <br />
							(서울 차량은 전자테그 부착 차량만이 이용 가능)</p>
					</li>
				</ul>
			</li>
			<li><strong>주차장 이용요금안내</strong>
				<ul>
					<li><strong>비회원 주차요금</strong> : 최초30분 1,000원/ 초과시 10분당 500원씩 가산됨 </li>
				</ul>
			</li>
		</ul>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
