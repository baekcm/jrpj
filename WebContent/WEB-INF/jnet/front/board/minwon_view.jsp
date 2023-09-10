<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<jsp:include page="/resources/include/commonfile/inc/header.jsp" />
<script type="text/javascript">

	$(function(){
		$("#socreBtn").click(function(){
			//$(":input:radio[name=score]:checked").val();
			if($(":input:radio[name=score]:checked").val() == "" || $(":input:radio[name=score]:checked").val() ==null){
				alert("만족도를 선택해주세요.");
				return false;
			}
			if($("#assess").val() == "" ){
				alert("코멘트를 입력해주세요.");
				return false;
			}
			$.ajax({
		           type:"POST",
		           url: "/front/saveAssess",
		           dataType : "json",
		           data:  {"score" : $(":input:radio[name=score]:checked").val(),"assess":$("#assess").val(), "qSeq" : "${outMinwon.qSeq }"},
		           success: function(data){
	        		   alert("만족도를 등록하였습니다.");
	        		   $("#msatispoint").hide();
		           },
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
		     });	
		});
	})

</script>
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
			<jsp:include page="/resources/include/commonfile/inc/lnb_bottom.jsp" />
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
							<td class="bd01td">
							${fn:substring(outMinwon.qCreateYmd,0,4)}-${fn:substring(outMinwon.qCreateYmd,4,6)}-${fn:substring(outMinwon.qCreateYmd,6,8)}
							</td>
							<th class="ta_l">성명</th>
							<td class="bd01td">
							${ fn:substring(fn:trim(outMinwon.qNm), 0, 1) }○○
							</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">사업장</th>
							<td class="bd01td">${outMinwon.upNm }</td>
							<th class="ta_l" >분야</th>
							<td class="bd01td">${outMinwon.areaNm }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">상태</th>
							<td class="bd01td">
							
								<c:if test="${outMinwon.statusCd eq '01'}">
									접수대기
								</c:if>
								<c:if test="${outMinwon.statusCd eq '02'}">
									접수중
								</c:if>
								<c:if test="${outMinwon.statusCd eq '03'}">
									답변중
								</c:if>
								<c:if test="${outMinwon.statusCd eq '04'}">
									답변완료
								</c:if>
							</td>
							<th class="ta_l" >답변일</th>
							<td class="bd01td">${fn:substring(outMinwon.aCreateYmd,0,4)}-${fn:substring(outMinwon.aCreateYmd,4,6)}-${fn:substring(outMinwon.aCreateYmd,6,8)}</td>
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
							<td colspan="3" class="bd01td">${outMinwon.qSubject }</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">민원내용</th>
							<td colspan="3" class="bd01td">${outMinwon.qContent }
							</td>
						</tr>
						<tr>
							<th class="ta_l" scope="row">답변</th>
							<td colspan="3" class="bd01td">${outMinwon.aContent }</td>
						</tr>
						<c:if test="${outMinwon.qIdDi eq userInfo.userId}">
							<c:if test="${outMinwon.score eq '0' and outMinwon.statusCd eq '04'  }">
						
								<tr id="msatispoint">
									<th class="ta_l" scope="row">답변만족도</th>
									<td colspan="3" class="bd01td"><p class="mb05"><strong class="fl">만족도: </strong>
										
										<ul class="msatis">
											<li>
												<label for="msatisr5">
													<input id="msatisr5" type="radio" value="5" name="score" />
													매우만족</label>
											</li>
											<li>
												<label for="msatisr4">
													<input id="msatisr4" type="radio" value="4" name="score" />
													만족</label>
											</li>
											<li>
												<label for="msatisr3">
													<input id="msatisr3" type="radio" value="3" name="score" />
													보통</label>
											</li>
											<li>
												<label for="msatisr2">
													<input id="msatisr2" type="radio" value="2" name="score" />
													불만족</label>
											</li>
											<li>
												<label for="msatisr1">
													<input id="msatisr1" type="radio" value="1" name="score" />
													매우불만족</label>
											</li>
										</ul>
										</p>
										<p class="ovh clb">
											<label for="mreply"><strong>코멘트:</strong>
												<input type="text" name="assess" id="assess" style=" height:18px; width:350px;" />
											</label>
											<!-- Text Button --> 
											<span class="txtBtn_lightGray"><a href="#" id="socreBtn" >확인</a></span> 
											<!-- Text Button --> </p></td>
								</tr>
							</c:if>
						</c:if>
					</table>
				</div>
				<div class="btn_farm2 mt20 mb20"> 
					<!-- Text Button --> 
					<c:if test=">${outMinwon.qIdDi eq userInfo.userId}">
					<span class="txtBtn_lightGray"><a href="#" id="saveCptBtn" >작성</a></span>
					</c:if>
					 
					<!-- Text Button --> 
					<!-- Text Button --> 
					<span class="txtBtn_lightGray"><a href="/front/minwonList" >목록으로</a></span> 
					<!-- Text Button --> 
				</div>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%-- <jsp:include page="/front/satfact/${menuSeq }" /> --%>
				
				
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(4,5,0,0);</script>
</body>
</html>