package com.bit.lib.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.lib.domain.Book;

public interface MainDAO {
	
	int getSearchBook(String keyWord);
	List<Book> searchBook(@Param("keyWord") String keyWord,
						  @Param("startList") int startList,
						  @Param("listSize") int listSize);
	
	int getMainView();
	List<Book> mainView();
	
}
