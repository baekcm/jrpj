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
				<!-- real Contents -->
				<div class="pageSection"> 
					<!-- Sports & culture list top Search --><!-- Sports & culture list top Search -->
					
					<div class="tblWrap mb30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="강좌명, 시간,요일, 대상, 단가, 할인적용, 할인금액, 결젝금액을 나타낸 표 " class="tbl01 tdCenter">
							<caption>
							신청강좌 결제(예정)목록
							</caption>
							<colgroup>
							<col />
							<col style="width:80px;*width:66px;" />
							<col style="width:80px;*width:66px;" />
							<col style="width:70px;*width:56px;" />
							<col style="width:55px;*width:41px;" />
							<col style="width:90px;*width:76px;" />
							<col style="width:70px;*width:56px;" />
							<col style="width:70px;*width:56px;" />
							<col style="width:45px;*width:31px;" />
							</colgroup>
							<tr>
								<th scope="col">강좌</th>
								<th scope="col">시간</th>
								<th scope="col">요일</th>
								<th scope="col">대상</th>
								<th scope="col">단가</th>
								<th scope="col">할인적용</th>
								<th scope="col">할인금액</th>
								<th scope="col">결제금액</th>
								<th scope="col">삭제</th>
							</tr>
							<tr>
								<td><a href="../olympic/sports_view.jsp">06시 해오름 수영 A</a>(월~토)</td>
								<td><a href="../olympic/sports_view.jsp">06:00~06:50</a></td>
								<td>월 ~ 토</td>
								<td>성인남/여</td>
								<td>80,300</td>
								<td><select name="discount" id="discount" title="할인적용">
										<option>할인없음</option>
									</select></td>
								<td>0</td>
								<td>80,300</td>
								<td><a href="#link"><img src="/resources/include/commonfile/image/board/btn_delete.gif"  alt="삭제하기" /></a></td>
							</tr>
							<tr>
								<td><a href="../olympic/sports_view.jsp">06시 해오름 수영 A</a>(화수목)</td>
								<td><a href="../olympic/sports_view.jsp">06:00~06:50</a></td>
								<td>화,수,목</td>
								<td>성인남/여</td>
								<td>49,500</td>
								<td><select name="discount2" id="discount2" title="할인적용">
										<option>할인없음</option>
									</select></td>
								<td>0</td>
								<td>49,500</td>
								<td><a href="#link"><img src="/resources/include/commonfile/image/board/btn_delete.gif"  alt="삭제하기" /></a></td>
							</tr>
						</table>
					</div>
					<div class="tblWrap">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="품목,총액,할인금액,결제금액을 나타낸 표. " class="tbl01">
							<caption>
							결제표
							</caption>
							<tr>
								<th width="60px" scope="row">품목</th>
								<td>수영교실A(06)(월~토) 외 1건</td>
								<th width="60px" scope="row">총액</th>
								<td width="60px">129,800</td>
								<th width="60px" scope="row">할인금액</th>
								<td width="60px">0</td>
								<th width="60px" scope="row">결제금액</th>
								<td width="60px">129,800</td>
							</tr>
						</table>
					</div>
					<div class="btn_farm2 mt20 mb20"> 
						<!-- Text Button --> 
						<span class="txtBtn_lightGray"><a href="../olympic/sports_list.jsp" >강좌목록</a></span> 
						<!-- Text Button --> 
						<!-- Text Button --> 
						<span class="txtBtn_Gray"><a href="#" onClick="if(confirm('선택하신 프로그램에 대해 결제하시겠습니까?')){alert('결제를 진행합니다');}">결제하기</a></span> 
						<!-- Text Button --> 
					</div>
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
<script type="text/javascript">initMenu(1,1,2,0);</script>
</body>
</html>