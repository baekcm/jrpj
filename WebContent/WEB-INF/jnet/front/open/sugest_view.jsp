<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
</head>

<body>
<div class="accessibility"> <a href="#contentcore">본문바로가기</a> </div>
<div id="topheader">
	<%@ include file="/resources/include/commonfile/inc/top.jsp" %>
</div>
<div id="topVisual">
	<div id="visual"><img src="/resources/include/commonfile/image/visual/visual01.jpg" alt="눈과 귀를 열고 고객만족 1등 공기업을 만들기위해 최선을 다하겠습니다." /> </div>
</div>
<div id="middle">
	<div id="contbody">
		<div id="contleft">
			<h2></h2>
			<div class="lnbBody">
				<ul id="lnb" class="lnbul">
					<li></li>
				</ul>
			</div>
			<!--lnb Bottom Icon Area -->
			<%@ include file="/resources/include/commonfile/inc/lnb_bottom.jsp" %>
			<!--lnb Bottom Icon Area --> 
		</div>
		<div id="contentcore">
			<div class="naviandtitle">
				<h3></h3>
				<p class="navi"></p>
			</div>
			<div class="contents"> 
				<!-- tabMaker  -->
				<div class="ttabWrap">
					<ul id="ttab3">
						<li></li>
					</ul>
				</div>
				<!-- tabMaker  --> 
				<!-- real Contents -->
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제안제목과 내용을 포함한 제안내용 상세보기의 표" class="bd00view">
						<caption>
						제안내용 상세보기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row">성명</th>
							<td class="bd01td">김을동</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">구분</th>
							<td class="bd01td">주민제안</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">연락처</th>
							<td class="bd01td">02-101390-21293</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">이메일</th>
							<td class="bd01td">kimdoohan@ggangpae.com</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">공개여부</th>
							<td class="bd01td">비공개</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">제안제목</th>
							<td class="bd01td">종로의 영웅 김두한 기념관 건립 사업 제안</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">개요/목적</th>
							<td class="bd01td">종로하면 
								<p>가장 먼저 떠 오르는 건 김두한.</p>
								<p>야인시대의 테마파크화.</p></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">현황/문제점</th>
							<td class="bd01td">돈이 없다.</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">개선방안</th>
							<td class="bd01td">연말만 되면 멀쩡한 도로 뜯어서 고치지 말고...</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">기대효과</th>
							<td class="bd01td">관광수입?</td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_Gray"><a href="sugest_modify.jsp" >수정</a></span> 
					<!-- Text Button --> 
					<!-- Text Button --> 
					<span class="txtBtn_Gray"><a href="#" >삭제</a></span> 
					<!-- Text Button --> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="sugest_list.jsp" >목록으로</a></span> 
					<!-- Text Button --> 
				</div>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq}"/>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(4,5,0,0);</script>
</body>
</html>