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

        .card-body {
            display: flex;
            flex-direction: column;
        }

        .card-title {
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

        .btn-move{
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="container mt-5">
    <form action="/review/reviewModify.wow">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div style="display: flex;  justify-content: space-between;">
                    <h5 class="card-title">제목: ${boardView.reBoTitle}</h5> <span>작성자 ${boardView.reBoWriter}   ${boardView.reBoHit}</span>
                </div>
                <div>
                <c:forEach var="f" items="${boardView.attaches}" varStatus="st">
                    <img alt="" src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${f.atchFileName}&filePath=${f.atchPath}" width="600px" height="300px">
                </c:forEach>
                </div>
                <div class="card-body">
                    <!-- 게시글 정보 -->

                    <div>
                    <textarea rows="10" style="width: 100%" class="card-text" disabled>${boardView.reBoContent}</textarea>
                    </div>
                    <!-- 이미지 업로드 폼 -->
                    <div>
                        <div>첨부파일</div>
                        <div>
                            <c:forEach var="f" items="${boardView.attaches}" varStatus="st">
                                <div>
                                    <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                                    Size : ${f.atchFancySize}
                                </div>

                                <img alt="" src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${f.atchFileName}&filePath=${f.atchPath}" width="50px" height="50px">
                            </c:forEach>
                        </div>

                    </div>
                    <form id="imageUploadForm">
                        <div class="form-group">
                            <label for="image">이미지 첨부</label>
                            <input type="file" class="form-control-file" id="image" name="image">
                        </div>
                    </form>
                    <div id="id_reply_list_area">
                        <div class="row">
                            <div class="col-sm-2 text-right">홍길동</div>
                            <div class="col-sm-6">
                                <pre>내용</pre>
                            </div>
                            <div class="col-sm-2">12/30 23:45</div>
                            <div class="col-sm-2">
                                <button name="btn_reply_edit" type="button"
                                        class=" btn btn-sm btn-info">수정</button>
                                <button name="btn_reply_delete" type="button"
                                        class="btn btn-sm btn-danger">삭제</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2 text-right">그댄 먼곳만 보네요</div>
                            <div class="col-sm-6">
                                <pre> 롤링롤링롤링롤링</pre>
                            </div>
                            <div class="col-sm-2">11/25 12:45</div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div data-page="1"></div>
                    </div>

                    <div class="btn-move">
                        <button type="button" class="btn btn-warning" id="moveTop" >맨위로</button>
                        <button type="button" class="btn btn-danger" id="moveList">목록</button>
                    </div>


                    <!-- 댓글 폼 -->
                    <form id="commentForm" class="mt-3">
                        <div class="form-group">
                            <label for="comment">댓글 작성</label>
                            <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary" id="submitComment">댓글 작성</button>
                    </form>

                    <!-- 댓글 목록 -->

                <div class="btn-container">
                    <c:if test="${(USER_INFO.userName == boardView.reBoWriter) || USER_INFO.userRole eq 'admin'}">
                    <a  href="reviewEdit.wow?reBoNo=${boardView.reBoNo}" class="btn btn-success btn-sm"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;수정
                    </a>
                    </c:if>
                </div>
                </div>
                </div>
        </div>
    </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="your-script.js"></script>
<script>
    let param = {"curPage" : 1 , "reCategory" : "REVIEW" , "reParentNo" : ${boardView.reBoNo}}
    function replyList() {
        $.ajax({
            url : "/reply/replyList",
            data: param,
            success : function (replyList) {
                let str = '';
                $.each(replyList, function (index,reply) {
                    str += '<div class="row" data-re-no="'+reply.reNo+'">'
                        + '<div class="col-sm-2 text-right">' + reply.reUserName + '</div>'
                        + '<div class="col-sm-6">'
                        +  '	<pre>'+reply.reContent+'</pre>'
                        +'</div>'
                        +'<div class="col-sm-2">'+reply.reRegDate+'</div>'
                        +'<div class="col-sm-2">';
                    if(reply.reMemId == '${USER_INFO.userId}'){
                        str += '<button name="btn_reply_edit" type="button"'
                            +'class=" btn btn-sm btn-info">수정</button>'
                            +'<button name="btn_reply_delete" type="button"'
                            +'class="btn btn-sm btn-danger">삭제</button>'
                    }
                    str +='</div></div>'
                }) // each
                $("#id_reply_list_area").append(str)

            }
        });
    }

</script>
</body>
</html>
