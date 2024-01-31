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
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 1em;
      text-align: center;
    }

    section {
      max-width: 800px;
      margin: 20px auto;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      border-radius: 5px;
    }

    .detail-title {
      font-size: 24px;
      margin-bottom: 10px;
    }

    .detail-meta {
      color: #777;
      font-size: 16px;
      margin-bottom: 20px;
    }

    .detail-content {
      font-size: 18px;
      line-height: 1.5;
    }

    .back-button {
      margin-top: 20px;
      padding: 10px;
      background-color: #333;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    .back-button:hover {
      background-color: #555;
    }

    section {
      padding: 50px;
    }

    section .detail-content {
      height: 300px;
    }

    .comment-section {
      margin-top: 30px;
      border-top: 1px solid #ddd;
      padding-top: 20px;
    }

    .comment-list {
      list-style: none;
      padding: 0;
    }

    .comment-item {
      border-bottom: 1px solid #ddd;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .comment-content {
      font-size: 16px;
    }

    .comment-form {
      margin-top: 20px;
    }

    .comment-input {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      box-sizing: border-box;
    }

    .submit-button {
      padding: 10px;
      background-color: #333;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    .submit-button:hover {
      background-color: #555;
    }

    .navbar a {
      color: #0f5132;
    }

    h4.detail-title {
      width: 400px;
    }

  </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<header>
  <h1>Photo & Hiking</h1>
  <h1>공지사항</h1>
</header>

<section>
  <span>
    제목
    </span>
  <form action="noticeRegist.wow" method="post">
    <h4 class="detail-title">
      <input name="noBoTitle" required="required" style="width: 700px" type="text" value="">
      <input name="noBoWriter" style="width: 700px" type="hidden" value="${USER_INFO.userName}">
<%--      <input type="hidden" class="form-control" name="noBoDelYn" value="N">--%>
<%--      <input type="hidden" class="form-control" name="noBoRegDate" value="SYSDATE">--%>
<%--      <input type="hidden" class="form-control" name="noBoModDate" value="null">--%>
    </h4>
    <p class="detail-content"><span>내용</span>
      <textarea name="noBoContent" rows="10" style="width: 100%;"></textarea>
    </p>
    <a type="button" class="back-button" href="/notice/noticeList.wow">목록으로</a>
    <button type="submit" class="back-button">글쓰기</button>
  </form>


</section>


</body>
</html>
