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
            <li><a class="nav-link scrollto active" href="/">Home</a></li>
            <li><a class="nav-link scrollto" href="#about">About</a></li>
            <li><a class="nav-link scrollto" href="#resume">Resume</a></li>
            <li><a class="nav-link scrollto" href="#services">Services</a></li>
            <li class="dropdown"><a href="#"><span>게시판</span> <i class="bi bi-chevron-down"></i></a>
                <ul>
                    <li><a href="#">Drop Down 1</a></li>
                    <li class="dropdown"><a href="#"><span>게시판</span> <i class="bi bi-chevron-right"></i></a>
                        <ul>
                            <li><a href="#">Deep Drop Down 1</a></li>
                            <li><a href="#">Deep Drop Down 2</a></li>
                            <li><a href="/review/reviewList.wow">후기게시판</a></li>
                            <li><a href="#">Deep Drop Down 4</a></li>
                            <li><a href="#">Deep Drop Down 5</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Drop Down 2</a></li>
                    <li><a href="#">Drop Down 3</a></li>
                    <li><a href="/user/userList.wow">회원목록</a></li>
                </ul>
            </li>
            <c:if test="${USER_INFO eq null}">
                <li><a class="nav-link scrollto" href="/login/login.wow">Login</a></li>
            </c:if>
            <li><a class="nav-link scrollto " href="/user/userForm.wow">회원가입</a></li>
            <c:if test="${USER_INFO != null}">

                <li class="dropdown"><a href="#"><span>${USER_INFO.userName} 님</span> <i class="bi bi-chevron-right"></i></a>
                    <ul>
                        <li><a href="#">내정보</a></li>
                        <li><a href="/login/logout.wow">로그아웃</a></li>
                    </ul>
                </li>
            </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

</header>
<!-- End Header -->


<br><br><br><br><br><br>



		
 