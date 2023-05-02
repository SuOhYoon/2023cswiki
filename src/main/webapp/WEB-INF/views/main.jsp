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
        <link rel="stylesheet" href="${path}/resources/css/main.css?4">
    </head>
    <body>
	    <script>
		 document.getElementById("searchBtn").onclick = function () {
			 let keyword =  document.getElementsByName("title")[0].value;
			 console.log(title)
			 location.href = "/doc/search" + "&title=" + title;
		 };
		</script>
        <header id="header">
            <div class="center-align"> <!-- 가운데 정렬용 div -->
                <div id="header-top">
                    <c:choose>
						<c:when test="${not empty sessionScope.member}">
							<div>
								<span>${member.name}님 환영합니다.</span>
							</div>
						</c:when>
						<c:otherwise>
							<p>Beta 1.0</p>
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
                        <input type="text" name="d_title" />
                        <button type="button" id="searchBtn">
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
		                  <li><a href='<c:url value='/board/list'/>'>게시판</a></li> <!-- list item -->
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
		                  <li><a href='<c:url value='/board/list'/>'>게시판</a></li> <!-- list item -->
		                  <li><a href="">도움말</a></li> <!-- list item -->
		                </ul>
		            </div>
        		</c:otherwise>
        	</c:choose>
            
        </nav>
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
            <div id="help">규정/도움말</div>
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