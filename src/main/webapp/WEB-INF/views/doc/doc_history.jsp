<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <title>CS위키</title>
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?1" />
        <link rel="stylesheet" href="${path}/resources/css/doc.css?5">
        <link rel="stylesheet" href="${path}/resources/css/header.css">
        <link rel="stylesheet" href="${path}/resources/css/nav.css">
    </head>
    <body>
        <%@ include file ="../header.jsp" %>s
        <%@ include file ="../nav.jsp" %>
        <main>
            <div id="doc">
		        <div class="doc_inner">
		        <span class="title">${doc.d_title}(문서 역사)</span>
		        <div class="content">
		       	<c:choose>
				    <c:when test="${doc.p_read eq 0 && empty member.p_id}">
				        <c:forEach items="${historyList}" var="history">
				            <li>
				                <fmt:formatDate value="${history.d_date}" pattern="yyyy-MM-dd HH:mm:ss" /> ${history.d_time}
				                (<a href="${path}/doc/doc_version?d_num=${history.d_num}&d_version=${history.d_version}">보기</a>)
				                r${history.d_version} (${history.d_summary})
				            </li>
				        </c:forEach> 
				    </c:when>
				    <c:when test="${member.p_id >= doc.p_read}">
				        <c:forEach items="${historyList}" var="history">
				            <li>
				                <fmt:formatDate value="${history.d_date}" pattern="yyyy-MM-dd HH:mm:ss" /> ${history.d_time}
				                (<a href="${path}/doc/doc_version?d_num=${history.d_num}&d_version=${history.d_version}">보기</a>)
				                r${history.d_version} (${history.d_summary})
				            </li>
				        </c:forEach> 
				    </c:when>
				    <c:otherwise>
				        읽기 권한이 없습니다!
				    </c:otherwise>
				</c:choose>
		       </div>
        </div>
    </div>
        </main>
        <footer class="footer">
        <hr>
        <div class="footer_inner">
        	<div>본 위키는 CC-BY-NC-SA 2.0 KR을 이용합니다. 기여하신 문서의 각 부분의 저작권은 기여자님이 갖습니다.</div>
            <div>Creators | front : S O Yoon | back : H C Han</div>
            <a href="${path}/" class="footer_logo">
                <h1>
                    <span>CS위키</span>
                </h1>
            </a>
        <span class="text">Copyright ©</span>
        <span class="corp">CSWIKI Corp.</span>
        <span class="text">All Rights Reserved.</span>
    </div>
    </footer>
    </body>
</html>