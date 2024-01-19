package com.study.userinfo.service;


import com.study.userinfo.vo.UserInfoVO;

import java.util.List;

public interface IUserService {

    public List<UserInfoVO> getUserList();

    public UserInfoVO getUser(String userId);
    public void registUser(UserInfoVO user);
}
