package com.bit.lib.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.lib.domain.User;
import com.bit.lib.service.UserService;

@Controller
public class UserController {
	@SuppressWarnings("unused")
	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	/*
	 * @RequestMapping("login.do") public String login() { return "user/login"; }
	 */
	
	@RequestMapping(value = {"/","login.do"})
	public String index() {
		return "user/login";
	}
	
	@RequestMapping(value = "loginProc.do", method = RequestMethod.POST)
	public String loginProc(User user, HttpSession session) {
		session.setAttribute("id", user.getId());
		session.setAttribute("user", user);  
		String nextPage = userService.loginProc(user)? "redirect:/main.do":"user/login";
		return nextPage;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/login";
	}
	
	@RequestMapping(value="/join.do")
	public String join(User user) {
		
		return "user/join";
	}	
	
	
	@RequestMapping(value = "/joinProcess.do")
	public String joinProcess(User user) {
		//System.out.println(user);
		userService.joinUser(user);
		
		
		return "user/login";
	}
	
	
	@ResponseBody
	@RequestMapping(value= "/idCheck.do", method = RequestMethod.GET)
	public String joinIdCheck(HttpServletRequest request)  {
		
		String id = request.getParameter("id");
		int result = userService.idCheck(id);
		
		 return Integer.toString(result);
	}
	
	

	
	
	@RequestMapping("/viewUser.do")
	public String viewUser(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("user", userService.viewUser(id));
		return "mypage/userInfo/userInfo";
	}
	
	

	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute User user) {
		userService.updateUser(user);
		return "mypage/userInfo/userUpdateView";
	}
	
	
	
}

