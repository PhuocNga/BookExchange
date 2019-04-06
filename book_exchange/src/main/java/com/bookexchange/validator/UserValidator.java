package com.bookexchange.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.bookexchange.model.User;
import com.bookexchange.service.RegistrationService;

@Component
public class UserValidator implements Validator {
	@Autowired
	RegistrationService registrationService;

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "user.name.error");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "user.email.error");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "user.password.error");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "user.confirmPassWord.error");
		User validateUser = (User) target;
		if (validateUser.getConfirmPassword().length() > 0
				&& !validateUser.getConfirmPassword().equals(validateUser.getPassword())) {
			errors.rejectValue("confirmPassword", "user.confirmPassWord.notMatch");
		}
		if (validateUser.getEmail().length() > 0) {
			Pattern pattern = Pattern
					.compile("^[_A-Za-z0-9-+]+(.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$");
			Matcher matcher = pattern.matcher(validateUser.getEmail());
			if (!matcher.matches()) {
				errors.rejectValue("email", "user.email.invalid");
			}
			if (registrationService.checkExistsEmail(validateUser.getEmail())) {
				errors.rejectValue("email", "user.email.exists");
			}
		}
	}

}
