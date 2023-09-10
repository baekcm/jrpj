<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>종로구시설관리공단</title>
<script type="text/javascript" src="/resources/include/commonfile/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		fnLoad();
	})
	function fnLoad(){
		// 당사에서는 최상위를 설정하기 위해 'parent.opener.parent.document.'로 정의하였습니다.
		// 따라서 귀사에 프로세스에 맞게 정의하시기 바랍니다.
		if("${memberCnt}" == "0"){
			if("0" == "${iRtn}") {
				$("#encData",opener.document).val("${sResponseData}");
				if("${type}" == "old" ){
					$("#sDupInfo",opener.document).val("${sDupInfo}");
					$("#vnoform",opener.document).attr("action","/front/oldCerty");
					$("#vnoform",opener.document).submit();
					return false;
				}
				if("${adult}" == "child" && 14 > "${sAge}" ){
					alert("14세이하는 보호자 인증이 필요합니다.");
					self.close();					
				}else{
				
					if("${adult}" == "child" ){
						
						$("#adult",opener.document).val("adult");
						$("#vnoform",opener.document).attr("action","/front/certy/online");
						
					}else{
							if(14 > "${sAge}"){
								$("#adult",opener.document).val("child");
							}else{
								$("#adult",opener.document).val("${adult}");
							}
						if("${type}" == "off"){
							$("#vnoform",opener.document).attr("action","/front/certy2");
							$("#parm",opener.document).val("2");
						}else{
							$("#vnoform",opener.document).attr("action","/formMemberJoinInput2");
						}
					}
					$("#vnoform",opener.document).submit();
				}
			} else {
				alert("실명인증 실패하였습니다.\n관리자에게 문의해주세요");			
			}
			self.close();	
		} else {
			alert("이미 가입되어있는 사용자입니다.\n관리자에게 문의해주세요");
			self.close();
		}
	}
</script>
</head>

<body>
</body>
</html>
