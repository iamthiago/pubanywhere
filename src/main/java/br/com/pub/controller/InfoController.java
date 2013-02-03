package br.com.pub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	
	@RequestMapping("help")
	public String help() {
		return "help";
	}
}