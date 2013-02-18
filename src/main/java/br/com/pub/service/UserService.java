package br.com.pub.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Authorities;
import br.com.pub.domain.Pub;
import br.com.pub.domain.Users;
import br.com.pub.enumeration.Roles;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.repository.RolesRepository;
import br.com.pub.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired private UserRepository userRepository;
	@Autowired private RolesRepository rolesRepository;
	
	public Users insertOrUpdatePubUser(Pub pub, HttpServletRequest request) {
		
		Users user = userRepository.findUserByUsername(pub.getEmail());
		
		if (!StringUtils.isEmpty(pub.getEmail()) && user == null) {
			user = new Users();
			user.setUsername(pub.getEmail());
			user.setPassword(RandomStringUtils.randomAlphanumeric(15));
			user.setEnabled(true);
			
			Authorities auth = rolesRepository.find(Roles.ROLE_USER.getCodigo());
			if (auth != null) {
				user.setAuthorities(auth);
				user = userRepository.insert(user);
			}
			
			EmailMessageCreator.sendUserDetailsMail(pub, user, true, request);
			
		} else if (!StringUtils.isEmpty(pub.getEmail()) && user != null) {
			userRepository.update(user);
			EmailMessageCreator.sendUserDetailsMail(pub, user, false, request);
		
		}
		
		return user;
	}

	public Users findUserByUsername(String username) {
		return userRepository.findUserByUsername(username.trim());
	}

	public void updateUser(Users user) {
		userRepository.update(user);
	}
}