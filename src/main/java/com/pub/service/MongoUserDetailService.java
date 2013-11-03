package com.pub.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.pub.mongo.domain.Users;
import com.pub.repository.UserMongoRepository;

@Service
public class MongoUserDetailService implements UserDetailsService {

	@Autowired private UserMongoRepository userMongoRepository;
	
	private static final boolean enabled = true;
	private static final boolean accountNonExpired = true;
	private static final boolean credentialsNonExpired = true;
	private static final boolean accountNonLocked = true;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		final Users user = userMongoRepository.findByUsername(username);
		if (user == null) {
			return null;
		}
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String authority : user.getAuthorities()) {
			authorities.add(new SimpleGrantedAuthority(authority));
		}
		
		return new User(user.getUsername(), user.getPassword(), enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
}
