package com.bit.lib.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookDetailDTO {
	
	private String bookTitle;
	private String author;
	private String type;
	private String publisher;
	private String pubYear;
	private String imagePath;
	private String bookNo;
	private int rentStatus;
	private int reserveStatus;
	private Date rentDate;
	private String id;
}
