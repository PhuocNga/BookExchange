package com.bookexchange.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookexchange.model.Book;
import com.bookexchange.service.IBookService;
import com.bookexchange.service.ICategoryService;

@Controller
public class FilterController {
	
	@Autowired
	ICategoryService iCategoryService;
	
	@Autowired
	IBookService bookService;

	// filter with catrgory
	@RequestMapping(path="/filter/category/{id}")
	public String filterCategory(@PathVariable("id") int id, Model model) {
		List<Book> list = bookService.booksCategory(1, id);
		model.addAttribute("catogory", id);
		model.addAttribute("books", list);
		return "filter";
	}
	
	@RequestMapping(path="/filter/state/{id}")
	public String filterStateView(@PathVariable("id") int id, Model model) {
		List<Book> list = bookService.booksState(1, id);
		model.addAttribute("state", id);
		model.addAttribute("books", list);
		return "filterstate";
	}
	
	
	@RequestMapping(path = "/paginaion-category", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public @ResponseBody ResponseEntity<List<Book>> paginaion(@RequestParam(value = "page") int page,@RequestParam(value = "category") int category) {
		List<Book> list = bookService.booksCategory(page, category);
		return new ResponseEntity<List<Book>>(list, HttpStatus.ACCEPTED);
	}
	
	
	@RequestMapping(path = "/paginaion-state", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public @ResponseBody ResponseEntity<List<Book>> paginaionState(@RequestParam(value = "page") int page,@RequestParam(value = "state") int state) {
		List<Book> list = bookService.booksState(page, state);
		return new ResponseEntity<List<Book>>(list, HttpStatus.ACCEPTED);
	}
	
	
	
	
}
