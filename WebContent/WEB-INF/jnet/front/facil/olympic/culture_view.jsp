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
				<div class="pageSection"> 
					<!-- Sports & culture view top Search -->
					<div class="pageTopTitle">
						<dl>
							<dt>강좌명</dt>
							<dd>[수영프로] 아침 수영 C (성인 남여)</dd>
						</dl>
					</div>
					<!-- Sports & culture view top Search -->
					<div class="partSection bg_instructor">
						<div class="image3">
							<p><img src="/resources/include/commonfile/image/attached/program1.jpg" alt="제목을 alt값으로" /></p>
						</div>
						<ul class="guide2 wd_sports">
							<li>
								<p><strong>시간</strong> : 06:00~ 06:50 (단, 토요일은 07만 가능)</p>
							</li>
							<li>
								<p><strong>장소</strong>: 종로구민회관 장</p>
							</li>
							<li>
								<p><strong>수강료</strong> : 성인 49,500원 | 청소년 33,000원.</p>
							</li>
							<li>
								<p><strong>정원</strong>: 80명 (40명)</p>
							</li>
							<li>
								<p><strong>비고</strong> : 재수강 신청은 2013.08.16 ~ 2013.08.26일 까지입니다.</p>
							</li>
						</ul>
						<div class="partSection partInSection">
							<div class="image3">
								<p><img src="/resources/include/commonfile/image/attached/program2.jpg" alt="제목을 alt값으로" /></p>
							</div>
							<ul class="guide2 wd_instructor">
								<li>
									<p><strong>강사명</strong> : 김성진</p>
								</li>
								<li class="none">
									<dl>
										<dt><strong>주요경력</strong> :</dt>
										<dd>
											<p>올림픽기념 국민 생활관</p>
											<p>혜화 스포츠 센터</p>
											<p>하일라비치, 벽도 해수욕장 인명 구조원</p>
											<p>생활체육지도자 3급 (수영)</p>
										</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="pageSection mb30">
					<ul class="guide">
						<li><strong>강좌안내</strong>
							<ul>
								<li class="none">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="강좌의 소개와 내용과 준비물에 대한 안내표. " class="tbl01">
										<caption>
										강좌안내
										</caption>
										<colgroup>
										<col style="width:180px;" />
										<col  />
										</colgroup>
										<tr>
											<th scope="row">강좌 소개</th>
											<td>체중감량을 할 수 있다. 굽은 어깨가 곧게 펴진다. 폐활량이 좋아진다.</td>
										</tr>
										<tr>
											<th scope="row">강좌세부내용</th>
											<td>물 적응 및 자유형 (발차기 및 호흡, 팔 돌리기)</td>
										</tr>
										<tr>
											<th scope="row">개인준비물</th>
											<td>수영복, 수모, 물안경, 세면도구</td>
										</tr>
									</table>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="btn_farm2"> <a href="../olympic/program_cart.jsp"><img src="/resources/include/commonfile/image/board/btn_onlineapply.gif" alt="온라인 신청" /></a> </div>
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
<script type="text/javascript">initMenu(1,1,2,2);</script>
</body>
</html>