<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="<c:url value='/resources/css/style-noticeList.css' />">

<style>
#noticeInsertForm {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#noticeInsertForm h1 {
  font-size: 24px;
  margin-bottom: 20px;
}

#noticeInsertForm div {
  margin-bottom: 10px;
}

#noticeInsertForm label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

#noticeInsertForm input[type="text"],
#noticeInsertForm textarea {
  width: 100%;
  padding: 8px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#noticeInsertForm textarea {
  height: 150px;
}

#noticeInsertForm input[type="text"][readonly] {
  background-color: #f1f1f1;
  border: none;
}

</style>

<body>

<div id="header-container">
    <h1>공지사항</h1>
</div>


<!-- 공지사항 목록 표시 -->
<form name="pageForm" id="pageForm" action="<c:url value='/notice/list.do'/>" method="post" >
	<input type="hidden" name="pageNo" id="pageNo" value="${result.notice.pageNo}" />
	<input type="hidden" name="searchTitle" id="searchTitle" value="${result.notice.searchTitle}" >
	<input type="hidden" name="pageLength" id="pageLength" value="${result.notice.pageLength}" >
</form>







<form name="mForm" id="mForm" action="<c:url value='/notice/list.do'/>" method="post" >
	<input type="hidden" name="pageNo" id="pageNo" value="${result.notice.pageNo}" />
	<div style="margin:0px auto; width: 50%; background-color: #f2f2f2; padding: 0px; border-radius: 5px;">
	    <div style="display: flex; margin:0px auto; width:100%; justify-align: center">
	        <label style="margin-right: 10px;">건수: </label>
	        <select name="pageLength" id="pageLength" style="margin-right: 10px; padding: 5px; border: 1px solid #ccc; border-radius: 5px;">
	            <option value="10" ${result.notice.pageLength == 10 ? 'selected="selected"' : ''} >10건 &darr;</option>
	            <option value="20" ${result.notice.pageLength == 20 ? 'selected="selected"' : ''} >20건 &darr;</option>
	            <option value="50" ${result.notice.pageLength == 50 ? 'selected="selected"' : ''} >50건 &darr;</option>
	            <option value="100" ${result.notice.pageLength == 100 ? 'selected="selected"' : ''} >100건 &darr;</option>
	        </select>
	        
	        <label>제목 : </label>
	        <input type="text" name="searchTitle" id="searchTitle" value="${result.notice.searchTitle}" style="flex:1; margin-right: 10px;">
	        <input type="submit" value="검색" style="background-color: #007bff; color: #fff; border: none; padding: 5px 10px; border-radius: 5px;">
	    </div>
	</div>
 
	





	
	<div id="write-button-container">
	    <div id="write-button">
	         <a id="showWriteForm">글 작성</a>
	    </div>
	</div>

	<div id="notice" >
	    <!-- column 헤더 -->
	    <div class="column-header">
	        <div class="check-box">
	            전체 선택
	            <input type='checkbox' id='chk' onclick="selectAllCheckboxes()">
	        </div>
	        <div class="notice-number">글번호</div>
	        <div class="notice-title">제목</div>
	        <div class="notice-view-count">조회수</div>
	        <div class="notice-writer">글쓴이</div>
	    </div>

	    <c:forEach var="notice" items="${result.list}">
	        <div class="post">
	            <div class="post-meta">
	                <div class="check-box">
                    <input type="checkbox" class="chk-box" name="noticeid" value="${notice.noticeid}">
	                </div>
	                <div class="notice-number">${notice.noticeid}</div>
	                <div id="noticeDetail" class="notice-title" >
    	 							<span style="padding-left:${(notice.level-1)*20}px"></span>
											${notice.level != 1 ? "[답변] " : ""}  ${notice.title}</div>
	                <div class="notice-view-count">${notice.view_count}</div>
	                <div class="notice-writer">${notice.writer_uid}</div>
	            </div>
	        </div>
	    </c:forEach>
	</div>



   	<div style="text-align: center; margin-top:20px;">
    	<c:if test="${result.notice.navStart != 1}">
    		<a href="javascript:jsPageNo(${result.notice.navStart-1})" style="padding: 10px;border: 1px solid red;"> &lt; </a> 

    	</c:if>
    	<c:forEach var="item" begin="${result.notice.navStart}" end="${result.notice.navEnd}">
    		<c:choose>
    			<c:when test="${result.notice.pageNo != item }">
    				<a href="javascript:jsPageNo(${item})" style="padding: 10px;border: 1px solid red;">${item}</a>  
    			</c:when>
    			<c:otherwise>
    				<strong style="font-size:2rem">${item}</strong>   
    			</c:otherwise>
    		</c:choose>
    	</c:forEach>
    	<c:if test="${result.notice.navEnd != result.notice.totalPageSize}">
    		<a href="javascript:jsPageNo(${result.notice.navEnd+1})" style="padding: 10px;border: 1px solid red;"> &gt; </a> 
    	</c:if>
   	</div>

		</form>
	
	


</body>