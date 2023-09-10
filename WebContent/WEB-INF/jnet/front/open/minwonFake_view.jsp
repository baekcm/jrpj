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
				<div class="boardWrap mb20">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bd00view" summary="민원 제기건의 기본정보 내용">
						<caption>
						기본정보
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						<col width="120px" />
						<col width="250px" />
						</colgroup>
						<tr>
							<th colspan="4" class="ta_l" scope="row"><p>기본정보</p></th>
						</tr>
						<tr>
							<th class="ta_l" scope="row">등록일</th>
							<td class="bd01td">2013-10-30</td>
							<th class="ta_l">성명</th>
							<td class="bd01td">이○○</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">부서/처리일자</th>
							<td class="bd01td">종로구민회관</td>
							<th class="ta_l">분야</th>
							<td class="bd01td">운영/서비스</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">상태</th>
							<td colspan="3" class="bd01td">접수대기</td>
						</tr>
					</table>
				</div>
				<div class="boardWrap">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="민원제목과 내용을 포함한 민원상담내용 상세보기의 표" class="bd00view">
						<caption>
						민원상담내용 상세보기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						<col width="120px" />
						<col width="250px" />
						</colgroup>
						<tr>
							<th colspan="4" class="ta_l" scope="row"><p>민원상담내용</p></th>
						</tr>
						<tr>
							<th class="ta_l" scope="row">민원제목</th>
							<td colspan="3" class="bd01td"><a href="minwonFake_view.jsp">동부여성 문화센터는 여자만 이용가능한가요?</a></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">민원내용</th>
							<td colspan="3" class="bd01td">동부여성문화센터 프로그램중에서 남자인 저도 수강하고 싶은 프로그램이 있는데요.<br />
남자도 수강이 가능한지요?
								<p>&nbsp;</p></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">답변</th>
							<td colspan="3" class="bd01td">동부여성문화센터 프로그램중에서 여성으로 제한된 프로그램은 여성만 이용 가능하십니다.<br />
특별히 제한이 없는 경우에는 남성 시민 여러분도 이용이 가능하십니다.
<br />
감사합니다.</td>
						</tr>
						<tr id="msatispoint">
							<th class="ta_l" scope="row">답변만족도</th>
							<td colspan="3" class="bd01td"><p class="mb05"><strong class="fl">만족도: </strong>
								
								<ul class="msatis">
									<li>
										<label for="msatisr5">
											<input id="msatisr5" type="radio" value="" name="msatisr" />
											매우만족</label>
									</li>
									<li>
										<label for="msatisr4">
											<input id="msatisr4" type="radio" value="" name="msatisr" />
											만족</label>
									</li>
									<li>
										<label for="msatisr3">
											<input id="msatisr3" type="radio" value="" name="msatisr" />
											보통</label>
									</li>
									<li>
										<label for="msatisr2">
											<input id="msatisr2" type="radio" value="" name="msatisr" />
											불만족</label>
									</li>
									<li>
										<label for="msatisr1">
											<input id="msatisr1" type="radio" value="" name="msatisr" />
											매우불만족</label>
									</li>
								</ul>
								</p>
								<p class="ovh clb">
									<label for="mreply"><strong>코멘트:</strong>
										<input type="text" name="mreply" id="mreply" style=" height:18px; width:350px;" />
									</label>
									<!-- Text Button --> 
									<span class="txtBtn_lightGray"><a href="free_list.jsp" >확인</a></span> 
									<!-- Text Button --> </p></td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_Gray"><a href="minwon_list.jsp" >민원취소</a></span> 
					<!-- Text Button --> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="minwonFake_list.jsp" >목록으로</a></span> 
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
<script type="text/javascript">initMenu(4,4,0,0);</script>
</body>
</html>