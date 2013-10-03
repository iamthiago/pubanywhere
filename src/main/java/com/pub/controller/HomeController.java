package com.pub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pub.service.PubMongoService;
import com.pub.service.UserMongoService;


@Controller
public class HomeController {
	
	@Autowired private PubMongoService pubMongoService; 
	@Autowired private UserMongoService userMongoService;
	
	@RequestMapping("/")
	public String home(@SortDefault(sort = "rating", direction = Direction.DESC) Sort sortPubs, ModelMap map) {
		
		map.put("topPubs", pubMongoService.findTopPubs(sortPubs));
		map.put("topUser", userMongoService.findTopUsers());
		return "new/index";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "new/about-us";
	}
	
	@RequestMapping("/team")
	public String team() {
		return "new/team";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		return "new/faq";
	}
}