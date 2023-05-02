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
			<label>b_content</label> <input type="text" class="form-control"
				name="b_content" placeholder="b_content 작성해주세요.">
		</div>
		<div class="form-group">
			<label>b_title</label> <input type="text" class="form-control"
				name="b_title" placeholder="b_title 작성해주세요.">
		</div>
<!-- 		<div class="form-group"> -->
<!-- 			<label>u_id</label> <input type="text" class="form-control" -->
<!-- 				name="u_id" placeholder="u_id 작성해주세요."> -->
<!-- 		</div> -->

		<button type="submit" class="btn btn-outline-info">등록</button>
		<button type="button" class="btn btn-outline-info">
			<a href="/board/list">돌아가기</a>
		</button>
	</form>
</body>
</html>
