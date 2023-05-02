<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<form name="userForm">
		<h1>List page</h1>
		<table>
			<thead>
				<tr>
					<th scope="col">내용</th>
					<th scope="col">날짜</th>
					<th scope="col">게시글 제목</th>
					<th scope="col">게시글 번호</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td class="text_ct">${list.b_content}&nbsp;</td>
						<td class="text_ct"><fmt:formatDate value="${list.b_date}"
								pattern="yyyy/MM/dd" /></td>
						<td class="text_ct"><a
							href="${path}/board/detail?bl_num=${list.bl_num}">${list.b_title}&nbsp;</a></td>
						<td class="text_ct">${list.bl_num}&nbsp;</td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="<c:url value='/board/create'/>" role="button"
			class="btn btn-outline-info">글쓰기</a>
	</form>
</body>
</html>
