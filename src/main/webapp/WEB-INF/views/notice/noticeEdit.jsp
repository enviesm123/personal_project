<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Title</title>
<%--    <script type="text/javascript" src="/smart_editor/js/HuskyEZCreator.js" charset="utf-8"></script>--%>
<%--    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>--%>
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
    <p>no.${notice.noBoNo}</p>
    <span>
    제목
    </span>
    <form action="/notice/noticeModify.wow" method="post">
    <h4 class="detail-title">
        <input name="noBoTitle" style="width: 700px" type="text" value="${notice.noBoTitle}">
        <input name="noBoNo" type="hidden" value="${notice.noBoNo}">
        <input name="noBoWriter" type="hidden" value="${notice.noBoWriter}">
    </h4>
    <span>조회수: ${notice.noBoHit}</span>
    <p class="detail-meta" >작성자: ${notice.noBoWriter} | 작성일: ${notice.noBoRegDate}</p>
    <p class="detail-content"><span>내용</span>
        <textarea id="textarea" name="noBoContent" rows="10" style="width: 100%;">${notice.noBoContent}</textarea>
    </p>
    <button class="back-button" onclick="goBack()">뒤로 가기</button>
    <button type="submit" class="back-button">저장</button>
    </form>

<%--    <!-- SmartEditor2  -->--%>
<%--    <div class="jsx-2303464893 editor">--%>
<%--        <div class="fr-box fr-basic fr-top" role="application">--%>
<%--            <div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;">--%>
<%--			<textarea name="notice_content" id="smartEditor"--%>
<%--                      style="width: 100%; height: 412px;"></textarea>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>


</section>
<script>
    function goBack() {
        window.history.back();
    }

    // var oEditors = [];
    // nhn.husky.EZCreator.createInIFrame({
    //     oAppRef : oEditors,
    //     elPlaceHolder : "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
    //     sSkinURI : "smart_editor/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
    //     fCreator : "createSEditor2",
    //     htParams : {
    //         // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
    //         bUseToolbar : true,
    //
    //         // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
    //         bUseVerticalResizer : false,
    //
    //         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
    //         bUseModeChanger : false
    //     }
    // });
    //
    // $(function() {
    //     $("#savebutton").click(function() {
    //         oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
    //         //textarea의 id를 적어줍니다.
    //
    //         var title = $("#title").val();
    //         var content = document.getElementById("smartEditor").value;;
    //
    //         if (title == null || title == "") {
    //             alert("제목을 입력해주세요.");
    //             $("#title").focus();
    //             return;
    //         }
    //         if(content == "" || content == null || content == '&nbsp;' ||
    //             content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
    //             alert("본문을 작성해주세요.");
    //             oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
    //             return;
    //         } //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
    //
    //         var result = confirm("발행 하시겠습니까?");
    //
    //         if(result){
    //             alert("발행 완료!");
    //             $("#noticeWriteForm").submit();
    //         }else{
    //             return;
    //         }
    //     });
    // })
</script>

</body>
</html>
<script type="text/javascript" src = "resources/js/notice-write.js"></script>