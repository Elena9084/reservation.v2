package com.reservation.v2.csm.dao;

import com.reservation.v2.csm.model.UserModel;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDao {
    // 사용자 상세
    UserModel selectUserOne(@Param("userId") String userId,@Param("password")String password);



}
