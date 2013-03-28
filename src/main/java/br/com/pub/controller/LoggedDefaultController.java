package br.com.pub.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.pub.domain.Users;
import br.com.pub.form.UploadForm;
import br.com.pub.form.UserForm;
import br.com.pub.service.PubMessageService;

/**
 * @author Thiago
 * Classe criada para gerenciar a pagina principal do usuario logado, redirecionando para uma url amigavel
 */
@Controller
@RequestMapping("me")
public class LoggedDefaultController extends UserCommons {
	
	@Autowired private PubMessageService pubMessageService;
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@RequestMapping(method = RequestMethod.GET)
	public String getLoggedUserPage(HttpSession session, Map<String, Object> map) {
		Users loggedUser = getUserSession(session);
		
		map.put("lastReviews", pubMessageService.getPubReviewByUser(loggedUser.getUsername()));
		
		map.put("user", loggedUser);
		map.put("form", new UserForm());
		map.put("uploadForm", new UploadForm());
		
		return "user/user";
	}
}
