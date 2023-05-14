package com.reservation.v2.adm.controller;

import com.reservation.v2.adm.service.AdmUserService;
import com.reservation.v2.csm.model.departmentModel;
import com.reservation.v2.csm.model.UserModel;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class AdmUserController {

	@Autowired
	private AdmUserService admUserService;

	@GetMapping("/adm/user")
	public String getUserList(Model model, @RequestParam(value = "userName", required = false) String userName
							, @RequestParam(value = "departmentCode", required = false) String departmentCode){

		log.info("getUserList 컨트롤러 userName : {}, departmentCode : {}", userName, departmentCode);
		List<UserModel> userList = admUserService.getUserList(userName, departmentCode);

		// 부서 리스트 가져오기
		List<departmentModel> departmentList =  departmentList = admUserService.getDepartmentList();
		log.info("getUserList 컨트롤러 userList : {}", userList);
		log.info("getUserList 컨트롤러 departmentList : {}", departmentList);

		model.addAttribute("userList", userList);
		model.addAttribute("departmentList", departmentList);

		return "/user/list";
	}

	// 사용자 수정
	@PatchMapping("/adm/user/manager")
	@ResponseBody
	public ResponseEntity<Object> modifyUserManagerYn(@RequestParam String userId, @RequestParam String managerYn){
		log.info("사용자 등록 컨트롤러 userId : {}, managerYn", userId, managerYn);

		int result = admUserService.modifyUserAuth(userId, managerYn);

		if(result > 0){
			log.info("사용자 권한 수정 성공");
			return ResponseEntity.ok().build();
		}else {
			log.info("사용자 권한 수정 실패");
			return ResponseEntity.badRequest().build();
		}
	}

	// 사용자 수정
	@PatchMapping("/adm/user/registration")
	@ResponseBody
	public ResponseEntity<Object> modifyUserRegistration(@RequestParam String userId, @RequestParam String registrationYn){
		log.info("사용자 등록 컨트롤러 userId : {}, managerYn", userId, registrationYn);

		int result = admUserService.modifyUserRegistration(userId, registrationYn);

		if(result > 0){
			log.info("사용자 권한 수정 성공");
			return ResponseEntity.ok().build();
		}else {
			log.info("사용자 권한 수정 실패");
			return ResponseEntity.badRequest().build();
		}
	}


}
