package com.bookexchange.dao;

import com.bookexchange.model.User;
public interface RegistrationDao {
	boolean checkExistsEmail(String email);

	void userRegister(User user);

	User getUserByEmail(String email);
}
