package com.bookexchange.service;

import com.bookexchange.model.User;

public interface RegistrationService {
	boolean checkExistsEmail(String email);

	void userRegister(User user);

	User getUserByEmail(String email);
}
