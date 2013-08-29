package br.com.pub.validation;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.com.pub.annotation.MaxSizeUpload;
import br.com.pub.service.MessageService;

public class MaxSizeUploadValidator implements ConstraintValidator<MaxSizeUpload, Object> {

	@Autowired(required=true)
	private HttpServletRequest request;
	
	@Autowired
	private MessageService messageService;
	
	public void initialize(MaxSizeUpload constraintAnnotation) {}

	public boolean isValid(Object obj, ConstraintValidatorContext context) {
		CommonsMultipartFile file = (CommonsMultipartFile) obj;
		
		if (file != null) {
			if (file.getSize() > 2000000) {
				context.disableDefaultConstraintViolation();
				context.buildConstraintViolationWithTemplate(messageService.getMessageFromResource(request, "config.error.maxUploadSize")).addConstraintViolation();
				return false;
			}
		}
		
		return true;
	}
}