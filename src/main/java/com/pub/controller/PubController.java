package com.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pub.form.MessageForm;
import com.pub.mongo.domain.Pub;
import com.pub.service.MessageService;
import com.pub.service.PubMongoService;
import com.pub.utils.PubUtils;
import com.pub.utils.ResultMessage;


@Controller
@RequestMapping("pubs")
public class PubController extends UserCommons {
	
	@Autowired private PubMongoService pubMongoService;
	@Autowired private MessageService messageService;
	
	@RequestMapping(value = "maps")
	public String maps() {
		return "new/map";
	}
	
	@RequestMapping(value = "country/{country}", method = RequestMethod.GET)
	public String findByCountry(@PathVariable("country") String country, @PageableDefault(page = 1, sort = "rating") Pageable pageable, ModelMap map, HttpServletRequest request) {
		final Page<Pub> page = pubMongoService.findByCountry(country, pageable);
		if (!page.getContent().isEmpty()) {
			map.put("pubs", page.getContent());
			map.put("listTitle", PubUtils.setCountryTitle(messageService, country, request));
			
			PubUtils.resolvePage(page, map, request);
			return "new/listing-rows";
		} else {
			return "new/404";
		}
	}
	
	@RequestMapping(value = "top100")
	public String findAll(@PageableDefault(page = 1, sort = "rating") Pageable pageable, ModelMap map, HttpServletRequest request) {
		final Page<Pub> page = pubMongoService.findAll(pageable);
		if (!page.getContent().isEmpty()) {
			map.put("pubs", page.getContent());
			map.put("listTitle", messageService.getMessageFromResource(request, "nav.top.top100"));
			
			PubUtils.resolvePage(page, map, request);
			return "new/listing-rows";
		} else {
			return "new/404";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "last3", method = RequestMethod.GET)
	public List<Pub> listLast3(@SortDefault(sort = "desde", direction = Direction.DESC) Sort sort) {
		return pubMongoService.findLast3(sort).getContent();
	}
	
	@ResponseBody
	@RequestMapping(value = "listNearPubs")
	public List<Pub> listNearPubs(HttpServletRequest request, HttpSession session) {
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lng = Double.parseDouble(request.getParameter("lng"));
		return pubMongoService.findNearPubs(lat, lng);
	}
	
	@RequestMapping(value = "registerPub", method = RequestMethod.GET)
	public String pubs(ModelMap map) {
		map.put("pubForm", new Pub());
		return "new/list-your-place";
	}
	
	@ResponseBody
	@RequestMapping(value = "registerPub", method = RequestMethod.POST)
	public List<ResultMessage> registerPub(@ModelAttribute("pubForm") @Valid Pub pubForm, BindingResult result, HttpServletRequest request) {
		return pubMongoService.registerPub(pubForm, request, result);
	}
	
	@RequestMapping(value = "{pubId}", method = RequestMethod.GET)
	public String pubDetails(@PathVariable("pubId") String pubId, ModelMap map, HttpServletRequest request, HttpSession session) {
		Pub pub = pubMongoService.findByPubId(pubId);
		
		if (pub != null) {
			map.put("pub", pub);
			map.put("messageForm", new MessageForm());
		} else {
			return "new/404";
		}
		return "new/detail";
	}
	
	@RequestMapping(value = "activePub/{id}")
	public String activePub(@PathVariable("id") String pubId) {
		pubMongoService.activePub(pubId);
		return "redirect:/pubs/" + pubId;
	}
}