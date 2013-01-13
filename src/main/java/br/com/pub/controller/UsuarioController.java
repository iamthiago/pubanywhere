package br.com.pub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.pub.form.UserForm;
import br.com.pub.service.UsuarioService;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioService usuarioService;
	
	private boolean newUser = false;
	
	@RequestMapping(value = "/newUser", method = RequestMethod.GET)
	public String newUser(ModelMap map) {
		newUser = true;
		map.addAttribute(newUser);
		return "users";
	}
	
	@RequestMapping(value = "/createNewUser", method = RequestMethod.POST)
	public String createNewUser(@ModelAttribute UserForm form) {
		usuarioService.createNewUser(form);
		return "login";
	}
}
