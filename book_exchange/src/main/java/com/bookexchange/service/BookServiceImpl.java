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

}
