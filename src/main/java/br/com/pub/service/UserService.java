package br.com.pub.service;

import java.util.ArrayList;
import java.util.List;

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
				setPubToUser(pub, user);
				user = userRepository.insert(user);
			}
			
			EmailMessageCreator.sendUserDetailsMail(pub, user, true, request);
			
		} else if (!StringUtils.isEmpty(pub.getEmail()) && user != null) {
			setPubToUser(pub, user);
			userRepository.update(user);
			EmailMessageCreator.sendUserDetailsMail(pub, user, false, request);
		
		}
		
		return user;
	}

	private void setPubToUser(Pub pub, Users user) {
		List<Pub> pubList = new ArrayList<Pub>();
		if (user.getPubs() == null) {
			pubList.add(pub);
			user.setPubs(pubList);
		} else {
			boolean isEquals = false;
			pubList = new ArrayList<Pub>(user.getPubs());
			for (Pub existPub : pubList) {
				if (existPub.getPubId().equals(pub.getPubId())) {
					isEquals = true;
					break;
				}
			}
			if (!isEquals) {
				user.getPubs().add(pub);
			}
		}
	}

	public Users findUserByUsername(String username) {
		return userRepository.findUserByUsername(username.trim());
	}

	public void updateUser(Users user) {
		userRepository.update(user);
	}
}