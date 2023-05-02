<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Update page</h2>
	<form name="update" method="POST"
		action="${path}/cswiki/board/update?bl_num=${data.bl_num}">
		<div>글번호 : ${data.bl_num}</div>
		<div>게시글 제목 :</div>
		<div>
			<input name="b_title" value="${data.b_title}" type="text" />
		</div>
		<div>게시글 내용 :</div>
		<div>
			<input name="b_content" value="${data.b_content}" type="text" />
		</div>
		<div>작성일자</div>
		<div>
			<fmt:formatDate value="${data.b_date}" pattern="yyyy/MM/dd" />
		</div>

		<div>
			<input type="submit" class="btn btn-outline-info" value="완료" /> <input
				type="reset" class="btn btn-outline-info" value="리셋" />
		</div>
	</form>

</body>
</html>