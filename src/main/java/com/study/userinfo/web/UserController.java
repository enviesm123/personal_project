package com.study.userinfo.web;

import com.study.code.vo.CodeVO;
import com.study.userinfo.service.IUserService;
import com.study.userinfo.vo.UserInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.List;

@Controller
public class UserController {

    @Inject
    IUserService userService;



    @RequestMapping("/user/userList.wow")
    public String userList(Model model){

        List<UserInfoVO> userList = userService.getUserList();
        model.addAttribute("userList", userList);

        return "user/userList";
    }

    @RequestMapping("/user/userForm.wow")
    public String userForm(Model model){
        return "user/userForm";
    }

    @PostMapping("/user/userRegist")
    public String userRegist(Model model, UserInfoVO user){
        userService.registUser(user);

        return "redirect:/";
    }
}
