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
		<ul class="guide">
			<li><strong>미납요금 납부안내</strong>
				<ol>
					<li>1. 현장 납부 : 해당공영주차장에 방문하여 주차관리원에게 납부합니다.<br />
					</li>
					<li>2. 계좌납부 : 우리은행 1005-901-606851 계좌에 입금 <br />
						<ul>
							<li>※입금시 반드시 차량번호 뒷자리 4자리를 기재하여 주시기 바랍니다. </li>
						</ul>
					</li>
					<li>3. 부득이한 사정으로 주차요금을 납부하지 못하신 경우 저희 공단으로 연락(☎ 02-2236-0052) 주시면 신속히 처리하여 드립니다.</li>
				</ol>
			</li>
			<li><strong>주차요금 미납차량에 대한 조치</strong>
				<ol>
					<li>1. 주차요금을 납부하지 않을시 주차요금 납부안내문이 차량 소재지로 발송</li>
					<li>2. 납부기한까지 주차요금 미납부시 1,2차 고지서 원금, 3차 고지시 주차요금의 4배에 해당하는 가산금 부과</li>
					<li>3. 장기간 납부하지 않을시 차량 소유자의 재산 압류 처분</li>
				</ol>
			</li>
			<li><strong>주차요금 관령 법령 안내</strong>
				<ol>
					<li>1. 주차장법 제9조 3항(노상주차장의 주차요금 징수 등)</li>
					<li>2. 서울특별시 종로구주차장설치 및 관리조례 제2조 1,2항(주차요금 및 가산금)</li>
					<li>3. 지방세법 제28조1항(체납처분 압류)</li>
				</ol>
			</li>
			<li><strong>안내말씀</strong>
				<ol>
					<li>1. 주차요금은 전액 구청 주차장 특별회계로 입금되어 주차장신설, 교통안전, 시설물 설치 등에 쓰여집니다.</li>
					<li>2. 주차요금 납부 후 영수증은 반드시 교부받으시기 바랍니다.</li>
					<li>3. 주차장 이용문의 불편사항은 우리 공단 주차시설관리팀(☎ 02-2236-0052)으로 연락하여 주시기 바랍니다.<br />
					</li>
				</ol>
			</li>
		</ul>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
