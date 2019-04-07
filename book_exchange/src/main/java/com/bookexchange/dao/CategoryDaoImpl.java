package com.bookexchange.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookexchange.model.Bookcategory;

@Repository
public class CategoryDaoImpl implements ICategoryDAO{
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Bookcategory> getAllCate() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from Bookcategory").getResultList();
	}
}
