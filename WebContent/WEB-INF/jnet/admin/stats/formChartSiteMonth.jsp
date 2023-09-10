<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
     	 var s1 = [  <c:if test="${listCnt != null && fn:length(listCnt) > 0 }">
				  		<c:forEach items="${listCnt }" var="list" varStatus="status">
							${list}
							<c:if test="${!status.last }">
							,
							</c:if>
						</c:forEach>
					</c:if>]; 
        var ticks = ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"];
        
       
        $.jqplot('chart1', [s1], {
            animate: !$.jqplot.use_excanvas,
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true }
            },
           axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks
                }
            },
            highlighter: { show: false }
        });

    