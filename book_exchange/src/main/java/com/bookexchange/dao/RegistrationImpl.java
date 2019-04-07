package com.bookexchange.dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.bookexchange.model.User;

@Repository
public class RegistrationImpl implements RegistrationDao {
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	BCryptPasswordEncoder encoder;

	@Override
	public boolean checkExistsEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where email=:email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		try {
			query.getSingleResult();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public void userRegister(User user) {
		Session session = sessionFactory.getCurrentSession();
		user.setPassword(encoder.encode(user.getPassword()));
		session.persist(user);
	}

	@Override
	public User getUserByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where email=:email");
		query.setParameter("email", email);
		try {
			return (User) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

}
