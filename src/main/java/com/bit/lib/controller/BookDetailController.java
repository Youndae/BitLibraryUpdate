package com.bit.lib.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.lib.service.BookDetailService;

@Controller
public class BookDetailController {

	@Autowired
	private BookDetailService bookDetailService;
	
	/*
	 * //도서 상세페이지
	 * 
	 * @RequestMapping(value = "/bookDetail.do", method=RequestMethod.GET) public
	 * String bookPage(Model model, @RequestParam("bookCode") int bookCode,
	 * HttpSession session) { String id = (String) session.getAttribute("id");
	 * model.addAttribute("bookdtList", bookDetailService.bookPage(bookCode));
	 * model.addAttribute("bookdt", bookDetailService.bookDetail(bookCode));
	 * System.out.println(bookDetailService.bookDetail(bookCode));
	 * System.out.println(bookDetailService.bookPage(bookCode));
	 * 
	 * model.addAttribute("history", bookDetailService.rentCount(id));
	 * System.out.println("historycount Ok");
	 * System.out.println(bookDetailService.rentCount(id));
	 * 
	 * return "book/bookDetail"; }
	 */
	
	
	//도서 상세페이지
	@RequestMapping(value = "/bookDetail.do", method=RequestMethod.GET)
	public String bookPage(Model model, @RequestParam("bookCode") int bookCode, HttpSession session) {
		String id = (String) session.getAttribute("id");		
		/* model.addAttribute("bookdtList", bookDetailService.bookPage(bookCode)); */
		model.addAttribute("bookdt", bookDetailService.bookDetail(bookCode));
		System.out.println(bookDetailService.bookDetail(bookCode));
		/* System.out.println(bookDetailService.bookPage(bookCode)); */
		
		model.addAttribute("history", bookDetailService.rentCount(id));
		System.out.println("historycount Ok");
		System.out.println(bookDetailService.rentCount(id));

		return "book/bookDetail";
	}
}

