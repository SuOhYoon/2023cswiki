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
        <link rel="stylesheet" href="${path}/resources/css/main.css?5">
        <link rel="stylesheet" href="${path}/resources/css/header.css">
        <link rel="stylesheet" href="${path}/resources/css/nav.css">
    </head>
    <body>
	    <script>
		 document.getElementById("searchBtn").onclick = function () {
			 let keyword =  document.getElementsByName("title")[0].value;
			 console.log(title)
			 location.href = "/doc/search" + "&title=" + title;
		 };
		</script>
        <%@ include file ="header.jsp" %>
        <%@ include file ="nav.jsp" %>
        <main>
            <div id="welcome">
                <div id="welcome_inner">
                    <h2>컴퓨터공학에 대한 모든 것, <p style=color:skyblue>CS위키</p></h2><br>
                    CS위키에 오신 여러분을 환영합니다! 컴퓨터에 대한 많은 정보를 가지고 있으며 기여자들이 직접 편집할 수 있는 인터넷 사이트입니다.
                </div>      
            </div>
            <div id="member">
		        <div id="member_inner">
		        	<c:choose>
						<c:when test="${not empty sessionScope.member}">
							<div>
								<p>${member.name}님 환영합니다.</p>
								<button id="logoutBtn" type="button" onclick="location.href='${path}/member/logout'"><a>로그아웃</a></button>
							</div>
						</c:when>
						<c:otherwise>
							로그인 후 더 많은 기능을 이용해보세요.
							<button id="loginbtn"><a href='<c:url value='/member/login'/>'>로그인</a></button><br>
							<div id="joingroup">
								회원가입 | 아이디 찾기 | 비밀번호 찾기
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
            <div id="recentedit">
                <div id="recentedit_inner">
                    <h3>최근 수정된 문서</h3>
                    <hr>
                    <li class="list">자바 : 2023-03-16 11:00 GALAXY_NOTE</li>
                    <li class="list">자바 : 2023-03-16 11:00 GALAXY_NOTE</li>
                    <li class="list">자바 : 2023-03-16 11:00 GALAXY_NOTE</li>
                    <li class="list">자바 : 2023-03-16 11:00 GALAXY_NOTE</li>
                    <li class="list">자바 : 2023-03-16 11:00 GALAXY_NOTE</li>
                    <li class="list">자바 : 2023-03-16 11:00 GALAXY_NOTE</li>
                    +more
                </div>
            </div>
            <div id="help">도움말 목록
            	<div id="help_area">
            		<ul>
            			<li><a>문서 작성 도움말</a></li>
            			<li><a>차단 소명 도움말</a></li>
            			<li><a>문법 도움말</a></li>
            			<li><a>권리침해 도움말</a></li>
            			<li><a>FAQ</a></li>
            		</ul>
            	</div>
            	<div id="rule_area">규정/운영
            		<ul>
            			<li><a>기본 규정</a></li>
            			<li><a href="${path}/doc/doc?d_title=이용자 관리 방침">이용자 관리 방침</a> | <a href="${path}/doc/doc?d_title=운영 관리 방침">운영 관리 방침</a> | <a href="${path}/doc/doc?d_title=문서 관리 방침">문서 관리 방침</a></li>
            			<li><a>역대 운영진</a> | <a>관리 도움말</a> | <a>운영회의</a></li>
            		</ul>
            	</div>
            </div>
            <div id="notice">공지사항</div>
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