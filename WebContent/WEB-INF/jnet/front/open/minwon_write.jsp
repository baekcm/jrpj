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
					<!-- minwon Top  -->
					<div class="pageMinwonTop">
						<p>사업장을 선택해주세요.</p>
					</div>
					<!-- minwon Top  --> 
					<!--minwon main-->
					<ul class="guide minwonWrite">
						<li><strong>개인정보</strong>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="개인 정보를 입력받는 폼을 포함한 표 " class="tbl01">
								<caption>
								개인정보
								</caption>
								<tr>
									<th width="14%" scope="row"><label for="strname">이름</label></th>
									<td width="29%" class="ta_l"><a href="javascript:ckname();">
										<input readonly="readonly" maxlength="10" size="10" name="strname" id="strname"/>
										</a></td>
									<th width="14%"><label for="jumin1">생년월일</label></th>
									<td width="43%" class="ta_l"><a href="javascript:ckname();">
										<input readonly="readonly" maxlength="6" size="6" name="jumin1" id="jumin1" />
										</a></td>
								</tr>
								<tr>
									<th rowspan="3" scope="row"><label for="post1">주소</label></th>
									<td colspan="3" class="ta_l"><input readonly="readonly" maxlength="3" size="4" name="post1" id="post1" title="우편번호 앞자리" />
										- 
										<input readonly="readonly" maxlength="3" size="4" name="post2" id="post2" title="우편번호 뒷자리"  />
										
										<!-- Text Button --> 
										<span class="txtBtn_lightGray"><a href="#popup" >우편번호 찾기</a></span> 
										<!-- Text Button --></td>
								</tr>
								<tr>
									<td colspan="3"><input tabindex="-1" readonly="readonly" size="50" name="addr1" id="addr1" title="주소는 검색 버튼을 눌러서 입력하세요" /></td>
								</tr>
								<tr>
									<td colspan="3"><input maxlength="50" size="50" name="addr2" id="addr2" title="나머지 주소 입력" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="telno1">연락처</label></th>
									<td colspan="3" class="ta_l"><input maxlength="3" size="5" name="telno1" id="telno1" title="연락처 앞자리" />
										- 
										<input maxlength="4" size="5" name="telno2"id="telno2" title="연락처 중간자리" />
										- 
										<input maxlength="4" size="5" name="telno3" id="telno3" title="연락처 뒷자리" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="email">E-MAIL</label></th>
									<td colspan="3" class="ta_l"><input maxlength="30" size="30" name="email" id="email" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="repType">응답구분</label></th>
									<td colspan="3" class="ta_l"><select onchange="changeTyle(this.value)" name="repType" id="repType"  title="응답구분">
											<option selected="selected" value="민원게시판">민원게시판답변</option>
											<option value="전화">전화답변</option>
											<option value="전자우편">E-MAIL답변</option>
										</select></td>
								</tr>
							</table>
						</li>
						<li><strong>내용</strong>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="민원내용을 입력하기 위한 표. " class="tbl01">
								<caption>
								내용
								</caption>
								<tr>
									<th width="14%" scope="row"><label for="workcode">사업장</label></th>
									<td width="86%" class="ta_l"><select name="workcode" id="workcode"  title="사업장 카테고리">
											<option selected="selected" value="선택">----선택해주세요----</option>
											<option value="올림픽기념국민생활관">올림픽기념 국민생활관</option>
											<option value="종로구민회관">종로구민회관</option>
											<option value="종로문화체육센터">종로문화체육센터</option>
											<option value="동부여성회관">동부여성문화센터</option>
											<option value="청소년문화센터">청소년문화센터</option>
											<option value="삼청테니스장">삼청테니스장</option>
											<!--<option value="거주자우선주차">거주자우선주차</option>
											<option value="공영주차장">공영주차장</option>
											<option value="공원시설물">공원시설물</option>
											<option value="문화지구">문화지구</option>
											<option value="기타">기타</option>-->
										</select></td>
								</tr>
								<tr>
									<th scope="row"><label for="realm">분야</label></th>
									<td class="ta_l"><select name="realm" id="realm"  title="분야 카테고리">
											<option selected="selected" value="선택">-선택해주세요-</option>
											<option value="운영/서비스">운영/서비스</option>
											<option value="시설관리">시설관리</option>
											<option value="프로그램">프로그램</option>
											<option value="지도자/강사">지도자/강사</option>
											<option value="지도자/강사">주차</option>
											<option value="기타">기타</option>
										</select></td>
								</tr>
								<tr>
									<th scope="row"><label for="title">제목</label></th>
									<td class="ta_l"><input maxlength="60" size="73" align="absmiddle" name="title" id="title" /></td>
								</tr>
								<tr>
									<th scope="row"><label for="content">내용</label></th>
									<td><textarea rows="15" cols="90" name="content" id="content"></textarea></td>
								</tr>
							</table>
						</li>
					</ul>
					<div class="btn_farm2 mt20 mb20"> 
						<!-- Text Button --> 
						<span class="txtBtn_lightGray"><a href="minwon_list.jsp" onClick="alert('전자민원 신청을 완료하였습니다.\n빠른 시간 내에 답변드리도록 하겠습니다.')">작성확인</a></span> &nbsp; <span class="txtBtn_lightGray"><a href="minwon_main.jsp" >취소</a></span> 
						<!-- Text Button --> 
					</div>
					<!--minwon main--> 
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