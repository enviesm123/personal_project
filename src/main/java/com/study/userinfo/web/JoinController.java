package com.study.userinfo.web;

import com.study.userinfo.service.IUserService;
import com.study.userinfo.vo.UserInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

@Controller
public class JoinController {


    @Inject
    IUserService userService;

    @RequestMapping("/user/idcheck.wow")
    @ResponseBody
    public int idCheck(UserInfoVO user) {
       int result = userService.idChk(user);
       return result;
    }

    @RequestMapping("/user/mailcheck.wow")
    @ResponseBody
    public int mailCheck(UserInfoVO user) {
        int result = userService.mailChk(user);
        return result;
    }
}
