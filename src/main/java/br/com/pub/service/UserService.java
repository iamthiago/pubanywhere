package br.com.pub.service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Authorities;
import br.com.pub.domain.FacebookUser;
import br.com.pub.domain.Users;
import br.com.pub.dto.TopUserDTO;
import br.com.pub.enumeration.Roles;
import br.com.pub.repository.PubMessageRepository;
import br.com.pub.repository.RolesRepository;
import br.com.pub.repository.UserRepository;
import br.com.pub.utils.ResultMessage;

@Service
public class UserService {
	
	@Autowired private UserRepository userRepository;
	@Autowired private RolesRepository rolesRepository;
	@Autowired private PubMessageRepository pubMessageRepository;
	
	private static final Logger log = LoggerFactory.getLogger(UserService.class);
	
	public List<ResultMessage> createNewUser(Facebook facebook, HttpServletRequest request) {
		
		FacebookProfile facebookProfile = facebook.userOperations().getUserProfile();
		
		List<ResultMessage> lista = new LinkedList<ResultMessage>();
		
		Users userExists = this.findUserByUsername(facebookProfile.getEmail());
		if (userExists != null) {
			lista.add(new ResultMessage("FB_LOGIN_SUCCESS", true));
			setUserSpringContext(userExists);
			return lista;
		}
		
		try {
			
			Users newUser = new Users();
			newUser.setUsername(facebookProfile.getEmail().toLowerCase().trim());
			
			newUser.setEnabled(true);
			
			Authorities auth = rolesRepository.find(Roles.ROLE_USER.getCodigo());
			if (auth != null) {
				newUser.setAuthorities(auth);
				
				FacebookUser facebookUser = new FacebookUser();
				facebookUser.setFacebookProfileId(Long.parseLong(facebookProfile.getId()));
				facebookUser.setFirstName(facebookProfile.getFirstName());
				facebookUser.setLastName(facebookProfile.getLastName());
				facebookUser.setFullName(facebookProfile.getName());
				facebookUser.setGender(facebookProfile.getGender());
				facebookUser.setEmail(facebookProfile.getEmail());
				
				newUser.setFacebookUser(facebookUser);
				
				userRepository.insert(newUser);
			}
			
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
		authorities.add(new SimpleGrantedAuthority(user.getAuthorities().getAuthority()));
		Authentication authentication = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), authorities);
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}

	public Users findUserByUsername(String username) {
		return userRepository.findUserByUsername(username.trim());
	}
	
	public Users findUserByEmailHash(String name) {
		return userRepository.findUserByEmailHash(name);
	}
	
	public List<Users> getTopUsers() {
		List<Users> list = new ArrayList<Users>();
		List<TopUserDTO> topUsers = pubMessageRepository.getTopUsers();
		for (TopUserDTO topUserDTO : topUsers) {
			Users userFound = userRepository.findUserByUsername(topUserDTO.getUsername());
			list.add(userFound);
		}
		
		return list;
	}
}