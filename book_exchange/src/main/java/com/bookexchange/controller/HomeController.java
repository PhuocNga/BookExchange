package com.bookexchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookexchange.service.IBookService;

@Controller
public class HomeController {
	@Autowired
	IBookService bookService;

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("books", bookService.books());
		return "index";
	}

}
