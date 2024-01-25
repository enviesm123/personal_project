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
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <h3>상세보기</h3>
    <form action="userModify.wow" method="post">
        <table class="table table-striped table-bordered">
            <tbody>
            <tr>
                <th>아이디</th>
                <td>${user.userId} <input type="hidden" name="userId" value="${user.userId}"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="userPass" value="${user.userPass}"></td>
            </tr>
            <tr>
                <th>회원명</th>
                <td><input type="text" name="userName" value="${user.userName}"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="email" name="userMail" value="${user.userMail}"></td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td><input type="text" name="userZip" value="${user.userZip}"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="userAdd1" value="${user.userAdd1}">
                    <input type="text" name="userAdd2" value="${user.userAdd2}">
                </td>
            </tr>

            <tr>
                <th>핸드폰</th>
                <td><input type="text" name="userHp" value="${user.userHp}"></td>
            </tr>

            <tr>
                <th>탈퇴여부</th>
                <td>${user.userDelYn}<input type="hidden" name="userDelYn" value="${user.userDelYn}"></td>
            </tr>
            <tr>
                <th>유저권한</th>
                <td><input type="text" name="userGrant" value="${user.userGrant}"></td>
            </tr>
            <tr>
                <td colspan="2"><button type="submit" class="btn btn-default btn-sm"> <span
                        class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;저장
                </button> <button type="submit" formaction="userDelete.wow" class="btn btn-info btn-sm"> <span
                        class="glyphicon glyphicon-king" aria-hidden="true"></span> &nbsp;삭제
                </button></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>

</body>
</html>
