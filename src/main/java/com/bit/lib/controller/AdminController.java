package com.bit.lib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.lib.dto.NewBookDTO;
import com.bit.lib.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
		
	@RequestMapping("newBook.do")
	public String getNewBook() {
		return "admin/newBook";
	}
	
		
	@PostMapping(value="addBook.do")
	public String getaddbook(NewBookDTO book, @RequestParam("file") MultipartFile file) {
		
		String path="/"+file.getOriginalFilename(); //선택한 파일 이름을 가져와서
		book.setImagePath(path); //DTO에 넣어주고
		adminService.addBook(book); //DB에 경로를 넣어주기 위해 service로 보낸다.
		
		return "admin/newBookSuccess";
	}
}
