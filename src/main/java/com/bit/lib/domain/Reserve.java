package com.bit.lib.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class Reserve {
	
	private int reserveCode;
	private String id;
	private Date reserveDate;
	private Date reserveFinDate;
	private String bookNo;
}
