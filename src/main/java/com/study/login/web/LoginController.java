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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {


    @Inject
    ILoginService loginService;

    @GetMapping("/login/login.wow")
    public String loginGet(Model model) throws Exception {
        return "login/login";
    }


    @PostMapping("login/login.wow")
    public String loginPost(Model model, @RequestParam("userId")String id
            , @RequestParam("userPass")String pw,HttpServletRequest req, HttpServletResponse resp, HttpSession session){

        // 로그인 성공 했을때 로직
        // 데이터 베이스에 일치하는 계정이 있으면
        UserVO user = loginService.getUser(id, pw);
        // 세션에 저장하고 홈으로 리다이렉트
        System.out.println("유저VO: " + user);
        model.addAttribute("user", user);
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
