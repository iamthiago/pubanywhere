package br.com.pub.repository.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.pub.domain.PubWishOrFavorite;
import br.com.pub.enumeration.WishOrFavoriteType;
import br.com.pub.repository.PubWishOrFavoriteRepository;

import com.googlecode.ehcache.annotations.Cacheable;

@Repository
public class PubWishOrFavoriteDAO extends AbstractDAO<PubWishOrFavorite> implements PubWishOrFavoriteRepository {

	@Transactional
	@Cacheable(cacheName="getWishOrFavoritePubCache")
	@SuppressWarnings("unchecked")
	public List<PubWishOrFavorite> getWishOrFavoritePub(String emailHash, String type) {
		
		try {
			
			return super.em.createQuery("SELECT w FROM PubWishOrFavorite w WHERE w.users.pubUser.emailHash = :emailHash and w.type = :type")
					.setParameter("emailHash", emailHash)
					.setParameter("type", WishOrFavoriteType.valueOf(type))
					.getResultList();
			
		} catch (NoResultException e) {
			e.getMessage();
		}
		
		return null;
	}

	@Transactional
	@Cacheable(cacheName="userHasWishFavoritePubCache")
	@SuppressWarnings("unchecked")
	public List<PubWishOrFavorite> userHasWishFavoritePub(String pubId, String username) {
		return super.em.createQuery("SELECT fw FROM PubWishOrFavorite fw WHERE fw.users.username = :username and fw.pub.pubId = :pubId")
				.setParameter("username", username)
				.setParameter("pubId", pubId)
				.getResultList();
	}

	@Transactional
	@Cacheable(cacheName="findByPubAndUserAndTypeCache")
	public PubWishOrFavorite findByPubAndUserAndType(String pubId, String username, String type) {
		
		try {
			
			return (PubWishOrFavorite)
				super.em.createQuery("SELECT w FROM PubWishOrFavorite w WHERE w.users.username = :username and w.type = :type and w.pub.pubId = :pubId")
					.setParameter("username", username)
					.setParameter("type", WishOrFavoriteType.valueOf(type))
					.setParameter("pubId", pubId)
					.getSingleResult();
			
		} catch (NoResultException e) {
			e.getMessage();
		}
		
		return null;
	}
}
