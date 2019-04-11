package com.bookexchange.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
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
	
	@Override
	public List<Book> findBookByUser(String email) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = "FROM Book where userByUserId.email = :email";
		Query query = session.createQuery(queryString);
		query.setParameter("email", email);
		@SuppressWarnings("unchecked")
		List<Book> books = query.getResultList();
		return books;
	}

	@Override
	public void addBook(Book book) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(book);
	}
	
	public int maxID() {
		Session session = sessionFactory.getCurrentSession();
		List<Book> max = session.createQuery("from Book order by id asc").getResultList();
		return max.get(max.size()-1).getId();
	}

	@Override
	public List<Book> books(int start, int end) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book");
		query.setFirstResult(start);
		query.setMaxResults(end-start);
		return query.getResultList();
	}

	@Override
	public List<Book> booksCategory(int start, int end, int caterogy) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book where bookCategory="+ caterogy);
		query.setFirstResult(start);
		query.setMaxResults(end-start);
		return query.getResultList();
	}

	@Override
	public List<Book> booksState(int start, int end, int state) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book where bookState="+ state);
		query.setFirstResult(start);
		query.setMaxResults(end-start);
		return query.getResultList();
	}

}
