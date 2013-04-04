package br.com.pub.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.pub.service.CountryService;
import br.com.pub.service.PubService;
import br.com.pub.service.UserService;

@Controller
public class InfoController {
	
	@Autowired private PubService pubService;
	@Autowired private UserService userService;
	@Autowired private CountryService countryService;
	
	@RequestMapping("/")
	public String home(Map<String, Object> map) {
		map.put("topPubs", pubService.listTop6());
		map.put("topUser", userService.getTopUsers());
		map.put("countries", countryService.getRegisteredCountries());
		return "main";
	}
	
	@RequestMapping("help")
	public String help() {
		return "help";
	}
}