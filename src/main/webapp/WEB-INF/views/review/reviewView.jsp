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

        .card {
            margin-bottom: 20px;
        }

        .card div {
            margin: auto;
            display: flex;
            justify-content: space-between;
        }

        .card-body {
            padding: 0px;
        }

        .card-body {
            display: flex;
            flex-direction: column;
        }

        .card-title {
            width: 75%;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;

        }

        .card-text {
            flex-grow: 1;
            font-size: 18px;
            line-height: 1.6;
        }

        /*.card-img-top {*/
        /*    max-height: 300px; !* 이미지의 최대 높이를 지정 *!*/
        /*    object-fit: cover; !* 이미지가 잘리지 않도록 가로, 세로 비율을 유지한 채로 보여줌 *!*/
        /*}*/
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .btn-move {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .row .card-title-list {
            width: 158px;
        }

        .container h5 {
            height: 48px;
        }

        .pagination {
            display: flex;
            justify-content: center;
        }

        .pagination a {
            color: #161719;
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

        .searchBar {
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

        .row-list {
            width: 730px;

        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<header>
    <h1>Photo & Hiking</h1>
    <h1>등산후기 게시판</h1>
</header>

<div class="container mt-5" id="top">
    <form action="/review/reviewModify.wow">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card-view">
                    <div style="display: flex;  justify-content: space-between; margin: 10px; width: 90%">
                        <h5 class="card-title">제목: ${boardView.reBoTitle}</h5>
                        <span>작성자<strong> ${boardView.reBoWriter}</strong>  조회수  <strong>${boardView.reBoHit}</strong></span>
                    </div>
                    ${boardView}
                    <div>
                        <c:forEach var="f" items="${boardView.attaches}" varStatus="st">
                            <img alt=""
                                 src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${f.atchFileName}&filePath=${f.atchPath}"
                                 width="600px" height="300px">
                        </c:forEach>
                    </div>
                    <div class="card-body">
                        <!-- 게시글 정보 -->

                        <div>
                            <textarea rows="10" style="width: 100%" class="card-text"
                                      disabled>${boardView.reBoContent}</textarea>
                        </div>
                        <!-- 이미지 업로드 폼 -->
<%--                        <div>--%>
<%--                            <div>첨부파일</div>--%>
<%--                            <div>--%>
<%--                                <c:forEach var="f" items="${boardView.attaches}" varStatus="st">--%>
<%--                                    <div>--%>
<%--                                        <span class="glyphicon glyphicon-save"--%>
<%--                                              aria-hidden="true"></span> ${f.atchOriginalName}--%>
<%--                                        Size : ${f.atchFancySize}--%>
<%--                                    </div>--%>

<%--                                    <img alt=""--%>
<%--                                         src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${f.atchFileName}&filePath=${f.atchPath}"--%>
<%--                                         width="50px" height="50px">--%>
<%--                                </c:forEach>--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                        <form id="imageUploadForm">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="image">이미지 첨부</label>--%>
<%--                                <input type="file" class="form-control-file" id="image" name="image">--%>
<%--                            </div>--%>
<%--                        </form>--%>


                        <!-- 댓글 폼 -->
                        <div class="panel panel-default">
                            <div class="panel-body form-horizontal">
                                <form name="frm_reply" action="<c:url value='/reply/replyRegist' />"
                                      method="post" onclick="return false;">
                                    <input type="hidden" name="reParentNo" value="${boardView.reBoNo}">
                                    <input type="hidden" name="reCategory" value="REVIEW"> <input
                                        type="hidden" name="reMemId" value="${USER_INFO.userId }">
                                    <input type="hidden" name="reUserName" value="${USER_INFO.userName}">
                                    <input type="hidden" name="reIp"
                                           value="<%=request.getRemoteAddr()%>">
                                    <div class="form-group">
                                        <label class="col-sm-2  control-label">댓글</label>
                                        <div class="col-sm-8">
                                            <textarea rows="3" style="width: 736px" name="reContent"
                                                      class="form-control" ${USER_INFO== null ? 'disabled' : ""}></textarea>
                                        </div>
                                        <div class="col-sm-2">
                                            <button id="btn_reply_regist" type="button"
                                                    class="btn btn-sm btn-info">등록
                                            </button>
                                            <c:if test="${(USER_INFO.userName == boardView.reBoWriter) || USER_INFO.userRole eq 'admin'}">
                                                <a href="reviewEdit.wow?reBoNo=${boardView.reBoNo}"
                                                   class="btn btn-success btn-sm"> <span class="glyphicon glyphicon-pencil"
                                                                                         aria-hidden="true"></span> &nbsp;&nbsp;수정
                                                </a>
                                            </c:if>
                                        </div>
                                        <div class="btn-container">

                                        </div>
                                    </div>
                                </form>

                                <%--  댓글 목록 나오는 부분--%>

                                <div id="id_reply_list_area">
                                    <div data-page="1"></div>
                                </div>

                                <%-- 더보기영역--%>
                                <div class="row text-center" id="id_reply_list_more" style="background-color: #0b5ed7">
                                    <a id="btn_reply_list_more" style="width: 100%"
                                       class="btn btn-sm btn-default col-sm-10 col-sm-offset-1"> <span
                                            class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                                        더보기
                                    </a>
                                </div>

                                <div class="btn-move">
                                    <a href="#top" type="button" class="btn btn-warning" id="moveTop">맨위로</a>
                                    <a href="/review/reviewList.wow" type="button" class="btn btn-danger" id="moveList">목록</a>
                                </div>

                                <!-- START : 댓글 수정용 Modal -->
                                <div class="modal fade" id="id_reply_edit_modal" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <form name="frm_reply_edit"
                                                  action="<c:url value='/reply/replyModify' />" method="post"
                                                  onclick="return false;">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                                    <h4 class="modal-title">댓글수정</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" name="reNo" value="">
                                                    <textarea rows="3" name="reContent" class="form-control"></textarea>
                                                    <input type="hidden" name="reMemId" value="${USER_INFO.userId }">
                                                    <input type="hidden" name="reUserName"
                                                           value="${USER_INFO.userName}">
                                                </div>
                                                <div class="modal-footer">
                                                    <button id="btn_reply_modify" type="button"
                                                            class="btn btn-sm btn-info">저장
                                                    </button>
                                                    <button type="button" class="btn btn-default btn-sm"
                                                            data-dismiss="modal">닫기
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- END : 댓글 수정용 Modal -->

                                <!-- 댓글 목록 -->


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="container-list" style="display: flex; justify-content: center;">
        <div class="row-list">
            <div class="col">
                <c:if test="${USER_INFO != null}">
                    <a href="/review/reviewForm.wow" class="btn btn-info">글쓰기</a>
                </c:if>
            </div>
            <div class="row row-cols-4  g-4">
                <c:forEach items="${reviewList}" var="review">
                    <div class="col">
                        <div class="card" style="">
                            <div class="row">
                                <div class="col-sm-7" style="width: 125px">
                                        ${review.reBoWriter}
                                </div>
                                <span class="col-sm" style="width: 125px">추천수: ${review.reBoRecommend}</span>

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
                                <h5 class="card-title-list">
                                    <a href="/review/reviewView.wow?reBoNo=${review.reBoNo}">${review.reBoTitle}
                                    </a>
                                </h5>
                                <p class="card-text">조회수 : ${review.reBoHit} </p>
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
                    <label for="searchKeyword">검색어:</label>
                    <input type="text" id="searchKeyword" name="searchWord" value="${search.searchWord}"
                           placeholder="검색어를 입력하세요">
                    <button type="submit" class="btn btn-outline-success">검색</button>
                </form>
            </div>
            <!-- START : 페이지네이션  -->
            <nav class="text-center">
                <ul class="pagination">

                    <!-- 첫 페이지  -->
                    <li><a href="reviewList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a>
                    </li>


                    <!-- 이전 페이지 -->
                    <c:if test="${paging.firstPage >= 10}">
                        <li><a href="reviewList.wow?curPage=${paging.firstPage-1}"
                               data-page="${paging.firstPage-1}"><span aria-hidden="true">&lt;</span></a></li>
                    </c:if>

                    <!-- 페이지 넘버링  -->
                    <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="page">
                        <c:if test="${paging.curPage  ne page}">
                            <li><a href="reviewList.wow?curPage=${page}" data-page="${page}">${page}</a></li>
                        </c:if>
                        <c:if test="${paging.curPage eq page}">
                            <li class="active"><a href="reviewList.wow?curPage=${page}" data-page="${page}">${page}</a>
                            </li>
                        </c:if>
                    </c:forEach>


                    <!-- 다음  페이지  -->
                    <c:if test="${paging.lastPage < paging.totalPageCount}">
                        <li><a href="reviewList.wow?curPage=${paging.lastPage+1}" data-page="${paging.lastPage+1}"><span
                                aria-hidden="true">&gt;</span></a></li>
                    </c:if>

                    <!-- 마지막 페이지 -->
                    <li><a href="reviewList.wow?curPage=${paging.totalPageCount}"
                           data-page="${paging.totalPageCount}"><span aria-hidden="true">&raquo;</span></a></li>
                </ul>
            </nav>
            <!-- END : 페이지네이션  -->
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="your-script.js"></script>
<script type="text/javascript">
    // 댓글 데이터를 딱 10개만 가지고 오도록 하는 파라미터 모음
    var param = {
        "curPage": 1, "rowSizePerPage": 10
        , "reCategory": "REVIEW", "reParentNo": ${boardView.reBoNo}
    };

    //ajax 요청해서 댓글리스트를 받아오는 함수.
    function fn_reply_list() {

        //아작스 호출해서 DB에 있는 reply 데이터 가지고 옵니다.
        $.ajax({
            url: "/reply/replyList",
            data: param,
            success: function (replyList) {
                //가지고오면(success)하면 댓글 div 만들어줍니다.
                let str = ''
                $.each(replyList, function (index, reply) {
                    str += '<div class="row" data-re-no="' + reply.reNo + '">'
                        + '<div class="col-sm-2 text-right">' + reply.reUserName + '</div>'
                        + '<div class="col-sm-6">'
                        + '	<pre>' + reply.reContent + '</pre>'
                        + '</div>'
                        + '<div class="col-sm-2">' + reply.reRegDate + '</div>'
                        + '<div class="col-sm-2">';
                    if (reply.reMemId == '${USER_INFO.userId}') {
                        str += '<button name="btn_reply_edit" type="button"'
                            + 'class=" btn btn-sm btn-info">수정</button>'
                            + '<button name="btn_reply_delete" type="button"'
                            + 'class="btn btn-sm btn-danger">삭제</button>'
                    }
                    str += '</div></div>'
                })
                $("#id_reply_list_area").append(str)
            }
        })
        //list를 가지고오니까 jquery 반복문 써서 div 여러개 만들어주면됩니다.
        // 다 했으면 param의 curPage=2로 바꿔줍시다

    }//function fn_reply_list

    $(document).ready(function () { //documnet가 준비될 때
        fn_reply_list()

        //더보기 버튼
        $("#id_reply_list_more").on("click", function (e) {
            //fn_reply_list에서 마지막에 curPage=2로 바꿔줍니다.
            //그래서 그냥 fn_reply_list()하면 다음 댓글 10개 가져옵니다.
            param.curPage += 1
            fn_reply_list()

        });

        //등록버튼
        $("#btn_reply_regist").on("click", function (e) {
            // form태그안에 input hidden으로 필요한거 넣기
            let form = $(this).closest("form")
            console.log(form.serialize())
            $.ajax({
                url: "/reply/replyRegist",
                data: form.serialize(),
                success: function () {
                    $("#id_reply_list_area").html("")
                    param.curPage = 1
                    fn_reply_list()
                }

            })

            //가장가까운 form찾은 후 ajax 호출(data는 form.serialize(), )
            //성공 : 등록 글 내용부분 지우기,  댓글영역초기화( list_area.html('), curPage=1, fn_reply_list)
            //실패 : error : req.status==401이면 login으로   location.href
        });//등록버튼


        //수정버튼 : 댓글 영역안에 있는 수정버튼만  이벤트 등록
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_edit"]'
            , function (e) {
                //현재 버튼의 상위 div(한개 댓글) 찾기
                let div = $(this).closest(".row").find("pre")
                // 찾은 댓글의 reNo
                let divReno = $(this).closest(".row").data("reNo")
                // 찾은 댓글의 밸류(text)
                let divContent = div.text()
                // 모달창의 내용태그
                let modalDivText = $("#id_reply_edit_modal textarea[name='reContent']")
                // 모달창의 reNo 밸류에다가 댓글창의 reno를 넣는다 (수정버튼을 누른 해당 댓글의 모달창이 열림)
                $("#id_reply_edit_modal input[name='reNo']").val(divReno)
                //div에서 현재 댓글 내용을 modal에 있는 textarea에 복사
                modalDivText.val(divContent)
                //div태그의 data-re-no 값을 modal에 있는 input name="reNo" 태그의 value값에 복사
                // let replyReNo = div.data("reNo")
                //  $(".id_reply_edit_modal input[name='reNo']").val(replyReNo)
                //복사 후   .modal('show')
                $('#id_reply_edit_modal').modal('show')
            });//수정버튼


        //모달창 저장 버튼
        $("#btn_reply_modify").on("click", function (e) {
            //가장 가까운form 찾기 , ajax 호출(  data:form.serialzie()
            let form = $(this).closest("form")

            $.ajax({
                url: "/reply/replyModify",
                data: form.serialize(),
                success: function () {
                    // 성공하면 전부 지웠다가 다시 그리기
                    $("#id_reply_list_area").html("")
                    param.curPage = 1
                    fn_reply_list()
                    $('#id_reply_edit_modal').modal('hide')
                }
            })
            // 성공 :  modal찾은 후 modal('hide')
            // 현재 모달에 있는 reNo, reContent 찾기
            // 댓글영역에서 re_no에 해당하는 댓글 찾은 후 안의 내용 re_content로 변경
        });//모달창 저장버튼


        //삭제버튼
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_delete"]'
            , function (e) {
                //가장 가까운 div 찾기,
                let div = $(this).closest(".row")
                //reNo,  reMemId(현재 로그인 한 사람의 id) 구하기
                let reNo = $(".row").data("reNo")
                let reMemId = $("#id_reply_edit_modal input[name='reMemId']").val()
                // ajax 호출(reNo, reMemeId보내기) reMemId는 본인이 쓴 글인지 확인하는데 쓰임 (BizAccessFailException)
                $.ajax({
                    url: "/reply/replyDelete",
                    data: {"reNo": reNo, "reMemId": reMemId},
                    success: function () {
                        //성공  후 해당 div.remove
                        $(div).remove()
                    }
                })
            }); //삭제버튼


    });
</script>
</body>
</html>
