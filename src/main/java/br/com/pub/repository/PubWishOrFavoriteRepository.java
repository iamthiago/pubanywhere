package br.com.pub.repository;

import java.util.List;

import br.com.pub.domain.PubWishOrFavorite;

public interface PubWishOrFavoriteRepository extends AbstractRepository<PubWishOrFavorite> {
	
	List<PubWishOrFavorite> getWishOrFavoritePub(String emailHash, String type);
	
	List<PubWishOrFavorite> userHasWishFavoritePub(String pubId, String username);
	
	PubWishOrFavorite findByPubAndUserAndType(String pubId, String username, String type);
	
}
