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

        .board-list {
            list-style: none;
            padding: 0;
        }

        .board-item {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .board-item:hover {
            background-color: #f9f9f9;
        }

        .board-title {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .board-meta {
            color: #777;
            font-size: 14px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
        }

        .pagination-item {
            margin: 0 5px;
            font-size: 16px;
        }

        .pagination-item a {
            text-decoration: none;
            color: #333;
        }

        .pagination-item.active {
            font-weight: bold;
        }

        .board-item p {
            font-size: 14px;
            margin-bottom: 3px;
            color: #4d5154;
        }

        .pagination li {
            padding: 10px;
        }

        .pagination a {
            color: #161719;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<header>
    <h1>Photo & Hiking</h1>
    <h1>공지사항</h1>
</header>

<section style="width: 800px">

    <h2 class="detail-title">${notice.noBoTitle}</h2> <span>조회수: ${notice.noBoHit}</span>
    <p class="detail-meta">작성자: ${notice.noBoWriter} | 작성일: ${notice.noBoRegDate}</p>
    <p class="detail-content">
        ${notice.noBoContent}
    </p>
    <form action="noticeDelete.wow" method="post">
        <button type="button" class="back-button" onclick="goBack()">뒤로 가기</button>
        <c:if test="${USER_INFO.userRole == 'admin'}">
            <button class="back-button" formaction="/notice/noticeEdit.wow?noBoNo=${notice.noBoNo}" formmethod="get">
                수정하기
            </button>
            <button class="back-button">삭제</button>
        </c:if>
        <input name="noBoNo" type="hidden" value="${notice.noBoNo}">
    </form>


</section>


<section>

    <ul class="board-list">
        <c:if test="${USER_INFO.userRole == 'admin'}">
            <a href="/notice/noticeForm.wow" class="btn btn-outline-success">공지등록</a>
        </c:if>
        <c:forEach items="${noticeList}" var="notice">
            <li class="board-item">
                <div>
                    <h2 class="board-title">${notice.noBoTitle}</h2>
                    <p class="board-content">${notice.noBoContent != null &&
                            notice.noBoContent.length() > 50 ? notice.noBoContent.substring(0, 25) : ""}</p>
                    <p class="board-content">${notice.noBoContent != null &&
                            notice.noBoContent.length() > 50 ? notice.noBoContent.substring(25, 50) : notice.noBoContent}</p>
                    <p class="board-meta">작성자: ${notice.noBoWriter} | 작성일: ${notice.noBoRegDate}</p>
                </div>
                <a href="/notice/noticeView.wow?noBoNo=${notice.noBoNo}" class="btn btn-outline-secondary">자세히 보기</a>
            </li>
        </c:forEach>

        <!-- 추가적인 게시물 아이템들... -->
    </ul>

    <!-- START : 페이지네이션  -->
    <nav class="text-center">
        <ul class="pagination">

            <!-- 첫 페이지  -->
            <li><a href="noticeList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>


            <!-- 이전 페이지 -->
            <c:if test="${paging.firstPage >= 10}">
                <li><a href="noticeList.wow?curPage=${paging.firstPage-1}" data-page="${paging.firstPage-1}"><span
                        aria-hidden="true">&lt;</span></a></li>
            </c:if>

            <!-- 페이지 넘버링  -->
            <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="page">
                <c:if test="${paging.curPage  ne page}">
                    <li><a href="noticeList.wow?curPage=${page}" data-page="${page}">${page == 0 ?  "1" : page}</a></li>
                </c:if>
                <c:if test="${paging.curPage eq page}">
                    <li class="active"><a href="noticeList.wow?curPage=${page}" data-page="${page}">${page}</a></li>
                </c:if>
            </c:forEach>


            <!-- 다음  페이지  -->
            <c:if test="${paging.lastPage < paging.totalPageCount}">
                <li><a href="noticeList.wow?curPage=${paging.lastPage+1}" data-page="${paging.lastPage+1}"><span
                        aria-hidden="true">&gt;</span></a></li>
            </c:if>

            <!-- 마지막 페이지 -->
            <li><a href="noticeList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span
                    aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </nav>
    <!-- END : 페이지네이션  -->
</section>


</body>
<script>
    function goBack() {
        window.history.back();
    }
</script>
</html>
