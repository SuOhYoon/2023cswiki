<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리 메뉴</title>
</head>
<body>
	<c:choose>
   		<c:when test="${member.p_id eq 4 }">
   			<ul>
   				<h2>개발자 매뉴/권한 부여</h2>
   				<h3>접속 정보</h3>
   				관리자 이름 : ${member.name}
   				<form name="grant" method="POST" action="${path}/member/grant?u_id=${member.u_id}">
   					사용자 이름 : <input id="u_id"/>
   					권한 : 
   					<select name="p_id">
	                    <option value="3">관리자</option>
	                    <option value="4">개발자</option>
                	</select>
                	<button type="submit" id="grant">
                    	<span class="btn_text">설정</span> 
                	</button>
   				</form>
			</ul>
   		</c:when>
   		<c:otherwise>
   			<script>
   				alert('관리자 권한이 없습니다!');
   				window.history.back();
   			</script>
   		</c:otherwise>
   	</c:choose>
</body>
</html>