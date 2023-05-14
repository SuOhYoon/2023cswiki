<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <%@ include file ="../header.jsp" %>
        <%@ include file ="../nav.jsp" %>
        <main>
            <div id="doc">
		        <div class="doc_inner">
		        <span class="title">${doc.d_title}</span>
		        <div class="selectbox">
	                <ul>
	                    <li><a>★</a></li>
	                    <li>
						    <a href="${path}/doc/edit?d_num=${doc.d_num}">편집</a>
	                    </li>
	                    <li><a>역사</a></li>
	                    <li>
							<a href="${path}/doc/acl?d_num=${doc.d_num}">ACL</a>
	                    </li>
	                    <li>
		                    <c:choose>
								<c:when test= "${member.p_id eq 0}">
									삭제
								</c:when>
								<c:when test= "${member.p_id >= doc.p_delete}">
									<a href="${path}/doc/delete?d_num=${doc.d_num}">삭제</a>
								</c:when>
								<c:otherwise>
									삭제
								</c:otherwise>
							</c:choose>
	                    </li>
	                </ul>          
		       </div>
		       <div class="content">
		       	<c:choose>
		       		<c:when test="${doc.p_read eq 0 && empty member.p_id}">
		       			${doc.d_content}
		       		</c:when>
		       		<c:when test="${member.p_id >= doc.p_read }">
		       			${doc.d_content}
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