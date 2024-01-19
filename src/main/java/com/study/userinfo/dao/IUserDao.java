package com.study.userinfo.dao;

import com.study.userinfo.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface IUserDao {

    public int registUser(UserInfoVO user);

    List<UserInfoVO> getUserList();

    UserInfoVO getUser(String userId);
}
