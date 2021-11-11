package com.bit.lib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.BookDetailDAO;
import com.bit.lib.dto.BookDetailDTO;



@Service("bookDetailService")
public class BookDetailServiceImpl implements BookDetailService {

	@Autowired(required = false)
	private BookDetailDAO bookdetailDao;

	@Override
	public List<BookDetailDTO> bookDetail(int bookCode) {
		// TODO Auto-generated method stub
		return bookdetailDao.bookDetail(bookCode);
	}
	
	@Override
	public int rentCount(String id){
		System.out.println();
		return bookdetailDao.rentCount(id);
	}


}
