package br.com.pub.validation;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import br.com.pub.annotation.PK;
import br.com.pub.domain.Pub;
import br.com.pub.service.MessageService;
import br.com.pub.service.PubService;

public class PkValidator implements ConstraintValidator<PK, Object>{

	@Autowired(required=true)
	private HttpServletRequest request;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private PubService pubService;
	
	public void initialize(PK constraintAnnotation) {}

	public boolean isValid(Object obj, ConstraintValidatorContext context) {
		String pubId = (String) obj;
		
		if (pubService != null && pubId != null) {
			Pub pub = pubService.findPubById(pubId);
			if (pub != null) {
				context.disableDefaultConstraintViolation();
				context.buildConstraintViolationWithTemplate(messageService.getMessageFromResource(request, "config.nameExists")).addConstraintViolation();
				return false;
			}
		}
		
		return true;
	}

}
