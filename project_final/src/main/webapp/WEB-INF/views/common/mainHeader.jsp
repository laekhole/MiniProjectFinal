<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--  일반 회원의 MainHeader -->


<header class="header">
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

   <div id="logo">
		<a href="<c:url value='/' />">
			<img src="<c:url value='/resources/images/logoDaebo.jpg' />" alt="로고">
		</a>
		</div>
		<nav>
			<ul id="topMenu">
				<li><a href="<c:url value='/notice/list.do' />">공지사항</a>
				</li>
				<li><a href="<c:url value='/board/list.do' />">게시판</a>
				</li>


				<!-- 로그인 X -->
				<c:if test="${loginMember == null}">
					<li><a id="createUserDialog">회원가입</a></li>
					<li><a id="dialogueLoginAnchor">로그인</a></li>
				</c:if>			   
				

				<!-- 로그인 O -->
				<c:if test="${loginMember != null}">
					<li><a id="dialogueMemberDetail">내 정보</a></li>
					<li><a id="logout" >로그아웃</a></li>
				</c:if>
			

				  
			</ul>
		</nav>
</header>






