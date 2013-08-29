package br.com.pub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubService;

@Controller
@RequestMapping("mobile")
public class MobileController {

	@Autowired private PubService pubService;
	
	@ResponseBody
	@RequestMapping(value = "country/{country}")
	public List<Pub> listPubPerCountry(@PathVariable("country") String country) {
		return pubService.listAllPubsPerCountry(country);
	}
}
