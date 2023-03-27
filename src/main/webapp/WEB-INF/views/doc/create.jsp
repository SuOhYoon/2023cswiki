<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새 문서 작성</title>
	<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
</head>
<body>
	<h1>새 문서 작성</h1>
	<form method="post">
		문서 제목: <input type="text" name="d_title"><br>
	    <textarea name="d_content" id="editor"></textarea>
	    <br>
	    <button type="submit">게시글 작성</button>
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 	 </form>	
	<script>
    CKEDITOR.replace('editor', {
    	filebrowserUploadUrl : '${path}/doc/ckUpload'
    });
  	</script>
</body>
</html>