package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;
import com.bit.lib.dto.NewBookDTO;

public interface AdminService {
	boolean loginProc(User user);
	void logout(HttpSession session);
	void addBook(NewBookDTO newBookDTO);
}
