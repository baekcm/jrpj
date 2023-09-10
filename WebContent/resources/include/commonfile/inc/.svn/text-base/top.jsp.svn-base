<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="indexColumn">
	<h1 id="logo"><a href="/index.jsp"><img src="/resources/include/commonfile/image/common/logo.png" alt="종로구 시설관리공단" /></a></h1>
	<%-- <c:import url="/front/ontNoti" /> --%>
	<div id="siteMenu" class="siteMenu">
		<ul>
			<li><a href="/main">홈</a></li>
			<!-- <li><a href="/front/contents/175">찾아오시는길</a></li> -->
			<li><a href="/front/listEmp">전화번호 안내</a></li>
			<li><a href="/front/contents/182">사이트맵</a></li>
			<li><a href="http://old.ijongno.co.kr" target="_blank" alt="구홈페이지바로가기(새창)"><strong>구&nbsp;홈페이지</strong></a></li>
			<c:choose>
				<c:when test="${userInfo.userNm ne null && userInfo.userNm ne ''}">
					<li><a href="/front/mypage/minwonList"> 마이페이지</a></li>
					<li>
						${userInfo.userNm} 님
					</li>
					<li class="login"><a href="/front/sessionCheck"> 로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li class="login"><a href="/front/formLogin">로그인</a></li>
				</c:otherwise>
			</c:choose>
			<%-- <c:if test="${userInfo.userNm eq '' || userInfo.userNm eq null   }">
				<li class="login"><a href="/front/formLogin">${userInfo.userNm} 로그인</a></li>
			</c:if>
			<c:if test="${userInfo.userNm ne '' && userInfo.userNm ne null }">
				<li><a href="/front/mypage/minwonList"> 마이페이지</a></li>
				<li class="login"><a href="/front/logout"> 로그아웃</a></li>
			</c:if> --%>
		</ul>
	</div>
	<div id="indexNavi">
		<ul id="topmenu">
			<li id="gnb1" class="first"><a href="/front/main/11"><img src="/resources/include/commonfile/image/common/gnb1.png" alt="문화체육시설" /></a>
				<ul class="depth2">
					<li id="gnb1_1" class="first"><a href="/front/main/11">올림픽기념국민생활관</a>
						<ul class="depth3">
							<li id="gnb1_1_1"><a href="/front/contents/116">시설 및 이용안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/116">시설안내</a></li>
									<li><a href="/front/contents/117">접수안내</a></li>
									<li><a href="/front/contents/118">대관안내</a></li>
									<li><a href="/front/contents/119">주차장안내</a></li>
									<li><a href="/front/notice/3/80">분실물습득안내</a></li>
									<li><a href="/front/contents/120">회원규정</a></li>
								</ul>
							</li>
							<li id="gnb1_1_2"><a href="/front/program/11/01">프로그램 안내</a>
								<ul class="depth4">
									<li><a href="/front/program/11/01">스포츠</a></li>
									<li><a href="/front/program/11/02">문화</a></li>
									<li><a href="/front/program/11/03">방학프로그램</a></li>
									<li><a href="/front/program/11/04">특별프로그램</a></li>
									<li><a href="/front/notice/16/80">무료체험강좌</a></li>
								</ul>
							</li>
							<li id="gnb1_1_6"><a href="/front/contents/187">유아예체능단</a>
								<ul class="depth4">
									<li><a href="/front/contents/187">소개</a></li>
									<li><a href="/front/contents/188">모집안내</a></li>
									<li><a href="/front/contents/189">교육시간표</a></li>
									<li><a href="/front/contents/190">교육내용</a></li>
									<li><a href="/front/contents/191">연간계획</a></li>
								</ul>
							</li>
							<li id="gnb1_1_3"><a href="/front/notice/17/80">개인레슨 안내</a></li>
							<li id="gnb1_1_4"><a href="/front/contents/125">셔틀버스 안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/125">1호차</a></li>
									<li><a href="/front/contents/126">2호차</a></li>
									<li><a href="/front/contents/127">3호차</a></li>
								</ul>
							</li>
							<li id="gnb1_1_5"><a href="/front/contents/72">찾아오시는 길</a></li>
						</ul>
					</li>
					<li id="gnb1_2"><a href="/front/main/21">종로구민회관</a>
						<ul class="depth3">
							<li id="gnb1_2_1"><a href="/front/contents/128">시설 및 이용안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/128">시설안내</a></li>
									<li><a href="/front/contents/129">접수안내</a></li>
									<li><a href="/front/contents/130">대관안내</a></li>
									<li><a href="/front/contents/131">주차장안내</a></li>
									<li><a href="/front/notice/3/81">분실물습득안내</a></li>
									<li><a href="/front/contents/132">회원규정</a></li>
								</ul>
							</li>
							<li id="gnb1_2_2"><a href="/front/program/21/01">프로그램 안내</a>
								<ul class="depth4">
									<li><a href="/front/program/21/01">스포츠</a></li>
									<li><a href="/front/program/21/02">문화</a></li>
									<li><a href="/front/program/21/03">방학프로그램</a></li>
									<li><a href="/front/program/21/04">특별프로그램</a></li>
									<li><a href="/front/notice/16/81">무료체험강좌</a></li>
								</ul>
							</li>
							<li id="gnb1_2_3"><a href="/front/notice/17/81">개인레슨 안내</a></li>
							<li id="gnb1_2_4"><a href="/front/contents/137">셔틀버스 안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/137">1호차</a></li>
									<li><a href="/front/contents/138">2호차</a></li>
								</ul>
							</li>
							<li id="gnb1_2_5"><a href="/front/contents/77">찾아오시는 길</a></li>
						</ul>
					</li>
					<li id="gnb1_3"><a href="/front/main/41">종로문화체육센터</a>
						<ul class="depth3">
							<li id="gnb1_3_1"><a href="/front/contents/139">시설 및 이용안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/139">시설안내</a></li>
									<li><a href="/front/contents/140">접수안내</a></li>
									<li><a href="/front/contents/141">대관안내</a></li>
									<li><a href="/front/contents/142">주차장안내</a></li>
									<li><a href="/front/notice/3/85">분실물습득안내</a></li>
									<li><a href="/front/contents/143">회원규정</a></li>
								</ul>
							</li>
							<li id="gnb1_3_2"><a href="/front/program/41/01">프로그램 안내</a>
								<ul class="depth4">
									<li><a href="/front/program/41/01">스포츠</a></li>
									<li><a href="/front/program/41/02">문화</a></li>
									<li><a href="/front/program/41/03">방학프로그램</a></li>
									<li><a href="/front/program/41/04">특별프로그램</a></li>
									<li><a href="/front/notice/16/85">무료체험강좌</a></li>
								</ul>
							</li>
							<li id="gnb1_3_3"><a href="/front/notice/17/85">개인레슨 안내</a></li>
							<li id="gnb1_3_4"><a href="/front/contents/148">셔틀버스 안내</a>
							<ul class="depth4">
									<li><a href="/front/contents/148">1호차</a></li>
									<li><a href="/front/contents/149">2호차</a></li>
									<li><a href="/front/contents/150">미니셔틀버스</a></li>
								</ul>
								</li>
							<li id="gnb1_3_5"><a href="/front/contents/82">찾아오시는 길</a></li>
						</ul>
					</li>
					<li id="gnb1_4"><a href="/front/main/31">동부여성문화센터</a>
						<ul class="depth3">
							<li id="gnb1_4_1"><a href="/front/contents/151">시설 및 이용안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/151">시설안내</a></li>
									<li><a href="/front/contents/152">접수안내</a></li>
									<li><a href="/front/notice/3/82">분실물습득안내</a></li>
									<li><a href="/front/contents/153">회원규정</a></li>
								</ul>
							</li>
							<li id="gnb1_4_2"><a href="/front/program/31/01">프로그램 안내</a>
								<ul class="depth4">
									<li><a href="/front/program/31/01">스포츠</a></li>
									<li><a href="/front/program/31/02">문화</a></li>
									<li><a href="/front/program/31/03">방학프로그램</a></li>
									<li><a href="/front/program/31/04">특별프로그램</a></li>
									<li><a href="/front/notice/16/82">무료체험강좌</a></li>
								</ul>
							</li>
							<li id="gnb1_4_3"><a href="/front/notice/17/82">개인레슨 안내</a></li>
							<li id="gnb1_4_4"><a href="/front/contents/86">찾아오시는 길</a></li>
						</ul>
					</li>
					<li id="gnb1_5"><a href="/front/main/32">청소년문화센터</a>
						<ul class="depth3">
							<li id="gnb1_5_1"><a href="/front/contents/158">시설 및 이용안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/158">시설안내</a></li>
									<li><a href="/front/contents/159">접수안내</a></li>
									<li><a href="/front/contents/160">대관안내</a></li>
									<li><a href="/front/notice/3/83">분실물습득안내</a></li>
									<li><a href="/front/contents/161">회원규정</a></li>
								</ul>
							</li>
							<li id="gnb1_5_2"><a href="/front/program/32/01">프로그램 안내</a>
								<ul class="depth4">
									<li><a href="/front/program/32/01">스포츠프로그램</a></li>
									<li><a href="/front/program/32/02">문화프로그램</a></li>
									<li><a href="/front/program/32/03">방학프로그램</a></li>
									<li><a href="/front/program/32/04">특별프로그램</a></li>
									<li><a href="/front/notice/16/83">무료체험강좌</a></li>
								</ul>
							</li>
							<li id="gnb1_5_3"><a href="/front/notice/17/83">개인레슨 안내</a></li>
							<li id="gnb1_5_5"><a href="/front/contents/90">찾아오시는 길</a></li>
						</ul>
					</li>
					<li id="gnb1_6"><a href="/front/main/33">삼청테니스장</a>
						<ul class="depth3">
							<li id="gnb1_6_1"><a href="/front/contents/166">시설 및 이용안내</a>
								<ul class="depth4">
									<li><a href="/front/contents/166">시설안내</a></li>
									<li><a href="/front/contents/167">접수안내</a></li>
									<li><a href="/front/notice/3/84">분실물습득안내</a></li>
									<li><a href="/front/contents/168">회원규정</a></li>
								</ul>
							</li>
							<li id="gnb1_6_2"><a href="/front/program/33/01">프로그램 안내</a>
								<ul class="depth4">
									<li><a href="/front/program/33/01">테니스</a></li>
									<li><a href="/front/notice/16/84">무료체험강좌</a></li>
								</ul>
							</li>
							<li id="gnb1_6_3"><a href="/front/notice/17/84">개인레슨 안내</a></li>
							<li id="gnb1_6_5"><a href="/front/contents/94">찾아오시는 길</a></li>
						</ul>
					</li>
					<!-- <li id="gnb1_7"><a href="http://www.ghmarthall.co.kr" target="_blank" title="새 창 열림">광화문아트홀(새창)</a></li> -->
				</ul>
			</li>
			<li id="gnb2"><a href="/front/contents/95"><img src="/resources/include/commonfile/image/common/gnb2.png" alt="주차시설" /></a>
				<ul>
					<li class="first" id="gnb2_1"><a href="/front/contents/95">소개</a>
						<ul class="depth3">
							<li id="gnb2_1_1"><a href="/front/contents/95">사업소개</a></li>
							<!--li id="gnb2_1_2"><a href="/front/contents/102">조직도</a></li-->
							<li id="gnb2_1_2"><a href="/front/contents/96">찾아오시는길</a></li>
						</ul>
					</li>
					<li id="gnb2_2"><a href="/front/contents/97">공영주차장</a>
						<ul class="depth3">
							<li id="gnb2_2_1"><a href="/front/contents/97">시설현황</a></li>
							<li id="gnb2_2_2"><a href="/front/contents/98">이용안내</a></li>
							<li id="gnb2_2_3"><a href="/front/contents/99">미납요금안내</a></li>
						</ul>
					</li>
					<li id="gnb2_3"><a href="http://jongno.park119.co.kr" target="_blank" title="새 창 열림">거주자우선주차(새창)</a></li>
				</ul>
			</li>
			<li id="gnb3"><a href="/front/contents/48"><img src="/resources/include/commonfile/image/common/gnb3.png" alt="공공시설" /></a>
				<ul>
					<li class="first" id="gnb3_1"><a href="/front/contents/48">인사동문화지구</a></li>
					<!--li id="gnb3_2"><a href="/front/contents/46">대학로문화지구</a></li-->
					<li id="gnb3_2"><a href="/front/contents/49">북악팔각정</a></li>
					<li id="gnb3_3"><a href="/front/contents/50">공원시설물</a></li>
				</ul>
			</li>
			<li id="gnb4"><a href="/front/notice/5"><img src="/resources/include/commonfile/image/common/gnb4.png" alt="고객마당" /></a>
				<ul>
					<li class="first" id="gnb4_1"><a href="/front/notice/5">자주묻는 질문</a> </li>
					<li id="gnb4_2"><a href="/front/listPoll">설문조사</a></li>
					<li id="gnb4_3"><a href="/front/community/6">자유게시판</a></li>
					<li id="gnb4_4"><a href="/front/notice/7">포토갤러리</a></li>
					<li id="gnb4_5"><a href="/front/minwonList">전자민원</a></li>
					<li id="gnb4_6"><a href="/front/sugestList">고객제안</a></li>
					<li id="gnb4_7"><a href="/front/cleanMain">클린신고센터</a></li>
					<li id="gnb4_8"><a href=/front/contents/100>고객서비스헌장</a>
						<ul>
							<li id="gnb4_7_1"><a href="/front/contents/100">고객서비스헌장 </a></li>
							<li id="gnb4_7_2"><a href="/front/contents/101">서비스이행표준</a></li>
							<li id="gnb4_7_3"><a href="/front/contents/102">고객의 권리</a></li>
							<li id="gnb4_7_4"><a href="/front/contents/103">프로그램 이행기준</a></li>
							<li id="gnb4_7_5"><a href="/front/contents/104">사업장이행기준</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li id="gnb5"><a href="/front/notice/4"><img src="/resources/include/commonfile/image/common/gnb5.png" alt="알림마당" /></a>
				<ul>
					<li class="first" id="gnb5_1"><a href="/front/notice/4">공지사항</a></li>
					<li id="gnb5_2"><a href="/front/notice/8">강좌안내</a></li>
					<li id="gnb5_3"><a href="/front/notice/9">입찰정보</a></li>
					<% //20140313 추가내용	%>
					<li id="gnb5_4"><a href="/front/notice/18">공시송달</a></li>
					<li id="gnb5_5"><a href="/front/notice/10">채용공고</a></li>
					<li id="gnb5_6"><a href="/front/notice/11">보도자료</a></li>
					<li id="gnb5_7"><a href="/front/notice/12">종로다솜</a></li>
				</ul>
			</li>
			<li id="gnb6"><a href="/front/contents/105"><img src="/resources/include/commonfile/image/common/gnb6.png" alt="경영정보" /></a>
				<ul>
					<li class="first" id="gnb6_1"><a href="/front/contents/105">윤리경영</a>
						<ul>
							<li id="gnb6_1_1"><a href="/front/contents/105">소개</a></li>
							<li id="gnb6_1_2"><a href="/front/contents/106">추진방향</a></li>
							<li id="gnb6_1_3"><a href="/front/notice/13">윤리경영자료</a></li>
						</ul>
					</li>
					<li id="gnb6_2"><a href="/front/contents/108">경영공시</a>
						<ul>
							<li id="gnb6_2_1"><a href="/front/contents/108">연도별 경영 목표</a></li>
							<li id="gnb6_2_2"><a href="/front/contents/109">재무제표</a></li>
							<li id="gnb6_2_3"><a href="/front/contents/110">예산회계결산</a></li>
							<li id="gnb6_2_4"><a href="/front/contents/111">경영평가</a></li>
							<li id="gnb6_2_5"><a href="/front/contents/112">행정사무감사</a></li>
							<li id="gnb6_2_6"><a href="/front/contents/113">고객만족도</a></li>
							<li id="gnb6_2_7"><a href="/front/notice/14">수의계약내역공개</a></li>
							<li id="gnb6_2_8"><a href="/front/notice/15">업무추진비집행내역</a></li>
						</ul>
					</li>
					<li id="gnb6_3"><a href="/front/contents/67">사회공헌</a></li>
					<% //20140313 추가내용	%>
					<li id="gnb6_4"><a href="/front/notice/19">나눔실천</a></li>
				</ul>
			</li>
			<li id="gnb7"><a href="/front/contents/171"><img src="/resources/include/commonfile/image/common/gnb7.png" alt="공단소개" /></a>
				<ul>
					<li class="first" id="gnb7_1"><a href="/front/contents/171">인사말</a></li>
					<li id="gnb7_2"><a href="/front/contents/172">미션 및 비전</a></li>
					<li id="gnb7_3"><a href="/front/contents/176">공단소개</a>
						<ul>
							<li id="gnb7_3_1"><a href="/front/contents/176">설립배경 및 연혁</a></li>
							<li id="gnb7_3_2"><a href="/front/contents/177">사업현황</a></li>
							<li id="gnb7_3_3"><a href="/front/contents/178">수상 및 인증획득</a></li>
						</ul>
					</li>
					<li id="gnb7_4"><a href="/front/contents/179">조직 및 직원안내</a>
						<ul>
							<li id="gnb7_4_1"><a href="/front/contents/179">조직도</a></li>
							<li id="gnb7_4_2"><a href="/front/listEmp">조직 및 직원안내</a></li>
						</ul>
						</li>
					<li id="gnb7_5"><a href="/front/contents/175">찾아오시는 길</a></li>
				</ul>
			</li>
			<li id="gnb8"><a href="/intro/greeting.jsp"><img src="/resources/include/commonfile/image/common/gnb8.png" alt="회원정보" /></a>
				<ul>
					<li class="first" id="gnb8_1"><a href="/front/formLogin">로그인</a></li>
					<li id="gnb8_2"><a href="/front/sign">회원가입</a></li>
					<li id="gnb8_3"><a href="/front/findId">아이디찾기</a></li>
					<li id="gnb8_4"><a href="/front/findPw">비밀번호찾기</a></li>
					<li id="gnb8_5"><a href="javascript:void(0)" >본인확인실명인증</a></li>
				</ul>
			</li>
			<li id="gnb9"><a href="/mypage/mypage_list.jsp"><img src="/resources/include/commonfile/image/common/gnb9.png" alt="마이페이지" /></a>
				<ul>
					<li class="first" id="gnb9_1"><a href="/front/mypage/minwonList">마이페이지</a>
						<ul>
							<li id="gnb9_1_1"><a href="/front/mypage/minwonList">전자민원 내역</a></li>
							<li id="gnb9_1_2"><a href="/front/mypage/sugestList">고객제안 내역</a></li>
							<c:if test="${userInfo.userId ne null && userInfo.userId ne ''}">
							<li id="gnb9_1_3"><a href="/front/mypage/programList">수강 내역</a></li>
							<li id="gnb9_1_4"><a href="/front/mypage/paymentList">결제 내역</a></li>
							<li id="gnb9_1_5"><a href="/front/mypage/lockerList">사물함 내역</a></li>
							<li id="gnb9_1_6"><a href="/front/mypage/basketList">장바구니</a></li>
							</c:if>
						</ul>
					</li>
					<c:if test="${userInfo.userId ne null && userInfo.userId ne ''}">
					<li id="gnb9_2"><a href="/front/mypage/mypageModify">회원정보수정</a>
						<ul>
							<li id="gnb9_2_1"><a href="/front/mypage/mypageModify">회원정보수정</a></li>
							<li id="gnb9_2_2"><a href="/front/mypage/pwChange">비밀번호 변경</a></li>
						</ul>
					</li>
					</c:if>
					<li id="gnb9_3"><a href="/front/sessionCheck">로그아웃</a></li>
				</ul>
			</li>
			<li id="gnb10"><a href="/front/contents/182"><img src="/resources/include/commonfile/image/common/gnb9.png" alt="이용안내"  /></a>
				<ul>
					<li class="first" id="gnb10_1"><a href="/front/contents/182">사이트맵</a></li>
					<li id="gnb10_2"><a href="/front/contents/183">개인정보처리방침</a></li>
					<li id="gnb10_3"><a href="/front/contents/195">영상정보처리기기방침</a></li>
					<li id="gnb10_4"><a href="/front/contents/184">이용약관</a></li>
					<li id="gnb10_5"><a href="/front/contents/185">온라인접수안내</a></li>
					<li id="gnb10_6"><a href="/front/contents/197">인증서마크안내</a>
						<ul>
							<li id="gnb10_6_1"><a href="/front/contents/197">가족친화우수기관</a></li>
							<li id="gnb10_6_2"><a href="/front/contents/198">품질경영시스템</a></li>
							<li id="gnb10_6_3"><a href="/front/contents/199">환경경영시스템</a></li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
