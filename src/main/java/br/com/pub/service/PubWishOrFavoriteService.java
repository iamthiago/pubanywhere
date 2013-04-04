package br.com.pub.service;

import static br.com.pub.constants.PUB_CONSTANTS.MODAL_MESSAGE;
import static br.com.pub.constants.PUB_CONSTANTS.MODAL_TITLE;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import br.com.pub.domain.PubWishOrFavorite;
import br.com.pub.domain.Users;
import br.com.pub.enumeration.WishOrFavoriteType;
import br.com.pub.repository.PubRepository;
import br.com.pub.repository.PubWishOrFavoriteRepository;
import br.com.pub.utils.ResultMessage;

import com.googlecode.ehcache.annotations.TriggersRemove;

@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
@Service
public class PubWishOrFavoriteService {
	
	@Autowired PubRepository pubRepository;
	@Autowired PubWishOrFavoriteRepository wishOrFavoriteRepository;
	
	@TriggersRemove(
			cacheName={
					"getWishOrFavoritePubCache",
					"findByPubAndUserAndTypeCache"},
					removeAll=true)
	public List<ResultMessage> saveWishOrFavoritePub(String pubId, Users userSession, String type) {
		
		List<ResultMessage> lista = new ArrayList<ResultMessage>();
		PubWishOrFavorite userHasFavOrWishPub = wishOrFavoriteRepository.findByPubAndUserAndType(pubId, userSession.getUsername(), type);
		
		if (userHasFavOrWishPub == null) {
			PubWishOrFavorite favorite = new PubWishOrFavorite();
			favorite.setPub(pubRepository.find(pubId));
			favorite.setUsers(userSession);
			
			if (WishOrFavoriteType.valueOf(type) != null) {
				favorite.setType(WishOrFavoriteType.valueOf(type));
			}
			
			wishOrFavoriteRepository.insert(favorite);
			
			lista.add(new ResultMessage(MODAL_TITLE, "Success"));
			if (WishOrFavoriteType.FAVORITE.equals(WishOrFavoriteType.valueOf(type))) {
				lista.add(new ResultMessage(MODAL_MESSAGE, "This Pub will now be displayed on your favorite list."));
			} else if (WishOrFavoriteType.WISH_LIST.equals(WishOrFavoriteType.valueOf(type))) {
				lista.add(new ResultMessage(MODAL_MESSAGE, "This Pub will now be displayed on your wish list."));
			}
			
			lista.add(new ResultMessage("ADD", favorite.getType().toString()));
			System.out.println("add class to: " + favorite.getType().toString());
			
		} else {
			wishOrFavoriteRepository.delete(userHasFavOrWishPub.getId());
			
			lista.add(new ResultMessage(MODAL_TITLE, "Success"));
			lista.add(new ResultMessage(MODAL_MESSAGE, "You have removed this pub from your list."));
			lista.add(new ResultMessage("REMOVE", userHasFavOrWishPub.getType().toString()));
			System.out.println("remove class from: " + userHasFavOrWishPub.getType().toString());
		}
		
		return lista;
	}
	
	public List<PubWishOrFavorite> getWishOrFavoritePub(String emailHash, String type) {
		return wishOrFavoriteRepository.getWishOrFavoritePub(emailHash, type);
	}
	
	public WishOrFavoriteType userHasWishFavoritePub(String pubId, Users userSession) {
		List<PubWishOrFavorite> userHasWishFavoritePub = wishOrFavoriteRepository.userHasWishFavoritePub(pubId, userSession.getUsername());
		if (userHasWishFavoritePub != null) {
			if (userHasWishFavoritePub.size() <= 1) {
				for (PubWishOrFavorite pubWishOrFavorite : userHasWishFavoritePub) {
					return WishOrFavoriteType.valueOf(pubWishOrFavorite.getType().toString());
				}
			}
			return WishOrFavoriteType.BOTH;
		}
		return null;
	}
}
