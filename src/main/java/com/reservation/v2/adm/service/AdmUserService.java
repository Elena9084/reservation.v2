package com.reservation.v2.adm.service;

import com.reservation.v2.csm.model.PositionModel;
import com.reservation.v2.csm.model.departmentModel;
import com.reservation.v2.csm.model.UserModel;
import java.util.List;

public interface AdmUserService {

	// 사용자 리스트
	List<UserModel> getUserList(String userName, String departmentCode);

	List<departmentModel> getDepartmentList();

	int modifyUserAuth(String userId, String managerYn);

	int modifyUserRegistration(String userId, String registrationYn);

	// 직급리스트
	List<PositionModel> getPositionList();

	// 사용자 추가
	int addUserOne(UserModel user);

	// 사용자 삭제
	int deleteUserOne(String userId);
}
