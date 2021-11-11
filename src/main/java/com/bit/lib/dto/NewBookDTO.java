package com.bit.lib.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class NewBookDTO {

	private int bookCode;
	private String bookTitle;
	private String author;
	private String type;
	private String publisher;
	private String pubYear;
	private String imagePath;
	private int bookQty;
	
	private String bookNo;
	private int rentStatus;
	private int reserveStatus;
}