<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String pTitle="공공시설";
String sTitle="공원시설물";
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
	<%@ include file="/resources/include/mobile/inc/submenu3.jsp" %>
	<%@ include file="/resources/include/mobile/inc/navi.jsp" %>
</div>
<div id="body"> 
	<!--real Contents S-->
	<div class="pageSection">
		<ul class="guide mb15">
			<li><strong>공원 시설물 현황</strong>
				<ul>
					<li class="none">
						<div class="tblWrap">
							<table border="0" cellspacing="0" cellpadding="0" class="tbl01" summary="연번, 공원시설물명,위치,내용,비고로 이루어진 표">
								<caption>
								공원 시설물 현황
								</caption>
								<colgroup>
								<col style="width:15%;" />
								<col style="width:20%;" />
								<col style="width:25%;" />
								<col style="width:30%;" />
								<col />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">연번</th>
										<th scope="col">공원시설물명</th>
										<th scope="col">위치</th>
										<th scope="col">내용</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>계</td>
										<td colspan="2">3개소</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>1</td>
										<td>북악팔각정</td>
										<td>종로구 평창동 산6-17외 8필지</td>
										<td>본체, 제1,2휴게소, <br />
											전통한옥매점, 주차장 등</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>2</td>
										<td>경희궁공원 자판기</td>
										<td>종로구 신문로 2가 2-1</td>
										<td>자동자판기3개(커피1, 음료2) </td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>3</td>
										<td>마로니에 공원 카페</td>
										<td>종로구 대학로 104</td>
										<td>카페 1개소 </td>
										<td>&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li>공원시설물은 민간위탁관리하고 있으며 입찰참가자격은 개인 또는 법인 모두 참가하실 수 있습니다.</li>
					<li> 앞으로도 우리공단에 더욱 많은 관심을 가져주시기 바라며 문의사항이 있으시면 아래 연락처로 연락주시기 바랍니다.
						<ul>
							<li><strong>문의</strong> : 공공시설팀 ☎ 02-3676-0585</li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<!--real Contents E--> 
</div>
<%@ include file="/resources/include/mobile/inc/bottom.jsp" %>
</body>
</html>
