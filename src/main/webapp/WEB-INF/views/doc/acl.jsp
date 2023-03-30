<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
    <head>
        <title>ACL 설정</title>
        <link rel="stylesheet" type="text/css" href = "${path}/resources/css/acl.css">
    </head>
    <body>
        <div id="header">
            <h2>ACL</h2>
        </div>
        <div id="main">
        <c:choose>
        	<c:when test="${member.p_id >= 3}">
        		<form class="aclgroup" method="POST" action="${path}/doc/doc?d_num=${doc.d_num}/aclupdate">
            읽기 권한 :
                <select name="p_read">
                    <option value="1">회원</option>
                    <option value="2">관리자</option>
                    <option value="3">개발자</option>
                </select>
            수정 권한 :
                <select name="p_update">
                    <option value="1">회원</option>
                    <option value="2">관리자</option>
                    <option value="3">개발자</option>
                </select>
            삭제 권한 :
                <select name="p_delete">
                    <option value="1">회원</option>
                    <option value="2">관리자</option>
                    <option value="3">개발자</option>
                </select>
                <button type="submit" id="aclupdate">
                    <span class="btn_text">설정</span> 
                </button>
           </form>
        	</c:when>
        	<c:otherwise>
        		읽기 권한 : 아무나
        		<br>
        		수정 권한 : 아무나
        		<br>
        		삭제 권한 : 아무나
        	</c:otherwise>
        </c:choose>
        </div>
    </body>
</html>