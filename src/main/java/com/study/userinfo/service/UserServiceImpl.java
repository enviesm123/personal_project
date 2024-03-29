package com.study.userinfo.service;

import com.study.userinfo.dao.IUserDao;
import com.study.userinfo.vo.UserInfoVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;


@Service
public class UserServiceImpl implements IUserService{

    @Inject
    IUserDao userDao;

    @Override
    public List<UserInfoVO> getUserList() {
        return userDao.getUserList();
    }

    @Override
    public UserInfoVO getUser(String userId) {
        return userDao.getUser(userId);
    }


    @Override
    public void registUser(UserInfoVO user) {

        userDao.registUser(user);


    }



    @Override
    public int idChk(UserInfoVO user) {
        int result = userDao.idChk(user);
        return result;
    }

    @Override
    public int mailChk(UserInfoVO user) {
        int result = userDao.mailChk(user);
        return result;
    }

    @Override
    public void modifyUser(UserInfoVO user) {
        userDao.modifyUser(user);
    }

    @Override
    public void deleteUser(UserInfoVO user) {
        userDao.deleteUser(user);
    }
}
