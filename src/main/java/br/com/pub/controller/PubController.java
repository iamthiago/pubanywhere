package br.com.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping(method = RequestMethod.GET)
	public String pubs() {
		return "registerPub";
	}
	
	@ResponseBody
	@RequestMapping(value = "listNearPubs")
	public List<Pub> listNearPubs(HttpServletRequest request, HttpSession session) {
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lng = Double.parseDouble(request.getParameter("lng"));
		List<Pub> listNearPubs = pubService.listNearPubs(lat, lng);
		session.setAttribute("listPubs", listNearPubs);
		return listNearPubs;
	}
	
	@RequestMapping(value = "registerPub")
	public String registerPub(@ModelAttribute("pubForm") @Valid Pub form, BindingResult result) {
		if (result.hasErrors()) {
			return "registerPub";
		} else {
			pubService.registerPub(form);
		}
		
		return "redirect:/";
	}
}
