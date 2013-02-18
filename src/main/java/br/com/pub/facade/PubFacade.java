package br.com.pub.facade;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.pub.domain.Pub;
import br.com.pub.mail.EmailMessageCreator;
import br.com.pub.service.AmazonService;
import br.com.pub.service.PubService;
import br.com.pub.validation.PubValidations;

@Service
public class PubFacade {
	
	@Autowired private PubService pubService;
	
	public String registerPub(Pub pub, HttpServletRequest request) {
		
		pubService.registerPub(PubValidations.valid(pub), request);
		
		if (!pub.getFile().isEmpty()) {
			AmazonService.upload(pub);
		}
		
		EmailMessageCreator.sendPubMail(pub, request);
		
		return pub.getPubId();
	}
}
