package com.bookexchange.dao;

import java.util.List;

import com.bookexchange.model.Book;

public interface IBookDao {
	public List<Book>books();
	public Book getBookInformation(int id);
	public List<Book> findBookByUser(String email);
	public void addBook(Book book);
	public int maxID();
	public List<Book> books(int start, int end);
	
	public List<Book> booksCategory(int start, int end, int caterogy);
	public List<Book> booksState(int start, int end, int state);
}
