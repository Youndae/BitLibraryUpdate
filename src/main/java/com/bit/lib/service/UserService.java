package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;

public interface UserService {
	boolean loginProc(User user);
	void logout(HttpSession session);
	//회원가입
	void joinUser(User user);

	int idCheck(String id);
	

	User viewUser(String id);
	
	
	void updateUser(User user);
	
}
