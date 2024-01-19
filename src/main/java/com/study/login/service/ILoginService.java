package com.study.login.service;

import com.study.login.vo.UserVO;
import com.study.userinfo.vo.UserInfoVO;

public interface ILoginService {

    UserVO getUser(String id, String password);


}
