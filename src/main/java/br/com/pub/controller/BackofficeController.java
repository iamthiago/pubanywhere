package br.com.pub.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.pub.service.PubService;

@Controller
@RequestMapping("backoffice")
public class BackofficeController {
	
	@Autowired
	private PubService pubService;
	
	private static Logger log = LoggerFactory.getLogger(BackofficeController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public String getBackofficeMainPage(HttpSession session, Map<String, Object> map) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("Usuario: " + user.getUsername() + " logado no backoffice");
		
		map.put("pubList", pubService.listAllPubs());
		
		return "backoffice";
	}
}