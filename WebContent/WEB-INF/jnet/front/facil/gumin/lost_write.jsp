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
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="제목,작성자, 습득 및 분실일, 습득 및 분실장소, 보관 유무와 내용으로 이루어진 정보를 기입하기 위한 표" class="bd00view">
						<caption>
						분실물습득안내 작성하기
						</caption>
						<colgroup>
						<col width="120px" />
						<col />
						</colgroup>
						<tr>
							<th class="ta_l" scope="row"><label for="btitle">제목</label></th>
							<td class="bd01td listx"><input name="btitle" id="btitle" type="text" /></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="bwriter">작성자</label></th>
							<td class="bd01td"><span class="bd01td listx">
								<input name="bwriter" id="bwriter" type="text" />
								</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="blostDate">습득 및 분실일</label></th>
							<td class="bd01td"><span class="bd01td listx">
								<input name="blostDate" id="blostDate" type="text" />
								</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="blostPlace">습득 및 분실 장소</label></th>
							<td class="bd01td"><span class="bd01td listx">
								<input name="blostPlace" id="blostPlace" type="text" />
								</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="save">보관 유무</label></th>
							<td class="bd01td"><select name="save" id="save"  title="보관유무">
									<option>보관중</option>
									<option>찾아감</option>
								</select></td>
						</tr>
						<tr>
							<td colspan="2" scope="row" class="bd01tdC"><textarea cols="60" rows="30" title="내용입력"></textarea></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="file01">파일첨부</label></th>
							<td class="bd01td"><input name="file01" id="file01" type="file" /></td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="lost_list.jsp" >작성</a></span> &nbsp;
					<span class="txtBtn_lightGray"><a href="lost_list.jsp" >취소</a></span> 
					<!-- Text Button --> 
				</div>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq }" />
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(1,2,1,5);</script>
</body>
</html>