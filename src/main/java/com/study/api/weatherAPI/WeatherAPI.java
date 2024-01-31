package com.study.api.weatherAPI;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class WeatherAPI {
    public static void main(String[] args) throws Exception {

//        // 변수 설정
//        String apiURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
//        String authKey = "chUekvPVqAECF%2FjTQVoHXnF9eFMoiKS44vhd%2BGYico3Ac79IGSFpfJucj7Lo%2BUxrGcUuQZHcTubSy%2BT2rj%2BS7A%3D%3D"; // 본인 서비스 키
//
//        // 구하고자 하는 시간과 좌표 대입
//        String nx = "69";
//        String ny = "100";
//        String baseDate = "20240129";
//        String baseTime = "0600";
//
//        String dataType = "JSON";
//
//        StringBuilder urlBuilder = new StringBuilder(apiURL);
//        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + authKey);
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows=10", "UTF-8"));    // 표 개수
//        urlBuilder.append("&" + URLEncoder.encode("pageNo=1", "UTF-8"));    // 페이지 수
//        // JSON 형식으로 반환을 원하면 주석 제거
//         urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode(dataType, "UTF-8")); // 받으려는 타입
//        urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); // 조회하고 싶은 날짜
//        urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); // 조회하고싶은 시간

        URL url = new URL("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst?serviceKey=chUekvPVqAECF%2FjTQVoHXnF9eFMoiKS44vhd%2BGYico3Ac79IGSFpfJucj7Lo%2BUxrGcUuQZHcTubSy%2BT2rj%2BS7A%3D%3D&numOfRows=10&pageNo=1&stnId=133&tmFc=202401290600&dataType=json");
        System.out.println(url);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String result = sb.toString();

        // 테스트를 위해 출력
        System.out.println("데이터: " + result);

        try {
            // JSON 문자열을 JsonNode로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(result);

            // 응답 코드 확인
            String resultCode = rootNode.path("response").path("header").path("resultCode").asText();
            String resultMsg = rootNode.path("response").path("header").path("resultMsg").asText();

            System.out.println("Response Code: " + resultCode);
            System.out.println("Result Message: " + resultMsg);

            // 날씨 정보 확인
            String weatherForecast = rootNode.path("response").path("body").path("items").path("item").get(0).path("wfSv").asText();
            System.out.println("Weather Forecast: " + weatherForecast);
        } catch (Exception e) {
            e.printStackTrace();
        }

        LocalDateTime currentTime = LocalDateTime.now();

        // 원하는 형식으로 포맷팅
        DateTimeFormatter formattedTime = DateTimeFormatter.ofPattern("yyyyMMdd0600");
        String formattedString = currentTime.format(formattedTime);

        // 결과 출력
        System.out.println("현재 시각: " + formattedString);
    }
}
