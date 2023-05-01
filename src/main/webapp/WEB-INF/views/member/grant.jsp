<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리메뉴:사용자 관리</title>
</head>
<body>
	<main>
		<div id="list">
			<div class="list_inner">
				<h2>관리 메뉴:권한 부여/회수</h2>
				<h3>접속 정보</h3>
				관리자 이름 : ${member.name}
				권한 :
				<c:choose>
					<c:when test="${member.p_id eq 4}">
					개발자
					</c:when>
					<c:otherwise>
					관리자
					</c:otherwise>
				</c:choose>
				<div class="grantbox">
					<form name="grant" method="POST" action="${path}/member/grant?u_id=${member.g_id}">
						사용자 : <input type="text" name="g_id" placeholder="권한 부여/회수할  사용자를 입력해주세요.">
						<select name="p_id">
		                    <option value="2">회원</option>
		                    <option value="3">관리자</option>
		                    <option value="4">개발자</option>
                		</select>
	                	<button type="submit">
	                    	<span class="btn_text">설정</span> 
	                	</button>
					</form>
				</div>
				<div class="selectbox">
					<c:forEach items="${list}" var="list">
					<ul>
					<li>${list.u_id} | ${list.p_id} | ${list.email} | ${list.name} | ${list.reg_date}</li>
					</ul> 
					</c:forEach>         
				</div>
			</div>
		</div>
	</main>
</body>
</html>