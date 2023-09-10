<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		$("#userNoBtn").click(function(){
			
			 $.ajax({
		            type:"POST",
		            url: "/front/findOffMember",
		            dataType : "json",
		            data:  {"userNm" : $("#userNm").val(),"birthday" : $("#birthday").val() },
		            success: function(data){
		            	if(data.userNo == "" ) {
		            		alert("오프라인 회원이 아닙니다.");
		            		return;
						} else {
							$("#offNo").val(data.userNo);
						}              
		            },
		            error : function(request, status, error) {
						alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
					}
		      });
		});	
		
		$("#nextBtn").click(function(){;
			if("${parm}" == "1"){
				$("#vnoform").attr("action","/formMemberJoinInput");
			}else{
				$("#vnoform").attr("action","/formMemberJoinInput2");
			}
			$("#encData").val("${sResponseData}");
			$("#userNo").val($("#offNo").val());	
			$("#vnoform").submit();		
		});	
	
	});
</script>


</head>

<body>
<form name="vnoform" id="vnoform" method="post">
	<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
	<input type="hidden" name="enc_data" id="encData" />								
	<input type="hidden" name="adult" id="adult" value="${adult}" />								
	<input type="hidden" name="userNo" id="userNo" />								
</form>
<div class="accessibility"> <a href="#contentcore">Go to Contents</a> </div>
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
				<!-- real Contents -->
				<div class="mtop mb15"><img src="/resources/include/commonfile/image/member/mtop03.gif" alt="01.회원유형선택, 02.약관동의, 03.본인인증(현재단계), 04.회원정보입력, 05.회원가입완료" /></div>
				<p class="mb30"><img src="/resources/include/commonfile/image/member/mhead03_2.gif" alt="종로구 시설관리공단 &quot;&quot;오프라인회원&quot;회원번호 찾기. 오프라인회원이란? 종로구시설관리 공단이 관리하고 있는 각 시설별로 직접 방문해서 가입하신 회원으로서 기존 가입정보 확인을 위해 회원번호를 검색합니다."/></p>
				<div class="pageSection mb30">
					<h3 class="mb05"><img src="/resources/include/commonfile/image/member/title_join03.gif" alt="회원번호 찾기" /></h3>
					<p class="mb20">※ 가입하신 오프라인회원 성명, 생년월일을 입력하시고 [회원번호 찾기]를 클릭하세요.</p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="회원번호 찾기위한 표. " class="tbl01">
						<caption>
						회원번호 찾기
						</caption>
						<tr>
							<th width="20%" scope="row">회원번호 찾기</th>
							<td width="80%" class="ta_l">
									<p>
										<label for="ofmname">성명
											<input type="text" name="userNm" id="userNm" value="${sName}" />
										</label>
										<label for="ofmbirth">생년월일
											<input type="text" name="birthday" id="birthday" value="${sBirthday}"  />
										</label>
										<input type="image" id="userNoBtn" src="/resources/include/commonfile/image/member/btn_findno.gif" alt="회원번호찾기" />
									</p>
									<p>※ 생년월일은 숫자만 입력하세요. 예) 1980년 1월 2일인 경우 19800102 입력</p>
								</td>
						</tr>
						<tr>
							<th scope="row">회원번호</th>
							<td class="ta_l"><input type="text" name="offNo" id="offNo" readonly="readonly" title="회원번호 찾기를 통해서 회원번호가 입력됨" /></td>
						</tr>
					</table>
				</div>
				<p class="btn_farm2 mt20 mb20"> <a href="#"><img id="nextBtn" src="/resources/include/commonfile/image/member/btn_nextStep.gif" alt="다음단계로" /></a>&nbsp;<a href="#"><img src="/resources/include/commonfile/image/member/btn_cancel.gif"alt="취소" /></a></p>
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<jsp:include page="/front/satfact/${menuSeq }" />
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="/resources/include/commonfile/inc/bottom.jsp" />
</div>
<script type="text/javascript">initMenu(8,2,0,0);</script>
</body>
</html>