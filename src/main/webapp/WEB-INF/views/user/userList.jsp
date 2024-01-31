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
<div class="container mt-5">
    <h2 class="mb-4">회원 목록</h2>

    <table class="table">
        <thead>
        <tr>

            <th scope="col">ID</th>
            <th scope="col">이름</th>
            <th scope="col">이메일</th>
            <th scope="col">전화번호</th>
            <th scope="col">주소</th>
            <th scope="col">회원 등급</th>
            <th scope="col">활성화 여부</th>
<%--            <th scope="col">수정/삭제</th>--%>
        </tr>
        </thead>
        <tbody>
        <!-- 회원 데이터 예시 -->
            <c:forEach items="${userList}" var="user">
        <tr>
            <th scope="row"><a href="/user/userView.wow?userId=${user.userId}">${user.userId}</a></th>
            <td>${user.userName}</td>
            <td>${user.userMail}</td>
            <td>${user.userHp}</td>
            <td>${user.userAdd1}${user.userAdd2}</td>
            <td>${user.userGrant}</td>
            <td>${user.userDelYn}</td>
<%--            <td><img src="profile1.jpg" alt="프로필 사진" width="50"></td>--%>
            <td>
<%--                <button type="button" class="btn btn-primary btn-sm">수정</button>--%>
<%--                <button type="button" class="btn btn-danger btn-sm">삭제</button>--%>
            </td>
        </tr>
            </c:forEach>
        <!-- 추가적인 회원 데이터도 동일한 형태로 추가 가능 -->
        </tbody>
    </table>
</div>

</body>
</html>
