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

        .card-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;

        }

        .btn-container {
            display: flex;
            justify-content: space-evenly;
            margin-top: 10px;
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
<div class="container mt-5">
    <form action="reviewRegist.wow" method="post" enctype="multipart/form-data">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h6 class="card-title">제목<input name="reBoTitle" required="required" value="" type="text"
                                                        class="form-control"></h6>
                        <p>작성자</p>
                        <input type="text" class="form-control" disabled value="${USER_INFO.userName}">
                        <input type="hidden" class="form-control" name="reBoWriter" id="reBoWriterHidden"
                               value="${USER_INFO.userName}">
                        <input type="hidden" class="form-control" name="reBoDelYn" value="N">
                        <input type="hidden" class="form-control" name="reBoRegDate" value="SYSDATE">
                        <input type="hidden" class="form-control" name="reBoModDate" value="null">
                        비밀번호
                        <input type="password" name="reBoPass" value="" class="form-control input-sm"
                               required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력">
                    </div>
<%--                    <select name="reBoCategory" class="form-control input-sm" required="required">--%>
<%--                        <option value="bC00">-- 선택하세요--</option>--%>
<%--                        <option value="BC01">1</option>--%>
<%--                        <option value="BC02">2</option>--%>
<%--                        <option value="BC03">3</option>--%>
<%--                    </select>--%>
                    <img src="https://via.placeholder.com/800x400" class="card-img-top" alt="게시글 이미지">
                    <div class="card-body">
                        <!-- 게시글 정보 -->
                        <div class="form-group">
                            <label for="content">게시글 정보</label>
                            <textarea name="reBoContent" class="form-control" required="required" value="" id="content"
                                      rows="12"></textarea>
                        </div>
                        <div>
                            <div class="btn-container">
                                <button type="submit" class="btn btn-info">등록</button>
                                <button type="button" class="btn btn-danger">취소</button>
                            </div>
                        </div>
                    </div>
                    <div>첨부파일
                        <button type="button" id="id_btn_new_file">추가</button>
                    </div>
                    <div class="file_area">
                        <div class="form-inline">
                            <input type="file" name="boFiles" onchange="fileCheck(this)" class="form-control" accept="image/gif, image/jpeg, image/png">
                            <button type="button" class="btn_delete btn btn-sm">삭제</button>
                        </div>
                    </div>
                </div>
                </div>
            </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    $('#id_btn_new_file').click(function () {
        $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="boFiles" class="form-control" accept="image/gif, image/jpeg, image/png">'
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
    });
    $('.file_area').on('click', '.btn_delete', function () {
        $(this).closest('div').remove();
    });

    function fileCheck(obj) {
        console.log(obj);
        console.log(obj.value);
        pathpoint = obj.value.lastIndexOf('.')
        filepoint = obj.value.substring(pathpoint+1, obj.length)
        filetype = filepoint.toLowerCase()
        if(filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg'){

        }else {
            alert("이미지 파일만 선택할 수 있습니다.")
            obj.value = "";
            return false;
        }
    }
</script>


</body>
</html>
