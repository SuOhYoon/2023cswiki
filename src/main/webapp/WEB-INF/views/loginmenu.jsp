<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <title>CS위키</title>
        <link rel="stylesheet" href="${path}/resources/css/main.css?1">
    </head>
    <body>
	    <div id="member">
	        <div id="member_inner">
			    <c:choose>
				    <c:when test="${sessionScope.u_id == null}">
				         	로그인 후 더 많은 기능을 이용해보세요.
				            <button id="loginbtn"><a href='<c:url value='/member/login'/>'>로그인</a></button><br>
				            <div id="joingroup">
				            	회원가입 | 아이디 찾기 | 비밀번호 찾기
				            </div>
				    </c:when>
				    <c:otherwise>
				        ${sessionScope.name}님
				        <a href="${path}/member/logout">로그아웃</a>
				    </c:otherwise>
				</c:choose>
			</div>
		</div>
    </body>
</html>