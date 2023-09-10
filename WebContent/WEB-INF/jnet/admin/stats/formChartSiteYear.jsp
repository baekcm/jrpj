<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
     	 var s1 = [  <c:choose>
				        <c:when test="${listCnt != null &&  fn:length(listCnt) > 0 }">
				        	<c:forEach items="${listCnt }" var="list" varStatus="status">
								${list}
								<c:if test="${!status.last }">
								,
								</c:if>
							</c:forEach>
				        </c:when>
				         <c:otherwise>
				         	0
				         </c:otherwise>
				     </c:choose>]; 
        var ticks = [<c:choose>
				        <c:when test="${listYear != null &&  fn:length(listYear) > 0 }">
					        <c:forEach items="${listYear }" var="list" varStatus="status">
								"${list}년"
								<c:if test="${!status.last }">
								,
								</c:if>
							</c:forEach>
				        </c:when>
				        <c:otherwise>
				        	"데이터 없음"
				        </c:otherwise>
			        </c:choose> ];
        
        $.jqplot('chart1', [s1], {
            animate: !$.jqplot.use_excanvas,
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer
                ,pointLabels: { show: true }
                 <c:if test="${listYear != null && fn:length(listYear) > 0 && fn:length(listYear) < 5 }">
                ,rendererOptions: {barWidth: 50}
                </c:if>
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer
                    ,ticks: ticks
                   
                }
            },
            highlighter: { show: false }
        });
