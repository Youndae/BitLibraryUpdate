package com.bit.lib.dao;

import javax.servlet.http.HttpSession;

import com.bit.lib.domain.User;


public interface UserDAO {
	
	User loginProc(User user);
	void logout(HttpSession session);
	void joinUser(User user);	
	int idCheck(String id);
	User viewUser(String id);
	void updateUser(User user);
}
