package com.bookexchange.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookexchange.model.State;

@Repository
public class StateDaoImpl{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public List<State> getAllCate() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from State").getResultList();
	}
}
