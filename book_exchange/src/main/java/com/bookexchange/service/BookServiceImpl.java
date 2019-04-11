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

	// Thái
	@Override
	public List<Book> findBookByUser(String email) {
		return bookDao.findBookByUser(email);
	}

	@Override
	public void addBook(Book book) {
		// TODO Auto-generated method stub
		bookDao.addBook(book);
	}

	/**
	 * @param page
	 * @return {@link List<Book>}}
	 * 
	 *         page = 1, start = 0 and end = 9 | Formula: start = (page - 1) * 9 )
	 *         and end = (page * 9 - 1) page = 2, start = 10 and end = 18 | Formula:
	 *         start = (page - 1) * 9 + 1) and end = (page * 9) page = 3, start = 19
	 *         and end = 27 | Formula: start = (page - 1) * 9 + 1) and end = (page *
	 *         9) page = 4, start = 28 and end = 36 | Formula: start = (page - 1) *
	 *         9 + 1) and end = (page * 9)
	 */
	@Override
	public List<Book> books(int page) {
		if (page == 1) {
			return bookDao.books((page - 1) * 9, (page * 9));
		}
		return bookDao.books((page - 1) * 9, (page * 9));
	}

	@Override
	public List<Book> booksCategory(int page, int category) {
		if (page == 1) {
			return bookDao.booksCategory((page - 1) * 9, (page * 9), category);
		}
		return bookDao.booksCategory((page - 1) * 9, (page * 9), category);
	}

	@Override
	public List<Book> booksState(int page, int state) {
		if (page == 1) {
			return bookDao.booksState((page - 1) * 9, (page * 9), state);
		}
		return bookDao.booksState((page - 1) * 9, (page * 9), state);
	}

	public String deleteBook(int bookId) {
		return bookDao.deleteBook(bookId);
	}

}
