package br.com.pub.controller.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.domain.RegisteredCountry;
import br.com.pub.service.CountryService;
import br.com.pub.service.PubService;

@Controller
@RequestMapping("mobile")
public class Mobile {
	
	@Autowired private PubService pubService;
	@Autowired private CountryService countryService;
	
	@ResponseBody
	@RequestMapping(value = "countries")
	public List<RegisteredCountry> listCountries() {
		return countryService.getRegisteredCountries();
	}
	
	@ResponseBody
	@RequestMapping(value = "pubs/top10rated")
	public List<Pub> listTop10RatedMobile() {
		return pubService.listTop10Mobile();
	}
	
	@ResponseBody
	@RequestMapping(value = "pubs/country/{country}")
	public List<Pub> listPubsPerCountry(@PathVariable("country") String country) {
		return pubService.listPubsPerCountry(country);
	}
	
	@ResponseBody
	@RequestMapping(value = "pubs/top100World")
	public List<Pub> listTop100World() {
		return pubService.listTop100World();
	}
}