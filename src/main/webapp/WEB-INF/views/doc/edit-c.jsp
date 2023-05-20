<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <title>CS위키</title>
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?1" />
        <link rel="stylesheet" href="${path}/resources/css/doc_list.css?6">
        <link rel="stylesheet" href="${path}/resources/css/header.css">
        <link rel="stylesheet" href="${path}/resources/css/nav.css">
        <link rel="stylesheet" href="${path}/resources/css/header.css">
        <link rel="stylesheet" href="${path}/resources/css/nav.css">
    </head>
    <body>
        <%@ include file ="../header.jsp" %>
        <%@ include file ="../nav.jsp" %>
        <main>
            <div id="list">
        		<div class="list_inner">
            		<h2>분류 편집<h2>
	            		<ul>
						    <c:forEach items="${bigCategoryVOs}" var="bigCategoryVO">
						      	<li>
						        	<a href="#">${bigCategoryVO.b_ca_name}</a>
							        <ul>
								        <c:forEach items="${docService.getSmallCategoriesByBigCategoryNum(bigCategoryVO.b_ca_num)}" var="smallCategoryVO">
								          <li>${smallCategoryVO.s_ca_name}</li>
								        </c:forEach>
							        </ul>
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
    <script>

    </script>
    </body>
</html>