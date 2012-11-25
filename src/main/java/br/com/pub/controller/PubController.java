package br.com.pub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.pub.domain.Pub;
import br.com.pub.service.PubService;

@Controller
@RequestMapping("pubs")
public class PubController {
	
	@Autowired private PubService pubService;
	
	@ResponseBody
	@RequestMapping(value = "listNearPubs")
	public List<Pub> listNearPubs(HttpServletRequest request) {
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lng = Double.parseDouble(request.getParameter("lng"));
		return pubService.listNearPubs(lat, lng);
	}
	
	public String registerPub(@ModelAttribute("pubForm") Pub form) {
		Pub pub = new Pub();
		pub.setNome(form.getNome());
		pub.setDescricao(form.getDescricao());
		pub.setPhone(form.getPhone());
		pub.setEmail(form.getEmail());
		pub.setLat(form.getLat());
		pub.setLng(form.getLng());
		pubService.registerPub(pub);
		return "redirect:/";
	}
}
