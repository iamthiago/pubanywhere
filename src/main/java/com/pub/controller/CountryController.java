package com.pub.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pub.mongo.domain.RegisteredCountry;
import com.pub.service.CountryMongoService;
import com.pub.utils.PubUtils;


@Controller
@RequestMapping("country")
public class CountryController {
	
	@Autowired private CountryMongoService countryMongoService;
	
	private Logger log = LoggerFactory.getLogger(CountryController.class);
	
	@RequestMapping(value = "findAll")
	public String listRegisteredCountries(@PageableDefault(page = 1, size = 6) Pageable pageable, ModelMap map, HttpServletRequest request) {
		
		try {
			
			final Page<RegisteredCountry> page = countryMongoService.findAll(pageable);
			if (!page.getContent().isEmpty()) {
				map.put("countries", page.getContent());
				PubUtils.resolvePage(page, map, request);
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
