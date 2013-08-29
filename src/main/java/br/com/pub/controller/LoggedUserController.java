package br.com.pub.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Users;
import br.com.pub.form.MessageForm;
import br.com.pub.service.PubMessageService;
import br.com.pub.service.UserService;
import br.com.pub.utils.ResultMessage;

/**
 * @author Thiago
 * Classe criada para gerenciar somente usuario logado, necessitando de permissões para visualizar o conteudo
 */
@Controller
@RequestMapping("user")
public class LoggedUserController extends UserCommons {
	
	@Autowired private UserService userService;
	@Autowired private PubMessageService pubMessageService;
	
	@RequestMapping(value = "/{hash}", method = RequestMethod.GET)
	public String getUserPage(@PathVariable("hash") String hash, HttpSession session, Map<String, Object> map, HttpServletRequest request) {
		
		getUserSession(session);
		
		Users user = userService.findUserByEmailHash(hash);
		if (user != null) {
			map.put("user", user);
			return "user/user";
		} else {
			return "new/404";
		}		
	}
	
	@ResponseBody
	@RequestMapping(value = "postPubReview", method = RequestMethod.POST)
	public List<ResultMessage> postPubReview(@ModelAttribute("messageForm") MessageForm messageForm, HttpServletRequest request, HttpSession session, Map<String, Object> map) {
		Users userSession = getUserSession(session);
		return pubMessageService.registerReview(messageForm, request, userSession);
	}
}