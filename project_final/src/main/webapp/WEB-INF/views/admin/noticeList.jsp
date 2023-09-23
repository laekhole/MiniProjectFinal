<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet"
	href="<c:url value='/resources/css/style-noticeList.css' />">

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

#noticeInsertForm input[type="text"], #noticeInsertForm textarea {
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
		<h1>게시판</h1>
	</div>


	<!-- 게시판 목록 표시 -->
	<form name="pageForm" id="pageForm"
		action="<c:url value='/notice/list.do'/>" method="post">
		<input type="hidden" name="pageNo" id="pageNo"
			value="${result.notice.pageNo}" /> <input type="hidden"
			name="searchTitle" id="searchTitle"
			value="${result.notice.searchTitle}"> <input type="hidden"
			name="pageLength" id="pageLength" value="${result.notice.pageLength}">
	</form>


	<form name="mForm" id="mForm" action="<c:url value='/notice/list.do'/>"
		method="post">
		<input type="hidden" name="pageNo" id="pageNo"
			value="${result.notice.pageNo}" />
		<div
			style="margin: 0px auto; width: 50%; background-color: #f2f2f2; padding: 0px; border-radius: 5px;">
			<div
				style="display: flex; margin: 0px auto; width: 100%; justify-align: center">
				<label style="margin-right: 10px;">건수: </label> <select
					name="pageLength" id="pageLength"
					style="margin-right: 10px; padding: 5px; border: 1px solid #ccc; border-radius: 5px;">
					<option value="10"
						${result.notice.pageLength == 10 ? 'selected="selected"' : ''}>10건
						&darr;</option>
					<option value="20"
						${result.notice.pageLength == 20 ? 'selected="selected"' : ''}>20건
						&darr;</option>
					<option value="50"
						${result.notice.pageLength == 50 ? 'selected="selected"' : ''}>50건
						&darr;</option>
					<option value="100"
						${result.notice.pageLength == 100 ? 'selected="selected"' : ''}>100건
						&darr;</option>
				</select> <label>제목 : </label> <input type="text" name="searchTitle"
					id="searchTitle" value="${result.notice.searchTitle}"
					style="flex: 1; margin-right: 10px;"> <input type="submit"
					value="검색"
					style="background-color: #007bff; color: #fff; border: none; padding: 5px 10px; border-radius: 5px;">
			</div>
		</div>


		<div id="write-button-container">
			<div id="write-button">
				<a id="showWriteForm">${loginMember!=null? "글 작성" : '<br>' }</a>
			</div>
		</div>

		<div id="notice">
			<!-- column 헤더 -->
			<div class="column-header">
				<div class="check-box">
					 <input type='checkbox' id='chk'
						onclick="selectAllCheckboxes()">
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
							<input type="checkbox" class="chk-box" name="noticeid"
								value="${notice.noticeid}">
						</div>
						<div class="notice-number">${notice.noticeid}</div>
						<div id="noticeDetail" class="notice-title">
							<span style="padding-left:${(notice.level-1)*20}px"></span>
							${notice.level != 1 ? "[답변] " : ""} ${notice.title}
						</div>
						<div class="notice-view-count">${notice.view_count}</div>
						<div class="notice-writer">${notice.writer_uid}</div>
					</div>
				</div>
			</c:forEach>
		</div>



		<div style="text-align: center; margin-top: 20px;">
			<c:if test="${result.notice.navStart != 1}">
				<a href="javascript:jsPageNo(${result.notice.navStart-1})"
					style="padding: 10px; border: 1px solid red;"> &lt; </a>

			</c:if>
			<c:forEach var="item" begin="${result.notice.navStart}"
				end="${result.notice.navEnd}">
				<c:choose>
					<c:when test="${result.notice.pageNo != item }">
						<a href="javascript:jsPageNo(${item})"
							style="padding: 10px; border: 1px solid red;">${item}</a>
					</c:when>
					<c:otherwise>
						<strong style="font-size: 2rem">${item}</strong>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${result.notice.navEnd != result.notice.totalPageSize}">
				<a href="javascript:jsPageNo(${result.notice.navEnd+1})"
					style="padding: 10px; border: 1px solid red;"> &gt; </a>
			</c:if>
		</div>

	</form>








	<!--   --------------- 이 밑으로는 모달 다이얼로그 html -----------------   -->


	<div id="noticeInsertForm">
		<h1>간단한 게시판 - 글쓰기</h1>
		<input type= "hidden" id="writer_email2" name="writer_email2">	
		<div>
			<label for="title2">제목</label> <input type="text" id="title2" />
		</div>
		<div>
			<label for="writer_uid2">작성자</label> <input type="text"
				id="writer_uid2" value="${loginMember.id}" readonly />
		</div>
		<div>
			<label for="contents2">내용</label>
			<textarea id="contents2"></textarea>
		</div>
	</div>


	<div id="noticeReplyForm">
		<h1>간단한 게시판 - 답글 달기</h1>
		<input type="hidden" id="noticeid4" name="noticeid4"> <input
			type="hidden" id="pid4" name="pid4">
		<div>
			<label for="title4">제목</label> <input type="text" id="title4" />
		</div>
		<div>
			<label for="writer_uid4">작성자</label> <input type="text"
				id="writer_uid4" value="${loginMember.id}" readonly />
		</div>
		<div>
			<label for="contents4">내용</label>
			<textarea id="contents4"></textarea>
		</div>
	</div>


	<div id="noticeDetailForm">
		<div id="detail-container">
			<h1>간단한 게시판 - 게시글 상세</h1>
			<input type="hidden" id="noticeid1" name="noticeid1">
			<input type= "hidden" id="writer_email1" name="writer_email1">	
			
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
		<div id="comments-container"
			style="padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9;">
			<h2 style="font-size: 1.5em; margin-bottom: 20px;">댓글</h2>
			<div id="comments">
				<!-- 댓글 리스트가 여기에 들어갈 것입니다. -->
			</div>
			<div class="comment-input" style="margin-top: 20px;">
				<div><h3>댓글 입력칸 </h3></div><br>
				<textarea id="comment_contents1" class="comment-contents"
					style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 10px;"> 댓글을 입력하세요</textarea>
				<button id="comment_submit1" class="comment-buttons">작성</button>
			</div>
		</div>


		<div id="noticeUpdateForm">
			<h1>간단한 게시판 - 글 수정하기</h1>
			<div>
				<label for="title3">제목</label> <input type="text" id="title3" />
			</div>
			<div>
				<label for="writer_uid3">작성자</label> <input type="text"
					id="writer_uid3" value="${loginMember.id}" readonly />
			</div>
			<div>
				<label for="contents3">내용</label>
				<textarea id="contents3"></textarea>
			</div>
		</div>


		<!--   --------------- 여기서 모달 다이얼로그 html 끝 -----------------   -->








		<script>

///////////////////////////////// 게시글 모달 다이얼로그 ///////////////////////////////////
////////////////////////////////////CRUD 순서로 정렬////////////////////////////////////////
/////////////////////////////////////////시작///////////////////////////////////////////////


// 게시글 작성 다이얼로그 띄우기
$("#showWriteForm").on("click", function (e) {

   $("#noticeInsertForm").dialog("open");
});

	
	// 	게시글 작성 다이얼로그 상세
noticeInsertDialog = $("#noticeInsertForm").dialog({
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
		                    // alert("제목을 입력해주세요.");
		                    $("#title2").focus();
		                    return false;
		                }
		                
		                if (contents === "") {
		                    // alert("본문을 입력해주세요");
		                    $("#contents2").focus();
		                    return false;
		                }

		                const param = {
		                		title: title,
		                		writer_uid: writer_uid,
		                    contents: contents
		                };
		                
		                console.log(param);
		                fetch("<c:url value='/notice/insert.do'/>", {
		                    method: "POST",
		                    headers: {
		                        "Content-Type": "application/json; charset=UTF-8",
		                    },
		                    body: JSON.stringify(param),
		                })
		                .then((response) => response.json())
		                .then((json) => {
		                    if (json.status) {
		                        // alert("게시글 작성 성공!");
			                      noticeInsertDialog.dialog("close");
			                      listUpdate();
		                    } else {
		                        // alert("게시글 작성 실패!");
		                        listUpdate();
		                    }
		                });

		            },
       닫기: function() {
              $(this).dialog("close");
              listUpdate();
        } /* 이거 close 폼 */
		     	}     	
});



	
	/* 게시판 답글 다이얼로그 상세 */
	noticeReplyDialog = $("#noticeReplyForm").dialog({
		   autoOpen: false,
		   modal: true,
		   width: 500,
		   height: 700,
		   buttons: {
				    "답글 작성": function(){
	              	const title = $("#title4").val();
	                const writer_uid = $("#writer_uid4").val();
	                const contents = $("#contents4").val();
	                const pid = $("#noticeid1").val(); // 부모 게시물의 ID
	                
	                if (title === "") {
	                    // alert("제목을 입력해주세요.");
	                    $("#title4").focus();
	                    return false;
	                }
	                
	                if (contents === "") {
	                    // alert("본문을 입력해주세요");
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
	                fetch("<c:url value='/notice/insertReply.do'/>", {
	                    method: "POST",
	                    headers: {
	                        "Content-Type": "application/json; charset=UTF-8",
	                    },
	                    body: JSON.stringify(param),
	                })
	                .then((response) => response.json())
	                .then((json) => {
	                    if (json.status) {
	                        // alert("게시글 작성 성공!");
	                        noticeReplyDialog.dialog("close");
	                        noticeDetailDialog.dialog("close");
	                        listUpdate(); //게시판 리스트 갱신
	                        alert("메일 전송 메소드 직전임");
	                        mailSend(); //메일 전송
	                        alert("메일 전송 메소드 지나감");
	                    } else {
	                        // alert("게시글 작성 실패!");
	                        listUpdate();
	                    }
	                });
	
	            },
						닫기: function() {
	             noticeReplyDialog.dialog("close");
	             listUpdate();
						}
			}
	});


// 메일
// 답글 작성 성공 시 메일 발송
function mailSend(){
	var title = $("#title1").text();
	var noticeid =	$("#noticeid1").val();
	var writer_email = $("#writer_email1").val();

	console.log(title+"   "+noticeid+"  "+writer_email);
	var param ={
			title: title,
			noticeid: noticeid,
			writer_email: writer_email
	};
	console.log(param);
	fetch("<c:url value='/notice/sendMail.do'/>", {
	    method: "POST",
	    headers: {
	        "Content-Type": "application/json; charset=UTF-8",
	    },
	    body: JSON.stringify(param),
	})
	.then((response) => response.json())
	.then((json) => {
	    if (json.status) {
	        alert("메일 전송 성공!");
	        noticeReplyDialog.dialog("close");
	        noticeDetailDialog.dialog("close");
	        listUpdate();
	    } else {
	        alert("메일 전송 실패!");
	        listUpdate();
	    }
	});
}


    /* 게시판 상세 폼 띄우기 (게시판 상세 버튼) */
    const noticeDetailEventHandler = () => {
	    $(".post-meta #noticeDetail").on("click", function() {
	
// 	       // alert("게시판 상세보기");
	       //여기서 ajax로 세션 데이터를 가져와라.
	       //성공하면 오픈하기 전에 데이터를 출력
	       //
	       //그러고 나서 대화상자 화면에 보이게 한다.
				var noticeid = $(this).siblings(".notice-number").text();
				const writer_email = $("writer_email1").val();
	      const param ={
	    		   noticeid: noticeid,
	    		   writer_email: writer_email
	       };
		    console.log("noticeid는 : "+noticeid);
		    
	       fetch("<c:url value='/notice/detail.do'/>", {
	           method: "POST",
	           headers: {
	               "Content-Type": "application/json; charset=UTF-8",
	           },
	           body: JSON.stringify(param)
	       })
	       .then((response) => response.json())
	       .then((json) => {
	           if (json.status) {
	               // alert("정보 실시간 반영 성공!");
	  							const noticeid = json.noticeView.noticeid;
	  							const email = json.noticeView.writer_email;
	  							const title = json.noticeView.title;
	  							const writer_uid = json.noticeView.writer_uid;
	  							const contents = json.noticeView.contents;
	  							const reg_date = json.noticeView.reg_date;
	  							const view_count = json.noticeView.view_count;
	               console.log("noticeid = "+noticeid);
	               console.log("email = "+email);
	               console.log("title = "+title);
	               console.log("writer_uid = "+writer_uid);
	               console.log("contents = "+contents);
	               console.log("reg_date = "+reg_date);
	              $("#noticeid1").val(noticeid);
	              $("#writer_email1").val(email);
	  		      	$("#title1").text(title);
	  		      	$("#writer_uid1").text(writer_uid);
	  		      	$("#contents1").html(contents);
	  		      	$("#reg_date1").text(reg_date);
	  		      	$("#view_count1").text(view_count);
	  		      	
	           } else {
	               // alert("정보 반영 실패!");
	           }
								$("#noticeDetailForm").dialog("open");
	       });
	       commentList(noticeid); // 게시글에 맞는 댓글 띄우기
	    });
    }	    //게시판 상세 dialog 띄우기 declare 완
    noticeDetailEventHandler(); 	    //게시판 상세 dialog 띄우기 완
    
    
    
/* 게시판 상세 다이얼로그 (게시판 수정 다이얼로그도 이 안에 있음) */
noticeDetailDialog = $("#noticeDetailForm").dialog({
   autoOpen: false,
   modal: true,
   width: 500,
   height: 700,
   close : function() {
			$("#comments").empty();
			listUpdate();
   }
});

	
//게시글 상세 다이얼로그 열기 전에 실행될 함수
noticeDetailDialog.on("dialogopen", function () {

	displayCommentsMoreCount=0; //댓글 더보기 버튼 누른 횟수 카운트


		var loginMemberIdOption;
		if ("${sessionScope.loginMember.id}" != null){ 											// 비회원이 게시판 들어올 수도 있는데,
			  loginMemberIdOption = "${sessionScope.loginMember.id}"; // if문 처리 안하면 비회원 들어왔을 때
				} 																													// modal 터짐
    var writer_uid = $("#writer_uid1").text();
				
    if (loginMemberIdOption === writer_uid) {
    	noticeDetailDialog.dialog("option", "buttons", {
            "게시글 수정하기": function () {
                $("#noticeUpdateForm").dialog("open");
                
                $(this).dialog("option", "buttons", {
                    "수정 완료": function () {
                    	listUpdate();
                    },
                    닫기: function () {
                    	listUpdate()
   	           					$("#comments").empty();
                        $(this).dialog("close");
                    }
                   
          	      });
       		   },
            "답글 쓰기" : function(){
            	noticeReplyDialog.dialog("open"); //답글 다이얼로그(noticeReplyDialog) 열기
         	   },
            "삭제하기" : function(){ //얘는 다이얼로그가 아니라서 바로 함수 넣고 진행. 삭제 함수 짤 수도 있지만, 익숙치 않으므로 지저분해도 일단 진행
             var noticeid = $("#noticeid1").val();
				             var param ={
				                 noticeid: noticeid
				             };
				             if (confirm("정말로 삭제하시겠습니까?")) {
						                 // 삭제 처리 코드
						                 fetch("<c:url value='/notice/delete.do'/>", {
						                     method: "POST",
						                     headers: {
						                         "Content-Type": "application/json; charset=UTF-8",
						                     },
						                     body: JSON.stringify(param),
						                 })
						                 .then((response) => response.json())
						                 .then((json) => {
						                     if (json.status) {
						                         // alert("게시글 삭제가 완료되었습니다.");
						                         noticeDetailDialog.dialog("close"); // 다이얼로그 닫기
						                         listUpdate(); //게시글 리스트 비동기 구현
						                     } else {
						                         // alert("게시글 삭제에 실패했습니다.");
						                     }
						                 });
				             	}
         		},
            닫기: function () {
            	listUpdate() //게시글 리스트 비동기 구현
           					$("#comments").empty();
                $(this).dialog("close"); //게시글 상세 다이얼로그(noticeDetailDialog) 닫기
            }
        });
    }
		else if(loginMemberIdOption!=""){
       	noticeDetailDialog.dialog("option", "buttons",{
             "답글 쓰기" : function () {
           	  noticeReplyDialog.dialog("open"); //답글 다이얼로그(noticeReplyDialog) 열기
            },
              닫기: function () {
           	   listUpdate() //게시글 리스트 비동기 구현
           					$("#comments").empty();
                    $(this).dialog("close");//게시글 상세 다이얼로그(noticeDetailDialog) 닫기
                }
          })
    }
		else {
       	noticeDetailDialog.dialog("option", "buttons", {
               닫기: function () {
               	listUpdate() //게시글 리스트 비동기 구현
           					$("#comments").empty();
                   $(this).dialog("close");//게시글 상세 다이얼로그(noticeDetailDialog) 닫기
               }
           });
       }
});


//	// 게시판 상세 다이얼로그 패치(옵션 적용 안 한 게시판 상세 다이얼로그)
//noticeDetailDialog = $("#noticeDetailForm").dialog({

//  autoOpen: false,
//  modal: true,
//  width: 500,
//  height: 700,
//  buttons: {
//		     "답글 쓰기" : function () {
//		 	  noticeReplyDialog.dialog("open"); //답글 다이얼로그(noticeReplyDialog) 열기
////   		 	  // alert($("#noticeid1").val());
//				  },
//      "게시글 수정": function(){
//          var loginMemberId = "${sessionScope.loginMember.id}";
//          var writer_uid = $("#writer_uid1").text();            
//          console.log(loginMemberId);
         
//          console.log(writer_uid);
//          if (loginMemberId === writer_uid) {
//              $("#noticeUpdateForm").dialog("open");
//          } else {
//              // alert("자신이 작성한 게시글만 수정할 수 있습니다.");
//          }
//      },
//      "게시글 삭제": function(){
     	
//          var loginMemberId = "${sessionScope.loginMember.id}";
//          var writer_uid = $("#writer_uid1").text();
//          var noticeid = $("#noticeid1").val();
//          var param ={
//              noticeid: noticeid
//          };
//          if (confirm("정말로 삭제하시겠습니까?")) {
//              // 삭제 처리 코드
//              fetch("<c:url value='/notice/delete.do'/>", {
//                  method: "POST",
//                  headers: {
//                      "Content-Type": "application/json; charset=UTF-8",
//                  },
//                  body: JSON.stringify(param),
//              })
//              .then((response) => response.json())
//              .then((json) => {
//                  if (json.status) {
////                           // alert("게시글 삭제가 완료되었습니다.");
//                      noticeDetailDialog.dialog("close"); // 다이얼로그 닫기
//                      listUpdate();
//                  } else {
//                      // alert("게시글 삭제에 실패했습니다.");
//                      listUpdate();
//                  }
//              });
//          }
//      },
//      닫기: function() {
//          $(this).dialog("close");
//          listUpdate();
//      }
//  }
//});



 /* 게시판 수정 다이얼로그 상세 */
 noticeUpdateDialog = $("#noticeUpdateForm").dialog({
 	   autoOpen: false,
 	   modal: true,
 	   width: 500,
 	   height: 700,
 	   buttons: {
 			    "수정 완료": function(){
	            var title = $("#title3").val();
	            var contents = $("#contents3").val();
	            var noticeid = $("#noticeid1").val();
	            var param ={
	            		title: title,
	                contents: contents,
	                noticeid: noticeid
	            };
	            if (confirm("정말로 수정하시겠습니까?")) {
	                // 삭제 처리 코드
	                fetch("<c:url value='/notice/update.do'/>", {
	                    method: "POST",
	                    headers: {
	                        "Content-Type": "application/json; charset=UTF-8",
	                    },
	                    body: JSON.stringify(param),
	                })
	                .then((response) => response.json())
	                .then((json) => {
	                    if (json.status) {
	                        // alert("게시글 수정 성공!");
	                        $(this).dialog("close");
	                        noticeDetailDialog.dialog("close");
	                        listUpdate();
	                    } else {
	                        // alert("게시글 수정 실패!");
	                        listUpdate();
	                    }
	                });
	            }
	        },
	        닫기: function() {
	            $(this).dialog("close");
	            listUpdate();
	        }
 			}
 });


    
///////////////////////////////// 게시글 모달 다이얼로그 ///////////////////////////////////
////////////////////////////////////CRUD 순서로 정렬////////////////////////////////////////
//////////////////////////////////////////끝////////////////////////////////////////////////
 
 
 
 
///////////////////////////////////// 게시글 JS ///////////////////////////////////////////
////////////////////////////////모달 다이얼로그 아님///////////////////////////////////////
////////////////////////////////////////시작///////////////////////////////////////////////
	
	
    /* 비동기 게시글 리스트 재구축 */
    function listUpdate() {
        $.ajax({
            url: "<c:url value='/notice/ajaxList.do'/>",
            method: "GET",
            contentType: "application/json; charset=UTF-8",
            success: function (json) {
                console.log(json.message);
                if (json.status) {
                    var noticeContainer = $("#notice");

                    // 기존 게시물 데이터만 제거
                    $(".post", noticeContainer).remove();

                    if (json.list.length === 0) {
                        // 리스트가 비어있을 경우
                        var emptyElement = '<div class="post">게시물이 없습니다.</div>';
                        noticeContainer.append(emptyElement);
                    } else {
                        json.list.forEach(function (notice) {
                            var postElement =
                                '<div class="post">' +
                                '<div class="post-meta">' +
                                '<div class="check-box">' +
                                '<input type="checkbox" class="chk-box" name="noticeid" value="' + notice.noticeid + '">' +
                                '</div>' +
                                '<div class="notice-number">' + notice.noticeid + '</div>' +
                                '<div id="noticeDetail" class="notice-title">'
                                +'<span style="padding-left:' + (notice.level-1)*20 + 'px"></span>'  // 작업 후 비동기 구현에도 답변 indent 유지
                                + (notice.level != 1 ? "[답변] " : "") + notice.title + '</div>' +    // 작업 후 비동기 구현에도 답변 indent 유지
                                '<div class="notice-view-count">' + notice.view_count + '</div>' +
                                '<div class="notice-writer">' + notice.writer_uid + '</div>' +
                                '</div>' +
                                '</div>';
  
                            noticeContainer.append(postElement);
                        });
                        noticeDetailEventHandler();
                    }
                }
            }
        });
    } 

    
///////////////////////////////////// 게시글 JS ///////////////////////////////////////////
////////////////////////////////모달 다이얼로그 아님///////////////////////////////////////
/////////////////////////////////////////끝////////////////////////////////////////////////
    


///////////////////////////////// 댓글 모달 다이얼로그 ///////////////////////////////////
////////////////////////////////////CRUD 순서로 정렬//////////////////////////////////////
////////////////////////////////////////시작//////////////////////////////////////////////


    
// 댓글 작성 버튼 동작 						C Button 시작
// C Button 시작
	 $("#comment_submit1").on("click", function() {
	
// 	    // alert("댓글 작성 js 함수 시작");
	    //여기서 ajax로 세션 데이터를 가져와라.
	    //성공하면 오픈하기 전에 데이터를 출력
	    //그러고 나서 대화상자 화면에 보이게 한다.
	
		 const noticeid = $("#noticeid1").val();
	   const contents = $("#comment_contents1").val();
	   
	   const param ={
	 		   comment_noticeid: noticeid,
	 		   contents: contents
	    };
	  console.log("댓글 작성 버튼 동작에서의 noticeid는 : ",noticeid);
	  console.log("contents는 : ",contents);
	
	    fetch("<c:url value='/comment/insert.do'/>", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json; charset=UTF-8",
	        },
	        body: JSON.stringify(param)
	    })
	    .then((response) => response.json())
	    .then((json) => {
	        if (json.status) {
	        	$("#comment_contents1").val('');
	        	// alert(json.message);
	        	commentList(noticeid);
	        	
	        } else {
	            alert(json.message);
	        }
	    });
	    
	 }); // 댓글 작성 버튼 동작	완			 C Button 완

	// 댓글 출력 fetch 함수 						R fetch 
	// R fetch 
	// 반복 시 계속 commentList(noticeid)로 가자. commentList(noticeid);
 function commentList(noticeid){
	 //작성 성공 후 전체 리스트 출력
	     fetch("<c:url value='/comment/list.do'/>?comment_noticeid="+noticeid, {
			     method: "GET",
			     headers: {
			         "Content-Type": "application/json; charset=UTF-8",
			     }
			 })
			 .then((response) => response.json())
			 .then((json) => {
			     if (json.status) {
							 displayComments(json.commentList, json.loginMember, json.lastCommentid, json.totalCounts);
			     } else {
			     }
			 });
 }	// 댓글 출력 fetch 함수 완						R fetch 


		// 비동기 구현용 첫 댓글 출력         R html create
		// 댓글 출력은 게시글 출력 자리(게시글 CRUD 순서 중 R에 있음)			R html create
		// 댓글 비동기 구현 위해 html 생성 및 삽입부
		// 검색 키워드 : displayComments, 수정 버튼, 수정 완료 버튼, UpdateButton, DeleteButton.
		// displayComments 검색해서 쓰는 부분 찾자
function displayComments(comments, loginMember, lastCommentid, totalCounts) {
					
		// 더보기 종료 조건용 변수
		const commentContents = $("#comments .comment-contents").last();
		const commentid = commentContents.attr("data-commentid");
		
		// 댓글 출력할 form틀
		const commentsContainer = $("#comments");

    // 기존 div id="comments" 에 쌓인 데이터 제거
    commentsContainer.empty();
    
    // div id="comments"에 데이터 추가
    comments.forEach(function(comment) {
    	var commentElement = 
		        	'<div class="comment">' +
		            '<div class="comment-content">' +
		                '<div>작성자 : <span class="comment-writer">' + comment.writer_uid + '</span></div>' +
		                '<div>작성일자 : <span class="comment-date">' + comment.mod_date + '</span></div>' +
		            '</div>' +
		            '<div class="comment-text">' +
		                '<textarea class="comment-contents" data-commentid="' + comment.commentid + '" readonly>' + comment.contents + '</textarea>' +
		            '</div>' +
		            '<div>';
        // Session에서 loginMember 가져오기
        // ID 검증부
        if (loginMember) {
            if (loginMember.id === comment.writer_uid) {
                // 로그인한 사용자와 댓글 작성자가 동일한 경우 버튼 보이기
                commentElement += '<button class="commentUpdateButton comment-buttons">수정</button>' +
                    '<button class="commentDeleteButton comment-buttons">삭제</button>';
            } else {
                // 로그인한 사용자와 댓글 작성자가 다른 경우 버튼 숨기기
                commentElement += '<button class="commentUpdateButton comment-buttons" style="display:none">수정</button>' +
                    '<button class="commentDeleteButton comment-buttons" style="display:none">삭제</button>';
            }
        } else {
            // 로그인하지 않은 경우 버튼 숨기기
            commentElement += '<button class="commentUpdateButton comment-buttons" style="display:none">수정</button>' +
                '<button class="commentDeleteButton comment-buttons" style="display:none">삭제</button>';
        }
					 //열려 있는 div 태그 닫기
     		   commentElement += '</div>' +
       		     '</div>';
        commentsContainer.append(commentElement);
    });
		//더보기 버튼
		if(totalCounts>10){
				var commentMoreElement = 
					'<button class="commentMoreButton comment-buttons commentMoreButtonFirst" style="background-color: green; color: white;">더보기</button>';
					commentsContainer.append(commentMoreElement); //더보기 버튼 append하기	
		}
}



/* 댓글 더보기 동작  */
$(document).on("click", ".commentMoreButton", function() {
		console.log("댓글 더보기 동작 진입");

		const commentContents = $("#comments .comment-contents").last();
		const commentid = commentContents.attr("data-commentid");
		const noticeid = $("#noticeid1").val();
		var param = {
        commentid: commentid,
        comment_noticeid: noticeid
    };
    fetch("<c:url value='/comment/ajaxList.do'/>", {
          method: "POST",
          headers: {
              "Content-Type": "application/json; charset=UTF-8",
          },
          body: JSON.stringify(param)
      })
      .then((response) => response.json())
      .then((json) => {
          if (json.status) {
              // alert("댓글 더보기 성공!");
              
              displayCommentsMore(json.commentList, json.loginMember, json.lastCommentid, json.totalCounts);
              console.log(json.commentList);
          } else {
              // alert("댓글 더보기 실패.");
          }
    });
});
	 		
		
		
		
//더보기 종료 조건용 전역 변수 선언
//displayCommentsMore 실행 될 때마다 10씩 추가
var displayCommentsMoreCount;
		
// 비동기 구현용 첫 댓글 출력         R html create
// 댓글 출력은 게시글 출력 자리(게시글 CRUD 순서 중 R에 있음)			R html create
// 댓글 비동기 구현 위해 html 생성 및 삽입부
// 검색 키워드 : displayComments, 수정 버튼, 수정 완료 버튼, UpdateButton, DeleteButton.
// displayComments 검색해서 쓰는 부분 찾자
function displayCommentsMore(comments, loginMember, lastCommentid, totalCounts) {
	
	// 더보기 종료 조건용 변수
	const commentContents = $("#comments .comment-contents").last();
	const commentid = commentContents.attr("data-commentid");
	
	// 댓글 출력할 form틀
	const commentsContainer = $("#comments");
		

		// 기존 div id="comments" 에 쌓인 데이터 제거하면 안됨.
		// 그래야 쌓임
		// 이 부분이 차이점
		// 		commentsContainer.empty();
		
		// div id="comments"에 데이터 추가
		comments.forEach(function(comment) {
		var commentElement = 
        	'<div class="comment">' +
            '<div class="comment-content">' +
                '<div>작성자 : <span class="comment-writer">' + comment.writer_uid + '</span></div>' +
                '<div>작성일자 : <span class="comment-date">' + comment.mod_date + '</span></div>' +
            '</div>' +
            '<div class="comment-text">' +
                '<textarea class="comment-contents" data-commentid="' + comment.commentid + '" readonly>' + comment.contents + '</textarea>' +
            '</div>' +
            '<div>';
					// Session에서 loginMember 가져오기
					// ID 검증부
					if (loginMember) {
					    if (loginMember.id === comment.writer_uid) {
					        // 로그인한 사용자와 댓글 작성자가 동일한 경우 버튼 보이기
					        commentElement += '<button class="commentUpdateButton comment-buttons">수정</button>' +
					            '<button class="commentDeleteButton comment-buttons">삭제</button>';
					    } else {
					        // 로그인한 사용자와 댓글 작성자가 다른 경우 버튼 숨기기
					        commentElement += '<button class="commentUpdateButton comment-buttons" style="display:none">수정</button>' +
					            '<button class="commentDeleteButton comment-buttons" style="display:none">삭제</button>';
					    }
					} else {
					    // 로그인하지 않은 경우 버튼 숨기기
					    commentElement += '<button class="commentUpdateButton comment-buttons" style="display:none">수정</button>' +
					        '<button class="commentDeleteButton comment-buttons" style="display:none">삭제</button>';
					}
								 //열려 있는 div 태그 닫기
							   commentElement += '</div>' +
							     '</div>';
					commentsContainer.append(commentElement);
					});
			//더보기 버튼
			if(totalCounts-displayCommentsMoreCount>10){
				var commentMoreElement = 
					'<button class="commentMoreButton comment-buttons commentMoreButtonMore" style="background-color: green; color: white;">더보기</button>';
					commentsContainer.append(commentMoreElement); //더보기 버튼 append하기
			}
	displayCommentsMoreCount+=10;
}

		

		
// 댓글 수정 < - > 수정 완료로 동작이 변하는 루틴
let updateButtonStart = null;

$(document).on("click", ".commentUpdateButton", function() {
    var $commentContainer = $(this).closest(".comment");
    var $textarea = $commentContainer.find(".comment-text textarea");
    var buttonText = $(this).text();

    if (buttonText === "수정") {
        // 수정 시작 상태로 변경
        $textarea.prop("readonly", false);
        $(this).text("수정 완료");
        $(this).addClass("commentUpdateFinish");
        updateButtonStart = $(document).on("click", ".commentUpdateFinish", function() {
            $textarea.prop("readonly", true);
            $(this).text("수정");
            $(this).removeClass("commentUpdateFinish");
            $(document).off("click", ".commentUpdateFinish");
        });
    }
});


// 댓글 수정(수정 완료 버튼 클릭 시)
$(document).on("click", ".commentUpdateFinish", function(e) {
	  var commentContents = $(e.target).closest(".comment").find(".comment-contents");

    var param = {
        commentid: commentContents.attr("data-commentid"),
        contents: commentContents.val()
    };
	
    // 수정 완료 상태에서의 동작 추가
    var $commentContainer = $(e.target).closest(".comment");
    var $textarea = $commentContainer.find(".comment-text textarea");
    $textarea.prop("readonly", true);
    $(this).text("수정");
    $(this).removeClass("commentUpdateFinish");
    $(document).off("click", ".commentUpdateFinish");
    
    fetch("<c:url value='/comment/update.do'/>", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(param)
    })
    .then((response) => response.json())
    .then((json) => {
        if (json.status) {
            // alert("댓글 수정이 완료되었습니다.");
        } else {
            // alert("댓글 수정에 실패했습니다.");
        }
    });
    
});


	/* 댓글 삭제 동작  */
$(document).on("click", ".commentDeleteButton", function() {
		console.log("댓글 삭제 동작 진입");
	  var commentContents = $(".comment").find(".comment-contents");
	  var noticeid = $("#noticeid1").val(); // 삭제 루틴에는 필요 없지만, 댓글 리스트 업데이트에 필요함
	  console.log(commentContents.attr("data-commentid"));
	  var commentid = commentContents.attr("data-commentid");
    var param = {
//         commentid: commentContents.attr("data-commentid")
        commentid: commentid
    };
	
    if (confirm("정말로 삭제하시겠습니까?")) {
        var param = {
            commentid: commentid
        };
        fetch("<c:url value='/comment/delete.do'/>", {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(param)
        })
        .then((response) => response.json())
        .then((json) => {
            if (json.status) {
                // alert("댓글 삭제가 완료되었습니다.");
                // 성공적으로 삭제된 경우에 대한 처리 추가
                commentList(noticeid); // 댓글 리스트 업데이트
            } else {
                // alert("댓글 삭제에 실패했습니다.");
            }
        });
    }
});
	 


// 	/* 비동기 게시글 리스트 재구축 */
// 	function commentList() {
// 	    $.ajax({
// 	        url: "<c:url value='/comment/ajaxList.do'/>",
// 	        method: "GET",
// 	        contentType: "application/json; charset=UTF-8",
// 	        success: function (json) {
// 	            console.log(json.message);
// 	            if (json.status) {
// 	                var noticeContainer = $("#notice");

// 	                // 기존 게시물 데이터만 제거
// 	                $(".post", noticeContainer).remove();

// 	                if (json.list.length === 0) {
// 	                    // 리스트가 비어있을 경우
// 	                    var emptyElement = '<div class="post">게시물이 없습니다.</div>';
// 	                    noticeContainer.append(emptyElement);
// 	                } else {
// 	                    json.list.forEach(function (notice) {
// 	                        var postElement =
// 	                            '<div class="post">' +
// 	                            '<div class="post-meta">' +
// 	                            '<div class="check-box">' +
// 	                            '<input type="checkbox" class="chk-box" name="noticeid" value="' + notice.noticeid + '">' +
// 	                            '</div>' +
// 	                            '<div class="notice-number">' + notice.noticeid + '</div>' +
// 	                            '<div id="noticeDetail" class="notice-title">'
// 	                            +'<span style="padding-left:' + (notice.level-1)*20 + 'px"></span>'  // 작업 후 비동기 구현에도 답변 indent 유지
// 	                            + (notice.level != 1 ? "[답변] " : "") + notice.title + '</div>' +    // 작업 후 비동기 구현에도 답변 indent 유지
// 	                            '<div class="notice-view-count">' + notice.view_count + '</div>' +
// 	                            '<div class="notice-writer">' + notice.writer_uid + '</div>' +
// 	                            '</div>' +
// 	                            '</div>';
	
// 	                        noticeContainer.append(postElement);
// 	                    });
// 	                    noticeDetailEventHandler();
// 	                }
// 	            }
// 	        }
// 	    });
// 	}



///////////////////////////////// 댓글 모달 다이얼로그 ///////////////////////////////////
////////////////////////////////////CRUD 순서로 정렬//////////////////////////////////////
//////////////////////////////////////////끝//////////////////////////////////////////////



////////////////////////////////////// 기타 JS ///////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////시작//////////////////////////////////////////////

	 /* 페이지 누르면 해당 페이지로 이동  */
	 function jsPageNo(pageNo) {
	 	document.querySelector("#pageForm > #pageNo").value = pageNo;
	 	document.querySelector("#pageForm").submit(); 
	 }
 
 
 		////////// 댓글 input시 text-area 높이 동적 조절 함수//////
 		///////////////////////// 시작 ////////////////////////////
	 function autoResizeTextarea(element) {
		  element.style.height = "auto";
		  element.style.height = element.scrollHeight + "px";
		}

		// 이벤트 핸들러 등록
		var textarea = document.querySelector('.comment-contents');

		textarea.addEventListener('input', function() {
		  autoResizeTextarea(this);
		});

		// 초기 로딩 시에도 높이를 조절해야 하는 경우
		autoResizeTextarea(textarea);
 		////////// 댓글 input시 text-area 높이 동적 조절 함수//////
 		///////////////////////// 끝 //////////////////////////////
    
 		// 더보기 버튼 매번 생기는데, 가리는 코드
 		// 버튼 클릭하면 매번 가리고, 새로 생김.
 		$(document).on("click", ".commentMoreButtonFirst", function() {
	    // 더보기 버튼을 클릭했을 때 실행될 코드
	    $(this).hide(); // 버튼을 숨깁니다.
			});
	 		
 		$(document).on("click", ".commentMoreButtonMore", function() {
 		    // 더보기 버튼을 클릭했을 때 실행될 코드
 		    $(this).hide(); // 버튼을 숨깁니다.
 				});
 		

    
</script>
</body>