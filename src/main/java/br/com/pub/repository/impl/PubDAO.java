package br.com.pub.repository.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.ehcache.annotations.Cacheable;

import br.com.pub.domain.Pub;
import br.com.pub.repository.PubRepository;

@Repository
public class PubDAO extends AbstractDAO<Pub> implements PubRepository {

	private static final Logger log = LoggerFactory.getLogger(PubDAO.class);

	@Transactional
	@Cacheable(cacheName="listPubsByUsernameCache")
	@SuppressWarnings("unchecked")
	public List<Pub> listPubsByUsername(String username) {
		try {
			
			return super.em.createNativeQuery("select * from pub p where p.pub_id in(select up.pub_id from user_has_pubs up, users u where up.user_id = u.user_id and u.username = ?1)", Pub.class)
					.setParameter(1, username)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
	
	@Transactional
	@Cacheable(cacheName="listPubsPerCountryCache")
	@SuppressWarnings("unchecked")
	public List<Pub> listPubsPerCountry(String country) {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub where country = :country order by new_rating desc", Pub.class)
					.setParameter("country", country)
					.setMaxResults(100)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}

	@Transactional
	@Cacheable(cacheName="listTop100WorldCache")
	@SuppressWarnings("unchecked")
	public List<Pub> listTop100World() {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub order by new_rating desc", Pub.class)
					.setMaxResults(100)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Pub> top6() {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub order by new_rating desc", Pub.class)
					.setMaxResults(6)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
	
	

	/*MOBILE*/
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Pub> listTop10Mobile() {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub order by new_rating desc", Pub.class)
					.setMaxResults(10)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
}
