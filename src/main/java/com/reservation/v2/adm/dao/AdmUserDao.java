package com.reservation.v2.adm.dao;

import com.reservation.v2.csm.model.PositionModel;
import com.reservation.v2.csm.model.departmentModel;
import com.reservation.v2.csm.model.UserModel;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdmUserDao {

	// 사용자 리스트
	List<UserModel> selectUserList(@Param("userName") String userName, @Param("departmentCode") String departmentCode);

	// 부서 리스트
	List<departmentModel> selectDepartmentList();

	// 사용자 권한 수정
	int updateUserAuth(@Param("userId") String userId, @Param("managerYn") String managerYn);

	// 사용자 등록 여부 수정
	int updateUserRegistration(@Param("userId") String userId, @Param("registrationYn") String registrationYn);

	// 직급 리스트
	List<PositionModel> selectPositionList();

	// 사용자 등록
	int insertUserOne(@Param("user") UserModel user);

	// 직급 하나
	String selectPositionOne(String positionCode);

	// 사용자 삭제
	int deleteUserOne(String userId);
}
