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
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자를 포함한 게시물 상세보기의 표" class="bd00view">
						<caption>
						게시물 내용 상세보기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row">제목</th>
							<td class="bd01td listx">명품 스타일의 저가 가방과 지갑 그리고 포인트 멤버쉽 카드 다수</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">작성자</th>
							<td class="bd01td">관리자</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">습득 및 분실일</th>
							<td class="bd01td">2013년 8월 26일</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">습득 및 분실 장소</th>
							<td class="bd01td">구민회관 대강당 좌측 1열 의자 밑</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">보관 유무</th>
							<td class="bd01td">보관중</td>
						</tr>
						<tr>
							<td colspan="2" scope="row" class="bd01tdC"><p><img src="/resources/include/commonfile/image/attached/lostsampl1.jpg" width="257" height="198" alt="제목을 alt값으로" /></p>
								<p>&nbsp;</p>
								<p>2013년 8월 26일 오후 2시 경 구민회관 강당 좌측 1열 의자 아래에서 사진과 은 살구색 가방과 검정색 갑을 습득하였습니다.</p>
								<p>1층 안내데스크에서 보관 중에 있사오니,</p>
								<p>보관 시일 내에 찾아가 주시기 바랍니다.</p></td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="lost_list.jsp" >목록으로</a></span> 
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
<script type="text/javascript">initMenu(1,1,1,5);</script>
</body>
</html>