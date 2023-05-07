package com.reservation.v2.csm.controller;

import com.reservation.v2.csm.service.ReservationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	public String getReservationList(Model model, @RequestParam("resLocation")String resLocation, @RequestParam("mCode")String mCode,
									@RequestParam("date")String date){
		log.info("reservationList 컨트롤러 resLocation : {}, menuCode : {}", resLocation, mCode);

		if(mCode == null || mCode.equals("")){
			mCode = "R001";	// 초기값 회의실(R001)
		}
		reservationService.getReservationList(resLocation, mCode, date);


		return "/reservation/list";
	}




}
