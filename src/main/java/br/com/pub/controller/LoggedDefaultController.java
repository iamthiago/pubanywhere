package br.com.pub.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.pub.domain.Users;
import br.com.pub.form.UploadForm;
import br.com.pub.form.UserForm;
import br.com.pub.service.PubMessageService;
import br.com.pub.service.UserService;

/**
 * @author Thiago
 * Classe criada para gerenciar a pagina principal do usuario logado, redirecionando para uma url amigavel
 */
@Controller
@RequestMapping("me")
public class LoggedDefaultController {
	
	@Autowired private UserService userService;
	@Autowired private PubMessageService pubMessageService;
	
	private static final Logger log = LoggerFactory.getLogger(LoggedDefaultController.class);

	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@RequestMapping(method = RequestMethod.GET)
	public String getLoggedUserPage(HttpSession session, Map<String, Object> map) {
		Users loggedUser = null;
		if (session.getAttribute("loggedUser") == null) {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			loggedUser = userService.findUserByUsername(user.getUsername());
			session.setAttribute("loggedUser", loggedUser);
		} else {
			loggedUser = (Users) session.getAttribute("loggedUser");
		}
		
		map.put("user", loggedUser);
		log.info("Usuario: " + loggedUser.getUsername() + " logado no sistema");
		
		map.put("lastReviews", pubMessageService.getPubReviewByUser(loggedUser.getUsername()));
		
		map.put("form", new UserForm());
		map.put("uploadForm", new UploadForm());
		
		return "user/user";
	}
	
}
