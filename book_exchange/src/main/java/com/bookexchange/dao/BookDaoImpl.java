package com.bookexchange.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookexchange.model.Book;

@Repository
public class BookDaoImpl implements IBookDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Book> books() {
		String hql = "from Book";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		return query.getResultList();
	}

	@Override
	public Book getBookInformation(int id) {
		Session session = sessionFactory.getCurrentSession();
		Book book = session.get(Book.class, id);
		return book;
	}

}
