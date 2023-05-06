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
            <div class="center-align relative">
                <ul> <!-- unordered list --> <!-- ol 태그도 있어요 ordered list -->
                  <li><a href='<c:url value='/doc/create'/>'>문서 만들기</a></li> <!-- list item -->
                  <li><a href='<c:url value='/doc/list'/>'>문서 목록</a></li> <!-- list item -->
                  <li><a href="">게시판</a></li> <!-- list item -->
                  <li><a href="">도움말</a></li> <!-- list item -->
                  <li><a href="">특수기능</a></li> <!-- list item -->
                </ul>
            </div>
        </nav>
        <main>
            <div id="list">
        		<div class="list_inner">
            	<h2>분류<h2>
            		<div class="selectbox">
            			<c:forEach items="${list}" var="list">
                		<ul>
                    		<li>
                    			<a href="${path}/doc/s_category?b_ca_num=${list.b_ca_num}">
                    				<c:out value="${list.b_ca_name}"/>
                				</a>
               				</li>
                		</ul> 
                		</c:forEach>         
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