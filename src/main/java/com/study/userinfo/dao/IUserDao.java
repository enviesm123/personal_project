package com.study.userinfo.dao;

import com.study.userinfo.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface IUserDao {


    public List<UserInfoVO> getUserList();

    public UserInfoVO getUser(String userId);

    public int registUser(UserInfoVO user);

    public int idChk(UserInfoVO user);

    public int mailChk(UserInfoVO user);

    public int modifyUser(UserInfoVO user);

    public int deleteUser(UserInfoVO user);
}
