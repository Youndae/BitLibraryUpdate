package com.bit.lib.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class ReserveListDTO {
	private String bookNo;
	private String bookTitle;
	private Date reserveDate;
	private Date returnDueDate;
	private Date returnDate;
	private Date reserveFinDate;
	private int rentStatus;
	
}
