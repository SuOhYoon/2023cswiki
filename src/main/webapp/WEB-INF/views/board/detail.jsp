<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<h2>Detail page</h2>
	<table border="1">
		<th>정보</th>
		<th>데이터</th>
		<tr>
			<td>게시글 번호</td>
			<td>${data.bl_num}</td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td><fmt:formatDate value="${data.b_date}" pattern="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<td>게시글 제목</td>
			<td>${data.b_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${data.b_content}</td>
		</tr>

	</table>
	<a href="/cswiki/board/update?bl_num=${data.bl_num}" role="button"
		class="btn btn-outline-info">수정</a>
	<a href="/cswiki/board/delete?bl_num=${data.bl_num}" role="button"
		class="btn btn-outline-info">삭제</a>
</body>
</html>
