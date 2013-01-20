package br.com.pub.facade;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.service.AmazonService;
import br.com.pub.service.PubService;
import br.com.pub.service.UserService;
import br.com.pub.validation.PubValidations;

@Service
public class PubFacade {
	
	@Autowired private UserService userService;
	@Autowired private PubService pubService;
	
	public String registerPub(Pub pub, HttpServletRequest request) {
		
		if (!StringUtils.isEmpty(pub.getEmail())) {
			userService.insertOrUpdatePubUser(PubValidations.valid(pub), request);			
		} else {
			pubService.registerPub(PubValidations.valid(pub), request);
		}
		
		if (!pub.getFile().isEmpty()) {
			AmazonService.upload(pub);
		}
		
		EmailMessageCreator.sendPubMail(pub, request);
		
		return pub.getPubId();
	}
}
