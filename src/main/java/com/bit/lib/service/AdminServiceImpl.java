package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.AdminDAO;
import com.bit.lib.domain.User;
import com.bit.lib.dto.NewBookDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired(required = false)
	AdminDAO adminDAO;

	@Override
	public boolean loginProc(User user) {

		return adminDAO.loginProc(user) != null;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void addBook(NewBookDTO newBookDTO) {

		adminDAO.addBookProc(newBookDTO); // book테이블에 도서등록
		newBookDTO = adminDAO.selectBookInfo(newBookDTO); // 등록한 book테이블에서 bookstatus에 넣어주기위한 bookcode,qty 가져와서 세팅.

		for (int i = 0; i < newBookDTO.getBookQty(); i++) {// bookstatus테이블에 book테이블의 qty만큼 반복해서 넣어주기
			String bookNo = "BC" + newBookDTO.getBookCode() + "BIT" + i;
			newBookDTO.setBookNo(bookNo); // bookNo는 어떻게 넣어주지? bookNo를 셋해보자
			newBookDTO.setBookCode(newBookDTO.getBookCode());
			adminDAO.addBookProc2(newBookDTO);
		}

	}

	

}
