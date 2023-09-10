<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 결제 결과 출력 PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 요청 결과값을 출력하는 페이지입니다.                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do			        = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>
<%
	//--ksj request.setCharacterEncoding("euc-kr") ;
    /* ============================================================================== */
    /* =   지불 결과                                                                = */
    /* = -------------------------------------------------------------------------- = */
	String site_cd			= f_get_parm( request.getParameter( "site_cd"		 ) );      // 사이트 코드
    String req_tx           = f_get_parm( request.getParameter( "req_tx"         ) );      // 요청 구분(승인/취소)
    String use_pay_method   = f_get_parm( request.getParameter( "use_pay_method" ) );      // 사용 결제 수단
    String bSucc            = f_get_parm( request.getParameter( "bSucc"          ) );      // 업체 DB 정상처리 완료 여부
    /* = -------------------------------------------------------------------------- = */
    String res_cd           = f_get_parm( request.getParameter( "res_cd"         ) );      // 결과 코드
    String res_msg          = f_get_parm( request.getParameter( "res_msg"        ) );      // 결과 메시지
    String panc_mod_mny     = f_get_parm( request.getParameter( "panc_mod_mny"   ) );      // 부분취소 금액
    String panc_rem_mny     = f_get_parm( request.getParameter( "panc_rem_mny"   ) );      // 부분취소 가능 금액
	String mod_type         = f_get_parm( request.getParameter( "mod_type"       ) );
	String res_msg_bsucc    = "";
    /* = -------------------------------------------------------------------------- = */
    String amount           = f_get_parm( request.getParameter( "amount"         ) );      // 금액
    String ordr_idxx        = f_get_parm( request.getParameter( "ordr_idxx"      ) );      // 주문번호
    String tno              = f_get_parm( request.getParameter( "tno"            ) );      // KCP 거래번호
    String good_mny         = f_get_parm( request.getParameter( "good_mny"       ) );      // 결제 금액
    String good_name        = f_get_parm( request.getParameter( "good_name"      ) );      // 상품명
    String buyr_name        = f_get_parm( request.getParameter( "buyr_name"      ) );      // 구매자명
    String buyr_tel1        = f_get_parm( request.getParameter( "buyr_tel1"      ) );      // 구매자 전화번호
    String buyr_tel2        = f_get_parm( request.getParameter( "buyr_tel2"      ) );      // 구매자 휴대폰번호
    String buyr_mail        = f_get_parm( request.getParameter( "buyr_mail"      ) );      // 구매자 E-Mail
    /* = -------------------------------------------------------------------------- = */
	// 공통
	String pnt_issue        = f_get_parm( request.getParameter( "pnt_issue"      ) );      // 포인트 서비스사
    String app_time         = f_get_parm( request.getParameter( "app_time"       ) );      // 승인시간 (공통)
	/* = -------------------------------------------------------------------------- = */
    // 신용카드
    String card_cd          = f_get_parm( request.getParameter( "card_cd"        ) );      // 카드 코드
    String card_name        = f_get_parm( request.getParameter( "card_name"      ) );      // 카드명
	String noinf			= f_get_parm( request.getParameter( "noinf"			 ) );      // 무이자 여부
    String quota            = f_get_parm( request.getParameter( "quota"          ) );      // 할부개월
	String app_no           = f_get_parm( request.getParameter( "app_no"         ) );      // 승인번호
    /* = -------------------------------------------------------------------------- = */
    // 계좌이체
    String bank_name        = f_get_parm( request.getParameter( "bank_name"      ) );      // 은행명
	String bank_code        = f_get_parm( request.getParameter( "bank_code"      ) );      // 은행코드
    /* = -------------------------------------------------------------------------- = */
    // 가상계좌
    String bankname         = f_get_parm( request.getParameter( "bankname"       ) );      // 입금할 은행
    String depositor        = f_get_parm( request.getParameter( "depositor"      ) );      // 입금할 계좌 예금주
    String account          = f_get_parm( request.getParameter( "account"        ) );      // 입금할 계좌 번호
    String va_date          = f_get_parm( request.getParameter( "va_date"        ) );      // 가상계좌 입금마감시간
    /* = -------------------------------------------------------------------------- = */
    // 포인트
	String add_pnt          = f_get_parm( request.getParameter( "add_pnt"        ) );      // 발생 포인트
    String use_pnt          = f_get_parm( request.getParameter( "use_pnt"        ) );      // 사용가능 포인트
    String rsv_pnt          = f_get_parm( request.getParameter( "rsv_pnt"        ) );      // 적립 포인트
    String pnt_app_time     = f_get_parm( request.getParameter( "pnt_app_time"   ) );      // 승인시간
    String pnt_app_no       = f_get_parm( request.getParameter( "pnt_app_no"     ) );      // 승인번호
    String pnt_amount       = f_get_parm( request.getParameter( "pnt_amount"     ) );      // 적립금액 or 사용금액
    /* = -------------------------------------------------------------------------- = */
	//휴대폰
	String commid			= f_get_parm( request.getParameter( "commid"		 ) );      // 통신사 코드
	String mobile_no		= f_get_parm( request.getParameter( "mobile_no"      ) );      // 휴대폰 번호
	/* = -------------------------------------------------------------------------- = */
	//상품권
	String tk_van_code      = f_get_parm( request.getParameter( "tk_van_code"    ) );      // 발급사 코드
	String tk_app_no        = f_get_parm( request.getParameter( "tk_app_no"      ) );      // 승인 번호
	/* = -------------------------------------------------------------------------- = */
    // 현금영수증
    String cash_yn          = f_get_parm( request.getParameter( "cash_yn"        ) );      // 현금 영수증 등록 여부
    String cash_authno      = f_get_parm( request.getParameter( "cash_authno"    ) );      // 현금 영수증 승인 번호
    String cash_tr_code     = f_get_parm( request.getParameter( "cash_tr_code"   ) );      // 현금 영수증 발행 구분
    String cash_id_info     = f_get_parm( request.getParameter( "cash_id_info"   ) );      // 현금 영수증 등록 번호
	/* ============================================================================== */

    String req_tx_name = "";

    if     ( req_tx.equals( "pay" ) ) 
	{ 
		req_tx_name = "지불" ;
	}
    else if( req_tx.equals( "mod" ) )
	{ 
		req_tx_name = "취소/매입" ;
	}

    /* ============================================================================== */
    /* =   가맹점 측 DB 처리 실패시 상세 결과 메시지 설정                           = */
    /* = -------------------------------------------------------------------------- = */

    if ( "pay".equals ( req_tx ) )
    {
        // 업체 DB 처리 실패
        if ( "false".equals ( bSucc ) )
        {
            if ( "0000".equals ( res_cd ) )
			{
                res_msg_bsucc = "결제는 정상적으로 이루어졌지만 쇼핑몰에서 결제 결과를 처리하는 중 오류가 발생하여 시스템에서 자동으로 취소 요청을 하였습니다. <br> 쇼핑몰로 전화하여 확인하시기 바랍니다." ;
			}
            else
			{
				res_msg_bsucc = "결제가 정상적으로 이루어지지 않았습니다" ;
			}
		}
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   가맹점 측 DB 처리 실패시 상세 결과 메시지 설정 끝                        = */
    /* ============================================================================== */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="/resources/include/commonfile/js/gnb.js"></script>
<link href="/resources/include/commonfile/css/sub.css" rel="stylesheet" type="text/css" />
<!-- link href="/resources/include/commonfile/css/style.css" rel="stylesheet" type="text/css" id="cssLink"/-->
<!--// 아래의 header.jsp include는 개발의 필요 또는 서브페이지의 테마적인 속성이 다를 경우, 추가적인 css와 js를 로딩 할 수 있도록 구성하는데 사용해주십시오. //-->
<%@ include file="/resources/include/commonfile/inc/header.jsp" %>
    <script type="text/javascript">
		/* 신용카드 영수증 */ 
		/* 실결제시 : "https://admin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" */ 
		/* 테스트시 : "https://testadmin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" */ 
		function receiptView( tno ) 
		{ 
			receiptWin = "https://admin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" + tno; 
			window.open(receiptWin, "", "width=455, height=815"); 
		} 
		 
		/* 현금 영수증 */ 
		/* 실결제시 : "https://admin.kcp.co.kr/Modules/Service/Cash/Cash_Bill_Common_View.jsp" */ 
		/* 테스트시 : "https://testadmin8.kcp.co.kr/Modules/Service/Cash/Cash_Bill_Common_View.jsp" */   
		function receiptView2( site_cd, order_id, bill_yn, auth_no ) 
		{ 
			receiptWin2 = "https://admin.kcp.co.kr/Modules/Service/Cash/Cash_Bill_Common_View.jsp"; 
			receiptWin2 += "?"; 
			receiptWin2 += "term_id=PGNW" + site_cd + "&"; 
			receiptWin2 += "orderid=" + order_id + "&"; 
			receiptWin2 += "bill_yn=" + bill_yn + "&"; 
			receiptWin2 += "authno=" + auth_no ; 
		 
			window.open(receiptWin2, "", "width=370, height=625"); 
		}
		/* 가상 계좌 모의입금 페이지 호출 */
		/* 테스트시에만 사용가능 */
		/* 실결제시 해당 스크립트 주석처리 */
		function receiptView3() 
		{ 
			receiptWin3 = "http://devadmin.kcp.co.kr/Modules/Noti/TEST_Vcnt_Noti.jsp"; 
			window.open(receiptWin3, "", "width=520, height=300"); 
		} 
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
				<div class="pageSection"> 
    <form name="cancel" action="/front/mypage/payment/paymentCancel?param=<%=tno%>" method="post">
    <div class="sample">
        <p>
          요청 결과를 출력하는 페이지 입니다.<br />
          요청이 정상적으로 처리된 경우 결과코드(res_cd)값이 0000으로 표시됩니다.
        </p>
<%
    /* ============================================================================== */
    /* =   결제 결과 코드 및 메시지 출력(결과페이지에 반드시 출력해주시기 바랍니다.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 정상 : res_cd값이 0000으로 설정됩니다.                              = */
    /* =   결제 실패 : res_cd값이 0000이외의 값으로 설정됩니다.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
                    <h2>&sdot; 처리 결과<%= bSucc %></h2>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문정보를 나타낸 표 " class="tbl01">
                    	<caption>
						주문정보
						</caption>
						<colgroup>
						<col style="width:200px" />
						<col />
						</colgroup>
                        <!-- 결과 코드 -->
                        <tr>
                          <th scope="row">결과 코드</th>
                          <td class="ta_l"><%=res_cd%></td>
                        </tr>
                              <!-- 결과 메시지 -->
                        <tr>
                          <th scope="row">결과 메세지</th>
                          <td class="ta_l"><%=res_msg%><%= "false".equals(bSucc) ? "(결제실패)" : "(결제성공)"%></td>
                        </tr>
<%
    // 처리 페이지(pp_ax_hub.jsp)에서 가맹점 DB처리 작업이 실패한 경우 상세메시지를 출력합니다.
    if( !"".equals ( res_msg_bsucc ) )
    {
%>
                         <tr>
                           <th scope="row">결과 상세 메세지</th>
                           <td class="ta_l"><%=res_msg_bsucc%></td>
                         </tr>
<%
    }
%>
                    </table>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 결과 코드 및 메시지 출력 끝                                         = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   01. 결제 결과 출력                                                       = */
    /* = -------------------------------------------------------------------------- = */
    if ( "pay".equals ( req_tx ) )
    {
        /* ============================================================================== */
        /* =   01-1. 업체 DB 처리 정상(bSucc값이 false가 아닌 경우)                     = */
        /* = -------------------------------------------------------------------------- = */
        if ( ! "false".equals ( bSucc ) )
        {
            /* ============================================================================== */
            /* =   01-1-1. 정상 결제시 결제 결과 출력 ( res_cd값이 0000인 경우)             = */
            /* = -------------------------------------------------------------------------- = */
            if ( "0000".equals ( res_cd ) )
            {
%>
                    <h2>&sdot; 주문 정보</h2>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문정보를 나타낸 표 " class="tbl01">
	                    <caption>
						주문정보
						</caption>
						<colgroup>
						<col style="width:200px" />
						<col />
						</colgroup>
                        <!-- 주문번호 -->
                        <tr>
                          <th scope="row">주문 번호</th>
                          <td class="ta_l"><%= ordr_idxx %></td>
                        </tr>
                        <!-- KCP 거래번호 -->
                        <tr>
                          <th scope="row">KCP 거래번호</th>
                          <td class="ta_l"><%= tno %></td>
                        </tr>
                        <!-- 결제금액 -->
                        <tr>
                          <th scope="row">결제 금액</th>
                          <td class="ta_l"><%= good_mny %>원</td>
                        </tr>
                        <!-- 상품명(good_name) -->
                        <tr>
                          <th scope="row">상 품 명</th>
                          <td class="ta_l"><%= good_name %></td>
                        </tr>
                        <!-- 주문자명 -->
                        <tr>
                          <th scope="row">주문자명</th>
                          <td class="ta_l"><%= buyr_name %></td>
                        </tr>
                        <!-- 주문자 전화번호 -->
                        <tr>
                          <th scope="row">주문자 전화번호</th>
                          <td class="ta_l"><%= buyr_tel1 %></td>
                        </tr>
                        <!-- 주문자 휴대폰번호 -->
                        <tr>
                          <th scope="row">주문자 휴대폰번호</th>
                          <td class="ta_l"><%= buyr_tel2 %></td>
                        </tr>
                        <!-- 주문자 E-mail -->
                        <tr>
                          <th scope="row">주문자 E-mail</th>
                          <td class="ta_l"><%= buyr_mail %></td>
                        </tr>
                    </table>
<%
                /* ============================================================================== */
                /* =   신용카드 결제 결과 출력                                             = */
                /* = -------------------------------------------------------------------------- = */
                if ( use_pay_method.equals("100000000000") )
                {
%>
                    <h2>&sdot; 신용카드 정보</h2>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="신용카드정보를 나타낸 표 " class="tbl01">
						<caption>
						신용카드정보
						</caption>
						<colgroup>
						<col style="width:200px" />
						<col />
						</colgroup>                    
                        <!-- 결제수단 : 신용카드 -->
                        <tr>
                          <th scope="row">결제 수단</th>
                          <td class="ta_l">신용 카드</td>
                        </tr>
                        <!-- 결제 카드 -->
                        <tr>
                          <th scope="row">결제 카드</th>
                          <td class="ta_l"><%= card_cd %> / <%= card_name %></td>
                        </tr>
                        <!-- 승인시간 -->
                        <tr>
                          <th scope="row">승인 시간</th>
                          <td class="ta_l"><%= app_time %></td>
                        </tr>
                        <!-- 승인번호 -->
                        <tr>
                          <th scope="row">승인 번호</th>
                          <td class="ta_l"><%= app_no %></td>
                        </tr>
                        <!-- 할부개월 -->
                        <tr>
                          <th scope="row">할부 개월</th>
                          <td class="ta_l"><%= quota %></td>
                        </tr>
                        <!-- 무이자 여부 -->
                        <tr>
                          <th scope="row">무이자 여부</th>
                          <td class="ta_l"><%= noinf %></td>
                        </tr>
<%
                    /* = -------------------------------------------------------------- = */
                    /* =   복합결제(포인트+신용카드) 승인 결과 처리                     = */
                    /* = -------------------------------------------------------------- = */
                     if ( pnt_issue.equals("SCSK") || pnt_issue.equals( "SCWB" ) )
                    {
%>
                    </table>
                    <h2>&sdot; 포인트 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- 포인트사 -->
                        <tr>
                          <th>포인트사</th>
                          <td><%= pnt_issue %></td>
                        </tr>
                    <!-- 포인트 승인 시간 -->
                        <tr>
                          <th>포인트 승인시간</th>
                          <td><%= pnt_app_time %></td>
                        </tr>
                    <!-- 포인트 승인번호 -->
                        <tr>
                          <th>포인트 승인번호</th>
                          <td><%= pnt_app_no %></td>
                        </tr>
	                <!-- 적립금액 or 사용금액 -->
                        <tr>
                          <th>적립금액 or 사용금액</th>
                          <td><%= pnt_amount %></td>
                        </tr>
                    <!-- 발생 포인트 -->
                        <tr>
                          <th>발생 포인트</th>
                          <td><%= add_pnt %></td>
                        </tr>
                    <!-- 사용가능 포인트 -->
                        <tr>
                          <th>사용가능 포인트</th>
                          <td><%= use_pnt %></td>
                        </tr>
					<!-- 총 누적 포인트 -->
                        <tr>
                          <th>총 누적 포인트</th>
                          <td><%= rsv_pnt %></td>
                        </tr>
<%                  }
				    /* ============================================================================== */
                    /* =   신용카드 영수증 출력                                                     = */
                    /* = -------------------------------------------------------------------------- = */
                    /* =   실제 거래건에 대해서 영수증을 출력할 수 있습니다.                        = */
                    /* = -------------------------------------------------------------------------- = */
%>
                    <tr>
                        <th>영수증 확인</th>
                        <td class="sub_content1"><a href="javascript:receiptView('<%=tno%>')"><img src="/resources/include/commonfile/image/payment/btn_receipt.png" alt="영수증을 확인합니다." />
                    </td>
                    </table>
<%				}
				/* ============================================================================== */
                /* =   계좌이체 결제 결과 출력                                                  = */
                /* = -------------------------------------------------------------------------- = */
				else if (use_pay_method.equals("010000000000"))       // 계좌이체
                {
%>
                    <h2>&sdot; 계좌이체 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- 결제수단 : 계좌이체 -->
                        <tr>
                          <th>결제 수단</th>
                          <td>계좌이체</td>
                        </tr>
                    <!-- 이체 은행 -->
                        <tr>
                          <th>이체 은행</th>
                          <td><%= bank_name %></td>
                        </tr>
                    <!-- 이체 은행 코드 -->
                        <tr>
                          <th>이체 은행코드</th>
                          <td><%= bank_code %></td>
                        </tr>
                    <!-- 승인시간 -->
                        <tr>
                          <th>승인 시간</th>
                          <td><%= app_time %></td>
                        </tr>
                    </table>
<%
                }
				/* ============================================================================== */
                /* =   가상계좌 결제 결과 출력                                                  = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("001000000000"))       
                {
%>
                    <h2>&sdot; 가상계좌 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- 결제수단 : 가상계좌 -->
                        <tr>
                          <th>결제 수단</th>
                          <td>가상계좌</td>
                        </tr>
                    <!-- 입금은행 -->
                        <tr>
                          <th>입금 은행</th>
                          <td><%= bankname %></td>
                        </tr>
                    <!-- 입금계좌 예금주 -->
                        <tr>
                          <th>입금할 계좌 예금주</th>
                          <td><%= depositor %></td>
                        </tr>
                    <!-- 입금계좌 번호 -->
                        <tr>
                          <th>입금할 계좌 번호</th>
                          <td><%= account %></td>
                        </tr>
					<!-- 가상계좌 입금마감시간 -->
                        <tr>
                          <th>가상계좌 입금마감시간</th>
                          <td><%= va_date %></td>
                        </tr>
					<!-- 가상계좌 모의입금(테스트시) -->
                        <tr>
                          <th>가상계좌 모의입금</br>(테스트시 사용)</th>
                          <td class="sub_content1"><a href="javascript:receiptView3()"><img src="./img/btn_vcn.png" alt="모의입금 페이지로 이동합니다." />
                        </tr>
                    </table>
<%
				}
				/* ============================================================================== */
                /* =   포인트 결제 결과 출력                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000100000000"))       
                {
%>
                    <h2>&sdot; 포인트 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- 결제수단 : 포인트 -->
                        <tr>
                          <th>결제수단</th>
                          <td>포 인 트</td>
                        </tr>
                    <!-- 포인트사 -->
                        <tr>
                          <th>포인트사</th>
                          <td><%= pnt_issue %></td>
                        </tr>
                    <!-- 포인트 승인시간 -->
                        <tr>
                          <th>포인트 승인시간</th>
                          <td><%= pnt_app_time %></td>
                        </tr>
                    <!-- 포인트 승인번호 -->
                        <tr>
                          <th>포인트 승인번호</th>
                          <td><%= pnt_app_no %></td>
                        </tr>
                    <!-- 적립금액 or 사용금액 -->
                        <tr>
                          <th>적립금액 or 사용금액</th>
                          <td><%= pnt_amount %></td>
                        </tr>
                    <!-- 발생 포인트 -->
                        <tr>
                          <th>발생 포인트</th>
                          <td><%= add_pnt %></td>
                        </tr>
                    <!-- 사용가능 포인트 -->
                        <tr>
                          <th>사용가능 포인트</th>
                          <td><%= use_pnt %></td>
                        </tr>
					<!-- 총 누적 포인트 -->
                        <tr>
                          <th>총 누적 포인트</th>
                          <td><%= rsv_pnt %></td>
                        </tr>
                </table>
<%
                }
				/* ============================================================================== */
                /* =   휴대폰 결제 결과 출력                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000010000000"))
                {
%>
                    <h2>&sdot; 휴대폰 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- 결제수단 : 휴대폰 -->
                        <tr>
                          <th>결제 수단</th>
                          <td>휴 대 폰</td>
                        </tr>
                    <!-- 승인시간 -->
                        <tr>
                          <th>승인 시간</th>
                          <td><%= app_time %></td>
                        </tr>
                    <!-- 통신사코드 -->
                        <tr>
                          <th>통신사 코드</th>
                          <td><%= commid %></td>
                        </tr>
                    <!-- 승인시간 -->
                        <tr>
                          <th>휴대폰 번호</th>
                          <td><%= mobile_no %></td>
                        </tr>
                </table>
<%
				}
				/* ============================================================================== */
                /* =   상품권 결제 결과 출력                                                    = */
                /* = -------------------------------------------------------------------------- = */
                else if (use_pay_method.equals("000000001000"))
                {
%>
                    <h2>&sdot; 상품권 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- 결제수단 : 상품권 -->
                        <tr>
                          <th>결제 수단</th>
                          <td>상 품 권</td>
                        </tr>
                    <!-- 발급사 코드 -->
                        <tr>
                          <th>발급사 코드</th>
                          <td><%= tk_van_code %></td>
                        </tr>
                    <!-- 승인시간 -->
                        <tr>
                          <th>승인 시간</th>
                          <td><%= app_time %></td>
                        </tr>
                    <!-- 승인번호 -->
                        <tr>
                          <th>승인 번호</th>
                          <td><%= tk_app_no %></td>
                        </tr>
                </table>
<%
                }
                /* ============================================================================== */
                /* =   현금영수증 정보 출력                                                     = */
                /* = -------------------------------------------------------------------------- = */
                if( !"".equals ( cash_yn ) )
				{
					if ( "010000000000".equals ( use_pay_method ) | "001000000000".equals ( use_pay_method ) )
					{
%>
                <!-- 현금영수증 정보 출력-->
                    <h2>&sdot; 현금영수증 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <tr>
                          <th>현금영수증 등록여부</th>
                          <td><%= cash_yn %></td>
                        </tr>
<%
                    //현금영수증이 등록된 경우 승인번호 값이 존재
                    if( !"".equals ( cash_authno ) )
					{
%>
                        <tr>
                          <th>현금영수증 승인번호</th>
                          <td><%= cash_authno %></td>
                        </tr>
                    <tr>
                        <th>영수증 확인</th>
                        <td class="sub_content1"><a href="javascript:receiptView2('<%=site_cd%>','<%= ordr_idxx %>', '<%= cash_yn %>', '<%= cash_authno %>')"><img src="/resources/include/commonfile/image/payment/btn_receipt.png" alt="현금영수증을  확인합니다." />
                    </td>
<%
                    }
%>
                </table>
<%
					}
				}
            }
            /* = -------------------------------------------------------------------------- = */
            /* =   01-1-1. 정상 결제시 결제 결과 출력 END                                   = */
            /* ============================================================================== */
        }
        /* = -------------------------------------------------------------------------- = */
        /* =   01-1. 업체 DB 처리 정상 END                                              = */
        /* ============================================================================== */
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   01-1-2. 부분취소시 취소 결과 출력                                        = */
    /* ============================================================================== */
    if( "mod".equals ( req_tx ) )
	{
		if( "STPC".equals ( mod_type ) )
		{
			if( "0000".equals ( res_cd ) )
			{
%>
             <h2>&sdot; 부분취소 정보</h2>
             <table class="tbl" cellpadding="0" cellspacing="0">
                 <!-- 총 금액 -->
                    <tr>
                      <th>총 금액</th>
                      <td><%= amount %></td>
                    </tr>
                 <!-- 부분취소 요청금액 -->
                     <tr>
                       <th>부분취소 요청금액</th>
                       <td><%= panc_mod_mny %></td>
                      </tr>
                 <!-- 부분취소 가능금액 -->
                      <tr>
                        <th>부분취소 가능금액</th>
                        <td><%= panc_rem_mny %></td>
                      </tr>
             </table>
<%
			}
		}
	}

    /* = -------------------------------------------------------------------------- = */
    /* =   01. 결제 결과 출력 END                                                   = */
    /* ============================================================================== */
%>
                    <!-- 매입 요청/처음으로 이미지 버튼 -->
                <tr>
                <div class="btnset">
                <% if("false".equals(bSucc)) { %>
                <a href="/front/mypage/basketList" class="home"><strong>[장바구니로]</strong></a>
                <% } else { %>
                <a href="/front/mypage/paymentList" class="home"><strong>[결제내역으로]</strong></a>
                <% } %>
                </div>
                </tr>
              </tr>
            </div>
        <!-- div class="footer">
                Copyright (c) KCP INC. All Rights reserved.
        </div-->
    </div>
				
				
				<!-- real Contents --> 
				<!--만족도 조사가 들어갈 영역 -->
				<%--@ include file="/resources/include/commonfile/inc/poll.jsp" --%>
				<!--만족도 조사가 들어갈 영역 --> 
				
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<%@ include file="/resources/include/commonfile/inc/bottom.jsp" %>
</div>
<script type="text/javascript">initMenu(9,1,6,0);</script>
</body>
</html>    
  </body>
</html>