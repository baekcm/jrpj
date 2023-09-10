<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript">

	$(function(){
		$("#pollBtn").click(function(){
			//$(":input:radio[name=score]:checked").val();
			if($(":input:radio[name=score]:checked").val() == "" || $(":input:radio[name=score]:checked").val() ==null){
				alert("만족도를 선택해주세요.");
				return false;
			}
			$.ajax({
		           type:"POST",
		           url: "/front/saveSatfact",
		           dataType : "json",
		           data:  {"score" : $(":input:radio[name=score]:checked").val(), "menuSeq" : "${menuSeq}"},
		           success: function(data){
		        	   if(data.flag=="Y"){
		        		   alert("만족도를 등록하였습니다.");
		        	   }else{
		        		   alert("만족도는 하루에 한번만 등록가능합니다.");
		        	   }
		           },
		           error : function(request, status, error) {
					alert("에러코드 : " + request.status +"\n" + "메시지 :"+ request.responseText);
				}
		     });	
		});
	})

</script>
<c:if test="${menuSeq ne '' and menuSeq ne null }">

	<div class="pollWrap">
		<div class="poll">
			<p class="text">이 페이지의 내용과 편의성에 만족하십니까? </p>
			<ul>
				<li>
					<label for="satisr5">
						<input name="score" id="satisr5" type="radio" value="5" />매우만족</label>
				</li>
				<li>
					<label for="satisr4">
						<input name="score" id="satisr4" type="radio" value="4" />만족</label>
				</li>
				<li>
					<label for="satisr3">
						<input name="score" id="satisr3" type="radio" value="3" />보통</label>
				</li>
				<li>
					<label for="satisr2">
						<input name="score" id="satisr2" type="radio" value="2" />불만족</label>
				</li>
				<li>
					<label for="satisr1">
						<input name="score" id="satisr1" type="radio" value="1" />매우불만족</label>
				</li>
			</ul>
		</div>
		<div class="btn"><a href="#" ><img id="pollBtn" src="/resources/include/commonfile/image/common/btn_regist.png" alt="등록" /></a></div>
		<ul class="satis">
			<li>
				<dl>
					<dt>컨텐츠 관리부서  : </dt>
					<dd>
					${retMenu.empDept }
					
					</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>연락처  : </dt>
					<dd>
						<c:choose>
							<c:when test="${retMenu.empPhone1 eq null or retMenu.empPhone1 eq '' and retMenu.empPhone2 eq null or retMenu.empPhone2 eq '' }">
							
							</c:when>
							<c:otherwise>
							${retMenu.empPhone1 }-${retMenu.empPhone2 }-${retMenu.empPhone3 }
							</c:otherwise>
					</c:choose>
					</dd>
				</dl>
			</li>
			<li class="fr">
				<dl>
					<dt>최종수정일  : </dt>
					<dd>${fn:substring(retMenu.modiYmd,0,4)}-${fn:substring(retMenu.modiYmd,4,6)}-${fn:substring(retMenu.modiYmd,6,8)}</dd>
				</dl>
			</li>
		</ul>
	</div>
	
</c:if>
