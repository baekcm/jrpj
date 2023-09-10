<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
     	 var s1 = [<c:if test="${listSiteDate != null && fn:length(listSiteDate) > 0 }">
				  		<c:forEach items="${listSiteDate }" var="list" varStatus="status">
							${list.memCnt}
							<c:if test="${!status.last }">
							,
							</c:if>
						</c:forEach>
					</c:if>]; 
        var ticks = ["일","월","화","수","목","금","토"];
        
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
    