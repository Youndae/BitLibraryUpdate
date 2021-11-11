package com.bit.lib.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class RentDTO {

	private int historyCode;
	private int bookCode;
	private String bookNo;
	private String bookTitle;
	private String author;
	private int rentStatus;
	private int reserveStatus;
	private Date rentDate;
	private Date returnDate;
	private Date returnDueDate;
	private long datedif;
	private String id;
	private Date reserveFinDate;
}

