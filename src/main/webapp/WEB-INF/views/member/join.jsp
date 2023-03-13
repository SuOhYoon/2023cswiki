<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CS WIKI : 회원가입</title>
        <link rel="stylesheet" type="text/css" href = "${path}/resources/css/join.css">
    </head>
    <body>
        <header>
            <header>
                <div class="header_inner">
                    <a href="main.jsp" class="logo">
                        <h1>
                            <span>CS위키</span>
                        </h1>
                    </a>
                </div>
            </header>
        </header>
        <main>
            <form id="join_form" method="post">
                <div id="group">
                    <div class="input_area">
                        <label class="form_text">아이디</label>
                            <div class="textForm">
                                <input name="u_id" type="text" class="textinput" placeholder="ID 입력">
                            </div>
                    </div>
                    <div class="input_area">
                        <label class="form_text">비밀번호</label>
                            <div class="textForm">
                                <input name="pwd" type="password" class="textinput" placeholder="비밀번호 입력">
                            </div>
                    </div>
                    <div class="input_area">
                        <label class="form_text">비밀번호 재확인</label>
                            <div class="textForm">
                                <input name="pwd_confirm" type="password" class="textinput" placeholder="비밀번호 다시 입력"></input>
                            </div>
                    </div>
                    <div class="input_area">
                        <label class="form_text">이름</label>
                            <div class="textForm">
                                <input name="name" type="text" class="textinput" placeholder="이름 입력">
                            </div>
                    </div>
                    <div class="input_area">
                        <label class="form_text">이메일</label>
                            <div class="textForm">
                                <input name="email" type="text" class="textinput" placeholder="이메일 주소 입력">
                            </div>
                    </div>
                </div>
                <div class="btn_area">
                	<button type="submit" id="btnJoin" class="join_btn"><span>회원가입</span></button>
	    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </div>
            </form>
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
