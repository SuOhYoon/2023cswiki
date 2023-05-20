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
        <link rel="stylesheet" href="${path}/resources/css/doc_list_edit.css">
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
            	<h2>대분류 수정<h2>
            	<hr>
            		<div class="selectbox">
                		<table class="table">
                			<th>선택</th>
                			<th>대분류 번호</th>
                			<th>대분류 이름</th>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr class="tr">
										<td><input id="allCheck" type="checkbox" name="allCheck"/></td>
										<td>${list.b_ca_num}</td>
										<td>${list.b_ca_name}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">
						<input type="button" value="수정" class="btn btn-outline-info" onclick="deleteValue();">
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
    </body>
</html>