package br.com.pub.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.pub.domain.PubWishOrFavorite;
import br.com.pub.enumeration.WishOrFavoriteType;
import br.com.pub.service.MessageService;
import br.com.pub.service.PubWishOrFavoriteService;

/**
 * @author Thiago
 * Classe criada para gerenciar todo o tipo de usuario, logado ou deslogado, não necessitando de permissões para visualizar o conteudo
 */
@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired private PubWishOrFavoriteService pubWishFavoriteService;
	@Autowired private MessageService message;
	
	@RequestMapping(value = "/getFavoriteOrWishListPub/{type}/{emailHash}")
	public String getFavoriteOrWishListPub(@PathVariable("type") String type, @PathVariable("emailHash") String emailHash, HttpSession session, HttpServletRequest request, Map<String, Object> map) {
		List<PubWishOrFavorite> wishOrFavoritePub = pubWishFavoriteService.getWishOrFavoritePub(emailHash, type);
		map.put("favWishPubs", wishOrFavoritePub);
		setPageParam(type, map, wishOrFavoritePub, request);
		return "user/userWishFavorite";
	}

	private void setPageParam(String type, Map<String, Object> map, List<PubWishOrFavorite> wishOrFavoritePub, HttpServletRequest request) {
		switch (WishOrFavoriteType.valueOf(type)) {
			case FAVORITE:
				map.put("favWishTitle", message.getMessageFromResource(request, "user.main.favorite"));
				break;
			case WISH_LIST:
				map.put("favWishTitle", message.getMessageFromResource(request, "user.main.wishlist"));
				break;
				
			default:
				break;
		}
		
		if (wishOrFavoritePub.isEmpty()) {
			map.put("noPubs", message.getMessageFromResource(request, "config.pub.404.favorite"));
		}
	}
}