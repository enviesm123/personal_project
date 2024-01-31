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
        header {
            background-color: #333;
            color: #fff;
            padding: 1em;
            text-align: center;
        }
        body {
            text-align: center;
            margin: 20px;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 0;
        }

        table {
            width: 60%; /* 테이블의 크기를 조절 */
            margin: auto; /* 테이블을 가운데 정렬 */
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .weather-container {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
            max-width: 400px;
        }

        h2 {
            color: #333;
        }

        .weather-text {
            font-size: 18px;
            color: #555;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<%@include file="/WEB-INF/inc/top.jsp" %>
<header>
    <h1>Photo & Hiking</h1>
    <h1>날 씨</h1>
</header>


<div class="container">
    <h2>오늘의 날씨!!</h2>
    <div class="weather-text" th:text="${weatherForecast}">
        ${weatherForecast}
    </div>

<%-- ${weatherInfo}--%>

<h2>날씨 예보</h2>

<table>
    <thead>
    <tr>
        <th>날짜</th>
        <th>강수량(%)</th>
        <th>최고기온/최저기온 (°C)</th>
    </tr>
    </thead>
    <tbody>
    <!-- 여기에 서버에서 받아온 날씨 정보를 동적으로 추가할 수 있습니다. -->

    <tr>
        <td>${weatherInfo.days[0]}</td>
        <td>30% (api 아님)</td>
        <td>${weatherInfo.taMax3} / ${weatherInfo.taMin3}</td>
    </tr>
    <tr>
        <td>${weatherInfo.days[1]}</td>
        <td>30%</td>
        <td>${weatherInfo.taMax4} / ${weatherInfo.taMin4}</td>
    </tr>
    <tr>
        <td>${weatherInfo.days[2]}</td>
        <td>30%</td>
        <td>${weatherInfo.taMax5} / ${weatherInfo.taMin5}</td>
    </tr>
    <!-- 추가적인 행들을 필요에 따라 동적으로 생성할 수 있습니다. -->
    </tbody>
</table>
</div>
</body>
</html>
