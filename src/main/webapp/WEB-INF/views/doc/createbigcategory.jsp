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
<title>1단계 분류 추가 - CS위키</title>
</head>
<body>
	<form class="center" method="post">
		<h2>1단계 분류 추가</h2>
		<div class="form-group">
			<label>분류 항목</label> <input type="text" class="form-control"
				name="b_ca_name" placeholder="추가할 분류를 입력해주세요.">
		</div>
		<button type="submit" class="btn btn-outline-info">추가</button>
		<button type="button" class="btn btn-outline-info">
			<a href="/board/list">이전</a>
		</button>
	</form>
</body>
</html>
