<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        	<br>
	        <c:choose>
	        	<c:when test="${member.p_id >= 3}">
	        		<form name="acl" class="aclgroup" method="POST" action="${path}/doc/acl?d_num=${doc.d_num}">
		            	읽기 권한 :
		                <select name="p_read">
		                	<option value="1">아무나</option>
		                    <option value="2">회원</option>
		                    <option value="3">관리자</option>
		                    <option value="4">개발자</option>
		                </select>
		            	수정 권한 :
		                <select name="p_update">
		                    <option value="1">아무나</option>
		                    <option value="2">회원</option>
		                    <option value="3">관리자</option>
		                    <option value="4">개발자</option>
		                </select>
		            	삭제 권한 :
		                <select name="p_delete">
		                	<option value="1">아무나</option>
		                    <option value="2">회원</option>
		                    <option value="3">관리자</option>
		                    <option value="4">개발자</option>
		                </select>
		                <button type="submit" id="aclupdate">
		                    <span class="btn_text">설정</span> 
		                </button>
	           		</form>
	           	</c:when>
	      </c:choose>
		              읽기 권한 : 
			  <c:choose>
				<c:when test="${doc.p_read eq 4}">
					개발자
				</c:when>
				<c:when test="${doc.p_read eq 3}">
					관리자
				</c:when>
				<c:when test="${doc.p_read eq 2}">
					회원
				</c:when>
				<c:otherwise>
					아무나
				</c:otherwise>
		     </c:choose>
		      <br>
		            수정 권한 : 
		     <c:choose>
				<c:when test="${doc.p_update eq 4}">
					개발자
				</c:when>
				<c:when test="${doc.p_update eq 3}">
					관리자
				</c:when>
				<c:when test="${doc.p_update eq 2}">
					회원
				</c:when>
				<c:otherwise>
					아무나
				</c:otherwise>
			</c:choose>
			<br>
			삭제 권한 :
		    <c:choose>
			    <c:when test="${doc.p_delete eq 4}">
		        	개발자
			    </c:when>
			    <c:when test="${doc.p_delete eq 3}">
		        	관리자
			    </c:when>
			    <c:when test="${doc.p_delete eq 2}">
		        	회원
			    </c:when>
			    <c:otherwise>
		       	         아무나
			    </c:otherwise>
		    </c:choose>
        </div>
    </body>
</html>