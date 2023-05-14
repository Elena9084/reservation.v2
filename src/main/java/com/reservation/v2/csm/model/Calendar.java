package com.reservation.v2.csm.model;

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
public class Calendar {
	private int id;
	private String resourceCode;
	private String title;
	private String start;
	private String end;
	private String writer;

}
