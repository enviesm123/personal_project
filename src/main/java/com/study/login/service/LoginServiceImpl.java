package com.study.login.service;

import com.study.login.vo.UserVO;
import com.study.userinfo.dao.IUserDao;
import com.study.userinfo.vo.UserInfoVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class LoginServiceImpl implements ILoginService{


    @Inject
    IUserDao userDao;

    @Override
    public UserVO getUser(String id, String password) {

        UserInfoVO user = userDao.getUser(id);
        if (user == null) { // 아이디 없음
            System.out.println("아이디가 없음");
            return null;
        }
        if (!StringUtils.equals(user.getUserPass(), password)) { //비밀번호틀림
            System.out.println("비밀번호 틀림");
            return null;
        }
        //로그인 성공

        // 보통은 권한 테이블 따로 존재하는데 .. 그렇게 하려면 우리가 테이블 만들고 구찮으니까

        if(user.getUserId().equals("admin")){
            UserVO userVO = new UserVO(user.getUserId(), user.getUserName(), user.getUserPass(), "admin");
            System.out.println("운영자로그인성공");
            return userVO;

        }else{
            UserVO userVO = new UserVO(user.getUserId(), user.getUserName(), user.getUserPass(), "USER");
            System.out.println("유저로그인 성공");
            return userVO;
        }

    }


}
