package com.bit.lib.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class RentHistory {
	private int historyCode;
	private String bookNo;
	private Date returnDate;
	private Date rentDate;
	private String id;
}
