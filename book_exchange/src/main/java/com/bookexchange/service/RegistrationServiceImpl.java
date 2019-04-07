package com.bookexchange.service;

import javax.transaction.Transactional;
import javax.xml.bind.annotation.XmlRegistry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookexchange.dao.RegistrationDao;
import com.bookexchange.model.User;

@Service
@Transactional
public class RegistrationServiceImpl implements RegistrationService {
	@Autowired
	RegistrationDao registrationDao;
	
	@Override
	public boolean checkExistsEmail(String email) {
		return registrationDao.checkExistsEmail(email);
	}

	@Override
	public void userRegister(User user) {
		registrationDao.userRegister(user);
	}

	@Override
	public User getUserByEmail(String email) {
		return registrationDao.getUserByEmail(email);
	}

}
