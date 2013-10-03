package com.pub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.mongo.domain.Pub;
import com.pub.service.PubMongoService;


@Controller
@RequestMapping("mobile")
public class MobileController {

	@Autowired private PubMongoService pubMongoService;
	
	@ResponseBody
	@RequestMapping(value = "country/{country}")
	public List<Pub> findByCountry(@PathVariable("country") String country, Pageable pageable) {
		final Page<Pub> page = pubMongoService.findByCountry(country, pageable);
		return page.getContent();
	}
}
