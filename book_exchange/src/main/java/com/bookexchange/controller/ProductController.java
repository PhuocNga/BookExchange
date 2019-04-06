package com.bookexchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookexchange.service.IBookService;

@Controller
@RequestMapping(name="/books")
public class ProductController {
	@Autowired
	IBookService bookService;
	@RequestMapping(name="/book")
	public ModelAndView getBookInformation(@RequestParam int id) {
		return null;
	}
}
