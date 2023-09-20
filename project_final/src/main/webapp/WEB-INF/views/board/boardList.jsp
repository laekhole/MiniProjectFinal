<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="<c:url value='/resources/css/style-boardList.css' />">

<style>
#boardInsertForm {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#boardInsertForm h1 {
  font-size: 24px;
  margin-bottom: 20px;
}

#boardInsertForm div {
  margin-bottom: 10px;
}

#boardInsertForm label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

#boardInsertForm input[type="text"],
#boardInsertForm textarea {
  width: 100%;
  padding: 8px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#boardInsertForm textarea {
  height: 150px;
}

#boardInsertForm input[type="text"][readonly] {
  background-color: #f1f1f1;
  border: none;
}

</style>

<body>

<div id="header-container">
    <h1>게시판</h1>
</div>


<!-- 게시판 목록 표시 -->
<form name="pageForm" id="pageForm" action="<c:url value='/board/list.do'/>" method="post" >
	<input type="hidden" name="pageNo" id="pageNo" value="${result.board.pageNo}" />
	<input type="hidden" name="searchTitle" id="searchTitle" value="${result.board.searchTitle}" >
	<input type="hidden" name="pageLength" id="pageLength" value="${result.board.pageLength}" >
</form>







<form name="mForm" id="mForm" action="<c:url value='/board/list.do'/>" method="post" >
	<input type="hidden" name="pageNo" id="pageNo" value="${result.board.pageNo}" />
	<div style="margin:0px auto; width: 50%; background-color: #f2f2f2; padding: 0px; border-radius: 5px;">
	    <div style="display: flex; margin:0px auto; width:100%; justify-align: center">
	        <label style="margin-right: 10px;">건수: </label>
	        <select name="pageLength" id="pageLength" style="margin-right: 10px; padding: 5px; border: 1px solid #ccc; border-radius: 5px;">
	            <option value="10" ${result.board.pageLength == 10 ? 'selected="selected"' : ''} >10건 &darr;</option>
	            <option value="20" ${result.board.pageLength == 20 ? 'selected="selected"' : ''} >20건 &darr;</option>
	            <option value="50" ${result.board.pageLength == 50 ? 'selected="selected"' : ''} >50건 &darr;</option>
	            <option value="100" ${result.board.pageLength == 100 ? 'selected="selected"' : ''} >100건 &darr;</option>
	        </select>
	        
	        <label>제목 : </label>
	        <input type="text" name="searchTitle" id="searchTitle" value="${result.board.searchTitle}" style="flex:1; margin-right: 10px;">
	        <input type="submit" value="검색" style="background-color: #007bff; color: #fff; border: none; padding: 5px 10px; border-radius: 5px;">
	    </div>
	</div>
 
	





	
	<div id="write-button-container">
	    <div id="write-button">
	         <a id="showWriteForm">글 작성</a>
	    </div>
	</div>

	<div id="board" >
	    <!-- column 헤더 -->
	    <div class="column-header">
	        <div class="check-box">
	            전체 선택
	            <input type='checkbox' id='chk' onclick="selectAllCheckboxes()">
	        </div>
	        <div class="board-number">글번호</div>
	        <div class="board-title">제목</div>
	        <div class="board-view-count">조회수</div>
	        <div class="board-writer">글쓴이</div>
	    </div>

	    <c:forEach var="board" items="${result.list}">
	        <div class="post">
	            <div class="post-meta">
	                <div class="check-box">
	                    <input type="checkbox" class="chk-box" name="boardid" value="${board.boardid}">
	                </div>
	                <div class="board-number">${board.boardid}</div>
	                <div id="boardDetail" class="board-title" style="text-align: left">
    	 							<span style="padding-left:${(board.level-1)*20}px"></span>
											${board.level != 1 ? "[답변] " : ""}  ${board.title}</div>
	                <div class="board-view-count">${board.view_count}</div>
	                <div class="board-writer">${board.writer_uid}</div>
	            </div>
	        </div>
	    </c:forEach>
	</div>



   	<div style="text-align: center; margin-top:20px;">
    	<c:if test="${result.board.navStart != 1}">
    		<a href="javascript:jsPageNo(${result.board.navStart-1})" style="padding: 10px;border: 1px solid red;"> &lt; </a> 

    	</c:if>
    	<c:forEach var="item" begin="${result.board.navStart}" end="${result.board.navEnd}">
    		<c:choose>
    			<c:when test="${result.board.pageNo != item }">
    				<a href="javascript:jsPageNo(${item})" style="padding: 10px;border: 1px solid red;">${item}</a>  
    			</c:when>
    			<c:otherwise>
    				<strong style="font-size:2rem">${item}</strong>   
    			</c:otherwise>
    		</c:choose>
    	</c:forEach>
    	<c:if test="${result.board.navEnd != result.board.totalPageSize}">
    		<a href="javascript:jsPageNo(${result.board.navEnd+1})" style="padding: 10px;border: 1px solid red;"> &gt; </a> 
    	</c:if>
   	</div>

		</form>
	
	

		




<!--   --------------- 이 밑으로는 모달 다이얼로그 html -----------------   -->
		
		<div id="boardDetailForm">
			<div id="detail-container">
				<input type="hidden" id="boardid1" name="boardid1">
		    <table class="tb">
		        <tr>
		            <th class="col">제목</th>
		            <td id="title1"></td>
		        </tr>
		        <tr>
		            <th class="col">작성자</th>
		            <td id="writer_uid1"></td>
		        </tr>
		        <tr>
		            <th class="col">내용</th>
		            <td>
		                <div id="contents1"></div>
		            </td>
		        </tr>
		        <tr>
		            <th class="col">작성날짜</th>
		            <td id="reg_date1"></td>
		        </tr>
		        <tr>
		            <th class="col">조회수</th>
		            <td id="view_count1"></td>
		        </tr>
		    </table>
			</div>
		</div>


	
	<div id="boardInsertForm">
    <h1>간단한 게시판 - 글쓰기</h1>
    <div>
        <label for="title2">제목</label>
        <input type="text" id="title2" />
    </div>
    <div>
        <label for="writer_uid2">작성자</label>
        <input type="text" id="writer_uid2" value="${loginMember.id}" readonly />
    </div>
    <div>
        <label for="contents2">내용</label>
        <textarea id="contents2"></textarea>
    </div>
	</div>
	
	
	
	
	<div id="boardUpdateForm">
    <h1>간단한 게시판 - 글 수정하기</h1>
    <div>
        <label for="title3">제목</label>
        <input type="text" id="title3" />
    </div>
    <div>
        <label for="writer_uid3">작성자</label>
        <input type="text" id="writer_uid3" value="${loginMember.id}" readonly />
    </div>
    <div>
        <label for="contents3">내용</label>
        <textarea id="contents3"></textarea>
    </div>
	</div>
	
	
	
<div id="boardReplyForm">
    <h1>간단한 게시판 - 답글 달기</h1>
    <input type="hidden" id="boardid4" name="boardid4">
    <input type="hidden" id="pid4" name="pid4">
    <div>
        <label for="title4">제목</label>
        <input type="text" id="title4" />
    </div>
    <div>
        <label for="writer_uid4">작성자</label>
        <input type="text" id="writer_uid4" value="${loginMember.id}" readonly />
    </div>
    <div>
        <label for="contents4">내용</label>
        <textarea id="contents4"></textarea>
    </div>
</div>


<!--   --------------- 여기서 모달 다이얼로그 html 끝 -----------------   -->

	
	
	
	
	


<script>
   
    /* 게시판 상세 폼 띄우기 */
    const boardDetailEventHandler = () => {
	    $(".post-meta #boardDetail").on("click", function() {
	
	       alert("게시판 상세보기");
	       //여기서 ajax로 세션 데이터를 가져와라.
	       //성공하면 오픈하기 전에 데이터를 출력
	       //
	       //그러고 나서 대화상자 화면에 보이게 한다.
				var boardid = $(this).siblings(".board-number").text();
	      const param ={
	    		   boardid: boardid
	       };
		    console.log("boardid는 : "+boardid)
	
	       fetch("<c:url value='/board/detail.do'/>", {
	           method: "POST",
	           headers: {
	               "Content-Type": "application/json; charset=UTF-8",
	           },
	           body: JSON.stringify(param)
	       })
	       .then((response) => response.json())
	       .then((json) => {
	           if (json.status) {
	               alert("정보 실시간 반영 성공!");
	  							const boardid = json.boardView.boardid
	  							const title = json.boardView.title;
	  							const writer_uid = json.boardView.writer_uid;
	  							const contents = json.boardView.contents;
	  							const reg_date = json.boardView.reg_date;
	  							const view_count = json.boardView.view_count;
	               console.log("boardid = "+boardid);
	               console.log("title = "+title);
	               console.log("writer_uid = "+writer_uid);
	               console.log("contents = "+contents);
	               console.log("reg_date = "+reg_date);
	              $("#boardid1").val(boardid);
	  		      	$("#title1").text(title);
	  		      	$("#writer_uid1").text(writer_uid);
	  		      	$("#contents1").html(contents);
	  		      	$("#reg_date1").text(reg_date);
	  		      	$("#view_count1").text(view_count);
	      //       detailDialog.dialog("close"); // 이거 뭐지 기억이 안 나는데;
	           } else {
	               alert("정보 반영 실패!");
	           }
	       });
	       
	       $("#boardDetailForm").dialog("open");
	    });
    }	    //게시판 상세 dialog 띄우기 declare 완
    boardDetailEventHandler(); 	    //게시판 상세 dialog 띄우기 완
    
    
    
// /* 게시판 상세 다이얼로그 (게시판 수정 다이얼로그도 이 안에 있음) */
// boardDetailDialog = $("#boardDetailForm").dialog({
//    autoOpen: false,
//    modal: true,
//    width: 500,
//    height: 700
// });
    

// //게시글 상세 다이얼로그 열기 전에 실행될 함수
// boardDetailDialog.on("dialogopen", function () {
//     var loginMemberId = ${sessionScope.loginMember.id};
//     var writer_uid = $("#writer_uid1").text();
  
//     if (loginMemberId === writer_uid) {
//         dialog.dialog("option", "buttons", {
//             "게시글 수정하기": function () {
//                 $("#boardUpdateForm").dialog("open");
                
//                 $(this).dialog("option", "buttons", {
//                     "수정 완료": function () {
//                     	listUpdate()
//                     },
//                     닫기: function () {
//                     	listUpdate()
//                         $(this).dialog("close");
//                     }
                   
//                 });
//             },
//             "답글 쓰기" : function(){
//             	boardReplyDialog.dialog("open"); //답글 다이얼로그(boardReplyDialog) 열기
//             },
//             "삭제하기" : function(){ //얘는 다이얼로그가 아니라서 바로 함수 넣고 진행. 삭제 함수 짤 수도 있지만, 익숙치 않으므로 지저분해도 일단 진행
//              var boardid = $("#boardid1").val();
// 				             var param ={
// 				                 boardid: boardid
// 				             };
// 				             if (confirm("정말로 삭제하시겠습니까?")) {
// 						                 // 삭제 처리 코드
// 						                 fetch("<c:url value='/board/delete.do'/>", {
// 						                     method: "POST",
// 						                     headers: {
// 						                         "Content-Type": "application/json; charset=UTF-8",
// 						                     },
// 						                     body: JSON.stringify(param),
// 						                 })
// 						                 .then((response) => response.json())
// 						                 .then((json) => {
// 						                     if (json.status) {
// 						                         alert("게시글 삭제가 완료되었습니다.");
// 						                         boardDetailDialog.dialog("close"); // 다이얼로그 닫기
// 						                         listUpdate(); //게시글 리스트 비동기 구현
// 						                     } else {
// 						                         alert("게시글 삭제에 실패했습니다.");
// 						                     }
// 						                 });
// 				             	}
//          		},
//             닫기: function () {
//             	listUpdate() //게시글 리스트 비동기 구현
//                 $(this).dialog("close"); //게시글 상세 다이얼로그(boardDetailDialog) 닫기
//             }
//         });
//     }
// 		else if(loginMemberId!=""){
//        	boardDetailDialog.dialog("option", "buttons",{
//              "답글 쓰기" : function () {
//            	  boardReplyDialog.dialog("open"); //답글 다이얼로그(boardReplyDialog) 열기
//             },
//               닫기: function () {
//            	   listUpdate() //게시글 리스트 비동기 구현
//                     $(this).dialog("close");//게시글 상세 다이얼로그(boardDetailDialog) 닫기
//                 }
//           })
//     }
// 		else {
//        	boardDetailDialog.dialog("option", "buttons", {
//                닫기: function () {
//                	listUpdate() //게시글 리스트 비동기 구현
//                    $(this).dialog("close");//게시글 상세 다이얼로그(boardDetailDialog) 닫기
//                }
//            });
//        }
// });






// 이거는 상대적으로 단순하게 구현한 코드. 여기서 답글 완성하고 들어가자
//     /* 게시판 상세 다이얼로그 패치(게시판 수정 다이얼로그도 이 안에 있음) */
 boardDetailDialog = $("#boardDetailForm").dialog({

    autoOpen: false,
    modal: true,
    width: 500,
    height: 700,
    buttons: {
		     "답글 쓰기" : function () {
		 	  boardReplyDialog.dialog("open"); //답글 다이얼로그(boardReplyDialog) 열기
		 	  alert($("#boardid1").val());
				  },
        "게시글 수정": function(){
            var loginMemberId = "${sessionScope.loginMember.id}";
            var writer_uid = $("#writer_uid1").text();            
            console.log(loginMemberId);
            
            console.log(writer_uid);
            if (loginMemberId === writer_uid) { // 수정된 부분
                $("#boardUpdateForm").dialog("open");
            } else {
                alert("자신이 작성한 게시글만 수정할 수 있습니다.");
            }
        },
        "게시글 삭제": function(){
        	
            var loginMemberId = "${sessionScope.loginMember.id}";
            var writer_uid = $("#writer_uid1").text();
            var boardid = $("#boardid1").val();
            var param ={
                boardid: boardid
            };
            if (confirm("정말로 삭제하시겠습니까?")) {
                // 삭제 처리 코드
                fetch("<c:url value='/board/delete.do'/>", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json; charset=UTF-8",
                    },
                    body: JSON.stringify(param),
                })
                .then((response) => response.json())
                .then((json) => {
                    if (json.status) {
                        alert("게시글 삭제가 완료되었습니다.");
                        boardDetailDialog.dialog("close"); // 다이얼로그 닫기
                        listUpdate();
                    } else {
                        alert("게시글 삭제에 실패했습니다.");
                    }
                });
            }
        },
        닫기: function() {
            $(this).dialog("close");
        }
    }
});
    


/* 게시판 답글 다이얼로그 */
boardReplyDialog = $("#boardReplyForm").dialog({
	   autoOpen: false,
	   modal: true,
	   width: 500,
	   height: 700,
	   buttons: {
			    "답글 작성": function(){
              	const title = $("#title4").val();
                const writer_uid = $("#writer_uid4").val();
                const contents = $("#contents4").val();
                const pid = $("#boardid1").val(); // 부모 게시물의 ID
                
                if (title === "") {
                    alert("제목을 입력해주세요.");
                    $("#title4").focus();
                    return false;
                }
                
                if (contents === "") {
                    alert("본문을 입력해주세요");
                    $("#contents4").focus();
                    return false;
                }

                const param = {
                	 title: title,
                	 writer_uid: writer_uid,
                   contents: contents,
                   pid: pid
                };
                
                console.log(param);
                fetch("<c:url value='/board/insertReply.do'/>", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json; charset=UTF-8",
                    },
                    body: JSON.stringify(param),
                })
                .then((response) => response.json())
                .then((json) => {
                    if (json.status) {
                        alert("게시글 작성 성공!");
                        boardReplyDialog.dialog("close");
                        boardDetailDialog.dialog("close");
                        listUpdate();
                    } else {
                        alert("게시글 작성 실패!");
                    }
                });

            },
					닫기: function() {
             boardReplyDialog.dialog("close");
             boardDetailDialog.dialog("close");
             listUpdate();
					}
		}
});



    
	// 게시글 작성 다이얼로그 띄우기
   $("#showWriteForm").on("click", function (e) {

      $("#boardInsertForm").dialog("open");
  });

	
	// 	게시글 작성 다이얼로그 상세
  boardInsertDialog = $("#boardInsertForm").dialog({
      autoOpen: false,
      modal: true,
      width: 500,
      height: 700,
      buttons: {
  		     	"게시글 작성": function(){
		                	const title = $("#title2").val();
  		                const writer_uid = $("#writer_uid2").val();
  		                const contents = $("#contents2").val();
  		                
  		                if (title === "") {
  		                    alert("제목을 입력해주세요.");
  		                    $("#title2").focus();
  		                    return false;
  		                }
  		                
  		                if (contents === "") {
  		                    alert("본문을 입력해주세요");
  		                    $("#contents2").focus();
  		                    return false;
  		                }

  		                const param = {
  		                		title: title,
  		                		writer_uid: writer_uid,
  		                    contents: contents
  		                };
  		                
  		                console.log(param);
  		                fetch("<c:url value='/board/insert.do'/>", {
  		                    method: "POST",
  		                    headers: {
  		                        "Content-Type": "application/json; charset=UTF-8",
  		                    },
  		                    body: JSON.stringify(param),
  		                })
  		                .then((response) => response.json())
  		                .then((json) => {
  		                    if (json.status) {
  		                        alert("게시글 작성 성공!");
  		                      boardInsertDialog.dialog("close");
  		                    } else {
  		                        alert("게시글 작성 실패!");
  		                    }
  		                });

  		            },
          닫기: function() {
                 $(this).dialog("close");
           } /* 이거 close 폼 */
		     	}     	
  });
    

	
	
    /* 비동기 리스트 재구축 */
    function listUpdate() {
        $.ajax({
            url: "<c:url value='/board/ajaxList.do'/>",
            method: "GET",
            contentType: "application/json; charset=UTF-8",
            success: function (json) {
                console.log(json.message);
                if (json.status) {
                    var boardContainer = $("#board");

                    // 기존 게시물 데이터만 제거
                    $(".post", boardContainer).remove();

                    if (json.list.length === 0) {
                        // 리스트가 비어있을 경우
                        var emptyElement = '<div class="post">게시물이 없습니다.</div>';
                        boardContainer.append(emptyElement);
                    } else {
                        json.list.forEach(function (board) {
                            var postElement =
                                '<div class="post">' +
                                '<div class="post-meta">' +
                                '<div class="check-box">' +
                                '<input type="checkbox" class="chk-box" name="boardid" value="' + board.boardid + '">' +
                                '</div>' +
                                '<div class="board-number">' + board.boardid + '</div>' +
                                '<div id="boardDetail" class="board-title">' + board.title + '</div>' +
                                '<div class="board-view-count">' + board.view_count + '</div>' +
                                '<div class="board-writer">' + board.writer_uid + '</div>' +
                                '</div>' +
                                '</div>';

                            boardContainer.append(postElement);
                        });
                        boardDetailEventHandler();
                    }
                }
            }
        });
    } 



    $("#deleteBtn").on("click", function(e) {
        const boardList = $("#boardList");
        e.preventDefault();
        let ids = [];
        const items = $(".item:checked");
        items.each(function() {
            ids.push($(this).val());
        });
        console.log(ids);

        //삭제 함수
        //boardList.removeChild(삭제 객체)

        $.ajax({
            url: "<c:url value='/board/deleteBoard.do'/>",
            method: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({ boardids: ids }),
            dataType: "json",
            success: function(json) {
                alert(json.message);
                if (json.status) {
                    location.href = "<c:url value='/board/list.do'/>";
                }
            }
        });

        return false;
    });
    
    
    
    
    /* 페이지 누르면 해당 페이지로 이동  */
    function jsPageNo(pageNo) {
    	document.querySelector("#pageForm > #pageNo").value = pageNo;
    	document.querySelector("#pageForm").submit(); 
    }
    
    
     
//  /* 
// 	 이거 머지 
// function jsDetailView(boardid){
//    $.ajax({
//        url: "<c:url value='/board/detailView.do'/>",
//        method: "POST",
//        contentType: "application/json; charset=UTF-8",
//        data: JSON.stringify({ boardid: boardid }),
//        dataType: "json",
//        success: function(json) {
//            alert(json.message);
//            if (json.status) {
//                location.href = "<c:url value='/board/detailView.do'/>";
//            }
//        }
//    });
// }

    
      
//     function selectAllCheckboxes() {
//         const allChk = document.querySelector("#chk");
//         const chkBoxes = document.querySelectorAll(".chk-box");

//         for (let i = 0; i < chkBoxes.length; i++) {
//             chkBoxes[i].checked = allChk.checked;
//         }
//     }

    
    
    

//     document.querySelector("#mForm").addEventListener("submit", e => {
//     	document.querySelector("#mForm > #pageNo").value = "1";
//     	return true;
//     });


    
    
//     */

    
</script>
</body>