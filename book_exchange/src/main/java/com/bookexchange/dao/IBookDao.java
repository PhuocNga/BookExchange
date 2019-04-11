package com.bookexchange.dao;

import java.util.List;

import com.bookexchange.model.Book;

public interface IBookDao {
	public List<Book>books();
	public Book getBookInformation(int id);
	public List<Book> findBookByUser(String email);
	public void addBook(Book book);
	public int maxID();
	public String deleteBook(int bookId);
}
