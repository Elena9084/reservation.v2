package com.reservation.v2.adm.service.serviceImpl;

import com.reservation.v2.adm.dao.AdmUserDao;
import com.reservation.v2.adm.service.AdmUserService;
import com.reservation.v2.csm.model.departmentModel;
import com.reservation.v2.csm.model.UserModel;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class AdmUserServiceImpl implements AdmUserService {
	@Autowired
	private AdmUserDao admUserDao;

	@Override
	public List<UserModel> getUserList(String userName, String departmentCode) {
		log.info("getUserList 서비스 userName : {}, departmentCode : {}", userName, departmentCode);
		List<UserModel> userList = admUserDao.selectUserList(userName, departmentCode);
		log.info("getUserList 서비스 userList : {}", userList);

		return userList;
	}

	@Override
	public List<departmentModel> getDepartmentList() {
		return admUserDao.selectDepartmentList();
	}

	@Override
	public int modifyUserAuth(String userId, String managerYn) {
		log.info("사용자 권한 수정 서비스 userId : {}, managerYn : {}", userId, managerYn);
		int result = admUserDao.updateUserAuth(userId, managerYn);
		log.info("사용자 권한 수정 서비스 result : {}", result);

		return result;
	}

	@Override
	public int modifyUserRegistration(String userId, String registrationYn) {
		log.info("사용자 등록 서비스 userId : {}, registrationYn : {}", userId, registrationYn);
		int result = admUserDao.updateUserRegistration(userId, registrationYn);
		log.info("사용자 등록 서비스 result : {}", result);

		return result;
	}
}
