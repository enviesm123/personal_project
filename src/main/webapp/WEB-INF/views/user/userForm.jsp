<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        .navbar a {
            color: #0f5132;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        #container {
            width: 20%;
        }

        .input-form-box {
            margin-top: 5px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div id="container">
    <!--  login 폼 영역을 : loginBox -->
    <form action="userRegist.wow" method="post" id="loginBox">

        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle"><h3>회 원 가 입</h3></div>
        <!-- 아이디, 비번, 버튼 박스 -->
        <div id="inputBox">
            <div class="input-form-box"><input type="text" onkeyup="fn_idChk()" name="userId" class="form-control"
                                               placeholder="아이디">
                <%--            <button class="btn btn-info" type="button" id="idcheck">아이디 중복체크</button>--%>
            </div>
            <span style="color: darkgreen" id="usernameMessage-S"></span>
            <span style="color: red" id="usernameMessage-F"></span>
            <div class="input-form-box"><input type="password" name="userPass" class="form-control" placeholder="비밀번호">
            </div>
            <div class="input-form-box"><input type="text" name="userName" class="form-control" placeholder="회원명"></div>

            <div class="input-form-box"><input id="zipcode" type="text" name="userZip" class="form-control"
                                               placeholder="우편번호" readonly></div>
            <input type="button" onclick="findAddress()" value="우편번호 찾기">
            <div class="input-form-box"><input id="address" type="text" name="userAdd1" class="form-control"
                                               placeholder="주소" readonly></div>
            <%--            <div class="input-form-box"><input id="address_sub" type="text" name="uid" class="form-control" placeholder="참고항목"></div>--%>
            <div class="input-form-box"><input id="adress2" type="text" name="userAdd2" class="form-control"
                                               placeholder="상세주소"></div>
            <div class="input-form-box"><input type="text" name="userHp" class="form-control" placeholder="핸드폰번호"></div>
            <div class="input-form-box"><input onkeyup="fn_mailChk()" type="text" name="userMail" class="form-control"
                                               placeholder="이메일"></div>
            <%--            <button class="btn btn-info" type="button"  id="emailCheck">이메일 중복체크</button>--%>
            <span style="color: darkgreen" id="userMailMessage-S"></span>
            <span style="color: red" id="userMailMessage-F"></span>
            <div class="button-login-box">
                <button type="submit" id="signUp" class="btn btn-primary btn-xs"
                        style="width:100%; margin-bottom: 5px; margin-top: 10px">
                    회원가입
                </button>
                <a href="/login/login.wow">아이디가 이미 있다면? 로그인하러 가기</a>
            </div>
        </div>

    </form>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    let isidDuple = false
    let ismailDuple = false

    function fn_idChk() {
        $("#usernameMessage-F").text("");
        $("#usernameMessage-S").text("");
        // e.preventDefault()
        // 아이디 중복체크로직
        // 이벤트 전송을 막기
        // 현재 인풋창에 입력한 아이디 얻기
        // 입력하지 않았을때를 체크해줌
        // 아이디가 입력이 되었을때
        // ajax 통신으로 아이디 중복 체크를 진행
        let currentId = $("input[name='userId']").val();
        if (currentId != '' && currentId != null) {
            console.log(currentId)
            $.ajax({
                url: "/user/idcheck.wow",
                type: "POST",
                dataType: "json",
                data: {"userId": currentId},
                success: function (data) {
                    if (data == 1) {
                        $("#usernameMessage-F").text("이미 사용 중인 아이디입니다.");
                        isidDuple = false
                    } else if (data == 0) {
                        $("#usernameMessage-S").text("사용 가능한 아이디입니다.");
                        isidDuple = true
                    }
                }
            })

        }

    }

    function fn_mailChk() {
        $("#userMailMessage-S").text("");
        $("#userMailMessage-F").text("");
        let currentMail = $("input[name='userMail']").val();
        $.ajax({
            url: "/user/mailcheck.wow",
            type: "POST",
            dataType: "json",
            data: {"userMail": currentMail},
            success: function (data) {
                if (data == 1) {
                    $("#userMailMessage-F").text("이미 사용 중인 메일입니다.");
                    ismailDuple = false
                } else if (data == 0) {
                    $("#userMailMessage-S").text("사용 가능한 메일입니다.");
                    ismailDuple = true
                }
            }
        })
    }


    function findAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                // if(data.userSelectedType === 'R'){
                //     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                //     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                //     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                //         extraAddr += data.bname;
                //     }
                //     // 건물명이 있고, 공동주택일 경우 추가한다.
                //     if(data.buildingName !== '' && data.apartment === 'Y'){
                //         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                //     }
                //     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                //     if(extraAddr !== ''){
                //         extraAddr = ' (' + extraAddr + ')';
                //     }
                //     // 조합된 참고항목을 해당 필드에 넣는다.
                //     document.getElementById("address_sub").value = extraAddr;
                //
                // } else {
                //     document.getElementById("address_sub").value = '';
                // }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("adress2").focus();

            }
        }).open();
    }

    document.querySelector("#signUp").addEventListener("click", (e) => {
        e.preventDefault()
        // 간단한 클라이언트 측 검증
        const userId = $("input[name='userId']").val();
        const email = $("input[name='userMail']").val();
        const password = $("input[name='userPass']").val();
        const userName = $("input[name='userName']").val();

        if (!userId || !email || !password || !userName
            || userId == "" || email == "" || password == "" || userName == "") {
            alert("기본 정보를 입력하세요");
            return;
        }

        // 서버로의 요청을 막고 사용자에게 알림을 보여줌
        if (isidDuple == true && ismailDuple == true) {
            // 폼에 전송
            alert("회원가입 성공");
            document.querySelector("form").submit();
        } else if (isidDuple == false) {
            alert("아이디를 확인 해주세요")
        } else if (ismailDuple == false) {
            alert("이메일을 확인해 주세요")
        }
    })


</script>
</html>
