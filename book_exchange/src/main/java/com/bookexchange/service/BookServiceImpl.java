package com.bookexchange.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookexchange.dao.IBookDao;
import com.bookexchange.model.Book;

@Service
@Transactional
public class BookServiceImpl implements IBookService {
	@Autowired
	IBookDao bookDao;

	@Override
	public List<Book> books() {
		return bookDao.books();
	}

	@Override
	public Book getBookInformation(int id) {
		return bookDao.getBookInformation(id);
	}
	
	public int maxID() {
		return bookDao.maxID();
	}
	
	//Thái
	@Override
	public List<Book> findBookByUser(String email) {
		return bookDao.findBookByUser(email);
	}

	@Override
	public void addBook(Book book) {
		// TODO Auto-generated method stub
		bookDao.addBook(book);
	}

	@Override
	public String deleteBook(int bookId) {
		return bookDao.deleteBook(bookId);
	}

}
