<%@ page language="java"
         pageEncoding="UTF-8" %>


<%--<style>--%>
<%--    .navbar a {--%>
<%--        color: #161719;--%>
<%--    }--%>
<%--</style>--%>
<!-- Fixed navbar -->
<header id="header" class="fixed-top d-flex justify-content-center align-items-center header-transparent">


    <nav id="navbar" class="navbar">
        <ul>
            <li><a class="nav-link scrollto" href="/">Home</a></li>
            <li><a class="nav-link scrollto" href="#about"></a></li>
            <li><a class="nav-link scrollto" href="#resume">Resume</a></li>
            <li><a class="nav-link scrollto" href="/api/weather.wow">날씨</a></li>
            <li class="dropdown"><a href="#"><span>게시판</span> <i class="bi bi-chevron-down"></i></a>
                <ul>
                    <li><a href="/notice/noticeList.wow">공지사항</a></li>
                    <li class="dropdown"><a href="/review/reviewList.wow"><span>후기게시판</span></a>
                    </li>
                    <li><a href="#">Drop Down 2</a></li>
                    <li><a href="#">Drop Down 3</a></li>

                </ul>
            </li>
            <c:if test="${USER_INFO eq null}">
                <li><a class="nav-link scrollto" href="/login/login.wow">Login</a></li>
                <li><a class="nav-link scrollto " href="/user/userForm.wow">회원가입</a></li>
            </c:if>
            <c:if test="${USER_INFO != null}">

                <li class="dropdown"><a href="#"><span>${USER_INFO.userName} 님</span> <i
                        class="bi bi-chevron-right"></i></a>
                    <ul>
                        <li><a href="/user/userView.wow">내정보</a></li>
                        <li><a href="/login/logout.wow">로그아웃</a></li>
                        <c:if test="${USER_INFO.userRole eq 'admin'}">
                            <li><a href="/user/userList.wow">회원목록</a></li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

</header>
<!-- End Header -->


<br><br><br><br><br><br>



		
 