package com.bookexchange.controller;

import java.util.HashMap;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import com.bookexchange.model.User;
import com.bookexchange.model.UserJsonEntity;
import com.bookexchange.service.RegistrationService;
import com.bookexchange.validator.UserValidator;

@Controller
public class RegistrationController {
	@Autowired
	UserValidator uservalidator;
	@Autowired
	RegistrationService registrationService;
	@Autowired
	MessageSource message;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(uservalidator);
	}

	@PostMapping(value = "/signup")
	@ResponseBody
	public UserJsonEntity signUp(@Valid User user, BindingResult result, WebRequest request) {
		UserJsonEntity userJson = new UserJsonEntity();
		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			String error;
			for (int i = 0; i < result.getFieldErrors().size(); i++) {
				error = message.getMessage(result.getFieldErrors().get(i).getCode(), null, request.getLocale());
				errorMap.put(result.getFieldErrors().get(i).getField(), error);
				userJson.setErrorMap(errorMap);
			}
			userJson.setError(true);
		} else {
			userJson.setError(false);
			registrationService.userRegister(user);
		}
		return userJson;
	}

	@GetMapping("/signin")
	public String login(@RequestParam(name = "error", required = false) boolean error,
			@RequestParam(name = "success", required = false) boolean success,Model model,WebRequest request) {
		if(error) {
			model.addAttribute("loginFail", message.getMessage("register.user.login_fail", null, request.getLocale()));
		}else {
			if(success) {
				return "index";
			}
		}
		return "login";
	}
}
