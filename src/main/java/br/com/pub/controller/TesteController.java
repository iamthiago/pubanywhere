package br.com.pub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("teste")
public class TesteController {
	
	@RequestMapping()
	public String teste() {
		return "teste";
	}
}
