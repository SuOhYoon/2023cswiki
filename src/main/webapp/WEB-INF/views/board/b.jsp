<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${path}/resources/css/boardlist.css">
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
				<li><a>자유게시판</a></li> <!-- list item -->
				<li><a>문의게시판</a></li> <!-- list item -->
				<li><a>신고게시판</a></li> <!-- list item -->
				<li><a>위키로 이동</a></li> <!-- list item -->
			</ul>
		</div>
	</nav>
	<main>
		<h4>공지사항</h4>
		<table class="table">
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr class="tr">
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h4>자유게시판</h4>
		<table class="table">
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr class="tr">
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h4>문의게시판</h4>
		<table class="table">
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr class="tr">
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h4><a>신고게시판</a></h4>
		<table class="table">
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr class="tr">
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
					<tr>
						<td>테스트</td>
						<td>관리자</td>
						<td>2022-09-22 09:00 KST</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>
