package com.study.login.web;

import com.study.login.service.ILoginService;
import com.study.login.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class LoginController {


    @Inject
    ILoginService loginService;

    @GetMapping("/login/login.wow")
    public String loginGet(Model model, HttpServletRequest req) throws Exception {

        model.addAttribute("msg", req
                .getParameter("msg"));
        return "login/login";
    }


    @PostMapping("login/login.wow")
    public String loginPost(Model model, @RequestParam("userId")String id,@RequestParam(value = "rememberMe", required = false) String saveId
            , @RequestParam("userPass")String pw,HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws UnsupportedEncodingException {

        // post
        if (saveId == null) {  //아이디기억하기체크안함
            // 아이디 기억하기가 선택되지 않은 경우, 기존 쿠키 삭제
            Cookie cookie = new Cookie("SAVE_ID", null);
            cookie.setMaxAge(0); // 쿠키를 즉시 만료시킴
            resp.addCookie(cookie);
        }else if(saveId.equals("Y")){
            Cookie cookie = new Cookie("SAVE_ID", id);
            // 쿠키를 한 달 동안 유지하도록 설정 (초 단위로 설정)
            cookie.setMaxAge(30 * 24 * 60 * 60);
            resp.addCookie(cookie);
        }
        boolean nonInput = (id == null || id.isEmpty()) || (pw == null || pw.isEmpty());
        if (nonInput) {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디를 입력해주세요.", "utf-8");
        }

        // 로그인 성공 했을때 로직
        // 데이터 베이스에 일치하는 계정이 있으면
        UserVO user = loginService.getUser(id, pw);
        if (user == null) {
            return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 혹은 비밀번호가 틀립니다.", "utf-8");
        }
        // 세션에 저장하고 홈으로 리다이렉트

        session.setAttribute("USER_INFO", user);

        return "redirect:/";
    }


    @RequestMapping("/login/logout.wow")
    public String logout(HttpSession session){
        // 세션에 저장해놓은 정보를 삭제 하면서 리다이렉트
        session.removeAttribute("USER_INFO");
        System.out.println("로그아웃함");

        return "redirect:/";
    }
}
