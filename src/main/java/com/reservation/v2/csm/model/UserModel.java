package com.reservation.v2.csm.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserModel {	// empCode X, registrationYn O

	private String userId;		// 회사 이메일 영문이름
	private String userName;
	private String password;	// 회사 이메일 패스워드
	private String managerYn;
	private String email;
	private String phoneNum;
	private String registrationYn;	// 등록여부
	private String deleteYn;		// 퇴사여부
	private String departmentCode;
	private String departmentName;
	private String positionCode;
	private String regUserId;
	private Date createDate;
	private String modifyUserId;
	private Date updateDate;





}
