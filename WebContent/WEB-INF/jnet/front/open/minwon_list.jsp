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
				<div class="top_info"> 
					<p class="infom">종로구시설관리공단의 불편사항에 대한 민원을 접수하는 곳입니다.<br />
 공단과 무관한 내용, 상업성, 저속한 표현, 명예훼손, 반사회적인 글과 직원 또는 특정인에 대한 실명기재, 비방, 동일 건에 대한 반복 등의 글은 <strong>예고 없이 삭제 또는 비공개로 전환될 수</strong> 있습니다. <br />
비공개로 등록된 민원은 목록에 표시되지 않으며, <strong>[나의민원보기]</strong>에서만 확인이 가능합니다. </p>
<p class="infom">민원상담 접수 후 <strong>[답변중/답변완료]</strong>인 상태가 되면 삭제/수정할 수 없습니다. </p>
				</div>
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
						<form name="pgtSearch" method="post" action="/open/minwon_list.jsp">
							<select name="pgtFacil" id="pgtFacil" title="시설명 선택">
								<option>시설관리공단</option>
								<option>올림픽기념국민생활관</option>
								<option>종로구민회관</option>
								<option>종로문화체육센터</option>
								<option>동부여성문화센터</option>
								<option>청소년문화센터</option>
								<option>삼청테니스장</option>
							</select>
							<select name="kwdtype" id="kwdtype" title="검색방법 선택" class="schSel">
							<option>제목</option>
							<option>내용</option>
							</select>
							<input type="text" name="schKwd" id="schKwd" title="검색어 입력" class="schKwd"  style="width:200px;" />
							<input type="image" alt="검색" id="pgtschBtn" src="/resources/include/commonfile/image/common/btn_search.gif" />
						</form>
					</div>
					<!-- Sports & culture list top Search -->
					
					<div class="boardWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 자주 묻는 질문의 목록표">
							<caption>
							자주 묻는 질문
							</caption>
							<colgroup>
							<col width="40px" />
							<col width="120px" />
							<col />
							<col width="50px" />
							<col width="70px" />
							<col width="70px" />
							<col width="40px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">부서</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">처리사항</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>10</td>
									<td>종로구민회관</td>
									<td class="title"><a href="minwon_view.jsp">종로구 민원 제기왕으로써 민원제기의 편의성 향상을 위해 제안합니다.</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>접수대기</td>
									<td>1221</td>
								</tr>
								<tr>
									<td>9</td>
									<td>문화체육센터</td>
									<td class="title"><a href="minwon_view.jsp">팔각정 동상이 애들 교육상 좋질 않습니다. 철거해주시거나 적절한 조취를 취해주시기 바랍니다.</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>답변중</td>
									<td>23</td>
								</tr>
								<tr>
									<td>8</td>
									<td>청소년문화센터</td>
									<td class="title"><a href="minwon_view.jsp">청소년 문화센터 주변에 불법 시설들에 대한 단속은 구청 소관인가요? 공단 소관인가요?</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>답변완료</td>
									<td>323</td>
								</tr>
								<tr>
									<td>7</td>
									<td>올림픽기념국민생활관</td>
									<td class="title"><a href="minwon_view.jsp">종로에서 북악스카이웨이로 가는 길에 아스팔트가 벗겨진 곳에 대해서는 언제 보수가 되나요?</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>접수대기</td>
									<td>1221</td>
								</tr>
								<tr>
									<td>6</td>
									<td>삼청테니스장</td>
									<td class="title"><a href="minwon_view.jsp">삼청동 테니스장 7일 정도 전세 임대 가능한지요?</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>답변완료</td>
									<td>23</td>
								</tr>
								<tr>
									<td>5</td>
									<td>동부여성문화센터</td>
									<td class="title"><a href="minwon_view.jsp">동부여성 문화센터는 여자만 이용가능한가요?</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>접수대기</td>
									<td>323</td>
								</tr>
								<tr>
									<td>4</td>
									<td>청소년문화센터</td>
									<td class="title"><a href="minwon_view.jsp">청소년 문화센터 내 취식 금지 아닌가요?</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>답변완료</td>
									<td>222</td>
								</tr>
								<tr>
									<td>3</td>
									<td>문화체육센터</td>
									<td class="title"><a href="minwon_view.jsp">문화체육센터 셔틀 버스 운영 시간에 대해 문의 드립니다.</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>접수대기</td>
									<td>222</td>
								</tr>
								<tr>
									<td>2</td>
									<td>종로구민회관</td>
									<td class="title"><a href="minwon_view.jsp">종로구민회관 강당 대여를 신청하고 싶습니다.</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>답변중</td>
									<td>222</td>
								</tr>
								<tr>
									<td>1</td>
									<td>종로구민회관</td>
									<td class="title"><a href="minwon_view.jsp">종로구민 회관 내의 사과나무의 사과는 언제 따나요?</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>답변중</td>
									<td>222</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- board paging -->
					<div class="pgeAbs mt30"> 
						<!--페이징 영역 시작 :프로그램 작성시 현재 페이지는 span에 class로 tp를 추가로 부여하면 현재페이지 처리됨.-->
						<p class="paging">
                        <span class="prev"><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></span>
                        <span class="prev mr15"><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></span>
                        <span class="paging tp first">1</span>
                        <span class="paging">2</span>
                        <span class="paging">3</span>
                        <span class="paging">4</span>
                        <span class="paging">5</span>
                        <span class="paging">6</span>
                        <span class="paging">7</span>
                        <span class="paging">8</span>
                        <span class="paging">9</span>
                        <span class="paging">10</span>
                        <span class="next ml10"><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></span>
                        <span class="next"><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></span>
                        </p>                        
                        
                        
<!--                        
						<p class="paging"> <span class="prev"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageFirst.gif" alt="맨 첫 페이지로 가기" /></a></span> <span class="prev mr15"><a href=""><img src="/resources/include/commonfile/image/board/btn_pagePrev.gif" alt="이전 10개 보기" /></a></span> <span class="paging tp first">1</span> <span class="paging"><a href="">2</a></span> <span class="paging"><a href="">3</a></span> <span class="paging"><a href="">4</a></span> <span class="paging"><a href="">5</a></span> <span class="paging"><a href="">6</a></span> <span class="paging"><a href="">7</a></span> <span class="paging"><a href="">8</a></span> <span class="paging"><a href="">9</a></span> <span class="paging"><a href="">10</a></span> <span class="next ml10"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageNext.gif" alt="다음 10개 보기" /></a></span> <span class="next"><a href=""><img src="/resources/include/commonfile/image/board/btn_pageLast.gif" alt="맨 마지막 페이지로 가기" /></a></span> </p>
-->    
						<div class="frBtn"> 
						</div>
					</div>
					<!-- board paging --> 
					<div class="btn_farm2 mt20 mb20">
							<!-- Text Button --> 
							<span class="txtBtn_Gray"><a href="minwon_main.jsp" >민원신청하기</a></span> 
							<!-- Text Button --> 
							<!-- Text Button --> 
							<span class="txtBtn_lightGray"><a href="minwonFake_list.jsp" >나의민원조회</a></span> 
							<!-- Text Button --> 
					</div>
				</div>
				
				<!-- search Box -->
				<!-- search Box --> 
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
<script type="text/javascript">initMenu(4,4,0,0);</script>
</body>
</html>