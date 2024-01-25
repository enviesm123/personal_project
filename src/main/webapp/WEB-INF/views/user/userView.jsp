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
    <table class="table table-striped table-bordered">
        <tbody>
        <tr>
            <th>아이디</th>
            <td>${user.userId}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>${user.userPass}</td>
        </tr>
        <tr>
            <th>회원명</th>
            <td>${user.userName}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${user.userMail}</td>
        </tr>
        <tr>
            <th>우편번호</th>
            <td>${user.userZip}</td>
        </tr>
        <tr>
            <th>주소</th>
            <td>${user.userAdd1}  ${user.userAdd2}</td>
        </tr>

        <tr>
            <th>핸드폰</th>
            <td>${user.userHp}</td>
        </tr>

        <tr>
            <th>탈퇴여부</th>
            <td>${user.userDelYn}</td>
        </tr>
        <tr>
            <th>유저권한</th>
            <td>${user.userGrant}</td>
        </tr>
        <tr>
            <td colspan="2"><a href="userList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록
            </a> <a href='userEdit.wow?userId=${user.userId}' class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-king" aria-hidden="true"></span> &nbsp;수정
            </a></td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
