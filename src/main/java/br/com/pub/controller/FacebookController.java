package br.com.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.service.UserService;
import br.com.pub.utils.ResultMessage;

@Controller
public class FacebookController {
	
	@Autowired private UserService userService;
	
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
}