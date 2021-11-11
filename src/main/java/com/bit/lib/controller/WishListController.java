package com.bit.lib.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.lib.service.BookDetailService;
import com.bit.lib.service.WishListService;

@Controller
public class WishListController {

	@Autowired
	private WishListService wishListService;

	@Autowired
	private BookDetailService bookDetailService;
	
	//wishlist페이지에 목록 가져오기
	@RequestMapping("wishList.do")
	public String getWishList(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		model.addAttribute("wishList", wishListService.selectWishList(id));
		model.addAttribute("history", bookDetailService.rentCount(id)); //대여권수 한도 주기위해서
		return "mypage/wishList/wishList";
	}

	//책상세페이지에서 위시리스트버튼 누르면 해당책이 위시리스트에 담긴다.
	@PostMapping(value = "/addWishList.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getAddWishList(@RequestParam List<String> chknos, HttpSession session) {

		String id = (String) session.getAttribute("id");
		wishListService.addWishList(chknos, id); 

	}

	//위시리스트페이지에서 선택한 책 삭제
	@PostMapping(value = "/deleteWishList.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getDeleteWishList(@RequestParam List<String> chkcodes) {

        wishListService.deleteWishList(chkcodes);

	}
	
	//위시리스트페이지에서 선택한 책 대여
	@PostMapping(value = "/wishRent.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getAddRent(@RequestParam List<String> chknos, @RequestParam List<String> chkcodes, HttpSession session) {
		String id = (String) session.getAttribute("id");
		wishListService.addRent(chknos, id);
		wishListService.deleteWishList(chkcodes);
	}
	

	//위시리스트페이지에서 선택한 책 예약
	@PostMapping(value = "/wishReserve.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void getAddReserve(@RequestParam List<String> chknos, @RequestParam List<String> chkcodes, HttpSession session) {
		String id = (String) session.getAttribute("id");
		wishListService.addReserve(id, chknos);
		wishListService.deleteWishList(chkcodes);
	}
	
	

}
