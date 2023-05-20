<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리 메뉴</title>
</head>
<body>
	<c:choose>
   		<c:when test="${member.p_id >= 3 }">
   			<ul>
   				<h2>관리자 페이지</h2>
   				<h3>접속 정보</h3>
   				관리자 이름 : ${member.name}
   				권한 :
   				<c:choose>
   					<c:when test="${member.p_id eq 3}">
   						관리자
   					</c:when>
   					<c:otherwise>
   						개발자
   					</c:otherwise>
   				</c:choose>
   				<c:choose>
   					<c:when test="${member.p_id eq 3}">
   						<li><a href="${path}/member/memberlist">사용자 조회</a></li>
						<li><a href="${path}/member/grant">사용자 차단</a></li>
						<li><a href="${path}/member/edit-c">카테고리 관리</a></li>
						<li><a href="">게시판 관리</a></li>
   					</c:when>
   					<c:otherwise>
   						<li><a href="${path}/member/memberlist">사용자 조회</a></li>
						<li><a href="${path}/member/grant">사용자 권한 부여</a></li>
						<li><a href="${path}/member/ban">사용자 차단</a></li>
						<li><a href="${path}/member/edit-c">카테고리 관리</a></li>
						<li><a href="">게시판 관리</a></li>
   					</c:otherwise>
   				</c:choose>
			</ul>
   		</c:when>
   		<c:otherwise>
   			<script>
   				alert('관리자 권한이 없습니다!');
   				window.history.back();
   			</script>
   		</c:otherwise>
   	</c:choose>
</body>
</html>