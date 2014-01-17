package com.pub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pub.dto.LayoutDTO;
import com.pub.service.PubMongoService;
import com.pub.service.UserMongoService;


@Controller
@RequestMapping("layout")
public class LayoutController {
	
	@Autowired private PubMongoService pubMongoService; 
	@Autowired private UserMongoService userMongoService;
	
	@RequestMapping("home")
	public String getHomeLayout() {
		return "home";
	}
	
	public LayoutDTO home(@SortDefault(sort = "rating", direction = Direction.DESC) Sort sortPubs) {
		LayoutDTO dto = new LayoutDTO();
		dto.getObjects().add(pubMongoService.findTopPubs(sortPubs));
		dto.getObjects().add(userMongoService.findTopUsers());
		return dto;
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