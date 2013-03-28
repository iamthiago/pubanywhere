package br.com.pub.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import static br.com.pub.constants.PUB_CONSTANTS.*;
import br.com.pub.domain.Users;
import br.com.pub.form.MessageForm;
import br.com.pub.form.UploadForm;
import br.com.pub.form.UserForm;
import br.com.pub.service.AmazonService;
import br.com.pub.service.MessageService;
import br.com.pub.service.PubMessageService;
import br.com.pub.service.PubWishOrFavoriteService;
import br.com.pub.service.UserService;
import br.com.pub.utils.ResultMessage;

/**
 * @author Thiago
 * Classe criada para gerenciar somente usuario logado, necessitando de permissões para visualizar o conteudo
 */
@Controller
@RequestMapping("user")
public class LoggedUserController extends UserCommons {
	
	@Autowired private UserService userService;
	@Autowired private PubMessageService pubMessageService;
	@Autowired private PubWishOrFavoriteService pubWishFavoriteService;
	@Autowired private MessageService message;
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@RequestMapping(value = "/{hash}", method = RequestMethod.GET)
	public String getUserPage(@PathVariable("hash") String hash, HttpSession session, Map<String, Object> map, HttpServletRequest request) {
		
		getUserSession(session);
		
		Users user = userService.findUserByEmailHash(hash);
		if (user != null) {
			
			map.put("user", user);
			map.put("form", new UserForm());
			map.put("uploadForm", new UploadForm());
			map.put("lastReviews", pubMessageService.getPubReviewByUser(user.getUsername()));

			return "user/user";
		} else {
			map.put("erro", message.getMessageFromResource(request, "config.pub.404.user"));
			return "errorPage";
		}		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "postPubReview", method = RequestMethod.POST)
	public void postPubReview(@ModelAttribute("messageForm") MessageForm messageForm, HttpSession session, Map<String, Object> map) {
		Users userSession = (Users) session.getAttribute("loggedUser");
		pubMessageService.registerReview(messageForm, userSession);
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/saveUserProfile", method = RequestMethod.POST)
	public List<ResultMessage> saveUserProfile(@ModelAttribute("form") @Valid UserForm form, BindingResult result, Map<String, Object> map, HttpServletRequest request) {
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		if (!result.hasErrors()) {
			return userService.updateUserProfile(form, request);
		} else {
			lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
			lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.user.registered.error")));
			return lista;
		}		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@RequestMapping(value = "/getPubReviewsAjax/{pubId}")
	public String getPubReviewsAjax(@PathVariable("pubId") String pubId, Map<String, Object> map) {
		map.put("pubReview", pubMessageService.getPubReviewByPub(pubId));
		return "user/userPubReviews";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/addFavoriteOrWishListPub/{pubId}/{type}")
	public List<ResultMessage> addFavoriteOrWishListPub(@PathVariable("pubId") String pubId, @PathVariable("type") String type, HttpSession session, Map<String, Object> map) {
		Users userSession = (Users) session.getAttribute("loggedUser");
		return pubWishFavoriteService.saveWishOrFavoritePub(pubId, userSession, type);
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@ResponseBody
	@RequestMapping(value = "/uploadProfilePicture", method = RequestMethod.POST)
	public List<ResultMessage> uploadProfilePicture(@ModelAttribute("uploadForm") @Valid UploadForm uploadForm, BindingResult result, HttpSession session, HttpServletRequest request) {
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		if (!result.hasErrors()) {
			Users userSession = (Users) session.getAttribute("loggedUser");
			AmazonService.upload(uploadForm.getFile(), userSession.getPubUser().getEmailHash());			
		} else {
			if (uploadForm.getFile() != null) {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, result.getFieldError().getDefaultMessage()));				
			} else {
				lista.add(new ResultMessage(MODAL_TITLE, message.getMessageFromResource(request, "config.error")));
				lista.add(new ResultMessage(MODAL_MESSAGE, message.getMessageFromResource(request, "config.uploadProfileImage")));
			}
			return lista;
		}
		return null;
	}
}