package com.pub.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.form.MessageForm;
import com.pub.mongo.domain.Users;
import com.pub.service.PubMessageService;
import com.pub.service.UserMongoService;
import com.pub.utils.ResultMessage;


@Controller
public class FacebookController extends UserCommons {
	
	@Autowired private UserMongoService userService;
	@Autowired private PubMessageService pubMessageService;
	
	@ResponseBody
	@RequestMapping(value = "/facebook/auth/{authToken}", method = RequestMethod.POST)
	public List<ResultMessage> getUserInformation(@PathVariable String authToken, HttpServletRequest request, HttpSession session) {
		Facebook facebook = new FacebookTemplate(authToken);
		session.setAttribute("facebook_token", facebook);
		return userService.createNewUser(facebook, request);
	}
	
	@RequestMapping(value = "/channel", method = RequestMethod.GET)
	public String channelFB(HttpServletResponse response) {
		int cache_expire = 60*60*24*365;
		response.setHeader("Pragma", "public");
		response.setHeader("Cache-Control", "max-age:" + cache_expire);
		response.setHeader("Expires", ".gmdate('D, d M Y H:i:s', time()" + cache_expire + ") . ' GMT'");
		return "new/channel";
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/postPubReview", method = RequestMethod.POST)
	public List<ResultMessage> postPubReview(@ModelAttribute("messageForm") MessageForm messageForm, HttpServletRequest request, HttpSession session, Map<String, Object> map) {
		Users userSession = getUserSession(session);
		return pubMessageService.registerReview(messageForm, request, userSession);
	}
}