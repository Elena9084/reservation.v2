package com.reservation.v2.adm.controller;

import com.reservation.v2.adm.service.AdmUserService;
import com.reservation.v2.csm.model.PositionModel;
import com.reservation.v2.csm.model.departmentModel;
import com.reservation.v2.csm.model.UserModel;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

		// 부서&직급 리스트 가져오기
		List<departmentModel> departmentList = admUserService.getDepartmentList();
		List<PositionModel> positionList = admUserService.getPositionList();
		log.info("getUserList 컨트롤러 userList : {}", userList);
		log.info("getUserList 컨트롤러 departmentList : {}", departmentList);

		model.addAttribute("userList", userList);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("positionList", positionList);

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

	@GetMapping("/adm/user/add")
	public String addUser(Model model){
		log.info("사용자 등록 컨트롤러");
		// 부서&직급 리스트 가져오기
		List<departmentModel> departmentList = admUserService.getDepartmentList();
		List<PositionModel> positionList = admUserService.getPositionList();

		log.info("사용자 등록 컨트롤러 departmentList : {}", departmentList);
		log.info("사용자 등록 컨트롤러 positionList : {}", positionList);

		model.addAttribute("departmentList", departmentList);
		model.addAttribute("positionList", positionList);

		return "/user/add";
	}

	// 사용자 등록
	@PostMapping("/adm/user")
	public String addUserExec(@ModelAttribute UserModel user, RedirectAttributes redirect){
		log.info("사용자 등록 컨트롤러 user : {}", user);
		int result = admUserService.addUserOne(user);

		log.info("사용자 등록 컨트롤러 user 등록 결과 : {}", result);

		redirect.addAttribute("userName", "");
		redirect.addAttribute("departmentCode", "");


		return "redirect:/adm/user";
	}

	@DeleteMapping("/adm/user")
	public ResponseEntity<Object> deleteUserExec(@RequestParam String userId){
		log.info("사용자 삭제 컨트롤러 userId : {}", userId);
		int result = admUserService.deleteUserOne(userId);
		log.info("사용자 삭제 컨트롤러 userId : {}", userId);

		return ResponseEntity.ok().build();
	}


}
