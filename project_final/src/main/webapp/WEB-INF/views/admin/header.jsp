<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  

<!--  admin의 Header -->


  
    <!-- css에 추가하자, 로고 css임 -->
  <style>
        /* 추가한 CSS */
        .header_inner {
            text-align: center;
        }
  </style>
  <link rel="stylesheet" href="<c:url value='/resources/css/loginNaver.css' />">
  
	<div id="wrap" class="wrap">
    <header class="header">
        <div class="header_inner">
	        <a href="../index.jsp">
 				<img src="<c:url value='/resources/images/logoDaebo.jpg' /> " alt="로고">
			</a>
        </div>

    </header>
	</div>
