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
					    <td>글 번호</td>
					    <td>제목</td>
					    <td>작성자</td>
					    <td class="tab"></td>
					    <td>조회수</td>
						</tr>
						<c:forEach var="notice" items="${noticeTop5}">
							<tr>
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
   		<a href='notice/noticesGet.jsp'>목록 보기</a>
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
					    <td>글 번호</td>
					    <td>제목</td>
					    <td>작성자</td>
					    <td class="tab"></td>
					    <td>조회수</td>
					</tr>
					<c:forEach var="board" items="${boardTop5}">
						<tr>
					    <td><c:out value="${board.boardid}" /></td>
							<td><a href='board/boardDetail.jsp?boardid=${board.boardid}'>${board.title}</a></td>
							<td>${board.writer_uid}</td>
							<td class="tab"></td>
							<td>${board.view_count}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<a href='board/boardsGet.jsp'>목록 보기</a>
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



<div id="dialogueLoginForm">
	<div class="dialogueLogin">
		아이디<br><input type="text" id="id1" name="id" ><br>
		비밀번호<br><input type="password" id="pwd1" name="pwd" ><br>
	</div>
</div>


<div id="createUserForm">
	<div class="createUser">
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
		아이디   <br><input type="text" id="id4" name="id4" value="${loginMember.id}" readonly><br>
		비밀번호<br><input type="text" id="pwd4" name="pwd$" value="${loginMember.pwd}" readonly><br>
		이름      <br><input type="text" id="name4" name="name4" value="${loginMember.uname}" readonly><br>
		생년월일 <br><input type="text" id="birth4" name="birth4" value="${loginMember.birth}" readonly><br>
		성별      <br><input type="text" id="gender4" name="gender4" value="${loginMember.gender}" readonly><br>
		연락처   <br><input type="text" id="phone4" name="phone4" value="${loginMember.phone}" readonly><br>
	</div>
</div>

        
        
<div id="detail" title="글 상세보기" >
	<div class="detail">
		<input type="hidden" name="noticeid" id="noticeid2" value="${notice.noticeid}"/> 
		<h3 id="title2">[  ] </h3>
		<hr>
		<br>
		<div class="meta-info" id="info2"">
			작성자 :  <span id="writer_uid2">${notice.writer_uid}</span>  |　 작성날짜 :  <span id="reg_date2">${notice.reg_date}</span>　 |　 조회수 :  <span id="view_count2">${notice.view_count}</span>
		</div>
		<div class="contents" id="contents2">
			${notice.contentsHTML}
		</div>
	</div>
</div> 



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
  /* 내 정보(마이 페이지) 다이얼로그 폼 띄우기 */
  $("#dialogueMemberDetail").on("click", () => {
     alert("마이 페이지 다이얼로그 폼");
     //여기서 ajax로 세션 데이터를 가져와라.
     //성공하면 오픈하기 전에 데이터를 출력
     //
     //그러고 나서 대화상자 화면에 보이게 한다.
     $("#detailUserForm").dialog("open");
  });
  
//   /* 내 정보(마이 페이지) 다이얼로그 폼 띄우기 */
//   $("#dialogueMemberDetail").on("click", () => {
//      alert("마이 페이지 다이얼로그 폼");
//      //여기서 ajax로 세션 데이터를 가져와라.
//      //성공하면 오픈하기 전에 데이터를 출력
//      //
//      //그러고 나서 대화상자 화면에 보이게 한다.
  
//      let id;
//      let pwd;
//      let name;
//      let birth;
//      let gender;
//      let phone;
     
     
//      fetch("<c:url value='/member/detail.do'/>", {
//          method: "POST",
//          headers: {
//              "Content-Type": "application/json; charset=UTF-8",
//          }
//      })
//      .then((response) => response.json())
//      .then((json) => {
//          if (json.status) {
//              alert("정보 수정 성공!");
// 							id = json.member.id
//              pwd = json.member.pwd;
//              name = json.member.name;
//              birth = json.member.birth;
//              gender = json.member.gender;
//              phone = json.member.phone;
//              detailDialog.dialog("close");
//          } else {
//              alert("정보 수정 실패!");
//          }
//      });
				
//      	$("#id4").val(id);
//      	$("#pwd4").val(pwd);
//      	$("#name4").val(name);
//      	$("#birth4").val(birth);
//      	$("#gender4").val(gender);
//      	$("#phone4").val(phone);
//      	$("#contents3").val(contents);
     
//      $("#detailUserForm").dialog("open");
//   });



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
   	                    method: "POST",
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
   	                    } else {
   	                        alert("회원 탈퇴에 실패했습니다.");
   	                    }
   	                });
   	            }
   	        }
   	    }
   	});

   


	/* 공지사항 상세 */
	$(document).ready(function() {
		$("#detail").dialog({
		    autoOpen: false,
		    modal: true,
		    width: 800,
		    height: 500,
		    buttons: {
		        "수정": function() {

		        	const title = $("#title2").text();
		        	const contents = $("#contents2").text();

		        	$("#title3").val(title);
		        	$("#contents3").val(contents);
		        	console.log(title);
		        	console.log(contents);

		            $("#update").dialog("open");

		        },
		        "삭제": function() {
		            dialogDelete(); // noticeid를 함수에 전달
		        },
		        Close: function() {
		            $(this).dialog("close");
		        }
		    }
		});
	});
	
	/* 글 상세 패치 코드 */
	function dialogDetail(noticeid) {
		alert("asdasdas");
	 	const noticeid2 = document.querySelector("#noticeid2");
		const title2 = document.querySelector("#title2");
		const contents2 = document.querySelector("#contents2");
		const writer_uid2 = document.querySelector("#writer_uid2");
		const reg_date2 = document.querySelector("#reg_date2");
		const view_count2 = document.querySelector("#view_count2");

		
		const param = {
		        noticeid: noticeid
		      };

		      fetch("<c:url value='/notice/detail.do'/>", {
		        method: "POST",
		        headers: {
		          "Content-Type": "application/json; charset=UTF-8",
		        },
		        body: JSON.stringify(param),
		      })
		      .then((response) => response.json())
		      .then((json) => {
		    	   noticeid2.innerText = json.noticeid;  
		    	   title2.innerText = json.title;  
		    	   contents2.innerText = json.contents;  
		    	   writer_uid2.innerText = json.writer_uid;  
		    	   reg_date2.innerText = json.reg_date;  
		    	   view_count2.innerText = json.view_count;  
		       	   $("#detail").dialog("open");
		      });
		
		return false;
		
	}	
</script>		