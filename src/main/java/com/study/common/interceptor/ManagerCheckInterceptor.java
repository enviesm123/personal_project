package com.study.common.interceptor;

import com.study.login.vo.UserVO;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerCheckInterceptor extends HandlerInterceptorAdapter {
    // HandlerInterceptor 인터페이스를 구현하면 되는데
    // 요청 전 후, 뷰로 가기직전에 실행되는 메소드 전부 구현해야 됨

    // 우리는 요청 전만 오버라이딩 하고 싶음.


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("USER_INFO");
        if(user == null){
            response.sendRedirect("/login/login.wow");
            return false;
        }
        if(user.getUserRole().equals("MANAGER")) return true; // 매니저면 /member/*로 정상적인 화면을 볼 수 있다

        response.sendError(HttpServletResponse.SC_FORBIDDEN, "당신은 매니저가 아닙니다.");
        // 매니저가 아니면 /member/* 화면을 볼 수 없고, 특정한 작업 해주면 되겠다
        return false;
    }
}
