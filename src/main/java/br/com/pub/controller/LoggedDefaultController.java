package br.com.pub.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.pub.domain.Users;

/**
 * @author Thiago
 * Classe criada para gerenciar a pagina principal do usuario logado, redirecionando para uma url amigavel
 */
@Controller
@RequestMapping("me")
public class LoggedDefaultController extends UserCommons {
	
	@RequestMapping
	public String getLoggedUserPage(HttpSession session, Map<String, Object> map) {
		Users loggedUser = getUserSession(session);
		map.put("user", loggedUser);
		return "new/user/user";
	}
}