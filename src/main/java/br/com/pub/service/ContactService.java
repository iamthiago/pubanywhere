package br.com.pub.service;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import br.com.pub.form.ContactForm;
import br.com.pub.mail.EmailUtils;
import br.com.pub.utils.ResultMessage;

@Service
public class ContactService {
	
	@Autowired
	private MessageService message;

	public List<ResultMessage> sendMessage(ContactForm form, HttpServletRequest request, BindingResult result) {
		
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		
		if (result.hasErrors()) {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered.error")));
			
		} else {
			try {
				
				form.setDescription(
						"From: " + form.getFrom() + "<br>" + 
						"Name: " + form.getName() + "<br>" +
						"Subject: " + form.getSubject() + "<br>" +
						"Description:" + form.getDescription());
				
				EmailUtils.sendMail(form, request, false);
				
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "message.email.success")));
				
			} catch (Exception e) {
				e.printStackTrace();
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "message.error")));
			}
		}
		return lista;
	}
}
