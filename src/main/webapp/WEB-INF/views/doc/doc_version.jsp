<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%
	String version = request.getParameter("d_version");
	int ver = 0;
	ver = Integer.parseInt(version);
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <title>${version.d_title}(r<%= ver %>) - CS위키</title>
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
		        <span class="title">${version.d_title}(r<%= ver %>)</span>
		        <div class="selectbox">
	                <ul>
	                    <li><a>★</a></li>
	                    <li>
						    <a href="${path}/doc/edit?d_num=${version.d_num}">편집</a>
	                    </li>
	                    <li><a href="${path}/doc/doc_history?d_num=${version.d_num}">역사</a></li>
	                    <li>
							<a href="${path}/doc/acl?d_num=${version.d_num}">ACL</a>
	                    </li>
	                    <li>
		                    <c:choose>
								<c:when test= "${member.p_id eq 0}">
									삭제
								</c:when>
								<c:when test= "${member.p_id >= version.p_delete}">
									<a href="${path}/doc/delete?d_num=${version.d_num}">삭제</a>
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
				       		<c:when test="${version.p_read eq 0 && empty member.p_id}">
				       			${version.d_content}
				       		</c:when>
				       		<c:when test="${member.p_id >= version.p_read }">
				       			${version.d_content}
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