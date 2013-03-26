package br.com.pub.controller;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Users;
import br.com.pub.form.PasswordForm;
import br.com.pub.form.UserForm;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.service.MessageService;
import br.com.pub.service.UserService;
import br.com.pub.utils.ResultMessage;

@Controller
@RequestMapping("user")
public class ManageUserController {

	@Autowired private UserService userService;
	@Autowired private MessageService message;
	
	private static Logger log = LoggerFactory.getLogger(ManageUserController.class);
	
	@ResponseBody
	@RequestMapping(value = "createNewUser", method = RequestMethod.POST)
	public List<ResultMessage> createNewUser(@ModelAttribute("userForm") @Valid UserForm form, BindingResult result, HttpSession session, HttpServletRequest request) {
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		if (!result.hasErrors()) {
			if (form.getPassword().equals(form.getConfirmPassword())) {
				userService.createNewUser(form);
				log.info("criado usuario: " + form.getName() + " - " + form.getEmail());
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered")));				
			} else {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered.invalidPass")));
			}
			
		} else {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered.error")));
		}
		
		return lista;
	}
	
	@ResponseBody
	@RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
	public List<ResultMessage> confirmResetPassword(@ModelAttribute("passwordForm") @Valid PasswordForm form, BindingResult result, Map<String, Object> map, HttpServletRequest request) {
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		if (!result.hasErrors()) {
			Users user = userService.findUserByUsername(form.getEmail());
			EmailMessageCreator.confirmResetPassword(user, request);
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.resetpass")));
		} else {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.email.invalid")));
		}
		
		return lista;
	}
	
	//TODO: simplificar parte do forgotPassword
	@RequestMapping(value = "forgotPassword/{emailHash}/{hash}", method = RequestMethod.POST)
	public String resetPassword(@PathVariable String emailHash, @PathVariable String hash, Map<String, Object> map, HttpServletRequest request) {
		boolean isValidEmail = userService.resetPassword(emailHash, hash, request);
		if (!isValidEmail) {
			map.put("erro",  message.getMessageFromResource(request, "config.email.invalid") + emailHash);
			return "errorPage";
		}
		
		log.info("nova senha enviada para: " + emailHash);
		return "redirect:/login";
	}
}
