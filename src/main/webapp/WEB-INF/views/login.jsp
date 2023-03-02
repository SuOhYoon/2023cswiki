<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html;" charset="UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CS WIKI : 로그인</title>
        <link rel="stylesheet" type="text/css" href = "${path}/resources/css/login.css">
    </head>
    <body class="pc"> 
        <header>
            <div class="header_inner">
                <a href="main.jsp" class="logo">
                    <h1>
                        <span>CS위키</span>
                    </h1>
                </a>
            </div>
        </header>
        <main>
            <div class="main_inner">
                <div class="login_wrap">
                    <form>
                        <div class="id_pw_wrap">
                            <div class="id_area">
                                <input type="text" id="id" name="id" placeholder="아이디" title="아이디" class="input_text" maxlength="41" value="">
                            </div>
                            <div class="pw_area">
                                <input type="password" id="pw" name="pw" placeholder="비밀번호" title="비밀번호" class="input_text" maxlength="16">
                            </div>
                        </div>
                        <div class="login_btn">
                            <button type="submit" class="btn_login" id="log.login">
                                <span class="btn_text">로그인</span>
                            </button>
                        </div>
                    </form>
                </div>
                <ul class="find_wrap">
                    <li><a href="">비밀번호 찾기</a></li>
                    <li>|</li>
                    <li><a href="">아이디 찾기</a></li>
                    <li>|</li>
                    <li><a href="join.jsp">회원가입</a></li>
                </ul>
            </div>
        </main>
        <footer>
            <div class="footer_inner">
                    <a href="main.jsp" class="footer_logo">
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