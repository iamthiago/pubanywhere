package br.com.pub.controller.mobile;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubService;

@Controller
@RequestMapping("mobile")
public class MobileTeste {
	
	@Autowired
	private PubService pubService;
	
	@ResponseBody
	@RequestMapping(value = "helloWorld")
	public String helloWorld() {
		System.out.println("Hello World " + new Date());
		return "Hello World " + new Date();
	}
	
	@ResponseBody
	@RequestMapping(value = "lastPubs")
	public List<Pub> lastPubs() {
		return pubService.lastPubs();
	}
	
	@ResponseBody
	@RequestMapping(value = "setName/{name}", method = RequestMethod.POST)
	public String setName(@PathVariable("name") String name) {
		return "Your name is: " + name;
	}
	
	@ResponseBody
	@RequestMapping(value = "pubs/country/{country}")
	public List<Pub> listPubsPerCountry(@PathVariable("country") String country) {
		return pubService.listPubsPerCountry(country);
	}
}