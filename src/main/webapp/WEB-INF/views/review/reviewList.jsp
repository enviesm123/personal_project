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
                <c:if test="${USER_INFO != null}">
            <a href="/review/reviewForm.wow" class="btn btn-info">글쓰기</a>
                </c:if>
            </div>
            <div class="row row-cols-4  g-4">
                <c:forEach items="${reviewList}" var="review">
                    <div class="col">
                        <div class="card">
                            <div class="row">
                                <div class="col-sm-7">
                                        ${review.reBoWriter}
                                </div>
                                <span class="col-sm">추천수: ${review.reBoRecommend}</span>

                            </div>
                            <c:if test="${review.attaches.size() == 0 || review.attaches[0].atchContentType eq 'text/html'}">
                                <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_FA2CA58E0A6221B50231CA2E676729C1.jpg"
                                     class="card-img-top" alt="...">
                            </c:if>
                            <c:if test="${review.attaches.size() != 0 }">
                            <img src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${review.attaches[0].atchFileName}&filePath=${review.attaches[0].atchPath}"
                                 class="card-img-top" alt="...">
                            </c:if>
                            <div class="card-body">
                                <h5 class="card-title">
                                    <a href="/review/reviewView.wow?reBoNo=${review.reBoNo}">${review.reBoTitle}
                                    </a>
                                </h5>
                                <p class="card-text">조회수 :  ${review.reBoHit} </p>
                            </div>
                        </div>
                    </div>

                </c:forEach>

            </div>


        </div>
    </div>

</body>
</html>
