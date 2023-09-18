<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<link rel="stylesheet" href="<c:url value='/resources/css/style-noticeList.css' />">



<body>

    <div id="header-container">
        <h1>간단한 게시판</h1>
    </div>
    <h3 style="text-align: center;">게시판</h3>

    <div id="write-button-container">
        <div id="write-button">
            <button onclick="showWriteForm()">글 작성</button>
            <form action="deleteSelected.jsp" method='get'>
                <c:if test="${loginMember != null && loginMember.uid eq 'admin'}">
                    <input type='submit' value="삭제">
                </c:if>
            </form>
        </div>
    </div>

    <div id="notice">
        <div class="column-header">
            <div class="check-box">
                전체 선택
                <input type='checkbox' id='chk' onclick="selectAllCheckboxes()">
            </div>
            <div class="notice-number">글번호</div>
            <div class="notice-title">제목</div>
            <div class="notice-fixedYN">고정 여부</div>
            <div class="notice-view-count">조회수</div>
            <div class="notice-writer">글쓴이</div>
        </div>

        <c:forEach var="notice" items="${noticeList}">
            <div class="post">
                <div class="post-meta">
                    <div class="check-box">
                        <input type="checkbox" class="chk-box" name="noticeUid" value="${notice.noticeUid}">
                    </div>
                    <div class="notice-number">${notice.noticeUid}</div>
                    <div class="notice-title">
                        <a href="noticeDetail.jsp?noticeUid=${notice.noticeUid}">${notice.title}</a>
                    </div>
                    <div class="notice-fixedYN">${notice.fixedYN}</div>
                    <div class="notice-view-count">${notice.viewCount}</div>
                    <div class="notice-writer">${notice.writerUid}</div>
                </div>
            </div>
        </c:forEach>
    </div>

    <script>
        function showWriteForm() {
            window.location.href = 'noticeWrite.jsp';
            console.log("실행은 됐음");
        }

        function selectAllCheckboxes() {
            const allChk = document.querySelector("#chk");
            const chkBoxes = document.querySelectorAll(".chk-box");

            for (let i = 0; i < chkBoxes.length; i++) {
                chkBoxes[i].checked = allChk.checked;
            }
        }
    </script>
</body>
</html>