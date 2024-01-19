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
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        #container{
            width: 20%;
        }

        .input-form-box{
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
            <div class="input-form-box"><input type="text" name="userId" class="form-control" placeholder="아이디">
            <button class="btn btn-info" type="button" id="idcheck">아이디 중복체크</button>
            </div>
            <div class="input-form-box"><input type="password"  name="userPass" class="form-control" placeholder="비밀번호"></div>
            <div class="input-form-box"><input type="text" name="uid" class="form-control" placeholder="회원명"></div>

            <div class="input-form-box"><input id="zipcode" type="text" name="userZip" class="form-control" placeholder="우편번호" readonly></div>
            <input type="button" onclick="findAddress()" value="우편번호 찾기">
            <div class="input-form-box"><input id="address" type="text" name="userAdd1" class="form-control" placeholder="주소" readonly></div>
<%--            <div class="input-form-box"><input id="address_sub" type="text" name="uid" class="form-control" placeholder="참고항목"></div>--%>
            <div class="input-form-box"><input id="adress2" type="text" name="userAdd2" class="form-control" placeholder="상세주소"></div>
            <div class="input-form-box"><input type="text" name="userHp" class="form-control" placeholder="핸드폰번호"></div>
            <div class="input-form-box"><input type="text" name="userMail" class="form-control" placeholder="이메일"></div>
            <button class="btn btn-info" type="button" id="emailCheck">이메일 중복체크</button>
            <div class="button-login-box" >
                <button type="submit" class="btn btn-primary btn-xs" style="width:100%; margin-bottom: 5px; margin-top: 10px">
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
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
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
</script>
</html>
