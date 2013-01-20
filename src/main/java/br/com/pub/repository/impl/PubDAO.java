package br.com.pub.repository.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import br.com.pub.domain.Pub;
import br.com.pub.mapper.PubMapper;
import br.com.pub.repository.PubRepository;

@Repository
public class PubDAO extends AbstractDAO<Pub> implements PubRepository {

	private static final Logger log = LoggerFactory.getLogger(PubDAO.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Pub> listaPubsJdbc() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM PUB");
		return jdbcTemplate.query(sql.toString(), new PubMapper());
	}

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
}
