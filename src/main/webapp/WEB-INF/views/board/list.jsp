<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${path}/resources/css/boardlist.css?1">
	<meta charset="UTF-8">
	<title>신고게시판</title>
</head>
<body>
	<header id="header">
		<div class="center-align"> <!-- 가운데 정렬용 div -->
			<div id="header-top">
				<c:choose>
					<c:when test="${not empty sessionScope.member}">
						<div>
							<span>${member.name}님 환영합니다. | <a href="${path}/member/logout">로그아웃</a><span>
						</div>
					</c:when>
					<c:otherwise>
						<span><a href="${path}/member/login">로그인</a><span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<nav>
		<div class="center-align relative">
			<ul> <!-- unordered list --> <!-- ol 태그도 있어요 ordered list -->
				<li><a>CS위키 게시판</a></li> <!-- list item -->
				<li><a>위키로 이동</a></li> <!-- list item -->
			</ul>
		</div>
	</nav>
	<main>
		<h1>신고게시판</h1>
		<table class="table">
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr class="tr">
						<td><input type="checkbox"></td>
						<td>${list.bl_num}&nbsp;</td>
						<td><a href="${path}/board/detail?bl_num=${list.bl_num}">${list.b_title}&nbsp;</a></td>
						<td><fmt:formatDate value="${list.b_date}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="button-group">
			<button class="button button-write"><a href="<c:url value='/board/create'/>">글쓰기</a></button>
			<button class="button button-delete">삭제</button>
		</div>
	</main>
</body>
</html>
