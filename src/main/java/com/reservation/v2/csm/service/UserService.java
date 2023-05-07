package com.reservation.v2.csm.service;

import com.reservation.v2.csm.model.UserModel;

public interface UserService {

    UserModel getUserOne(String userId, String password);

}
