package br.com.pub.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.pub.domain.RegisteredCountry;
import br.com.pub.service.CountryService;
import br.com.pub.utils.PubUtils;

@Controller
@RequestMapping("country")
public class CountryController {
	
	@Autowired private CountryService countryService;
	
	private Logger log = LoggerFactory.getLogger(CountryController.class);
	
	@RequestMapping(value = "getAll/{page}")
	public String listRegisteredCountries(@PathVariable("page") int page, Map<String, Object> map, HttpServletRequest request) {
		
		try {
			
			List<RegisteredCountry> countries = countryService.getRegisteredCountries(page);
			if (!countries.isEmpty()) {
				map.put("countries", countries);
				
				PubUtils.resolvePage(page, countryService.getTotalCountries(), map, request);
				return "new/listing-grid";
			} else {
				return "new/404";
			}
			
		} catch (Exception e) {
			log.error(e.getMessage());
			return "new/404";
		}
	}

}
