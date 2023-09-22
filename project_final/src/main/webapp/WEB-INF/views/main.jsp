<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="slideShow">
	<div id="slides">
		<img src="<c:url value='/resources/images/TG.jpg' />" alt="" style="display: block;">
		<img src="<c:url value='/resources/images/photo-1.jpg' /> " alt="">
		<img src="<c:url value='/resources/images/photo-2.jpg' /> " alt="">
		<img src="<c:url value='/resources/images/photo-3.jpg' /> " alt="">
		<img src="<c:url value='/resources/images/photo-4.jpg' /> " alt="">
		<button id="prev">&lang;</button>
		<button id="next">&rang;</button>
	</div>
</div>

<div id="contents">
	<div id="tabMenu">
	  <input type="radio" id="tab1" name="tabs" checked>
    <label for="tab1">공지사항</label>
    <input type="radio" id="tab2" name="tabs">
    <label for="tab2">게시판</label>      
		<div id="notice" class="tabContent">
    	<h2>공지사항</h2>
    	<table>
   		  <c:choose>
					<c:when test="${empty noticeTop5}">
						<tr>
    					<td colspan="3">공지사항이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
					    <td>번호</td>
					    <td>제목</td>
					    <td>작성자</td>
					    <td class="tab"></td>
					    <td>조회수</td>
						</tr>
						<c:forEach var="notice" items="${noticeTop5}">
							<tr id="noticeGoDetail">
								<td>${notice.noticeid}</td>
								<td><a href='notice/noticeDetail.jsp?noticeid=${notice.noticeid}'>${notice.title}</a></td>
								<td>${notice.writer_uid}</td>
								<td class="tab"></td>
								<td>${notice.view_count}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
 			</table>
   		<a href="<c:url value='/notice/list.do' />">목록 보기</a>
		</div>
		<div id="gallery" class="tabContent">
	  	<h2>게시판 내용입니다.</h2>
	    <table>
	    	<c:choose>
					<c:when test="${empty boardTop5}">
						<tr>
						    <td colspan="3">빈 게시판입니다.</td>
						</tr>
					</c:when>
				<c:otherwise>
					<tr>
					    <td>번호</td>
					    <td>제목</td>
					    <td>작성자</td>
					    <td class="tab"></td>
					    <td>조회수</td>
					</tr>
					<c:forEach var="board" items="${boardTop5}">
						<tr class = "post-meta">
					    <td><c:out value="${board.boardid}" /></td>
							<td id="boardDetail">${board.level == 1 ? "" : "[답변]"} ${board.title}</td>
							<td>${board.writer_uid}</td>
							<td class="tab"></td>
							<td>${board.view_count}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<a href="<c:url value='/board/list.do' />">목록 보기</a>
		</div>   
	</div>
	<div id="links">
		<ul>
			<li>
				<a href="#">
					<span id="quick-icon1"></span>
					<p>ITS(지능형 교통시스템) 구축 및 운영</p>
				</a>
			</li>
			<li>
				<a href="#">
					<span id="quick-icon2"></span>
					<p>공공SI</p>
				</a>
			</li>
			<li>
				<a href="#">
					<span id="quick-icon3"></span>
				<p>SOC 구축</p>
				</a>
			</li>
		</ul>
	</div>
</div>



  <!--   --------------- 이 밑으로는 모달 다이얼로그 html -----------------   --> 


<div id="dialogueLoginForm">
	<div class="dialogueLogin">
    <h1>회원 기능 - 로그인</h1>
		아이디<br><input type="text" id="id1" name="id" ><br>
		비밀번호<br><input type="password" id="pwd1" name="pwd" ><br>
	</div>
</div>


<div id="createUserForm">
	<div class="createUser">
    <h1>회원 기능 - 회원 가입</h1>
		아이디   <br><input type="text" id="id2" name="id" ><br>
		비밀번호<br><input type="password" id="pwd2" name="pwd" ><br>
		이름      <br><input type="text" id="name2" name="name" ><br>
		생년월일 <br><input type="text" id="birth2" name="birth" ><br>
		성별      <br><input type="text" id="gender2" name="gender" ><br>
		연락처   <br><input type="text" id="phone2" name="phone" ><br>
	</div>
</div>


<div id="updateUserForm">
	<div class="updateUser">
    <h1>회원 기능 - 회원 정보 수정</h1>
		아이디   <br><input type="text" id="id3" name="id3" value="${loginMember.id}" readonly><br>
		비밀번호<br><input type="password" id="pwd3" name="pwd3" ><br>
		이름      <br><input type="text" id="name3" name="name3" ><br>
		생년월일 <br><input type="text" id="birth3" name="birth3" ><br>
		성별      <br><input type="text" id="gender3" name="gender3" ><br>
		연락처   <br><input type="text" id="phone3" name="phone3" ><br>
	</div>
</div>


<div id="detailUserForm">
	<div class="detailUser">
    <h1>회원 기능 - 회원 정보</h1>
		아이디   <br><input type="text" id="id4" name="id4" value="" readonly><br>
		비밀번호<br><input type="text" id="pwd4" name="pwd$" value="" readonly><br>
		이름      <br><input type="text" id="name4" name="name4" value="" readonly><br>
		생년월일 <br><input type="text" id="birth4" name="birth4" value="" readonly><br>
		성별      <br><input type="text" id="gender4" name="gender4" value="" readonly><br>
		연락처   <br><input type="text" id="phone4" name="phone4" value="" readonly><br>
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
	
	
	
<div id="boardDetailForm">
	<div id="detail-container">
	    <h1>간단한 게시판 - 게시글 상세</h1>
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
  	  	
  <!--   --------------- 여기서 모달 다이얼로그 html 끝 -----------------   -->








<script src="<c:url value='/resources/js/slideshow.js'/>"></script>
<script type="text/javascript">


/* 로그인 다이얼로그 폼 띄우기 */
$("#dialogueLoginAnchor").on("click", () => {
   alert("로그인 폼");
   $("#dialogueLoginForm").dialog("open");
});

/* 로그인 다이얼로그 패치(회원가입 다이얼로그 폼 띄우기도 이 안에 있음) */
loginDialog = $("#dialogueLoginForm").dialog({
    autoOpen: false,
    modal: true,
    width: 500,
    height: 700,
    buttons: {
		     	회원가입: function(){
		     		$("#createUserForm").dialog("open")
		     	},
		     	
        	로그인: function() {
        	
            const id = $("#id1").val();
            const pwd = $("#pwd1").val();
            
            if (id === "") {
                alert("아이디를 입력해주세요.");
                $("#id1").focus();
                return false;
            }
            
            if (pwd === "") {
                alert("비밀번호를 입력해주세요");
                $("#pwd1").focus();
                return false;
            }

            const param = {
                id: id,
                pwd: pwd
            };

            fetch("<c:url value='/member/login.do'/>", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify(param),
            })
            .then((response) => response.json())
            .then((json) => {
                if (json.status) {
                    alert("로그인 성공!");
                    loginDialog.dialog("close");
                    location.href = "<c:url value='/main.do'/>";
                } else {
                    alert("로그인 실패!");
                }
            })

        }, /* 로그인 버튼 */
        
        	닫기: function() {
            $(this).dialog("close");
        } /* 이거 close 폼 */

    }
});

/* 회원가입 다이얼로그 폼 띄우기 */
$("#createUserDialog").on("click", () => {
   alert("회원가입 폼");
   $("#createUserForm").dialog("open");
});


/* 회원 가입 다이얼로그 */
createDialog = $("#createUserForm").dialog({
    autoOpen: false,
    modal: true,
    width: 500,
    height: 700,
    buttons: {
        	회원가입: function() {
        	
            const id = $("#id2").val();
            const pwd = $("#pwd2").val();
            const uname = $("#name2").val();
            const birth = $("#birth2").val();
            const gender = $("#gender2").val();
            const phone = $("#phone2").val();
            
            if (id === "") {
                alert("아이디를 입력해주세요.");
                $("#id2").focus();
                return false;
            }
            
            if (pwd === "") {
                alert("비밀번호를 입력해주세요");
                $("#pwd2").focus();
                return false;
            }

            if (uname === "") {
                alert("이름을 입력해주세요");
                $("#name2").focus();
                return false;
            }

            if (birth === "") {
                alert("생년월일를 입력해주세요");
                $("#birth2").focus();
                return false;
            }

            if (gender === "") {
                alert("성별을 입력해주세요");
                $("#gender2").focus();
                return false;
            }

            if (phone === "") {
                alert("연락처를 입력해주세요");
                $("#phone2").focus();
                return false;
            }

            const param = {
                id: id,
                pwd: pwd,
                uname: uname,
                birth: birth,
                gender: gender,
                phone : phone
            };

            fetch("<c:url value='/member/insert.do'/>", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify(param),
            })
            .then((response) => response.json())
            .then((json) => {
                if (json.status) {
                    alert("회원가입 성공!");
                    createDialog.dialog("close");
                } else {
                    alert("회원가입 실패!");
                }
            });

        }        
    }
});


/* 로그아웃 ajax */
  $(document).ready(function () {
            // 로그아웃 링크를 클릭했을 때의 동작 설정
            $("#logout").click(function (e) {
                e.preventDefault(); // 링크의 기본 동작을 중지
                // 로그아웃 Ajax 요청 보내기
                $.ajax({
                    type: "GET", // 또는 "GET" 등 HTTP 요청 방식 설정
                    url: "<c:url value='/member/logout.do'/>", // 요청을 보낼 URL
                    success: function (data) { // 요청 성공 시 처리할 함수
                        if (data.status === true) {
                            // 로그아웃 성공
                            alert("로그아웃 되었습니다.");
                            // 여기에서 로그아웃 후에 수행할 추가 작업을 수행할 수 있습니다.
                            location.href="<c:url value='/main.do'/>";
                        } else {
                            // 로그아웃 실패
                            alert("로그아웃에 실패했습니다.");
                        }
                    },
                    error: function () { // 요청 실패 시 처리할 함수
                        alert("서버 오류로 인해 로그아웃에 실패했습니다.");
                    }
                });
            });
        });


//   /* 정보 수정하기 다이얼로그 폼 띄우기 */
//   $("#dialogueMemberUpdate").on("click", () => {
//      alert("마이 페이지 다이얼로그 폼");
//      $("#updateUserForm").dialog("open");
//   });

  /* 정보 수정하기 다이얼로그 */
  updateDialog = $("#updateUserForm").dialog({
      autoOpen: false,
      modal: true,
      width: 500,
      height: 700,
      buttons: {
          	"수정하기": function() {
          	
              const id = $("#id3").val();
              const pwd = $("#pwd3").val();
              const uname = $("#name3").val();
              const birth = $("#birth3").val();
              const gender = $("#gender3").val();
              const phone = $("#phone3").val();
              
              if (pwd === "") {
                  alert("비밀번호를 입력해주세요");
                  $("#pwd3").focus();
                  return false;
              }

              if (uname === "") {
                  alert("이름을 입력해주세요");
                  $("#name3").focus();
                  return false;
              }

              if (birth === "") {
                  alert("생년월일를 입력해주세요");
                  $("#birth3").focus();
                  return false;
              }

              if (gender === "") {
                  alert("성별을 입력해주세요");
                  $("#gender3").focus();
                  return false;
              }

              if (phone === "") {
                  alert("연락처를 입력해주세요");
                  $("#phone3").focus();
                  return false;
              }
              const param = {
                  pwd: pwd,
                  uname: uname,
                  birth: birth,
                  gender: gender,
                  phone: phone,
                  id: id
              };

              fetch("<c:url value='/member/update.do'/>", {
                  method: "POST",
                  headers: {
                      "Content-Type": "application/json; charset=UTF-8",
                  },
                  body: JSON.stringify(param),
              })
              .then((response) => response.json())
              .then((json) => {
                  if (json.status) {
                      alert("정보 수정 성공!");
                      detailDialog.dialog("close");
                  } else {
                      alert("정보 수정 실패!");
                  }
              });

          }        
      }
  });
//   /* 내 정보(마이 페이지) 다이얼로그 폼 띄우기 */
//   $("#dialogueMemberDetail").on("click", () => {
//      alert("마이 페이지 다이얼로그 폼");
//      //여기서 ajax로 세션 데이터를 가져와라.
//      //성공하면 오픈하기 전에 데이터를 출력
//      //
//      //그러고 나서 대화상자 화면에 보이게 한다.
//      $("#detailUserForm").dialog("open");
//   });


  /* 내 정보(마이 페이지) 다이얼로그 폼 띄우기 */
  $("#dialogueMemberDetail").on("click", () => {
     alert("마이 페이지 다이얼로그 폼");
     //여기서 ajax로 세션 데이터를 가져와라.
     //성공하면 오픈하기 전에 데이터를 출력
     //
     //그러고 나서 대화상자 화면에 보이게 한다.

     fetch("<c:url value='/member/detail.do'/>", {
         method: "GET",
         headers: {
             "Content-Type": "application/json; charset=UTF-8",
         }
     })
     .then((response) => response.json())
     .then((json) => {
         if (json.status) {
             alert("정보 실시간 반영 성공!");
							const id = json.member.id
							const pwd = json.member.pwd;
							const uname = json.member.uname;
							const birth = json.member.birth;
							const gender = json.member.gender;
							const phone = json.member.phone;
             console.log("id = "+id);
             console.log("pwd = "+pwd);
             console.log("name = "+uname);
             console.log("birth = "+birth);
             console.log("gender = "+gender);
		      	$("#id4").val(id);
		      	$("#pwd4").val(pwd);
		      	$("#name4").val(uname);
		      	$("#birth4").val(birth);
		      	$("#gender4").val(gender);
		      	$("#phone4").val(phone);
    //       detailDialog.dialog("close"); // 이거 뭐지 기억이 안 나는데;
         } else {
             alert("정보 수정 실패!");
         }
     });


     
     $("#detailUserForm").dialog("open");
  });



  /* 내 정보(마이 페이지) 다이얼로그 */
  detailDialog = $("#detailUserForm").dialog({
      autoOpen: false,
      modal: true,
      width: 500,
      height: 700,
      buttons: {
          	"정보 수정": function(){
   		     	  $("#updateUserForm").dialog("open")
   		     	},
   		     "회원 탈퇴": function(){
   	            if (confirm("정말로 탈퇴하시겠습니까?")) {
   	                // 탈퇴 처리 코드
   	                fetch("<c:url value='/member/delete.do'/>", {
   	                    method: "GET",
   	                    headers: {
   	                        "Content-Type": "application/json; charset=UTF-8",
   	                    }
   	                })
   	                .then((response) => response.json())
   	                .then((json) => {
   	                    if (json.status) {
   	                        alert("회원 탈퇴가 완료되었습니다.");
   	                        // 탈퇴 성공시 필요한 추가 동작 수행
   	                       detailDialog.dialog("close"); // 다이얼로그 닫기
	   	                     location.href="<c:url value='/main.do'/>";
   	                    } else {
   	                        alert("회원 탈퇴에 실패했습니다.");
   	                    }
   	                });
   	            }
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
  			                      listUpdate();
  		                    } else {
  		                        alert("게시글 작성 실패!");
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
                          listUpdate();
                      }
                  });

              },
  					닫기: function() {
               boardReplyDialog.dialog("close");
               listUpdate();
  					}
  		}
  });



      /* 게시판 상세 폼 띄우기 (게시판 상세 버튼) */
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
//      autoOpen: false,
//      modal: true,
//      width: 500,
//      height: 700
  // });
      

  // //게시글 상세 다이얼로그 열기 전에 실행될 함수
  // boardDetailDialog.on("dialogopen", function () {
//       var loginMemberId = ${sessionScope.loginMember.id};
//       var writer_uid = $("#writer_uid1").text();
    
//       if (loginMemberId === writer_uid) {
//           dialog.dialog("option", "buttons", {
//               "게시글 수정하기": function () {
//                   $("#boardUpdateForm").dialog("open");
                  
//                   $(this).dialog("option", "buttons", {
//                       "수정 완료": function () {
//                       	listUpdate()
//                       },
//                       닫기: function () {
//                       	listUpdate()
//                           $(this).dialog("close");
//                       }
                     
//                   });
//               },
//               "답글 쓰기" : function(){
//               	boardReplyDialog.dialog("open"); //답글 다이얼로그(boardReplyDialog) 열기
//               },
//               "삭제하기" : function(){ //얘는 다이얼로그가 아니라서 바로 함수 넣고 진행. 삭제 함수 짤 수도 있지만, 익숙치 않으므로 지저분해도 일단 진행
//                var boardid = $("#boardid1").val();
//   				             var param ={
//   				                 boardid: boardid
//   				             };
//   				             if (confirm("정말로 삭제하시겠습니까?")) {
//   						                 // 삭제 처리 코드
//   						                 fetch("<c:url value='/board/delete.do'/>", {
//   						                     method: "POST",
//   						                     headers: {
//   						                         "Content-Type": "application/json; charset=UTF-8",
//   						                     },
//   						                     body: JSON.stringify(param),
//   						                 })
//   						                 .then((response) => response.json())
//   						                 .then((json) => {
//   						                     if (json.status) {
//   						                         alert("게시글 삭제가 완료되었습니다.");
//   						                         boardDetailDialog.dialog("close"); // 다이얼로그 닫기
//   						                         listUpdate(); //게시글 리스트 비동기 구현
//   						                     } else {
//   						                         alert("게시글 삭제에 실패했습니다.");
//   						                     }
//   						                 });
//   				             	}
//            		},
//               닫기: function () {
//               	listUpdate() //게시글 리스트 비동기 구현
//                   $(this).dialog("close"); //게시글 상세 다이얼로그(boardDetailDialog) 닫기
//               }
//           });
//       }
//   		else if(loginMemberId!=""){
//          	boardDetailDialog.dialog("option", "buttons",{
//                "답글 쓰기" : function () {
//              	  boardReplyDialog.dialog("open"); //답글 다이얼로그(boardReplyDialog) 열기
//               },
//                 닫기: function () {
//              	   listUpdate() //게시글 리스트 비동기 구현
//                       $(this).dialog("close");//게시글 상세 다이얼로그(boardDetailDialog) 닫기
//                   }
//             })
//       }
//   		else {
//          	boardDetailDialog.dialog("option", "buttons", {
//                  닫기: function () {
//                  	listUpdate() //게시글 리스트 비동기 구현
//                      $(this).dialog("close");//게시글 상세 다이얼로그(boardDetailDialog) 닫기
//                  }
//              });
//          }
  // });






//       /* 게시판 상세 다이얼로그 패치(삭제는 여기서 완성, 수정 다이얼로그 오픈(수정 버튼)도 이 안에 있음) */
  // 이거는 상대적으로 단순하게 구현한 코드. 여기서 답글 완성하고 들어가자
  // 답글 완성, 수정도 완성하고 들어가자
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
              if (loginMemberId === writer_uid) {
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





  	
  	

   /* 게시판 수정 다이얼로그 상세 */
   boardUpdateDialog = $("#boardUpdateForm").dialog({
   	   autoOpen: false,
   	   modal: true,
   	   width: 500,
   	   height: 700,
   	   buttons: {
   			    "수정 완료": function(){
  	            var title = $("#title3").val();
  	            var contents = $("#contents3").val();
  	            var boardid = $("#boardid1").val();
  	            var param ={
  	            		title: title,
  	                contents: contents,
  	                boardid: boardid
  	            };
  	            if (confirm("정말로 수정하시겠습니까?")) {
  	                // 삭제 처리 코드
  	                fetch("<c:url value='/board/update.do'/>", {
  	                    method: "POST",
  	                    headers: {
  	                        "Content-Type": "application/json; charset=UTF-8",
  	                    },
  	                    body: JSON.stringify(param),
  	                })
  	                .then((response) => response.json())
  	                .then((json) => {
  	                    if (json.status) {
  	                        alert("게시글 수정 성공!");
  	                        $(this).dialog("close");
  	                        boardDetailDialog.dialog("close");
  	                        listUpdate();
  	                    } else {
  	                        alert("게시글 수정 실패!");
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
                                  '<div id="boardDetail" class="board-title">'
                                  +'<span style="padding-left:' + (board.level-1)*20 + 'px"></span>'  // 작업 후 비동기 구현에도 답변 indent 유지
                                  + (board.level != 1 ? "[답변] " : "") + board.title + '</div>' +    // 작업 후 비동기 구현에도 답변 indent 유지
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
		
		
</script>		