package br.com.pub.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.pub.form.ContactForm;
import br.com.pub.service.ContactService;

@Controller
@RequestMapping("contact")
public class ContactController {
	
	@Autowired private ContactService contactService;
	
	@RequestMapping(method = RequestMethod.POST)
	public String sendSuggestion(@ModelAttribute("contactForm") @Valid ContactForm form, BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "contact";
		} else {
			contactService.sendMessage(form, request);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String contact() {
		return "contact";
	}
}
