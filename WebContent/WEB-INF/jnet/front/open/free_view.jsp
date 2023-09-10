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
							<td class="bd01td listx">너무 올리는 것 아닌가요? </td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">작성자</th>
							<td class="bd01td">이○○</td>
						</tr>
						<tr>
							<td colspan="2" scope="row" class="bd01tdC"><p>안녕하세요? 생활관을 여러가지로 이용하고 있습니다 <br />이번달은 6시 배드민턴을 집사람과 같이 쳤지요 <br />
							새로 생겼는데 사람이 없다기에 가입해서 억지로 게임하며 운동을 했지요 4~6명이 나와서 한시간 운동하기가 어렵지요 <br />
							그런데 
 방안을 마련하기 보다는 회원들을 봉으로 아는것 같군요 <br />
 매일 치는 것으로 해서 금액을 21450원으로 올렸는데 7시 타임은 44000원이지요 <br />
 7시 타임도 가격을 올리면서 단체레슨을 조건으로 올린것으로 압니다 <br />
 6시는 사람도 없어서 제대로 치지도 못하고 단체레슨도 없으면서 시간대비 금액은 거의 같게 올렷군요 <br />
 이런식의 금액 인상은 소비자를 우롱하고 생활체육의 의미를 잘모르고 하시는 것 같군요 <br />
 예전에는 생활관이 다른 시설물보다 저렴햇는데 이제는 아니지요 우리는 생활 체육을 기분 좋게 하고 싶군요</p></td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="free_list.jsp" >목록으로</a></span> 
					<!-- Text Button --> 
				</div>
				<div class="replyInput mb30">
					<div class="fl">
						<textarea name="content" id="content" cols="65" rows="5" title="댓글 내용 입력하기"></textarea>
					</div>
					<div class="fr">
						<p style="text-align:right">0 /100</p>
						<p> <a href="#giece" onclick="answerProc();"><img src="/resources/include/commonfile/image/board/btn_reply.gif" width="60" height="42" alt="댓글등록" /></a> </p>
					</div>
				</div>
				<ul class="replyList">
					<li>
						<dl>
							<dt>국정원홍길동 (2013-08-13)</dt>
							<dd>잡을 수 있으면 잡아봐~</dd>
							<dd class="btnDel"><a href="#giece" onclick="answerDelete('id');"><img src="/resources/include/commonfile/image/board/btn_delete.gif"  alt="댓글 삭제하기" /></a> </dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>김두한(2013-08-13)</dt>
							<dd>길동아 종로에서 놀지말고 헌릉에 가서 놀아라~</dd>
							<dd class="btnDel"><a href="#giece" onclick="answerDelete('id');"><img src="/resources/include/commonfile/image/board/btn_delete.gif"  alt="댓글 삭제하기" /></a> </dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>종로마스터(2013-08-13)</dt>
							<dd>시민 여러분 이 곳은 점잖은 종로구민의 쉼터입니다. 올바른 언행 부탁드립니다.</dd>
							<dd class="btnDel"><a href="#giece" onclick="answerDelete('id');"><img src="/resources/include/commonfile/image/board/btn_delete.gif"  alt="댓글 삭제하기" /></a> </dd>
						</dl>
					</li>
				</ul>
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