<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<header id="header">
	<div class="center-align"> <!-- 가운데 정렬용 div -->
		<div id="header-top">
		    <c:choose>
				<c:when test="${not empty sessionScope.member}">
					<div>
						<span onclick="toggleUserInfo()">${member.name}님 환영합니다.</span>
						<div id="userInfo" class="hidden">
							사용자:${member.name}
							<hr>
							<ul>
								<li>내 정보 확인/수정</li>
								<li><a href="${path}/doc/userstar?u_id=${member.u_id}">내 문서함</a></li>
							</ul>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<span><a href="${path}/member/login">로그인이 필요합니다.</a></span>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="header-search" style="clear:both">
			<a href="${path}/"><h1><span>CS위키</span></h1></a>
	        <h2 class="blind">검색창</h2>
	        <fieldset>
	            <legend class="blind">검색</legend>
	            <form action="${path}/doc/doc?d_title=${d_title}" method="get">
		            <input type="text" name="d_title" />
		            <button type="submit" id="searchBtn">
		                <span class="blind">검색</span>
		                <span id="search-image"></span>
		            </button>
	            </form>
	        </fieldset>
		</div>
	</div>
</header>
