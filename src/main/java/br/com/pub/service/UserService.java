package br.com.pub.service;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Authorities;
import br.com.pub.domain.PubUser;
import br.com.pub.domain.Users;
import br.com.pub.enumeration.Roles;
import br.com.pub.form.UserForm;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.repository.RolesRepository;
import br.com.pub.repository.UserRepository;
import br.com.pub.utils.ResultMessage;

import com.googlecode.ehcache.annotations.TriggersRemove;

@Service
public class UserService {
	
	@Autowired private UserRepository userRepository;
	@Autowired private RolesRepository rolesRepository;
	@Autowired private MessageService message;
	
	@TriggersRemove(
			cacheName={
					"abstractFindCache",
					"findUserByUsernameCache",
					"findUserByNameCache",
					"userHasWishFavoritePubCache"},
					removeAll=true)
	public void createNewUser(UserForm form) {
		PubUser pubUser = new PubUser();
		pubUser.setName(form.getName());
		pubUser.setEmail(form.getEmail());
		pubUser.setEmailHash(form.getEmail().replace("@", "."));
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
	}
	
	@TriggersRemove(
			cacheName={
					"abstractFindCache",
					"findUserByUsernameCache",
					"findUserByNameCache",
					"userHasWishFavoritePubCache"},
					removeAll=true)
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

	@TriggersRemove(
			cacheName={
					"abstractFindCache",
					"findUserByUsernameCache",
					"findUserByNameCache",
					"userHasWishFavoritePubCache"},
					removeAll=true)
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
}