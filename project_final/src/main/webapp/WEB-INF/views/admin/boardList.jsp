<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>


<%-- <link rel="stylesheet" href="<c:url value='/resources/css/style-boardList.css' />"> --%>



<!-- <body> -->

<!-- <div id="header-container"> -->
<!--     <h1>간단한 게시판</h1> -->
<!-- </div> -->
<!-- <h3 style="text-align: center;">공지사항</h3> -->

<!-- <div id="write-button-container"> -->
<!--     <div id="write-button"> -->
<%--         <c:if test="${loginMember != null && loginMember.uid eq 'admin'}"> --%>
<!--             <button onclick="showWriteForm()">글 작성</button> -->
<!--             <form action="deleteSelected.jsp" method="get"> -->
<!--                 <input type='submit' value="삭제"> -->
<!--             </form> -->
<%--         </c:if> --%>
<!--     </div> -->
<!-- </div> -->

<!-- <div id="board"> -->
<!--     column 헤더 -->
<!--     <div class="column-header"> -->
<!--         <div class="check-box"> -->
<!--             전체 선택 -->
<!--             <input type='checkbox' id='chk' onclick="selectAllCheckboxes()"> -->
<!--         </div> -->
<!--         <div class="board-number">글번호</div> -->
<!--         <div class="board-title">제목</div> -->
<!--         <div class="board-fixedYN">고정 여부</div> -->
<!--         <div class="board-view-count">조회수</div> -->
<!--         <div class="board-writer">글쓴이</div> -->
<!--     </div> -->

<%--     <c:forEach var="board" items="${boardList}"> --%>
<!--         <div class="post"> -->
<!--             <div class="post-meta"> -->
<!--                 <div class="check-box"> -->
<%--                     <input type="checkbox" class="chk-box" name="boardUid" value="${board.boardUid}"> --%>
<!--                 </div> -->
<%--                 <div class="board-number">${board.boardUid}</div> --%>
<!--                 <div class="board-title"> -->
<%--                     <a href="boardDetail.jsp?boardUid=${board.boardUid}">${board.title}</a> --%>
<!--                 </div> -->
<%--                 <div class="board-fixedYN">${board.fixedYN}</div> --%>
<%--                 <div class="board-view-count">${board.viewCount}</div> --%>
<%--                 <div class="board-writer">${board.writerUid}</div> --%>
<!--             </div> -->
<!--         </div> -->
<%--     </c:forEach> --%>
<!-- </div> -->

<!-- <script> -->
//     function showWriteForm() {
//         window.location.href = 'boardWrite.jsp';
//     }

//     function selectAllCheckboxes() {
//         const allChk = document.querySelector("#chk");
//         const chkBoxes = document.querySelectorAll(".chk-box");

//         for (let i = 0; i < chkBoxes.length; i++) {
//             chkBoxes[i].checked = allChk.checked;
//         }
//     }
<!-- </script> -->
<!-- </body> -->