<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
        .navbar a {
            color: #0f5132;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
    <div class="container">
        <div class="row">
            <div class="col">
                <h1 class="col-sm-6">등산후기 게시판</h1>
            <button class="btn btn-info">글쓰기</button>
            </div>
            <div class="row row-cols-4  g-4">

                <c:forEach items="${reviewList}" var="review">

                    <div class="col">
                        <div class="card">
                            <div class="row">
                                <div class="col-sm-7">
                                        ${review.reBoWriter}
                                </div>
                                <span class="col-sm">추천수</span>

                            </div>
                            <img src="https://previews.123rf.com/images/phadventure/phadventure1606/phadventure160600034/58922660-%EC%95%84%EB%A6%84%EB%8B%A4%EC%9A%B4-%EC%82%B0-%ED%92%8D%EA%B2%BD.jpg"
                                 class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <a href="/review/reviewView.wow?reBoNo=${review.reBoNo}">${review.reBoTitle}
                                    </a>
                                </h5>
                                <p class="card-text">조회수 : </p>
                            </div>
                        </div>
                    </div>

                </c:forEach>

            </div>


        </div>
    </div>

</body>
</html>
