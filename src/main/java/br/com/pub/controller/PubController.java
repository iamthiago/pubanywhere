package br.com.pub.controller;

import static br.com.pub.constants.PUB_CONSTANTS.MAX_PUBS_TOTAL;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.form.MessageForm;
import br.com.pub.service.MessageService;
import br.com.pub.service.PubService;
import br.com.pub.utils.PubUtils;
import br.com.pub.utils.ResultMessage;

@Controller
@RequestMapping("pubs")
public class PubController extends UserCommons {
	
	@Autowired private PubService pubService;
	@Autowired private MessageService messageService;
	
	private Logger log = LoggerFactory.getLogger(PubController.class);
	
	@RequestMapping(value = "maps")
	public String maps() {
		return "new/map";
	}
	
	@Deprecated
	@ResponseBody
	@RequestMapping(value = "listNearPubs")
	public List<Pub> listNearPubs(HttpServletRequest request, HttpSession session) {
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lng = Double.parseDouble(request.getParameter("lng"));
		return pubService.listNearPubs(lat, lng);
	}
	
	@RequestMapping(value = "country/{country}/{page}")
	public String listPubsPerCountry(@PathVariable("country") String country, @PathVariable("page") int page, Map<String, Object> map, HttpServletRequest request) {
		
		try {
			
			List<Pub> pubs = pubService.listPubsPerCountry(country, page);
			if (!pubs.isEmpty()) {
				
				map.put("pubs", pubs);
				map.put("listTitle", PubUtils.setCountryTitle(messageService, country, request));
				
				PubUtils.resolvePage(page, pubService.getTotalPubsPerCountry(country), map, request);
				return "new/listing-rows";
				
			} else {
				return "new/404";
			}
			
		} catch (Exception e) {
			log.error(e.getMessage());
			return "new/404";
		}
	}
	
	@RequestMapping(value = "top100World/{page}")
	public String listTop100World(@PathVariable("page") int page, Map<String, Object> map, HttpServletRequest request) {
		
		try {
			
			List<Pub> pubs = pubService.listTop100World(page);
			if (!pubs.isEmpty()) {
				map.put("pubs", pubs);
				map.put("listTitle", messageService.getMessageFromResource(request, "nav.top.top100"));
				
				PubUtils.resolvePage(page, MAX_PUBS_TOTAL, map, request);
				return "new/listing-rows";
				
			} else {
				return "new/404";
			}
			
		} catch (Exception e) {
			log.error(e.getMessage());
			return "new/404";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "last3", method = RequestMethod.GET)
	public List<Pub> listLast3(Map<String, Object> map) {
		return pubService.listLast3();
	}
	
	@RequestMapping(value = "registerPub", method = RequestMethod.GET)
	public String pubs(Map<String, Object> map) {
		map.put("pubForm", new Pub());
		return "new/list-your-place";
	}
	
	@ResponseBody
	@RequestMapping(value = "registerPub", method = RequestMethod.POST)
	public List<ResultMessage> registerPub(@ModelAttribute("pubForm") @Valid Pub form, BindingResult result, HttpServletRequest request, Map<String, Object> map) {
		return pubService.registerPub(form, request, result);
	}
	
	@RequestMapping(value = "{pubId}", method = RequestMethod.GET)
	public String pubDetails(@PathVariable("pubId") String pubId, Map<String, Object> map, HttpServletRequest request, HttpSession session) {
		Pub pub = pubService.findPubById(pubId);
		
		if (pub != null) {
			map.put("pub", pub);
			map.put("messageForm", new MessageForm());
		} else {
			return "new/404";
		}
		
		return "new/detail";
	}
	
	@RequestMapping(value = "activePub/{id}")
	public String activePub(@PathVariable("id") String id) {
		pubService.activePub(id);
		return "redirect:/pubs/" + id;
	}
}