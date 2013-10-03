package com.pub.validation;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.pub.annotation.PK;
import com.pub.mongo.domain.Pub;
import com.pub.service.MessageService;
import com.pub.service.PubMongoService;


public class PkValidator implements ConstraintValidator<PK, Object>{

	@Autowired(required=true) private HttpServletRequest request;
	@Autowired private MessageService messageService;
	@Autowired private PubMongoService pubMongoService;
	
	public void initialize(PK constraintAnnotation) {}

	public boolean isValid(Object obj, ConstraintValidatorContext context) {
		String pubId = (String) obj;
		
		if (pubMongoService != null && pubId != null) {
			Pub pub = pubMongoService.findByPubId(pubId);
			if (pub != null) {
				context.disableDefaultConstraintViolation();
				context.buildConstraintViolationWithTemplate(messageService.getMessageFromResource(request, "config.error.nameExists")).addConstraintViolation();
				return false;
			}
		}
		
		return true;
	}

}
