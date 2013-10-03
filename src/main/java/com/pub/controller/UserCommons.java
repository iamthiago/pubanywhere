package com.pub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.pub.mongo.domain.Users;
import com.pub.service.UserMongoService;


@Controller
public abstract class UserCommons {
	
	@Autowired private UserMongoService userMongoService;
	
	public Users getUserSession(HttpSession session) {
		Users loggedUser = null;
		if (session.getAttribute("loggedUser") == null) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			loggedUser = userMongoService.findByUsername(authentication.getName());
			session.setAttribute("loggedUser", loggedUser);
		} else {
			loggedUser = (Users) session.getAttribute("loggedUser");
		}
		return loggedUser;
	}
}