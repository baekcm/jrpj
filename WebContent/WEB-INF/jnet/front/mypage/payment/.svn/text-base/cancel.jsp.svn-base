<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
    /* ============================================================================== */
    /* =   PAGE : 취소 요청 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   아래의 ※ 주의 ※ 부분을 꼭 참고하시여 연동을 진행하시기 바랍니다.       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do			        = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/common/commoninc.jsp" />
	<script type="text/javascript">
		$(function(){
			$("#cancelBtn").click(function(){
				var f = confirm("취소요청을 하시겠습니까?");
				if(f) {
					$("#frm").submit();
				} else {
					return;
				}
			});
		})
	</script>
</head>
<body>
	<div align="center" style="margin-top: 20px;">
	<%
	    /* ============================================================================== */
	    /* =   1. 취소 요청 정보 입력 폼(cancel_info)                                   = */
	    /* = -------------------------------------------------------------------------- = */
	    /* =   취소 요청에 필요한 정보를 설정합니다.                                    = */
	    /* = -------------------------------------------------------------------------- = */
	%>
		<form name="frm" id="frm" method="post" action="/admin/saveRefundPop">
			<%
			    /* ============================================================================== */
			    /* =   1-1. 취소 요청 필수 정보 설정                                            = */
			    /* = -------------------------------------------------------------------------- = */
			    /* =   ※ 필수 - 반드시 필요한 정보입니다.                                      = */
			    /* = -------------------------------------------------------------------------- = */
			%>
			<input type="hidden" name="req_tx"   value="mod"  />
			<input type="hidden" name="mod_type" value="STSC" />
			<input type="hidden" name="mem_no" value="${outPgm.memNo }" />
			<input type="hidden" name="mod_desc" value="${outPgm.reason }" />
			<input type="hidden" name="upId" value="${outPgm.upId }" />
			<input type="hidden" name="recpNo" value="${outPgm.recpNo }" />
			<input type="hidden" name="tno" value="${outPgm.tno }" />
			<input type="hidden" name="dateGbnCd" value="${outPgm.dateGbnCd }" />
			<input type="hidden" name="lseq" value="${outPgm.lseq }" />
			<input type="hidden" name="gseq" value="${outPgm.gseq }" />
			<div class="naviandtitle">
				<h3>결제 취소 요청</h3>
			</div>
			<div class="contents"> 
				<table width="589" cellspacing="0" cellpadding="0" border="0" style="margin-top: 15px;">
					<tr style="height:14px">
						<td style="background-image:url('/resources/include/payment/img/boxtop589.gif')"></td>
					</tr>
					<tr>
						<td style="background-image:url('/resources/include/payment/img/boxbg589.gif')" align="center">
							<!-- 취소 요청 정보 입력 테이블 Start -->
							<table width="527" cellspacing="0" border="0" cellpadding="0" class="margin_top_20 bd00 bd00Bbs">
								<tr>
									<th class="ta_l" scope="row">
										요청 구분
									</th>
									<td class="bd01td listx">
										취소 요청
									</td>
								</tr>
								<!-- Input : 결제된 건의 거래번호(14 byte) 입력 -->
								<tr>
									<th class="ta_l" scope="row">
										거래번호
									</th>
									<td class="bd01td listx">
										${outPgm.tno } 
									</td>
								</tr>
								<!-- Input : 변경 사유(mod_desc) 입력 -->
								<tr>
									<th class="ta_l" scope="row">
										취소 사유
									</th>
									<td class="bd01td listx">
										${outPgm.reason } 
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="background-image:url('/resources/include/payment/img/boxbg589.gif')">       
							<table width="100%" cellspacing="0" cellpadding="0" class="margin_top_20" style="margin-top: 15px;">
								<tr>
									<td colspan="2" align="center"> 	
										<span class="txtBtn_lightGray">
											<a href="#" id="cancelBtn" >취소요청</a>
										</span> &nbsp;
										<span class="txtBtn_lightGray">
											<a href="#" onclick="window.close();" id="removeBtn" >닫기</a>
										</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<img src="/resources/include/payment/img/boxbtm589.gif" alt="Copyright(c) KCP Inc. All rights reserved."/>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
