<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문서 편집</title>
	<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>
	<h1>문서 편집</h1>
	<form name="edit" method="POST" action="${path}/doc/edit?d_num=${doc.d_num}">
		문서 제목: <input type="text" name="d_title" value="${doc.d_title}"><br>
	    <textarea name="d_content" id="editor">${doc.d_content}</textarea>
	    <br>
	    <button type="submit">확인</button>
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 	 </form>	
	<script>
    CKEDITOR.replace('editor');
  	</script>
</body>
</html>