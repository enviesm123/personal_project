package com.study.api.web;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.api.vo.WeatherInfo;
import com.study.api.vo.WeatherVO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WeatherController {


    @GetMapping("/api/weather.wow")
    public String showWeather(Model model) throws IOException {

        LocalDateTime currentTime = LocalDateTime.now();

        // 원하는 형식으로 포맷팅 201404080600
        DateTimeFormatter formattedTime = DateTimeFormatter.ofPattern("yyyyMMddHHmm");
        String formattedString = currentTime.format(formattedTime);
        // API 엔드포인트 URL
        URL url = new URL("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst?serviceKey=chUekvPVqAECF%2FjTQVoHXnF9eFMoiKS44vhd%2BGYico3Ac79IGSFpfJucj7Lo%2BUxrGcUuQZHcTubSy%2BT2rj%2BS7A%3D%3D&numOfRows=10&pageNo=1&stnId=133&tmFc="+formattedString+"&dataType=json");  // 실제 API URL을 사용하세요.

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
            model.addAttribute("weatherForecast", weatherForecast);
        } catch (Exception e) {
            e.printStackTrace();
        }



//        String[] days = {"내일", "2일뒤", "3일뒤"};
//        model.addAttribute("days", days);
        // 날짜별 온도 api

        getTemp(model);

        // 뷰의 이름 리턴 (뷰 페이지의 경로와 일치하게 설정)
        return "api/weather";
    }

    private static void getTemp(Model model) throws IOException {
        BufferedReader rd;
        StringBuilder sb;
        HttpURLConnection conn;
        String line;
        URL url;
        url = new URL("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey=chUekvPVqAECF%2FjTQVoHXnF9eFMoiKS44vhd%2BGYico3Ac79IGSFpfJucj7Lo%2BUxrGcUuQZHcTubSy%2BT2rj%2BS7A%3D%3D&numOfRows=10&pageNo=1&regId=11B10101&tmFc=202401291800&dataType=json");  // 실제 API URL을 사용하세요.

        conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        sb = new StringBuilder();

        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String resultWeather = sb.toString();

        try {
            // JSON 문자열을 JsonNode로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(resultWeather);

            // 응답 코드 확인
            String resultCodeWeather = rootNode.path("response").path("header").path("resultCode").asText();
            String resultMsgWeather = rootNode.path("response").path("header").path("resultMsg").asText();

            System.out.println("Response Code: " + resultCodeWeather);
            System.out.println("Result Message: " + resultMsgWeather);

            // 날씨 정보 확인
            JsonNode dailyWeather = rootNode.path("response").path("body").path("items").path("item").get(0);
            WeatherInfo weatherInfo = new WeatherInfo();
            weatherInfo.setTaMin3(dailyWeather.path("taMin3").asInt());
            weatherInfo.setTaMax3(dailyWeather.path("taMax3").asInt());
            weatherInfo.setTaMin4(dailyWeather.path("taMin4").asInt());
            weatherInfo.setTaMax4(dailyWeather.path("taMax4").asInt());
            weatherInfo.setTaMin5(dailyWeather.path("taMin5").asInt());
            weatherInfo.setTaMax5(dailyWeather.path("taMax5").asInt());
            System.out.println(dailyWeather);
// 필요한 다른 필드들에 대해서도 위와 같이 설정

// 모델에 VO 객체를 넣기
            model.addAttribute("weatherInfo", weatherInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
