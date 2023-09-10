<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
     	 var s1 = [
     	 <c:choose>
     	 	<c:when test="${listCnt != null && fn:length(listCnt) > 0 }">
   	 			<c:forEach items="${listCnt }" var="list" varStatus="status">
					${list}
					<c:if test="${!status.last }">
					,
					</c:if>
				</c:forEach>
     	 	</c:when>
     	 	<c:otherwise>
     	 		<c:forEach items="${listSiteSlctDateNm }" var="list" varStatus="status">
					0
					<c:if test="${!status.last }">
					,
					</c:if>
				</c:forEach>
     	 	</c:otherwise>
     	 </c:choose>]; 
         var ticks = [<c:if test="${listSiteSlctDateNm != null && fn:length(listSiteSlctDateNm) > 0 }">
					  		<c:forEach items="${listSiteSlctDateNm }" var="list" varStatus="status">
					  			"${fn:substring(list,6,8)}"
								<c:if test="${!status.last }">
								,
								</c:if>
							</c:forEach>
						</c:if>];
        
        $.jqplot('chart1', [s1], {
            animate: !$.jqplot.use_excanvas,
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true }
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer
                    ,ticks: ticks
                    <c:if test="${listSiteSlctDateNm != null && fn:length(listSiteSlctDateNm) > 0 && fn:length(listSiteSlctDateNm) < 5 }">
	                ,rendererOptions: {barWidth: 50}
	                </c:if>
                }
            },
            highlighter: { show: false }
        });