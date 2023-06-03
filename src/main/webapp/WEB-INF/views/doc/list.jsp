<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <title>1단계 분류 - CS위키</title>
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?1" />
        <link rel="stylesheet" href="${path}/resources/css/doc_list.css?6">
        <link rel="stylesheet" href="${path}/resources/css/header.css">
        <link rel="stylesheet" href="${path}/resources/css/nav.css">
        <link rel="stylesheet" href="${path}/resources/css/header.css">
        <link rel="stylesheet" href="${path}/resources/css/nav.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <%@ include file ="../header.jsp" %>
        <%@ include file ="../nav.jsp" %>
        <main>
            <div id="list">
        		<div class="list_inner">
            	<h2>1단계 분류<h2>
            		<div class="selectbox">		
	                		<ul>
	                			<li><a class="create">분류 만들기</a></li>
	                			<c:forEach items="${list}" var="list">
 								<li>
	                    			<a href="${path}/doc/s_category?b_ca_num=${list.b_ca_num}">
	                    				<c:out value="${list.b_ca_name}"/>
	                				</a>
	               				</li>
	               				</c:forEach> 
	                		</ul>                 		        
            		</div>
        		</div>
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
    <script type="text/javascript">
		$(".create").on("click", function(){
			window.open(
            	"${path}/doc/createbigcategory",
            	"Child",
            	"width=500, height=300, top=500, left=1080"
	        );
		});
	</script>
    </body>
</html>