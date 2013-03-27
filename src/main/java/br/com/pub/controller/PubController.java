package br.com.pub.controller;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.ArrayList;
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
import br.com.pub.domain.Users;
import br.com.pub.enumeration.WishOrFavoriteType;
import br.com.pub.form.MessageForm;
import br.com.pub.service.MessageService;
import br.com.pub.service.PubMessageService;
import br.com.pub.service.PubService;
import br.com.pub.service.PubWishOrFavoriteService;
import br.com.pub.utils.ResultMessage;

@Controller
@RequestMapping("pubs")
public class PubController {
	
	@Autowired private PubService pubService;
	@Autowired private PubMessageService pubMessageService;
	@Autowired private MessageService messageService;
	@Autowired private PubWishOrFavoriteService wishOrFavoriteService;
	@Autowired private MessageService message;
	
	@RequestMapping(value = "maps")
	public String maps() {
		return "maps";
	}
	
	@ResponseBody
	@RequestMapping(value = "listNearPubs")
	public List<Pub> listNearPubs(HttpServletRequest request, HttpSession session) {
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lng = Double.parseDouble(request.getParameter("lng"));
		return pubService.listNearPubs(lat, lng);
	}
	
	@RequestMapping(value = "country/{country}")
	public String listPubsPerCountry(@PathVariable("country") String country, Map<String, Object> map, HttpServletRequest request) {
		List<Pub> pubs = pubService.listPubsPerCountry(country);
		if (!pubs.isEmpty()) {
			map.put("pubs", pubs);
			map.put("windowTitle", country);
			map.put("listTitle", setCountryTitle(country, request));
			return "listPubs";
		} else {
			map.put("erro", messageService.getMessageFromResource(request, "config.pub.404.country"));
			return "errorPage";
		}
	}
	
	@RequestMapping(value = "top100World")
	public String listTop100World(Map<String, Object> map, HttpServletRequest request) {
		List<Pub> pubs = pubService.listTop100World();
		if (!pubs.isEmpty()) {
			map.put("pubs", pubs);
			map.put("windowTitle", "Top 100 Pubs");
			map.put("listTitle", messageService.getMessageFromResource(request, "pub.title.top100"));
			return "listPubs";
		} else {
			map.put("erro", messageService.getMessageFromResource(request, "config.pub.404.top"));
			return "errorPage";
		}
	}
	
	@RequestMapping(value = "registerPub", method = RequestMethod.GET)
	public String pubs(Map<String, Object> map) {
		map.put("pubForm", new Pub());
		return "registerPub";
	}
	
	@ResponseBody
	@RequestMapping(value = "registerPub", method = RequestMethod.POST)
	public List<ResultMessage> registerPub(@ModelAttribute("pubForm") @Valid Pub form, BindingResult result, HttpServletRequest request, Map<String, Object> map) {
		
		String pubId = null;
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		
		if (result.hasErrors()) {
			
			if (result.hasFieldErrors("pubId")) {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.pub.register.pudIdExists")));
			} else {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered.error")));
			}
		} else {
			pubId = pubService.registerPub(form, request);
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.success")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.pub.register.success", new Object[]{pubId})));
		}
		
		return lista;
	}
	
	@RequestMapping(value = "{pubId}", method = RequestMethod.GET)
	public String pubDetails(@PathVariable("pubId") String pubId, Map<String, Object> map, HttpServletRequest request, HttpSession session) {
		Pub pub = pubService.findPubById(pubId);
		
		if (pub != null) {
			map.put("pub", pub);
			map.put("messageForm", new MessageForm());
			map.put("pubReview", pubMessageService.getPubReviewByPub(pubId));
		} else {
			map.put("erro", messageService.getMessageFromResource(request, "config.pub.404.pub"));
			return "errorPage";
		}
		
		Users loggedUser = (Users) session.getAttribute("loggedUser");
		if (loggedUser != null) {
			WishOrFavoriteType type = wishOrFavoriteService.userHasWishFavoritePub(pubId, loggedUser);
			switch (type) {
				case BOTH:
					map.put("favCheckedClass", "title-h3-checked");
					map.put("wishCheckedClass", "title-h3-checked");
					break;
					
				case FAVORITE:
					map.put("favCheckedClass", "title-h3-checked");
					break;
						
				case WISH_LIST:
					map.put("wishCheckedClass", "title-h3-checked");
					break;
	
				default:
					break;
				}
		}
		
		return "details";
	}
	
	@RequestMapping(value = "activePub/{id}")
	public String activePub(@PathVariable("id") String id) {
		pubService.activePub(id);
		return "redirect:/pubs/" + id;
	}
	
	private String setCountryTitle(String country, HttpServletRequest request) {
		return messageService.getMessageFromResource(request, "pub.title.top100") + " - " + messageService.getMessageFromResource(request, "country." + getCountry(country));
	}
	
	private String getCountry(String country) {
		return country.trim().toLowerCase().replaceAll("\\s+", "");
	}
}