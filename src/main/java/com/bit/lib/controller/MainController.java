package com.bit.lib.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bit.lib.dao.MainDAO;
import com.bit.lib.domain.Book;
import com.bit.lib.domain.Paging;

@Controller
public class MainController {
	
	@Autowired(required = false)
	MainDAO mainDAO;
	
	@Autowired
	Paging paging;

	@GetMapping("/main.do")
	public String main(Model model, HttpSession session) {
		
		model.addAttribute("mainView", mainDAO.mainView());
		model.addAttribute("mainViewCount", mainDAO.getMainView());
		
		String id = (String) session.getAttribute("id");		
		return id.equals("adm123")?"admin/adminMain":"main";
		
	}
	
	@GetMapping("/mainSub.do")
	@ResponseBody
	public Map<String, List<Book>> mainSub() {
		Map<String, List<Book>> alal = new HashMap<String, List<Book>>();
		alal.put("mainView", mainDAO.mainView());			
		return alal;
	}
	
	
	@GetMapping("/mainSearch.do")
	public String mainSearch(Model model, 
			@RequestParam("keyWord") String keyWord,
			@RequestParam(required = false, defaultValue = "1")int page,
			@RequestParam(required = false, defaultValue = "0")int range) {		
		
		int listCnt = mainDAO.getSearchBook(keyWord);		
		paging.pageInfo(page, range, listCnt);
		
		model.addAttribute("searchBook", mainDAO.searchBook(keyWord, paging.getStartList(),paging.getListSize()));
		model.addAttribute("paging", paging); 
		model.addAttribute("keyWord", keyWord); 
		
		
		return "book/mainSearch";
		
	}
}
