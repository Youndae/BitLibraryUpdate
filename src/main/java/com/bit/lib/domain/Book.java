package com.bit.lib.domain;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("book")
public class Book {

	private int bookCode;
	private String bookTitle;
	private String author;
	private String type;
	private String publisher;
	private String pubYear;
	private String imagePath;
	private int bookQty;
	
}
