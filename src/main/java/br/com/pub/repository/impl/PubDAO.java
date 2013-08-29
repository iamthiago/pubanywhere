package br.com.pub.repository.impl;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.pub.domain.Pub;
import br.com.pub.repository.PubRepository;

import com.googlecode.ehcache.annotations.Cacheable;

@Repository
public class PubDAO extends AbstractDAO<Pub> implements PubRepository {

	private static final Logger log = LoggerFactory.getLogger(PubDAO.class);
	
	@Override
	@PreAuthorize("hasAnyRole('ROLE_CONTRIBUTOR', 'ROLE_ADMIN')")
	public Pub insert(Pub t) {
		return super.insert(t);
	}

	@Cacheable(cacheName="listPubsPerCountryCache")
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> listPubsPerCountry(String country, int from) {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub where country = :country order by new_rating desc", Pub.class)
					.setParameter("country", country)
					.setFirstResult(from)
					.setMaxResults(5)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
	
	@Cacheable(cacheName="listAllPubsPerCountryCache")
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> listAllPubsPerCountry(String country) {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub where country = :country order by new_rating desc", Pub.class)
					.setParameter("country", country)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}

	@Cacheable(cacheName="listTop100WorldCache")
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> listTop100World(int from) {
		try {
			
			return super.em.createNativeQuery("select *, ((pub_count_rating * pub_total_rating) / 5) as new_rating from pub order by new_rating desc", Pub.class)
					.setFirstResult(from)
					.setMaxResults(5)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
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

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pub> last3() {
		try {
			
			return super.em.createNativeQuery("select * from pub order by desde desc", Pub.class)
					.setMaxResults(3)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return null;
	}

	@Transactional
	public int getTotalPubsPerCountry(String country) {
		try {
			
			return ((BigInteger) super.em.createNativeQuery("select count(*) from pub where country = :country")
					.setParameter("country", country)
					.getSingleResult()).intValue();
					
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.getMessage();
		}
		return 0;
	}
}
