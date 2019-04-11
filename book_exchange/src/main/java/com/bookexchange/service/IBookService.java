package com.bookexchange.service;

import java.util.List;

import com.bookexchange.model.Book;

public interface IBookService {
	public List<Book> books();
	
	public List<Book> books(int page);
	
	public List<Book> booksCategory(int page, int category);
	
	public List<Book> booksState(int page, int state);

	public Book getBookInformation(int id);
//	Th�i
	
	public List<Book> findBookByUser(String email);
	public void addBook(Book book);
	public int maxID();
	public String deleteBook(int bookId);
	public void updateBook(Book book);

}
