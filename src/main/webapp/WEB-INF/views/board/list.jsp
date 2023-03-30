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
					<th scope="col">b_content</th>
					<th scope="col">b_date</th>
					<th scope="col">b_num</th>
					<th scope="col">b_title</th>
					<th scope="col">bl_num</th>
					<th scope="col">hashtag1</th>
					<th scope="col">hashtag2</th>
					<th scope="col">hashtag3</th>
					<th scope="col">hashtag4</th>
					<th scope="col">hashtag5</th>
					<th scope="col">p_id</th>
					<th scope="col">u_id</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td class="text_ct">${list.b_content}&nbsp;</td>
						<td class="text_ct"><fmt:formatDate value="${list.b_date}"
								pattern="yyyy/MM/dd" /></td>
						<td class="text_ct">${list.b_title}&nbsp;</td>
						<td class="text_ct">${list.bl_num}&nbsp;</td>
						<td class="text_ct">${list.hashtag1}&nbsp;</td>
						<td class="text_ct">${list.hashtag2}&nbsp;</td>
						<td class="text_ct">${list.hashtag3}&nbsp;</td>
						<td class="text_ct">${list.hashtag4}&nbsp;</td>
						<td class="text_ct">${list.hashtag5}&nbsp;</td>
						<td class="text_ct">${list.p_id}&nbsp;</td>
						<td class="text_ct">${list.u_id}&nbsp;</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>
