package br.com.pub.repository.impl;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.ehcache.annotations.Cacheable;

import br.com.pub.domain.Users;
import br.com.pub.repository.UserRepository;

@Repository
public class UserDAO extends AbstractDAO<Users> implements UserRepository {

	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	
	@Transactional
	@Cacheable(cacheName="findUserByUsernameCache")
	public Users findUserByUsername(String username) {
		try {
			
			return (Users) super.em.createQuery("SELECT u FROM Users u WHERE u.username = :username")
					.setParameter("username", username)
					.getSingleResult();
		
		} catch (NoResultException e) {
			log.info("No user found!");
			e.getMessage();
		}
		return null;
	}
	
	@Transactional
	@Cacheable(cacheName="findUserByNameCache")
	public Users findUserByEmailHash(String name) {
		try {
			
			return (Users) super.em.createNativeQuery("select * from users u, pubuser p where u.pub_user_id = p.pub_user_id and p.email_hash = ?1", Users.class)
					.setParameter(1, name)
					.getSingleResult();
			
		} catch (NoResultException e) {
			log.info("No user found!");
			e.getMessage();
		}
		return null;
	}
}
