package com.bit.lib.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.UserDAO;
import com.bit.lib.domain.User;

@Service("userService")
public class UserServiceImpl implements UserService {

		@Autowired
		UserDAO userDAO;

		@Override
		public boolean loginProc(User user) {
			// TODO Auto-generated method stub
			return userDAO.loginProc(user)!=null;
		}

		@Override
		public void logout(HttpSession session) {
			// TODO Auto-generated method stub
			session.invalidate();
		}

		@Override
		public void joinUser(User user) {
			// TODO Auto-generated method stub
			userDAO.joinUser(user);
		}

		@Override
		public int idCheck(String id) {
			int result = userDAO.idCheck(id);
			return result;
		}

		@Override
		public User viewUser(String id) {
			
			return userDAO.viewUser(id);
		}

		@Override
		public void updateUser(User user) {
			// TODO Auto-generated method stub
			userDAO.updateUser(user);
		}


		

		
		
		
}
