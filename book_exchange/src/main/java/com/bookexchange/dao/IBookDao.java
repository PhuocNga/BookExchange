package com.bookexchange.dao;

import java.util.List;

import com.bookexchange.model.Book;

public interface IBookDao {
	public List<Book>books();
	public Book getBookInformation(int id);
}
