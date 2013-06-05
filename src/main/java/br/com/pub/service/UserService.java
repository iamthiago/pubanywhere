package br.com.pub.service;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Authorities;
import br.com.pub.domain.PubUser;
import br.com.pub.domain.Users;
import br.com.pub.dto.TopUserDTO;
import br.com.pub.enumeration.Roles;
import br.com.pub.enumeration.StaticImage;
import br.com.pub.form.UserForm;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.repository.PubMessageRepository;
import br.com.pub.repository.RolesRepository;
import br.com.pub.repository.UserRepository;
import br.com.pub.utils.PubUtils;
import br.com.pub.utils.ResultMessage;

@Service
public class UserService {
	
	@Autowired private UserRepository userRepository;
	@Autowired private RolesRepository rolesRepository;
	@Autowired private PubMessageRepository pubMessageRepository;
	@Autowired private MessageService message;
	
	private static final Logger log = LoggerFactory.getLogger(UserService.class);
	
	public List<ResultMessage> createNewUser(UserForm form, HttpServletRequest request) {
		
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		
		Users userExists = this.findUserByUsername(form.getEmail());
		if (userExists != null) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.info")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered.exist")));
			return lista;
		}
		
		try {
			
			PubUser pubUser = new PubUser();
			pubUser.setName(form.getName());
			pubUser.setEmail(form.getEmail());
			pubUser.setEmailHash(PubUtils.removeInvalidCharacters(form.getEmail().toLowerCase().split("\\@")[0]));
			pubUser.setHash("user"+RandomStringUtils.randomAlphanumeric(15));
			pubUser.setSince(new Date());
			
			if (form.getPassword().equals(form.getConfirmPassword())) {
				Users newUser = new Users();
				newUser.setUsername(form.getEmail().toLowerCase().trim());
				newUser.setPassword(form.getPassword().trim());
				newUser.setEnabled(true);
				newUser.setPubUser(pubUser);
				
				Authorities auth = rolesRepository.find(Roles.ROLE_USER.getCodigo());
				if (auth != null) {
					newUser.setAuthorities(auth);
					userRepository.insert(newUser);
				}
			}
			
			PubUtils.uploadDefaultImage(StaticImage.USER, pubUser.getEmailHash());
			
			log.info("criado usuario: " + form.getName() + " - " + form.getEmail());
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered")));
		
		} catch (Exception e) {
			e.printStackTrace();
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.edit.error")));
		}
		
		return lista;
		
	}
	
	public boolean resetPassword(String emailHash, String hash, HttpServletRequest request) {		
		Users user = userRepository.findUserByEmailHash(emailHash);
		if (user != null) {
			if (user.getPubUser().getHash().equals(hash)) {
				String newPassword = RandomStringUtils.randomAlphanumeric(15);
				user.setPassword(newPassword);	
				userRepository.update(user);
				EmailMessageCreator.resetPassword(user.getPubUser().getEmail(), newPassword, request);
			} else {
				return false;
			}
		} else {
			return false;
		}
		
		return true;
	}

	public Users findUserByUsername(String username) {
		return userRepository.findUserByUsername(username.trim());
	}
	
	public Users findUserByEmailHash(String name) {
		return userRepository.findUserByEmailHash(name);
	}

	public List<ResultMessage> updateUserProfile(UserForm form, HttpServletRequest request){
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		
		if (!form.getPassword().equals(form.getConfirmPassword())) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered.invalidPass")));
			return lista;
		}
		
		try {
			Users user = userRepository.findUserByUsername(form.getEmail());
			user.getPubUser().setName(form.getName());
			user.getPubUser().setEmail(form.getEmail());
			user.setPassword(form.getPassword());
			userRepository.update(user);
		} catch (Exception e) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.edit.error")));
			e.printStackTrace();
		}
		
		lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
		lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.edit.success")));
		
		return lista;
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