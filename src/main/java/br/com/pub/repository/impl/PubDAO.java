package br.com.pub.repository.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import br.com.pub.domain.Pub;
import br.com.pub.repository.PubRepository;

@Repository
public class PubDAO extends AbstractDAO<Pub> implements PubRepository {

	private static final Logger log = LoggerFactory.getLogger(PubDAO.class);

	@SuppressWarnings("unchecked")
	public List<Pub> listPubsByUsername(String username) {
		try {
			
			return super.em.createNativeQuery("select * from pub p where p.pub_id in(select up.pub_id from user_has_pubs up, users u where up.user_id = u.user_id and u.username = ?1)", Pub.class)
					.setParameter(1, username)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Pub> listPubsPerCountry(String country) {
		try {
			
			return super.em.createQuery("select p from Pub p where p.country = :country order by p.pubViews desc limit 100")
					.setParameter("country", country)
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Pub> listTop100World() {
		try {
			
			return super.em.createQuery("select p from Pub p order by p.pubViews desc limit 100")
					.getResultList();
			
		} catch (NoResultException e) {
			log.info("No pub found!");
			e.printStackTrace();
		}
		return null;
	}
}
