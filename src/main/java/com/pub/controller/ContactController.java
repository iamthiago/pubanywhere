package com.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.form.ContactForm;
import com.pub.service.ContactService;
import com.pub.utils.ResultMessage;


@Controller
@RequestMapping("contact")
public class ContactController {
	
	@Autowired private ContactService contactService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String info(ModelMap map) {
		map.put("contactForm", new ContactForm());
		return "new/contact-us";
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public List<ResultMessage> sendSuggestion(@ModelAttribute("contactForm") @Valid ContactForm form, BindingResult result, HttpServletRequest request, ModelMap map) {
		map.put("contactForm", new ContactForm());
		return contactService.sendMessage(form, request, result);
	}
}
