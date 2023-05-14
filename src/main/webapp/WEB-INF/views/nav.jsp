<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<nav>
	<c:choose>
		<c:when test="${member.p_id >= 3}">
			<div class="center-align relative">
       			<ul> <!-- unordered list --> <!-- ol 태그도 있어요 ordered list -->
					<li><a href='<c:url value='/doc/create'/>'>문서 만들기</a></li> <!-- list item -->
					<li><a href='<c:url value='/doc/list'/>'>문서 목록</a></li> <!-- list item -->
					<li><a href='<c:url value='/board/b'/>'>게시판</a></li> <!-- list item -->
					<li><a href="">도움말</a></li> <!-- list item -->
					<li><a href='<c:url value='/member/admin'/>'>관리</a></li> <!-- list item -->
    			</ul>
			</div>
		</c:when>
		<c:otherwise>
			<div class="center-align relative">
			    <ul> <!-- unordered list --> <!-- ol 태그도 있어요 ordered list -->
					<li><a href='<c:url value='/doc/create'/>'>문서 만들기</a></li> <!-- list item -->
					<li><a href='<c:url value='/doc/list'/>'>문서 목록</a></li> <!-- list item -->
					<li><a href='<c:url value='/board/b'/>'>게시판</a></li> <!-- list item -->
					<li><a href="">도움말</a></li> <!-- list item -->
			    </ul>
			</div>
		</c:otherwise>
	</c:choose>
</nav>