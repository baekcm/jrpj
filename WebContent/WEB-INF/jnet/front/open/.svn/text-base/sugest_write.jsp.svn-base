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
							<th class="ta_l" scope="row"><label for="bwriter">작성자</label></th>
							<td class="bd01td"><span class="bd01td listx">
								<input name="bwriter" type="text" id="bwriter" />
								</span></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">제안구분</th>
							<td class="bd01td">
								<label for="divsion"><input type="radio" name="radio" id="divsion" value="1" />
								<strong>공단직원</strong></label> &nbsp; 
								<label for="divsion2"><input name="radio" type="radio" id="divsion2" value="2" />
							<strong>주민제안</strong></label></td>
						</tr>
						<tr>
							<th scope="row" class="ta_l"><label for="btitle">제안제목</label></th>
							<td class="bd01td"><input name="btitle" id="btitle" value="" size="73" maxlength="60" align="absmiddle" /></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">내용</th>
							<td class="bd01tdD"><ul class="guide">
									<li><strong>개요/목적</strong>
										<p><textarea name="textarea1" cols="70" rows="10" title="개요/목적 입력">
</textarea></p>
									</li>
									<li><strong>현황/문제점</strong>
										<p><textarea name="textarea2" cols="70" rows="10" title="현황/문제점 입력"></textarea></p>
									</li>
									<li><strong>개선방안</strong>
										<p><textarea name="textarea3" cols="70" rows="10" title="개선방안 입력">.</textarea></p>
									</li>
									<li><strong>기대효과</strong>
										<p><textarea name="textarea3" cols="70" rows="10" title="기대효과 입력"></textarea></p>
									</li>
								</ul></td>
						</tr>
						<tr>
							<th class="ta_l" scope="row"><label for="file01">파일첨부</label></th>
							<td class="bd01td"><input name="file01" id="file01" type="file" /></td>
						</tr>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="sugest_list.jsp" onclick="alert('제안신청이 완료되었습니다.')">신청확인</a></span> &nbsp; <span class="txtBtn_lightGray"><a href="/open/sugest_list.jsp" >취소</a></span> 
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
<script type="text/javascript">
function submit() {
	alert("제안이 접수되었습니다. 감사합니다.");
	window.location.href="/open/sugest_list.jsp";
}
</script>
</body>
</html>