package com.reservation.v2.csm.controller;

import com.reservation.v2.adm.model.ResourceModel;
import com.reservation.v2.csm.model.Calendar;
import com.reservation.v2.csm.model.ReservationModel;
import com.reservation.v2.csm.model.UserModel;
import com.reservation.v2.csm.service.ReservationService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

@Controller
@Slf4j
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@GetMapping("/reservation")
	public String getCalendar(Model model
		, @RequestParam(value = "resourceLocation", required = false)String resourceLocation
		, @RequestParam(value = "menuCode", required = false)String menuCode
		, @RequestParam(value = "resourceCode", required = false)String resourceCode){
		log.info("reservationList 컨트롤러 resourceLocation: {}, menuCode : {}", resourceLocation, menuCode, resourceCode);
		log.info("getCalendar 컨트롤러");
		if(menuCode == null || menuCode.equals("")){
			menuCode = "R001";	// 초기값 회의실(R001)
		}
		if(resourceLocation == null || resourceLocation.equals("")){
			resourceLocation = "한남";	// 초기값 한남
		}

		log.info("reservationList 컨트롤러 초기값세팅 resourceLocation: {}, menuCode : {}", resourceLocation, menuCode, resourceCode);

		// menuCode와 resourceLocation을 이용하여 resourceList를 가져온다.
		List<ResourceModel> resourceList = reservationService.getResourceList(resourceLocation, menuCode);


		// 자원 리스트를 가져와서 첫번째 자원을 저장해준다.
		if(resourceCode == null || resourceCode == ""){
			for(int i=0; i < resourceList.size(); i++){
				String first = resourceList.get(i).getResourceCode();
				if(first.charAt(0) == menuCode.charAt(0)){
					resourceCode = first;
					log.info("first: {}", first);
					break;
				}
			}
		}

		log.info("resourceCode: {}", resourceCode);
		List<Calendar> calendarList = reservationService.getReservationList(resourceCode);
		log.info("calendarList: {}", calendarList);
		if(resourceCode.contains("R")) {
			model.addAttribute("menuName", "회의실");
		}else if(resourceCode.contains("C")){
			model.addAttribute("menuName", "차량");
		}else if (resourceCode.contains("H")) {
			model.addAttribute("menuName", "헬스키퍼");
		}

		model.addAttribute("resourceCode", resourceCode);
		model.addAttribute("resourceList", resourceList);
		model.addAttribute("calendarList", calendarList);

		return "/reservation/list";
	}

	@GetMapping(value = "/reservation/list")
	@ResponseBody
	public List<Calendar> getReservationList(Model model
		, @RequestParam(value = "resourceLocation", required = false)String resourceLocation
		, @RequestParam(value = "menuCode", required = false)String menuCode
		, @RequestParam(value = "resourceCode", required = false)String resourceCode
	) {
		log.info("reservationList 컨트롤러 resourceLocation : {}, menuCode : {}, reousrceCode = {}", resourceLocation, menuCode, resourceCode);

		if(menuCode == null || menuCode.equals("")){
			menuCode = "R001";	// 초기값 회의실(R001)
		}
		if(resourceLocation == null || resourceLocation.equals("")){
			resourceLocation = "한남";	// 초기값 한남
		}

		log.info("reservationList 컨트롤러 resourceLocation: {}, menuCode : {}", resourceLocation, menuCode);
		// menuCode와 resourceLocation을 이용하여 resourceList를 가져온다.
		List<ResourceModel> resourceList = reservationService.getResourceList(resourceLocation, menuCode);


		// 자원 리스트를 가져와서 첫번째 자원을 저장해준다.
		if(resourceCode == null || resourceCode == ""){
			for(int i=0; i < resourceList.size(); i++){
				String first = resourceList.get(i).getResourceCode();
				if(first.charAt(0) == menuCode.charAt(0)){
					resourceCode = first;
					log.info("first: {}", first);
					break;
				}
			}
		}

		log.info("resourceCode: {}", resourceCode);
		List<Calendar> calendarList = reservationService.getReservationList(resourceCode);
		log.info("calendarList: {}", calendarList);

		model.addAttribute("resourceCode", resourceCode);
		model.addAttribute("resourceList", resourceList);
		model.addAttribute("calendarList", calendarList);

		return calendarList;
		//return "/reservation/list";
	}

	@GetMapping("/reservation/add")
	public String addReservation( HttpSession session, Model model
		, @RequestParam("reservationStartDate")String reservationStartDate
		, @RequestParam("reservationEndDate")String reservationEndDate
	 	, @RequestParam("resourceCode")String resourceCode){

		log.info("addReservation 컨트롤러 reservationStartDate : {}, reservationEndDate : {}, resourceCode : {}", reservationStartDate, reservationEndDate, resourceCode);

		if(reservationStartDate.length() == 10){
			reservationStartDate = reservationStartDate + " 00:00:00";
		}
		if(reservationEndDate.length() == 10){
			reservationEndDate = reservationEndDate + " 00:00:00";
		}
		// resource에 대한 정보를 가져와야함
		ResourceModel resourceModel = reservationService.getResourceOne(resourceCode);
		log.info("자원 하나 가져왔다 {}", resourceModel);

		String startDate =reservationStartDate;
		String endDate = reservationEndDate;

		// 타임존 없애줘야됨
		if(reservationStartDate.contains("T") && reservationEndDate.contains("T")){
			reservationStartDate = reservationStartDate.replace("T", " ");
			reservationEndDate = reservationEndDate.replace("T", " ");
			endDate = reservationEndDate.substring(0, reservationEndDate.length()-3);
			startDate = reservationStartDate.substring(0, reservationEndDate.length()-3);
		}

		log.info("addReservation 컨트롤러 reservationStartDate : {}, reservationEndDate : {}", reservationStartDate, reservationEndDate);

		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);

		model.addAttribute("resource", resourceModel);

		return "/reservation/add";
	}

	// 예약 추가
	@PostMapping("/reservation")
	public ResponseEntity<Object> addReservationOneExec(@RequestBody ReservationModel reservationModel, HttpSession session){
		log.info("addReservationOne 컨트롤러 reservationModel : {}", reservationModel);

		UserModel user = (UserModel)session.getAttribute("loginUser");
		reservationModel.setUserId(user.getUserId());

		reservationService.addReservation(reservationModel);


		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	// 내 예약 조회
	@GetMapping(value = "/myReservation")
	public String getMyReservationList(Model model, HttpSession session){
		UserModel user = (UserModel)session.getAttribute("loginUser");
		if(user == null){
			return "redirect:/login";
		}
		String userId = user.getUserId();

		List<ReservationModel> reservationList = reservationService.getMyReservationList(userId);
		// 메뉴저장해주기
		for (int i=0; i < reservationList.size();i++){
			if(reservationList.get(i).getResourceCode().contains("R")) {
				reservationList.get(i).setMenuName("회의실");
			}else if(reservationList.get(i).getResourceCode().contains("C")) {
				reservationList.get(i).setMenuName("차량");
			}else if(reservationList.get(i).getResourceCode().contains("H")){
				reservationList.get(i).setMenuName("헬스키퍼");
			}
		}


		model.addAttribute("reservationList", reservationList);

		return "/reservation/myReservation";
	}


	// 예약 상세
	@GetMapping(value = "/reservation/detail")
	public String getReservationOne(@RequestParam("reservationSeq")String reservationSeq, Model model){
		ReservationModel reservation = reservationService.selectReservationOne(reservationSeq);

		model.addAttribute("reservation", reservation);

		return "/reservation/detail";
	}

	// 예약 수정
	@GetMapping(value = "/reservation/modify")
	public String modifyReservationOne(@RequestParam("reservationSeq")String reservationSeq, Model model){
		ReservationModel reservation = reservationService.selectReservationOne(reservationSeq);

		model.addAttribute("reservation", reservation);

		return "/reservation/modify";
	}


	// 예약 수정
	@PatchMapping("/reservation")
	public ResponseEntity<Object> modifyReservationOneExec(@RequestBody ReservationModel reservationModel, HttpSession session){
		log.info("modifyReservationOneExec 컨트롤러 reservationModel : {}", reservationModel);

		UserModel user = (UserModel)session.getAttribute("loginUser");
		reservationModel.setUserId(user.getUserId());

		int result = reservationService.modifyReservation(reservationModel);
		log.info("modifyReservationOneExec 컨트롤러 result : {}", result);


		return new ResponseEntity<>("success", HttpStatus.OK);
	}



	// 예약 삭제
	@DeleteMapping("/reservation")
	public ResponseEntity<Object> deleteReservationOne(@RequestParam("reservationSeq") String reservationSeq){
		log.info("deleteReservationOne 컨트롤러 reservationSeq : {}", reservationSeq);

		int result = reservationService.deleteReservationOne(Integer.parseInt(reservationSeq));
		log.info("deleteReservationOne 컨트롤러 result : {}", result);

		return new ResponseEntity<>("success", HttpStatus.OK);
	}




}

