<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<div class="lnbBody"> 
	<ul id="lnb" class="lnbul">
		<c:if test="${adminInfo.admAuthCode eq 'S' }">
			<c:choose>
				<c:when test="${lnb != null && fn:length(lnb) > 0 }">
					<c:forEach items="${lnb }" var="lnb" varStatus="status">
						<li>
							<a href="${lnb.menuUrl }?gseq=${lnb.prntMenuSeq}&lseq=${lnb.menuSeq}"
								<c:choose>
									<c:when test="${lseq == 0 && status.index == 0 }">
										class="current"
									</c:when>
									<c:otherwise>
										<c:if test="${lnb.menuSeq == lseq }">
											class="current"
										</c:if>
									</c:otherwise>
								</c:choose>		
								>
								${lnb.menuNm }
							</a>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:if test="${gseq eq 5 }">
						<li>
							<a href="/admin/listPgmMng?gseq=5&lseq=0" <c:if test="${lseq eq 0 }">class="current"</c:if>>
								프로그램리스트
							</a>
							<a href="/admin/listPayMng?gseq=5&lseq=1"  <c:if test="${lseq eq 1 }">class="current"</c:if>>
								결제리스트
							</a>
							<a href="/admin/listRefundMng?gseq=5&lseq=2"  <c:if test="${lseq eq 2 }">class="current"</c:if>>
								환불요청
							</a>
							<a href="/admin/listTeacherMng?gseq=5&lseq=3" <c:if test="${lseq eq 3 }">class="current"</c:if>> 
								강사리스트
							</a>
							<a href="/admin/formAccept?gseq=5&lseq=4" <c:if test="${lseq eq 4 }">class="current"</c:if>> 
								접수일설정
							</a>
						</li>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${adminInfo.admAuthCode eq 'O' }">
			<c:if test="${gseq eq 3 }">
				<c:if test="${lnb != null && fn:length(lnb) > 0 }">
					<c:forEach items="${lnb }" var="lnb" varStatus="status">
						<c:if test="${status.index eq 0 }">
							<li>
								<a href="${lnb.menuUrl }?gseq=${lnb.prntMenuSeq}&lseq=${lnb.menuSeq}"
									<c:choose>
										<c:when test="${lseq == 0 && status.index == 0 }">
											class="current"
										</c:when>
										<c:otherwise>
											<c:if test="${lnb.menuSeq == lseq }">
												class="current"
											</c:if>
										</c:otherwise>
									</c:choose>		
									>
									${lnb.menuNm }
								</a>
							</li>
						</c:if>
					</c:forEach>
				</c:if>
			</c:if>
			<c:if test="${gseq eq 4 }">
				<c:if test="${lnb != null && fn:length(lnb) > 0 }">
					<c:if test="${authInfo != null && fn:length(authInfo) > 0 }">
						<c:forEach items="${lnb }" var="lnb" varStatus="status">
							<c:set var="cnt" value="0" />
							<c:forEach items="${authInfo }" var="list" varStatus="substatus">
								<c:if test="${lnb.menuSeq eq  list.menuSeq && cnt eq 0 }">
									<c:set var="cnt" value="${cnt + 1}" />
									<li>
										<a href="${lnb.menuUrl }?gseq=${lnb.prntMenuSeq}&lseq=${lnb.menuSeq}"
											<c:choose>
												<c:when test="${lseq == 0 && substatus.index == 0 }">
													class="current"
												</c:when>
												<c:otherwise>
													<c:if test="${lnb.menuSeq == lseq }">
														class="current"
													</c:if>
												</c:otherwise>
											</c:choose>		
											>
											${lnb.menuNm }
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:if>
				</c:if>
			</c:if>
			<c:if test="${gseq eq 7 }">
				<c:if test="${lnb != null && fn:length(lnb) > 0 }">
					<c:if test="${authInfo != null && fn:length(authInfo) > 0 }">
						<c:forEach items="${lnb }" var="lnb" varStatus="status">
							<c:set var="cnt" value="0" />
							<c:forEach items="${authInfo }" var="list" varStatus="substatus">
								<c:if test="${lnb.menuSeq eq  list.menuSeq && cnt eq 0 }">
									<c:set var="cnt" value="${cnt + 1}" />
									<li>
										<a href="${lnb.menuUrl }?gseq=${lnb.prntMenuSeq}&lseq=${lnb.menuSeq}" class="current">
											민원관리
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:if>
				</c:if>
			</c:if>
			<c:if test="${gseq eq 5 }">
				<li>
					<a href="/admin/listPgmMng?gseq=5&lseq=0" <c:if test="${lseq eq 0 }">class="current"</c:if>>
						프로그램리스트
					</a>
					<%-- <a href="/admin/listPayMng?gseq=5&lseq=1"  <c:if test="${lseq eq 1 }">class="current"</c:if>>
						결제리스트
					</a>
					<a href="/admin/listRefundMng?gseq=5&lseq=2"  <c:if test="${lseq eq 2 }">class="current"</c:if>>
						환불요청
					</a> --%>
					<a href="/admin/listTeacherMng?gseq=5&lseq=3"  <c:if test="${lseq eq 3 }">class="current"</c:if>> 
						강사리스트
					</a>
					<%-- <a href="/admin/formAccept?gseq=5&lseq=4" <c:if test="${lseq eq 4 }">class="current"</c:if>> 
						접수일설정
					</a> --%>
				</li>
			</c:if>
		</c:if>
	</ul>
</div>