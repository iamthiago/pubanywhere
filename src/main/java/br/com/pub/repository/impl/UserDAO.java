package br.com.pub.repository.impl;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import br.com.pub.domain.Users;
import br.com.pub.repository.UserRepository;

@Repository
public class UserDAO extends AbstractDAO<Users> implements UserRepository {

	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	
	public Users findUserByUsername(String username) {
		try {
			
			return (Users) super.em.createQuery("SELECT u FROM Users u WHERE u.username = :username")
					.setParameter("username", username)
					.getSingleResult();
		
		} catch (NoResultException e) {
			log.info("No user found!");
			e.printStackTrace();
		}
		return null;
	}

}
