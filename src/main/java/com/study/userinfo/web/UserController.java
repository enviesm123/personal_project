package com.study.userinfo.web;

import com.study.code.vo.CodeVO;
import com.study.common.vo.ResultMessageVO;
import com.study.login.vo.UserVO;
import com.study.userinfo.service.IUserService;
import com.study.userinfo.vo.UserInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Inject
    IUserService userService;


    @RequestMapping("/user/userList.wow")
    public String userList(Model model) {

        List<UserInfoVO> userList = userService.getUserList();
        model.addAttribute("userList", userList);

        return "user/userList";
    }

    @RequestMapping("/user/userView.wow")
    public String userView(Model model, HttpSession session) {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        if(userInfo==null){
            // 로그인 X
            return "login/login";
        }
        String userId=userInfo.getUserId();
        UserInfoVO user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "user/userView";
    }

    @RequestMapping("/user/userEdit.wow")
    public String userEdit(Model model, String userId){
        UserInfoVO user = userService.getUser(userId);
        System.out.println(user);
        model.addAttribute("user", user);

        return "user/userEdit";
    }

    @PostMapping("/user/userModify.wow")
    public String userModify(Model model, UserInfoVO user){
        userService.modifyUser(user);
        ResultMessageVO resultMessage = new ResultMessageVO();
        resultMessage.messageSetting
                (true, "Modify", "성공", "/user/userList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessage);
        return "common/message";
    }

    @PostMapping("/user/userDelete.wow")
    public String userDelete(Model model, UserInfoVO user){
        userService.deleteUser(user);
        ResultMessageVO resultMessage = new ResultMessageVO();
        resultMessage.messageSetting
                (true, "Delete", "성공", "/user/userList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessage);
        return "common/message";
    }

    @RequestMapping("/user/userForm.wow")
    public String userForm(Model model) {
        return "user/userForm";
    }

    @PostMapping("/user/userRegist")
    public String userRegist(Model model, UserInfoVO user) {

        int idResult = userService.idChk(user);
        int mailResult = userService.mailChk(user);

        try {
            if (idResult == 0 && mailResult == 0) {
                userService.registUser(user);
            } else {
                // 중복 체크 실패 시, 오류 메시지를 모델에 추가하여 사용자에게 표시
                if (idResult != 0) {
                    model.addAttribute("idError", "아이디가 이미 존재합니다.");
                }
                if (mailResult != 0) {
                    model.addAttribute("mailError", "이메일이 이미 사용 중입니다.");
                }
                return "/user/userForm";
            }
        } catch (Exception e) {
           throw new RuntimeException();
        }

        return "redirect:/";
    }


}
