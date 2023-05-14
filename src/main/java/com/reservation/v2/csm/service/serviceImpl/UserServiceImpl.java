package com.reservation.v2.csm.service.serviceImpl;

import com.reservation.v2.csm.dao.UserDao;
import com.reservation.v2.csm.model.UserModel;
import com.reservation.v2.csm.service.UserService;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public UserModel getUserOne(String userId, String password) {
        log.info("getUserOne 서비스 userId : {}, password : {}", userId, password);

        UserModel user = userDao.selectUserOne(userId, password);

        if(user == null || user.equals("")){
            log.info("getUserOne 서비스 : 로그인 실패", user);
        }else {
            log.info("getUserOne 서비스 - 로그인 성공 userModel : {} ", user);
        }
        return user;
    }




}
