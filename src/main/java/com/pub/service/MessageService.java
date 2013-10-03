package com.pub.service;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.RequestContextUtils;

@Service
public class MessageService {
	
	@Autowired
	private MessageSource messageSource;
	
	public String getMessageFromResource(HttpServletRequest request, String key) {
		Locale loc = RequestContextUtils.getLocale(request);
		return messageSource.getMessage(key, new Object[] {}, loc);
	}
	
	public String getMessageFromResource(HttpServletRequest request, String key, Object[] param) {
		Locale loc = RequestContextUtils.getLocale(request);
		return messageSource.getMessage(key, new Object[] {param[0]}, loc);
	}
}
