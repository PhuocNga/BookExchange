package com.bookexchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
import com.bookexchange.model.Book;
import com.bookexchange.model.Bookcategory;
import com.bookexchange.service.IBookService;
import com.bookexchange.service.ICategoryService;

@Controller
public class HomeController {
	@Autowired
	IBookService bookService;

	@Autowired
	ICategoryService categoryService;

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("books", bookService.books(1));
		return "index";
	}

	@RequestMapping(path = "/paginaion", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public @ResponseBody ResponseEntity<List<Book>> paginaion(@RequestParam(value = "page") int page) {
		List<Book> list = bookService.books(page);
		return new ResponseEntity<List<Book>>(list, HttpStatus.ACCEPTED);
	}

	@RequestMapping(path = "/bookcategorys", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public @ResponseBody ResponseEntity<List<Bookcategory>> bookcategorys() {
		List<Bookcategory> list = categoryService.getAllCate();
		return new ResponseEntity<List<Bookcategory>>(list, HttpStatus.ACCEPTED);
	}
	
	

	
}
