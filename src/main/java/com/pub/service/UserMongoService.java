package com.pub.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.stereotype.Service;

import com.pub.enumeration.Roles;
import com.pub.mongo.domain.FacebookUser;
import com.pub.mongo.domain.Users;
import com.pub.repository.UserCustomMongoRepository;
import com.pub.repository.UserMongoRepository;
import com.pub.utils.ResultMessage;


@Service
public class UserMongoService {
	
	private static final Logger log = LoggerFactory.getLogger(UserMongoService.class);
	
	@Autowired private MongoTemplate mongoTemplate;
	@Autowired private UserMongoRepository userMongoRepository;
	@Autowired private UserCustomMongoRepository userCustomMongoRepository;
	
	public List<ResultMessage> createNewUser(Facebook facebook, HttpServletRequest request) {
		
		FacebookProfile facebookProfile = facebook.userOperations().getUserProfile();
		
		List<ResultMessage> lista = new LinkedList<ResultMessage>();
		
		Users userExists = userMongoRepository.findByUsername(facebookProfile.getEmail());
		if (userExists != null) {
			lista.add(new ResultMessage("FB_LOGIN_SUCCESS", true));
			setUserSpringContext(userExists);
			return lista;
		}
		
		try {
			
			Users newUser = new Users();
			newUser.setUsername(facebookProfile.getEmail().toLowerCase().trim());
			
			newUser.setEnabled(true);
			
			newUser.setAuthorities(Arrays.asList(Roles.ROLE_USER.getDescricao()));
			
			FacebookUser facebookUser = new FacebookUser();
			facebookUser.setFacebookProfileId(Long.parseLong(facebookProfile.getId()));
			facebookUser.setFirstName(facebookProfile.getFirstName());
			facebookUser.setLastName(facebookProfile.getLastName());
			facebookUser.setFullName(facebookProfile.getName());
			facebookUser.setGender(facebookProfile.getGender());
			facebookUser.setEmail(facebookProfile.getEmail());
			
			newUser.setFacebookUser(facebookUser);
			
			mongoTemplate.save(facebookUser);
			userMongoRepository.save(newUser);
			
			setUserSpringContext(newUser);
			
			log.info("criado usuario: " + facebookProfile.getName() + " - " + facebookProfile.getEmail());

		} catch (Exception e) {
			log.error(e.getMessage());
			lista.add(new ResultMessage("FB_REVOKE_ACCESS", true));
		}
		
		return lista;
	}
	
	private void setUserSpringContext(Users user) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String authority : user.getAuthorities()) {
			authorities.add(new SimpleGrantedAuthority(authority));
		}
		Authentication authentication = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), authorities);
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}
	
	public Users findByUsername(String username) {
		return userMongoRepository.findByUsername(username);
	}
	
	public List<Users> findTopUsers() {
		return userCustomMongoRepository.findTopUsers();
	}
}