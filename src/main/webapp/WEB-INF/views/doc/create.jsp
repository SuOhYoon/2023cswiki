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
</head>
<body>
	<header id="header">
       <div class="center-align"> <!-- 가운데 정렬용 div -->
           <div id="header-top">
               <c:choose>
					<c:when test="${not empty sessionScope.member}">
						<div>
							<span>${member.name}님 환영합니다. | <a href="${path}/member/logout">로그아웃</a><span>
						</div>
					</c:when>
					<c:otherwise>
						<span><a href="${path}/member/login">로그인</a><span>
					</c:otherwise>
				</c:choose>
    	   </div>
           <div id="header-search" style="clear:both">
               <a href="${path}/">
                   <h1>
                       <span>CS위키</span>
                   </h1>
               </a>
               <h2 class="blind">검색창</h2>
               <fieldset>
                   <legend class="blind">검색</legend>
                   <input />
                   <button>
                       <span class="blind">검색</span>
                       <span id="search-image"></span>
                   </button>
               </fieldset>
           </div>
       </div>
    </header>
    <nav>
       	<c:choose>
       		<c:when test="${member.p_id >= 3}">
       			<div class="center-align relative">
	                <ul> <!-- unordered list --> <!-- ol 태그도 있어요 ordered list -->
	                  <li><a href='<c:url value='/doc/create'/>'>문서 만들기</a></li> <!-- list item -->
	                  <li><a href='<c:url value='/doc/list'/>'>문서 목록</a></li> <!-- list item -->
	                  <li><a href="">게시판</a></li> <!-- list item -->
	                  <li><a href="">도움말</a></li> <!-- list item -->
	                  <li><a href='<c:url value='/member/admin'/>'>관리</a></li> <!-- list item -->
	                </ul>
	            </div>
       		</c:when>
       		<c:otherwise>
       			<div class="center-align relative">
	                <ul> <!-- unordered list --> <!-- ol 태그도 있어요 ordered list -->
	                  <li><a href='<c:url value='/doc/create'/>'>문서 만들기</a></li> <!-- list item -->
	                  <li><a href='<c:url value='/doc/list'/>'>문서 목록</a></li> <!-- list item -->
	                  <li><a href="">게시판</a></li> <!-- list item -->
	                  <li><a href="">도움말</a></li> <!-- list item -->
	                </ul>
	            </div>
       		</c:otherwise>
       	</c:choose>
    </nav>
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