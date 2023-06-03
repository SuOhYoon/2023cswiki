<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${data.b_title}</title>
		<link rel="stylesheet" href="${path}/resources/css/boarddetail.css?g">
	</head>
	<body>
	<header id="header">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		</div>
	</header>
	<nav>
		<div class="center-align relative">
			<ul> <!-- unordered list --> <!-- ol 태그도 있어요 ordered list -->
				<li><a>CS위키 게시판</a></li> <!-- list item -->
				<li><a>위키로 이동</a></li> <!-- list item -->
			</ul>
		</div>
	</nav>
	<main>
		<div id="content-header">
			<h1>${data.b_title}</h1>
			<h2><fmt:formatDate value="${data.b_date}" pattern="yyyy-MM-dd HH:mm:ss" /></h2>
		</div>
		<hr>
		${data.b_content}
		<hr>
		<div class="button-group">
			<button class="button button-write"><a href="<c:url value='/board/create'/>">글쓰기</a></button>
			<button class="button button-delete">삭제</button>
		</div>
		<h4>댓글</h4>
		<div id="comment-area">
			<ul>
			    <c:forEach items="${comment}" var="comment">
			      	<div id="comment">
				      	<li>
				      		<div id="comment-header">
						      	${comment.u_id}<div class="modify"><fmt:formatDate value="${comment.cm_date}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;삭제 | 수정</a> | 답글</div>
					        </div>
					        <div id="comment-main">
					        	<p>${comment.cm_content}</p>
					        </div>
				      	</li>
			      	</div>
			    </c:forEach>   
		  	</ul>
		</div>
		<hr>
		<h4>댓글 작성</h4>
		<form name="commentw" method="post">
			<input type="hidden" name="u_id" id="u_id" value="${member.u_id}"/>
			<input type="hidden" id="bl_num" name="bl_num" value="${data.bl_num}" />
			<div>
				<label for="cm_content">댓글 내용</label><input type="text" id="cm_content" name="cm_content" />
			</div>
			<div>
				<button type="button" class="write_btn">작성</button>
			</div>
<!-- 			<div class="commentu-form" style="display: none;"> -->
<%-- 	          <form name="commentu" method="post" action="${path}/board/commentu"> --%>
<%-- 	            <input type="hidden" name="cm_num" value="${comment.cm_num}" /> --%>
<%-- 	            <input type="hidden" name="bl_num" value="${comment.bl_num}" /> --%>
<%-- 	            <input type="text" name="cm_content" value="${comment.cm_content}" /> --%>
<!-- 	            <button type="submit">수정 완료</button> -->
<!-- 	          </form> -->
<!-- 	        </div> -->
			</form>
		<script type="text/javascript">
			$(".write_btn").on("click", function(){
			  var formObj = $("form[name='commentw']");
			  formObj.attr("action", "${path}/board/commentw");
			  formObj.submit();
			});
		</script>
	</body>
</html>
