package com.reservation.v2.csm.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReservationModel {
	private int reservationSeq;
	private String resourceCode;
	private String userId;
	private Date reservationStartDate;
	private Date reservationEndDate;
	private String note;
	private String regUserId;
	private Date createDate;
	private String modifyUserId;
	private Date updateDate;









}
