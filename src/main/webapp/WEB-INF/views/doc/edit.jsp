<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${doc.d_title}(편집) - CS위키</title>
	<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>
	<h1>문서 편집</h1>
	<c:choose>
		<c:when test= "${member.p_id eq 0}">
			차단된 사용자입니다. 현재 편집 권한이 없습니다.
		</c:when>
		<c:when test= "${member.p_id >= doc.p_update}">
			<form name="edit" method="POST" action="${path}/doc/edit?d_num=${doc.d_num}">
				<input type="hidden" name="u_id" id="u_id" value="${member.u_id}"/>
				문서 제목: <input type="text" name="d_title" value="${doc.d_title}"><br>
			    <textarea name="d_content" id="editor">${doc.d_content}</textarea>
			    <br>
			         편집 요약 : <input type="text" name="d_summary"><br>
			    <button type="submit">확인</button>
			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		 	 </form>	
			<script>
		    CKEDITOR.replace('editor');
		  	</script>
		</c:when>
		<c:otherwise>
			편집 권한이 없습니다! 해당 문서의 ACL 탭을 확인하십시요.
		</c:otherwise>
	</c:choose>
</body>
</html>