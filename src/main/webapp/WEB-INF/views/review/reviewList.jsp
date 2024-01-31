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

        .container h5 {
            height: 48px;
        }

        .pagination{
            display: flex;
            justify-content: center;
        }
        .pagination a{
            color : #161719;
            margin-right: 30px;
        }

        .pagination li.active a {
            color: #f3a200; /* 텍스트 색상을 원하는 색상으로 지정 */
        }

        .card:hover {
            transform: scale(1.05); /* 확대 효과 */
            transition: transform 0.3s ease; /* 부드러운 애니메이션 효과 */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
        }
        .searchBar{
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
            /*width: 30%;*/
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 1em;
            text-align: center;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<header>
    <h1>Photo & Hiking</h1>
    <h1>등산후기 게시판</h1>
</header>
    <div class="container">
        <div class="row">
            <div class="col">
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
            <div class="searchBar">
            <form action="reviewList.wow" method="post">
                    <select id="id_searchType" name="searchType" class="form-control input-sm">
                        <option value="T" ${search.searchType eq "T" ? "selected = 'selected'" : ""} >제목</option>
                        <option value="W" ${search.searchType eq "W" ? "selected = 'selected'" : ""}>작성자</option>
                        <option value="C" ${search.searchType eq "C" ? "selected = 'selected'" : ""}>내용</option>
                    </select>
                <label for="searchKeyword" >검색어:</label>
                <input type="text" id="searchKeyword"  name="searchWord" value="${search.searchWord}" placeholder="검색어를 입력하세요">
                <button type="submit" class="btn btn-outline-success">검색</button>
            </form>
            </div>
            <!-- START : 페이지네이션  -->
            <nav class="text-center">
                <ul class="pagination">

                    <!-- 첫 페이지  -->
                    <li><a href="reviewList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>


                    <!-- 이전 페이지 -->
                    <c:if test="${paging.firstPage >= 10}">
                        <li><a href="reviewList.wow?curPage=${paging.firstPage-1}" data-page="${paging.firstPage-1}"><span aria-hidden="true">&lt;</span></a></li>
                    </c:if>

                    <!-- 페이지 넘버링  -->
                    <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="page">
                        <c:if test="${paging.curPage  ne page}">
                            <li><a href="reviewList.wow?curPage=${page}" data-page="${page}">${page}</a></li>
                        </c:if>
                        <c:if test="${paging.curPage eq page}">
                            <li class="active"><a href="reviewList.wow?curPage=${page}" data-page="${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>


                    <!-- 다음  페이지  -->
                    <c:if test="${paging.lastPage < paging.totalPageCount}">
                        <li><a href="reviewList.wow?curPage=${paging.lastPage+1}" data-page="${paging.lastPage+1}"><span aria-hidden="true">&gt;</span></a></li>
                    </c:if>

                    <!-- 마지막 페이지 -->
                    <li><a href="reviewList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span aria-hidden="true">&raquo;</span></a></li>
                </ul>
            </nav>
            <!-- END : 페이지네이션  -->
        </div>
    </div>

</body>
<script>
    // 페이지 로드 시 아래로 스크롤
    window.onload = function() {
        if (window.location.search.indexOf("curPage") !== -1) {
            scrollToBottom();
        }
    };

    // 스크롤을 제일 아래로 이동하는 함수
    function scrollToBottom() {
        window.scrollTo(0, document.body.scrollHeight);
    }
</script>
</html>
