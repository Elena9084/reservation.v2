package com.reservation.v2.csm.controller;

import com.reservation.v2.csm.service.ReservationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Slf4j
public class ReservationController {

	@Autowired
	ReservationService reservationService;




}
