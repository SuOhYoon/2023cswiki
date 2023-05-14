<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새 문서 작성</title>
	<script src="https://cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/create.css?3">
	<link rel="stylesheet" href="${path}/resources/css/header.css">
    <link rel="stylesheet" href="${path}/resources/css/nav.css">
</head>
<body>
	<%@ include file ="../header.jsp" %>
    <%@ include file ="../nav.jsp" %>
    <main>
    	<div id="doc">
			<c:choose>
				<c:when test= "${member.p_id eq 0}">
					차단된 사용자입니다. 현재 편집 권한이 없습니다.
				</c:when>
				<c:otherwise>
					<form class="editarea" method="post">
						<input type="text" name="d_title" id="d_title" placeholder="제목을 입력하세요."><br>
				    	<textarea name="d_content" id="editor"></textarea>
					    <br>
					    <p id="caution">경고! 문서 편집을 저장할 경우 당신의 기여 내용은 CC-BY-NC-SA 2.0 KR으로 배포됩니다.</p>
					    <button id="save" type="submit">저장</button>
					    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			 	 	</form>	
					<script>
					    CKEDITOR.replace('editor', {
					    	filebrowserUploadUrl : '${path}/doc/ckUpload'
					    });
			  		</script>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
	<footer class="footer">
        <hr>
        <div class="footer_inner">
        	<div>본 위키는 CC-BY-NC-SA 2.0 KR을 이용합니다. 기여하신 문서의 각 부분의 저작권은 기여자님이 갖습니다.</div>
            <div>Creators | front : S O Yoon | back : H C Han</div>
            <a href="${path}/" class="footer_logo">
                <h1>
                    <span>CS위키</span>
                </h1>
            </a>
        <span class="text">Copyright ©</span>
        <span class="corp">CSWIKI Corp.</span>
        <span class="text">All Rights Reserved.</span>
    </div>
    </footer>
</body>
</html>