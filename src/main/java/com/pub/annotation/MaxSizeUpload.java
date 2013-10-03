package com.pub.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.pub.validation.MaxSizeUploadValidator;


@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = MaxSizeUploadValidator.class)
@Documented
public @interface MaxSizeUpload {
	
	String message() default "{config.error.maxUploadSize}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};

}
