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
    <form action="reviewModify.wow"  method="post" enctype="multipart/form-data">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h6 class="card-title">제목<input name="reBoTitle" required="required" value="${reviewBoard.reBoTitle}" type="text" class="form-control"></h6>
                        <p>작성자</p>
                        <input type="text" class="form-control"  disabled value="${reviewBoard.reBoWriter}">
                        <input type="hidden" class="form-control" name="reBoWriter" id="reBoWriterHidden" value="${reviewBoard.reBoWriter}">
                        <input type="hidden" class="form-control" name="reBoNo"  value="${reviewBoard.reBoNo}">
                        비밀번호
                        <input type="password" name="reBoPass" value="" class="form-control input-sm"
                               required="required" pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력"  >
                    </div>
                    <select name="reBoCategory" class="form-control input-sm" required="required">
                        <option value="bC00" selected>-- 선택하세요--</option>
                        <option value="BC01">1</option>
                        <option value="BC02">2</option>
                        <option value="BC03">3</option>
                    </select>
                    <img src="https://via.placeholder.com/800x400" class="card-img-top" alt="게시글 이미지">
                    <div class="card-body">
                        <!-- 게시글 정보 -->
                        <div class="form-group">
                            <label for="content">게시글 정보</label>
                            <textarea name="reBoContent" class="form-control" required="required"  id="content" rows="12">${reviewBoard.reBoContent}</textarea>
                        </div>

                        <!-- 이미지 업로드 폼 -->

                        <div>
                            <div>첨부파일</div>
                            <div>
                                <c:forEach var="f" items="${boardView.attaches}" varStatus="st">
                                    <div> 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank">
                                        <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                                    </a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
                                    </div>

                                    <img alt="" src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${f.atchFileName}&filePath=${f.atchPath}" width="50px" height="50px">
                                </c:forEach>
                            </div>

                        </div>
                        <form id="imageUploadForm">
                            <div class="form-group">
                                <label for="image">이미지 첨부</label>
                                <div class="input-group">
                                    <input type="file" class="form-control-file" id="image" name="image">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-primary" id="uploadImage">이미지 업로드</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="btn-container">
                            <button type="submit" class="btn btn-info">저장</button>
                            <button type="submit" formaction="reviewDelete.wow" class="btn btn-danger">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
