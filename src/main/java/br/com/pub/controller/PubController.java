package br.com.pub.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubService;

@Controller
@RequestMapping("pubs")
public class PubController {
	
	@Autowired private PubService pubService;
	
	@RequestMapping(value = "maps")
	public String maps() {
		return "maps";
	}
	
	@RequestMapping(value = "registerPub", method = RequestMethod.GET)
	public String pubs(Map<String, Object> map) {
		map.put("pubForm", new Pub());
		return "registerPub";
	}
	
	@ResponseBody
	@RequestMapping(value = "listNearPubs")
	public List<Pub> listNearPubs(HttpServletRequest request, HttpSession session) {
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lng = Double.parseDouble(request.getParameter("lng"));
		return pubService.listNearPubs(lat, lng);
	}
	
	@RequestMapping(value = "registerPub", headers={"content-type=multipart/form-data"}, method = RequestMethod.POST)
	public String registerPub(@ModelAttribute("pubForm") @Valid Pub form, BindingResult result,
			HttpServletRequest request, Map<String, Object> map) {
		
		String pubId = null;
		
		if (result.hasErrors()) {
			return "registerPub";
		} else {
			pubId = pubService.registerPub(form, request);
		}
		
		return "redirect:/pubs/" + pubId;
	}
	
	@RequestMapping(value = "{pubId}", method = RequestMethod.GET)
	public String pubDetails(@PathVariable("pubId") String pubId, Map<String, Object> map, HttpServletRequest request) {
		Pub pub = pubService.findPubById(pubId);
		pubService.setPageCount(pub);
		map.put("pub", pub);
		map.put("fbUrlComments", request.getRequestURL());
		return "details";
	}
	
	@RequestMapping(value = "activePub/{id}")
	public String activePub(@PathVariable("id") String id) {
		pubService.activePub(id);
		return "redirect:/";
	}
}
