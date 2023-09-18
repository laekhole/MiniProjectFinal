<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div id="wrap" class="wrap">

    <div id="container" class="container">
        <!-- content -->
        <div class="content">
            <div class="login_wrap">
                <ul class="menu_wrap" role="tablist">
                    <li class="menu_item" role="presentation">
                        <div id="loinid" class="menu_id on" >
                            <span class="menu_text"><span class="text">로그인</span></span>
                        </div>
                    </li>
                </ul>
                <form id="frmNIDLogin" name="frmNIDLogin" target="_top" autocomplete="off"
                      action="login.jsp" method="POST">
                    <ul>
                        <li style="display: block;">
                            <div>
                                <div class="id_pw_wrap">
                                    
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">아이디</span>
                                            </span>
                                        </div>
                                        <input type="text" id="uid" name="uid"
                                        			 placeholder="아이디는 영문자, 숫자를 사용할 수 있습니다. 최대 16자리로 구성해주세요."
                                               class="input_text" maxlength="16"
                                               pattern="^[a-zA-Z0-9]{1,16}$" required>
                                    </div>

                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">비밀번호</span>
                                            </span>
                                        </div>
                                        <input type="password" id="pw" name="pw"
                                        			 placeholder="비밀번호는 영문자, 숫자, 특수문자를 각각 1개 이상 포함한 8~16자리로 구성해주세요."
                                               class="input_text" maxlength="16"
                                               pattern="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z \d!@#$%^&*]{8,16}$" required>                                    </div>
                                </div>



                                <div class="btn_login_wrap">

                                    <button type="submit" class="btn_login" id="log.login">
                                        <span class="btn_text">로그인</span>
                                    </button>

                                </div>
                            </div>
                        </li>
                    </ul>
                </form>
            </div>
            <ul class="find_wrap" id="find_wrap">

                <li><a target="_blank" href="findForm.jsp"
                       class="find_text">비밀번호 찾기</a></li>
                <li><a target="_blank" href="insertForm.jsp"
                	   class="find_text">회원가입</a>
                </li>

            </ul>
        </div>
        <!-- //content -->
    </div>

</div>
<script src = "../js/validDataForm.js"> </script>
</body>
</html>
