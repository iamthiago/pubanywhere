package br.com.pub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TesteController {
	
	@RequestMapping(value = "maps")
	public String maps() {
		return "maps";
	}
	
	@RequestMapping(value = "pubs")
	public String pubs() {
		return "pub";
	}
}
