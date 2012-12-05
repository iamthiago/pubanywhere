package br.com.pub.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import br.com.pub.form.ContactForm;
import br.com.pub.mail.EmailUtils;

@Service
public class ContactService {

	public void sendMessage(ContactForm form, HttpServletRequest request) {
		EmailUtils.sendMail(form, request);
	}
}
