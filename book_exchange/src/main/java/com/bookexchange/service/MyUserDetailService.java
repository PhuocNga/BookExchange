package com.bookexchange.service;

import java.util.Arrays;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailService")
public class MyUserDetailService implements UserDetailsService{
	@Autowired
	RegistrationService registrationService;
	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		com.bookexchange.model.User user=registrationService.getUserByEmail(username);
		List<GrantedAuthority>authorities=Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));
		User userDetail=new User(user.getEmail(), user.getPassword(), authorities);
		return userDetail;
	}

}
