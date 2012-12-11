package br.com.pub.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.form.ContactForm;
import br.com.pub.mail.EmailUtils;

@Service
public class ContactService {
	
	@Autowired
	private MessageService messageService;

	public String sendMessage(ContactForm form, HttpServletRequest request) {
		try {
			EmailUtils.sendMail(form, request);
			return messageService.getMessageFromResource(request, "message.email.success");
		} catch (Exception e) {
			e.printStackTrace();
			return messageService.getMessageFromResource(request, "message.error");
		}
	}
}
