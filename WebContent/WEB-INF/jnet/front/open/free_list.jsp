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
					<p class="infom">자유게시판은 건전하고 자유로운 의견을 나눌 수 있는 공간입니다.<br />
답변을 원하시는 사항이나 민원관련 내용은 전자민원 메뉴를 이용하여 주시기 바랍니다.<br />
<strong>개인정보, 음란물, 상품광고 등의 본래의 취지에 부합되지 않은 게시물은 예고 없이 삭제 될 수 있습니다.</strong></p>
				</div>
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Sports & culture list top Search -->
					<div class="pageTopSearch">
						<form name="pgtSearch" method="post" action="/open/free_list.jsp">
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
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bd00 bd00Bbs" summary="번호,시설명, 분류, 제목, 조회수의 게시물의 목록표">
							<caption>
							게시물 리스트
							</caption>
							<colgroup>
							<col width="40px" />
							<col width="140px" />
							<col />
							<col width="60px" />
							<col width="60px" />
							<col width="60px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">부서</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>10</td>
									<td>올림픽기념국민생활관</td>
									<td class="title"><a href="free_view.jsp">너무 올리는 것 아닌가요? </a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>1221</td>
								</tr>
								<tr>
									<td>9</td>
									<td></td>
									<td class="title"><a href="free_view_02.jsp">--> 체육관 프로그램 배드민턴 이용요금에 대하여 답변 드립니다 </a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>23</td>
								</tr>
								<tr>
									<td>8</td>
									<td>동부여성문화센터</td>
									<td class="title"><a href="free_view.jsp">주말렛슨문의 </a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>323</td>
								</tr>
								<tr>
									<td>7</td>
									<td></td>
									<td class="title"><a href="free_view_02.jsp">--> 주말렛슨문의에 대한 답변 입니다.</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>1221</td>
								</tr>
								<tr>
									<td>6</td>
									<td>종로구민회관</td>
									<td class="title"><a href="free_view.jsp">온라인접수버튼이안넘어가네요</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>23</td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td class="title"><a href="free_view_02.jsp">--> 고객님 안녕하세요, 문의사항에 대하여 답변드립니다.  </a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>323</td>
								</tr>
								<tr>
									<td>4</td>
									<td>청소년문화센터</td>
									<td class="title"><a href="free_view.jsp">대한민국 대표축제 제15회 김제지평선축제가 벽골제에서 열립니다.</a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>222</td>
								</tr>
								<tr>
									<td>3</td>
									<td>&nbsp;</td>
									<td class="title"><a href="free_view_02.jsp">--> 자유게시판의 본래 취지에 부합되지 않은 게시물입니다.  </a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>222</td>
								</tr>
								<tr>
									<td>2</td>
									<td>삼청테니스장</td>
									<td class="title"><a href="free_view.jsp">테니스 레슨문의 </a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
									<td>222</td>
								</tr>
								<tr>
									<td>1</td>
									<td></td>
									<td class="title"><a href="free_view_02.jsp">--> 주말렛슨문의 </a></td>
									<td>이○○</td>
									<td>2013.11.30</td>
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
							<!-- Text Button --> 
							<span class="txtBtn_Gray"><a href="free_write.jsp" >글쓰기</a></span> 
							<!-- Text Button --> 
						</div>
					</div>
					<!-- board paging --> 
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
<script type="text/javascript">initMenu(4,2,0,0);</script>
</body>
</html>