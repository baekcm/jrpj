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
						<col width="120px" />
						<col width="200px" />
						</colgroup>
						<tr>
							<th class="bd01th" scope="row">담당부서</th>
							<td colspan="3" class="bd01td">종로구민회관</td>
						</tr>
						<tr>
							<th class="bd01th" scope="row">구분</th>
							<td colspan="3" class="bd01td">시설물대관</td>
						</tr>
						<tr>
							<th class="bd01th" scope="row">제목</th>
							<td colspan="3" class="bd01td listx">대관신청시 주차장 사용은 어떻게 되나요? </td>
						</tr>
						<tr>
							<th class="bd01th" scope="row">작성자</th>
							<td colspan="3" class="bd01td">관리자</td>
						</tr>
						<tr>
							<th class="bd01th" scope="row">등록일</th>
							<td class="bd01td">2013.10.13 15:35</td>
							<th class="bd01th">조회수</th>
							<td class="bd01td">23,894</td>
						</tr>
<!--                        
						<tr>
							<th class="bd01th" scope="row">첨부파일</th>
							<td colspan="3" class="bd01td">KoreanoLibRanking.xls<img src="/resources/include/commonfile/image/board/b_ic_excel.gif" alt="파일형식별alt값" /></td>
						</tr>
-->                        
						<tr>
							<td colspan="4" scope="row" class="bd01tdC">
								<p>&nbsp;</p>
								<p>대관신청자중 주차무료대수는 3대까지 가능합니다.<br/>
								그 외 차량은 별도의 주차요금을 납부하셔야 합니다. <br /><br />
								이용고객 차량이 많은 관계로 불편하시더라도 대중교통 이용을 부탁드립니다.<br/><br />
                                더 궁금하신 사항이 있으시면 홈페이지를 참고하시거나 <br />
								전화 02-745-6701로 문의해 주시면 정성껏 답변해 드리겠습니다.</p></td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="faq_list.jsp" >목록으로</a></span> 
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
<script type="text/javascript">initMenu(4,1,0,0);</script>
</body>
</html>