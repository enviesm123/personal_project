<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Title</title>
    <style>
        .navbar a {
            color: #0f5132;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<body class="text-center">

<!--  html 전체 영역을 지정하는 container -->
<div id="container">
    <!--  login 폼 영역을 : loginBox -->
    <form action="login.wow" id="loginBox" method="post">

        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle"><h3>Login</h3></div>
        <!-- 아이디, 비번, 버튼 박스 -->
        <div id="inputBox">
            <div class="input-form-box"><span>아이디 </span><input type="text" name="userId" class="form-control"></div>
            <div class="input-form-box"><span>비밀번호 </span><input type="password" name="userPass" class="form-control"></div>
            <div class="button-login-box" >

                <button type="submit" class="btn btn-primary btn-xs" style="width:100%">로그인</button>

                <button type="submit" class="btn btn-danger btn-xs" style="width:100%" href="/user/userForm.wow">
                    회원가입
                </button>
            </div>
        </div>

    </form>
</div>

</body>
</html>
