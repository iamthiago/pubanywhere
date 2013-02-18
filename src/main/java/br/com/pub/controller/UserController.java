package br.com.pub.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.pub.domain.Pub;
import br.com.pub.domain.Users;
import br.com.pub.enumeration.Roles;
import br.com.pub.form.UserForm;
import br.com.pub.service.AmazonService;
import br.com.pub.service.PubService;
import br.com.pub.service.UserService;
import br.com.pub.validation.PubValidations;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired private PubService pubService;
	@Autowired private UserService userService;
	
	private static Logger log = LoggerFactory.getLogger(UserController.class);
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@RequestMapping(method = RequestMethod.GET)
	public String getUserMainPage(HttpSession session, Map<String, Object> map, HttpServletRequest request) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("Usuario: " + user.getUsername() + " logado no sistema");
		
		if(request.isUserInRole(Roles.ROLE_ADMIN.getDescricao())){
			map.put("pubList", pubService.listAllPubs());
		} else {
			map.put("pubList", pubService.listPubsByUsername(user.getUsername()));
		}
		
		map.put("userForm", new UserForm());
		map.put("username", user.getUsername());
		return "backoffice";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')") 
	@RequestMapping(value = "editPub/{pubId}", method = RequestMethod.GET)
	public String editPub(@PathVariable("pubId") String pubId, Map<String, Object> map, HttpServletRequest request) {
		if(request.isUserInRole(Roles.ROLE_ADMIN.getDescricao())){
			map.put("disabled", false);
		} else {
			map.put("disabled", true);
		}
		
		map.put("pub", pubService.findPubById(pubId));
		return "editPub";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@RequestMapping(value = "savePub", headers={"content-type=multipart/form-data"}, method = RequestMethod.POST)
	public String savePub(@ModelAttribute("pub") Pub form, Map<String, Object> map) {
		
		pubService.savePub(PubValidations.valid(form));
		
		if (!form.getFile().isEmpty() && form.getFile().getSize() < 1000000) {
			AmazonService.upload(form);
		}		
		
		return "redirect:/backoffice";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute("userForm") UserForm form, Map<String, Object> map) {
		Users user = userService.findUserByUsername(form.getUsername());
		if (form.getSenha().equals(form.getConfirmarSenha())) {
			user.setPassword(form.getSenha());
			userService.updateUser(user);
		} else {
			log.error("Password does not match the confirm password");
		}
		return "redirect:/backoffice";
	}
}