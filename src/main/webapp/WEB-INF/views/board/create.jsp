<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.center {
	margin: 5px 25px;
	padding: 20px
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Create</title>
</head>
<body>
	<form class="center" method="post">
		<h2>Create Page</h2>
		<div class="form-group">
			<label>b_title</label> <input type="text" class="form-control"
				name="b_title" placeholder="제목">
		</div>
		<div class="form-group">
			<label>b_content</label> <input type="text" class="form-control"
				name="b_content" placeholder="내용">
		</div>

		<button type="submit" class="btn btn-outline-info">작성</button>
		<button type="button" class="btn btn-outline-info">
			<a href="/board/list">이전</a>
		</button>
	</form>
</body>
</html>
