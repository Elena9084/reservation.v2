package com.reservation.v2.csm.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReservationModel {
	private int reservationSeq;
	private String resourceCode;
	private String resourceLocation;
	private String resourceName;
	private String menuName;
	private String userId;
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date reservationStartDate;
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date reservationEndDate;
	private String note;
	private String regUserId;
	private Date createDate;
	private String modifyUserId;
	private Date updateDate;

}
